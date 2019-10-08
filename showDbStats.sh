#!/bin/bash

set -e

export PGHOST=${PGHOST-localhost}
export PGPORT=${PGPORT-5432}
export PGDATABASE=${PGDATABASE-p}
export PGUSER=${PGUSER-postgres}


if [ -z "$1" ]; then
    echo "Usage: $0 table [db]"
    exit 1
fi

SCMTBL="$1"
SCHEMANAME="${SCMTBL%%.*}"  # everything before the dot (or SCMTBL if there is no dot)
TABLENAME="${SCMTBL#*.}"  # everything after the dot (or SCMTBL if there is no dot)

if [ "${SCHEMANAME}" = "${TABLENAME}" ]; then
    SCHEMANAME="public"
fi

if [ -n "$2" ]; then
    DB="$2"
else
    DB="my_default_db"
fi

PSQL="psql --no-psqlrc -x -c "

$PSQL "
select '-----------' as \"-------------\", 
       schemaname,
       tablename,
       attname,
       null_frac,
       avg_width,
       n_distinct,
       correlation,
       most_common_vals,
       most_common_freqs,
       histogram_bounds
  from pg_stats
 where schemaname='$SCHEMANAME'
   and tablename='$TABLENAME';
" | grep -v "\-\[ RECORD "
