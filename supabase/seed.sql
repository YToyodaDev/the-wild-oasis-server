--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.8 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    "startDate" timestamp without time zone,
    "endDate" timestamp without time zone,
    "numNights" smallint,
    "numGuests" smallint,
    "cabinPrice" real,
    "extrasPrice" real,
    "totalPrice" real,
    status text,
    "hasBreakfast" boolean,
    "isPaid" boolean,
    observations text,
    "cabinId" bigint,
    "guestId" bigint
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: Bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Bookings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cabins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cabins (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    "maxCapacity" smallint,
    "regularPrice" smallint,
    discount smallint,
    description text,
    image text
);


ALTER TABLE public.cabins OWNER TO postgres;

--
-- Name: Cabin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cabins ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Cabin_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: guests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guests (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    "fullName" text,
    email text,
    "nationalID" text,
    nationality text,
    "countryFlag" text
);


ALTER TABLE public.guests OWNER TO postgres;

--
-- Name: Guests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.guests ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Guests_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    "minBookingLength" smallint,
    "maxBookingLength" smallint,
    "maxGuestsPerBooking" smallint,
    "breakfastPrice" real
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: Settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.settings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Settings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: inquiries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inquiries (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    "fullName" text,
    email text,
    subject text,
    message text
);


ALTER TABLE public.inquiries OWNER TO postgres;

--
-- Name: inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.inquiries ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	2a236d04-370b-42ce-992b-eb7f318d20cf	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"yasuaki@example.com","user_id":"19533556-80f0-4370-87ba-8f69f9aa2670","user_phone":""}}	2024-08-05 02:12:56.303474+00	
00000000-0000-0000-0000-000000000000	5288a9af-43a2-4b70-b2b8-167965c6262f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:19:47.985168+00	
00000000-0000-0000-0000-000000000000	220af41e-4d8c-442b-81e1-379229f89aa3	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:19:49.463511+00	
00000000-0000-0000-0000-000000000000	d519f499-faeb-4910-8ec4-89631371f07b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:19:50.391954+00	
00000000-0000-0000-0000-000000000000	588e3c76-5681-4a9d-9d9e-6587121524ae	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:20:02.689778+00	
00000000-0000-0000-0000-000000000000	25d03700-222f-4d5a-aeb6-e4f55c74f247	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:20:44.144742+00	
00000000-0000-0000-0000-000000000000	73ba1ac4-0625-4ab0-b011-2fd3f4fbe788	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:05.730847+00	
00000000-0000-0000-0000-000000000000	196be8e1-52e7-4094-95b3-3e0c71202cde	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:06.232262+00	
00000000-0000-0000-0000-000000000000	ffa141a7-3b9c-449d-bc0e-a5a2a8b072d2	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:06.424079+00	
00000000-0000-0000-0000-000000000000	c807ab77-e35c-4bcc-958b-f3231ebd42d6	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:06.623267+00	
00000000-0000-0000-0000-000000000000	68cc5a30-2c66-4166-9dc3-947250705748	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:07.39983+00	
00000000-0000-0000-0000-000000000000	3ce1b777-6e6f-4621-860e-965aa1a7c64f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:23:07.573632+00	
00000000-0000-0000-0000-000000000000	a000a57d-1b93-4f99-9e7d-81ef32e77969	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:37:45.032473+00	
00000000-0000-0000-0000-000000000000	676d5d05-974e-4204-9392-61a81838a4b7	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:37:47.260486+00	
00000000-0000-0000-0000-000000000000	81a050fa-c277-4cf8-a766-f59102e6d8a4	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:37:50.331366+00	
00000000-0000-0000-0000-000000000000	90e2453a-2960-4269-a9e6-867521a5d53f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:38:40.771671+00	
00000000-0000-0000-0000-000000000000	0e677ecb-94fc-4bca-a6af-14e1f6719878	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 02:39:47.245988+00	
00000000-0000-0000-0000-000000000000	4b38e4f4-88f2-4741-bd99-6160cd60c255	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:18:41.597399+00	
00000000-0000-0000-0000-000000000000	0baf73b2-6d8d-4bd0-bb6b-c1a98532ad0b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:25:31.199679+00	
00000000-0000-0000-0000-000000000000	dd52c990-f050-4eda-9829-53496267311d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:25:37.060734+00	
00000000-0000-0000-0000-000000000000	c14adad8-5389-4eff-964f-cd6ea227c6c0	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:26:09.838015+00	
00000000-0000-0000-0000-000000000000	8e725bec-9727-4783-9feb-493e5794a567	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:26:23.4021+00	
00000000-0000-0000-0000-000000000000	ffb95dc1-078f-4b18-8bca-47c6d214db23	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:26:36.334837+00	
00000000-0000-0000-0000-000000000000	b8f57dec-83c2-4918-96ab-b2adfb48342d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:26:49.606978+00	
00000000-0000-0000-0000-000000000000	2eaba1d8-2dca-498e-84aa-b36883c35437	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:27:47.704126+00	
00000000-0000-0000-0000-000000000000	79d557b4-6b42-4468-9123-2ef52b4c8cdd	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:28:25.544132+00	
00000000-0000-0000-0000-000000000000	d5c5aa84-0546-41ef-9523-a0d706b2ebce	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:28:50.635542+00	
00000000-0000-0000-0000-000000000000	cfcd98bd-8915-4f2a-b7b5-25f891a2ca12	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:31:53.477295+00	
00000000-0000-0000-0000-000000000000	65b636cd-9896-4d68-b0e3-49822bd1ffd3	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:34:26.713523+00	
00000000-0000-0000-0000-000000000000	988ec196-eb6e-4e0e-800e-a6425ff444b8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:36:08.515139+00	
00000000-0000-0000-0000-000000000000	e9738ef5-a997-4733-9c93-844bec8ec119	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:38:31.893285+00	
00000000-0000-0000-0000-000000000000	b6511b47-68b9-406c-8e72-5431696e7575	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 03:56:07.551027+00	
00000000-0000-0000-0000-000000000000	c8303db6-8bb8-43f5-85b9-ab8aadf29856	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:56:24.47061+00	
00000000-0000-0000-0000-000000000000	b90dfc34-08cb-4b0d-8a26-36d315389127	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:56:28.413954+00	
00000000-0000-0000-0000-000000000000	da374ddf-6c3d-439c-a651-148305ede985	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:56:37.974433+00	
00000000-0000-0000-0000-000000000000	fa98eee0-3c8f-4198-b7bf-67991facbfa2	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:56:50.002305+00	
00000000-0000-0000-0000-000000000000	cf0ddef2-b269-4639-a163-d8a2db7bd4c4	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 03:57:10.292192+00	
00000000-0000-0000-0000-000000000000	144107a9-ab50-49b0-8973-48330ba5c982	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:59:10.117132+00	
00000000-0000-0000-0000-000000000000	c5b0a893-79f6-4812-993f-b793cf8a394a	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 03:59:48.328064+00	
00000000-0000-0000-0000-000000000000	54574c98-6fa6-483e-b623-7c98cb8b426d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:00:18.997109+00	
00000000-0000-0000-0000-000000000000	e73fd556-8529-463e-a602-392c0c4814a0	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:00:59.82251+00	
00000000-0000-0000-0000-000000000000	81cf1689-cfa5-4c9d-a5b1-4dc30a97429b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:01:05.12734+00	
00000000-0000-0000-0000-000000000000	8b015f99-7b68-4153-b1c6-a381f70647ae	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:01:33.94453+00	
00000000-0000-0000-0000-000000000000	e38bac20-9c85-4959-9d18-b9acf615e754	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:01:37.769732+00	
00000000-0000-0000-0000-000000000000	a1e94f2d-308e-4469-8cca-6287ca8d433e	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:03:58.954277+00	
00000000-0000-0000-0000-000000000000	b4e9acf7-e440-4cc9-8bec-14adffaa28ed	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:14:10.768889+00	
00000000-0000-0000-0000-000000000000	0ab41ab4-2956-453c-831e-8139eb17e6e9	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:16:06.414196+00	
00000000-0000-0000-0000-000000000000	16451ca0-fbe8-41be-a0ec-9a5dd2755c0f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:16:45.619057+00	
00000000-0000-0000-0000-000000000000	0ff2f2f8-b590-449e-9abd-b0cdb212d438	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:18:32.43742+00	
00000000-0000-0000-0000-000000000000	9900e6bf-fbb1-4da2-9ed6-d79e397874fe	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:19:44.997571+00	
00000000-0000-0000-0000-000000000000	c94d0912-bbfe-48b0-91ae-e486ed82eec8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:19:54.773591+00	
00000000-0000-0000-0000-000000000000	b10a952c-ef21-4770-8db9-6cdc33241730	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:20:31.23482+00	
00000000-0000-0000-0000-000000000000	debca487-6bdc-4738-acc9-37992a5273f8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:20:33.603212+00	
00000000-0000-0000-0000-000000000000	ef7aaea0-2366-4f50-97b1-1d5e4b73fde6	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 04:20:47.710687+00	
00000000-0000-0000-0000-000000000000	883a19f1-87e7-41c5-99f6-f1d2d103819f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:21:02.472951+00	
00000000-0000-0000-0000-000000000000	50a348b0-8399-442d-aea6-b8f1baf590f3	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 04:21:26.890932+00	
00000000-0000-0000-0000-000000000000	9dfb7e8f-86f8-45e0-9e14-852063f84727	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:21:36.06244+00	
00000000-0000-0000-0000-000000000000	6896d426-35c4-4833-8d91-9369186eb83c	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:23:28.901465+00	
00000000-0000-0000-0000-000000000000	72d8adf8-7afa-4173-a429-f4121e7da2a7	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:28:26.146072+00	
00000000-0000-0000-0000-000000000000	a8b0599b-b668-4751-b666-7be5be219a7b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:29:58.630772+00	
00000000-0000-0000-0000-000000000000	2edb9821-c6cd-4211-adf4-4e5d4f500e17	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:31:02.149307+00	
00000000-0000-0000-0000-000000000000	09357524-fd12-404f-8683-772ac952fac9	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:32:16.633544+00	
00000000-0000-0000-0000-000000000000	e0a40b20-2847-49da-aea5-6e7e1f276cff	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:32:44.082868+00	
00000000-0000-0000-0000-000000000000	e44d34fc-2f47-48b6-8687-9ffd6fa22d33	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:33:47.027208+00	
00000000-0000-0000-0000-000000000000	eadada8c-2f85-40c4-bfc5-b5416a2184d0	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:34:02.652399+00	
00000000-0000-0000-0000-000000000000	68c91442-151c-4281-ac5f-721fce5d7b3f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:35:08.408421+00	
00000000-0000-0000-0000-000000000000	9497b806-6584-4f4e-9025-73fa213196b9	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:35:51.615451+00	
00000000-0000-0000-0000-000000000000	9f222ee0-6c5a-4c29-85d2-d1060ec65b43	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:36:19.383323+00	
00000000-0000-0000-0000-000000000000	159ace46-9c24-46c6-a651-8f6f1a6d7592	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:37:51.804431+00	
00000000-0000-0000-0000-000000000000	83e151e5-9f45-4184-a6aa-08d521c4e292	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:38:08.676563+00	
00000000-0000-0000-0000-000000000000	a1adf2ba-8782-40c6-b7ae-5b332acb9ba1	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:39:15.566553+00	
00000000-0000-0000-0000-000000000000	a794cf50-f46f-4aaa-983f-b56c501a5ef1	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:42:01.671589+00	
00000000-0000-0000-0000-000000000000	7e75aedc-63ad-4884-8bab-4bac4c2b28c1	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:43:11.951263+00	
00000000-0000-0000-0000-000000000000	bc1ce999-3928-4c24-ae24-f0bf878001e4	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:43:28.727203+00	
00000000-0000-0000-0000-000000000000	8ecf7ce9-130a-4c39-b662-ec8d6740b27e	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:45:13.399484+00	
00000000-0000-0000-0000-000000000000	32863c2b-e5b5-4ad6-8001-a293997c1788	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:46:38.911983+00	
00000000-0000-0000-0000-000000000000	e4b634a4-70f7-4be3-bbdd-5c4688a3697d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:47:02.323986+00	
00000000-0000-0000-0000-000000000000	f50bef68-5a15-4fa5-aade-33524694cdba	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:50:29.581259+00	
00000000-0000-0000-0000-000000000000	04562068-a834-4209-bd7d-44a079437c95	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:53:41.354519+00	
00000000-0000-0000-0000-000000000000	35edc68a-d8e3-496e-9f41-ba24812c3455	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:55:38.967315+00	
00000000-0000-0000-0000-000000000000	d2d4f48f-631e-4ec2-b1f1-ac4a32769769	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:55:44.219179+00	
00000000-0000-0000-0000-000000000000	ba410f9e-3d50-431c-a911-16e80d29115a	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:56:22.411827+00	
00000000-0000-0000-0000-000000000000	db3c3ffd-b008-4efb-98f8-622579d1a677	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:57:30.478861+00	
00000000-0000-0000-0000-000000000000	3abad12b-0584-40e3-87a8-15b0e2ae1ffa	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:59:19.522994+00	
00000000-0000-0000-0000-000000000000	6b5df984-c2a3-49f3-a264-b920fbf26c22	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 04:59:23.679327+00	
00000000-0000-0000-0000-000000000000	ec17db12-b292-4120-8472-e576114b2308	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:00:07.246312+00	
00000000-0000-0000-0000-000000000000	e60236ea-d5db-474c-9a12-3c9b55bed9dd	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:01:31.07642+00	
00000000-0000-0000-0000-000000000000	c056cedb-8d5f-4d9c-b340-6de28bb41665	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:01:34.357728+00	
00000000-0000-0000-0000-000000000000	47dbcb22-6ca6-40dc-a98c-04bc59844ca6	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:05:35.191801+00	
00000000-0000-0000-0000-000000000000	7e727b7d-aa37-4d4f-8317-01947a069420	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:05:40.66881+00	
00000000-0000-0000-0000-000000000000	733aea3b-9a54-4a9b-a613-dd518651a979	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:05:52.975389+00	
00000000-0000-0000-0000-000000000000	8a51fbb7-2fc0-4fc7-a36d-a8facb1cde04	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:07:18.549593+00	
00000000-0000-0000-0000-000000000000	47cf138e-7db4-42e3-806d-6e9500cf86da	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:07:22.32459+00	
00000000-0000-0000-0000-000000000000	3cf3d0e6-00a7-413d-ba10-c34e76760272	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:08:57.888019+00	
00000000-0000-0000-0000-000000000000	6ce29511-ba2d-4e70-bd92-6a5116753a47	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:12:27.287153+00	
00000000-0000-0000-0000-000000000000	4b1b17d8-a2c7-4d52-b7a3-de93f5752910	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:13:24.615042+00	
00000000-0000-0000-0000-000000000000	7761971c-8a62-4bfd-9591-cb6ea8f75d70	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:13:59.392396+00	
00000000-0000-0000-0000-000000000000	6a480932-5a92-4051-988f-005fe0bcd8cb	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:14:02.076878+00	
00000000-0000-0000-0000-000000000000	3306f776-7125-4ed1-928f-4c5ad55fc7d2	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:14:12.367441+00	
00000000-0000-0000-0000-000000000000	50b0cedc-a4c1-464d-9b2b-f7d2cd39490b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:21:41.746709+00	
00000000-0000-0000-0000-000000000000	add08c95-83c2-4e1e-ba16-7901e623d709	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:21:46.020293+00	
00000000-0000-0000-0000-000000000000	65f55308-dc39-4a82-9e8b-2e024520cd6c	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:22:20.432963+00	
00000000-0000-0000-0000-000000000000	7dc01039-1436-4aab-9e02-b15b59877993	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:22:29.966811+00	
00000000-0000-0000-0000-000000000000	9ba3b3be-0a10-42ce-b906-7b1133574b1b	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:24:15.109074+00	
00000000-0000-0000-0000-000000000000	5424e62c-859a-48d6-a922-dfba89de9eb7	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:30:36.257259+00	
00000000-0000-0000-0000-000000000000	ba01e746-8fa4-44d4-94f6-9800cb07818d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:30:49.778025+00	
00000000-0000-0000-0000-000000000000	b46a4231-c19a-4290-a792-5908cc2979cd	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:30:53.257908+00	
00000000-0000-0000-0000-000000000000	a5f1aab5-c60f-4d03-9142-b985c0f528db	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:33:04.418429+00	
00000000-0000-0000-0000-000000000000	964dd769-d849-4adf-8e03-122c0e0ae13a	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:33:11.244597+00	
00000000-0000-0000-0000-000000000000	68504656-4c4f-4e94-ad20-32d77d33b1c1	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:33:19.160161+00	
00000000-0000-0000-0000-000000000000	a5d4717a-1218-471f-9897-ddf6a40813da	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:33:55.60145+00	
00000000-0000-0000-0000-000000000000	7771d776-a74a-40a3-8910-671873adf035	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:34:15.414614+00	
00000000-0000-0000-0000-000000000000	ca9fef62-e893-4b16-b28b-027248b73013	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:37:54.383746+00	
00000000-0000-0000-0000-000000000000	f7bc6069-34a3-4204-8419-ae9732bc1e42	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:39:35.749294+00	
00000000-0000-0000-0000-000000000000	de0459e0-b3ad-46fa-8c03-8a03fd3221b2	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:41:08.932849+00	
00000000-0000-0000-0000-000000000000	ccdb68a0-2f49-4d80-ad7d-da49448af34b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:41:13.454461+00	
00000000-0000-0000-0000-000000000000	7cdce7d8-9492-431b-bd97-14395f1f5908	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:41:34.820679+00	
00000000-0000-0000-0000-000000000000	6530bbd9-2126-4760-a6dc-6900b2a5571f	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:41:42.659993+00	
00000000-0000-0000-0000-000000000000	3e97e70b-b904-45dc-9e73-5789ad7e42db	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:41:46.825278+00	
00000000-0000-0000-0000-000000000000	a7bd0e7d-24e6-4f63-8eec-a6bbf33ccf51	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:41:58.50844+00	
00000000-0000-0000-0000-000000000000	72f29cbf-bc3f-4241-add2-906ef699bf0b	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:42:09.507289+00	
00000000-0000-0000-0000-000000000000	f72ce8d9-91f5-490e-8fc3-b2bd8cbf2989	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:42:13.576409+00	
00000000-0000-0000-0000-000000000000	1d1902d3-f15d-4c2c-9583-5acfa246291b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:42:22.934735+00	
00000000-0000-0000-0000-000000000000	d7d36665-a3b2-4c1e-9fe4-597bc5b2d884	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:42:27.489982+00	
00000000-0000-0000-0000-000000000000	eb966b65-3382-4a86-88b5-67fd5e8fae62	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:42:37.305336+00	
00000000-0000-0000-0000-000000000000	b9376989-f5d0-4acf-9be1-06ee598d32d6	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:42:44.549044+00	
00000000-0000-0000-0000-000000000000	27589520-a9c0-4d06-b052-0f210d214801	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:00.761344+00	
00000000-0000-0000-0000-000000000000	8923cafd-afe8-4967-8662-881ab20db838	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:12.792495+00	
00000000-0000-0000-0000-000000000000	9795a827-ae8f-4dd6-b848-0e0635975162	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:19.34156+00	
00000000-0000-0000-0000-000000000000	19220954-1eb6-4f88-b33f-3b78efca3ab8	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:43:30.921824+00	
00000000-0000-0000-0000-000000000000	08e857ba-1317-4d46-a6de-e5ab43dfe204	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:34.739137+00	
00000000-0000-0000-0000-000000000000	8c75d0ad-645d-4dd3-8c0b-a6a2376a3e76	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:55.932965+00	
00000000-0000-0000-0000-000000000000	241dac2e-2377-40e1-84df-d0ba38a32442	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:43:57.537007+00	
00000000-0000-0000-0000-000000000000	9e060bec-40f4-462a-b6c6-7d7bc7759d9b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:43:59.602282+00	
00000000-0000-0000-0000-000000000000	4b05114b-b642-45fc-9e6c-1b6bcdaf755e	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:02.809906+00	
00000000-0000-0000-0000-000000000000	3cffa238-7fd6-46b5-a9a1-15ddd370cbb0	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:04.484291+00	
00000000-0000-0000-0000-000000000000	f720d08b-889c-43b1-9e5a-08cd1154e59b	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:06.627209+00	
00000000-0000-0000-0000-000000000000	b09765b3-eeed-4271-9ef2-f9defa7351b4	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:10.29217+00	
00000000-0000-0000-0000-000000000000	1869555b-8df8-47b7-aa1b-a296718dc416	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:12.036882+00	
00000000-0000-0000-0000-000000000000	20c7bb9e-2a5a-43bd-b850-81b416e8c591	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:16.291712+00	
00000000-0000-0000-0000-000000000000	537390e3-f82a-4122-bed5-c83f4e0806c4	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:17.922433+00	
00000000-0000-0000-0000-000000000000	3d3ba934-8272-4000-a8df-98c2836cfc06	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:21.473938+00	
00000000-0000-0000-0000-000000000000	b0be8db5-d7da-4635-a11c-6b4e8d93f504	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:23.282192+00	
00000000-0000-0000-0000-000000000000	2c4d49eb-1363-4318-a67a-20adbd954a38	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:29.096451+00	
00000000-0000-0000-0000-000000000000	7f6ef030-15f7-460d-9cb8-1a2e0cea5e45	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:32.47679+00	
00000000-0000-0000-0000-000000000000	6d8938a3-629c-435c-8371-10076b0b734c	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:36.06426+00	
00000000-0000-0000-0000-000000000000	3a297967-59bc-4bcb-b9b7-f14961c0fc92	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:46.488063+00	
00000000-0000-0000-0000-000000000000	2d03ee83-acef-4ca9-b8c4-16cb9e30d647	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:44:48.068711+00	
00000000-0000-0000-0000-000000000000	a31802af-70cb-48a2-b40d-ee35c8b63006	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:50.32568+00	
00000000-0000-0000-0000-000000000000	a97d32e0-e45d-46ef-97d2-a365361894a8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:44:54.343212+00	
00000000-0000-0000-0000-000000000000	42c59a80-af28-4b51-8e34-065becdf6024	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:45:28.804748+00	
00000000-0000-0000-0000-000000000000	79c21763-f8da-45f3-8ee6-fc05b47bdda8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:45:30.883136+00	
00000000-0000-0000-0000-000000000000	552ec658-a541-46d4-836f-9901d91d7107	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:45:34.297682+00	
00000000-0000-0000-0000-000000000000	f8ee6f3a-5e64-49dd-af5f-a85c1a0f6a3b	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:45:35.809228+00	
00000000-0000-0000-0000-000000000000	96fc59a1-ae2b-419e-92af-17988ad3059c	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:45:38.175321+00	
00000000-0000-0000-0000-000000000000	5d889f92-79c3-4c80-91c4-863dc633e6a5	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:45:40.186293+00	
00000000-0000-0000-0000-000000000000	62f69841-3b53-44be-a6b4-912890eabb65	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:45:41.350495+00	
00000000-0000-0000-0000-000000000000	5486259c-59f9-468d-b42d-b152bd07f927	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:45:45.69406+00	
00000000-0000-0000-0000-000000000000	5b810cff-4800-4513-9d88-e253af1ac3f6	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:46:20.629447+00	
00000000-0000-0000-0000-000000000000	83f7a7aa-716f-465e-b328-94d9f08ede05	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:46:47.4985+00	
00000000-0000-0000-0000-000000000000	9f2a56f7-4d5a-49d1-9455-83ad34dae21f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:46:49.593614+00	
00000000-0000-0000-0000-000000000000	5ede4f6a-78e0-4e33-9154-c0715f5b8eab	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:46:51.831369+00	
00000000-0000-0000-0000-000000000000	c9a1fe36-b874-49ba-b0df-9d68689b9a88	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:46:58.872771+00	
00000000-0000-0000-0000-000000000000	a9839f4d-7282-466e-a98f-94efb954311d	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:47:26.681084+00	
00000000-0000-0000-0000-000000000000	7c0f60ac-4547-4c1e-b9bc-f99245fe4ee4	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:47:38.674825+00	
00000000-0000-0000-0000-000000000000	eaf3f7c4-3d2b-4a9f-9b9d-fad990a532d6	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:50:57.123416+00	
00000000-0000-0000-0000-000000000000	429a83e0-663d-49bb-b0a3-fe7913a9fe99	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:51:11.423322+00	
00000000-0000-0000-0000-000000000000	9e8c4c3e-e264-41ba-83c3-3fc2bedb05fe	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:51:14.225555+00	
00000000-0000-0000-0000-000000000000	400d6e28-9dc8-429e-89ee-40457098e897	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:51:56.357131+00	
00000000-0000-0000-0000-000000000000	cb067c08-fd2e-4b01-8762-b0bec6242cd9	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:52:15.542082+00	
00000000-0000-0000-0000-000000000000	af2b8ff4-59ce-4e7f-93db-9113f295bb49	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:52:21.552397+00	
00000000-0000-0000-0000-000000000000	50dc0222-1c13-4081-ab01-9e498bb1e803	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:52:51.60442+00	
00000000-0000-0000-0000-000000000000	cb9e9ae3-3538-4e32-a45e-dfb122969bac	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:53:52.671263+00	
00000000-0000-0000-0000-000000000000	9e303ce7-4da6-4499-b83d-05efc8138f7b	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:54:01.857609+00	
00000000-0000-0000-0000-000000000000	bccbfdd3-e293-4977-8b16-27a2b744d79f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:57:39.82523+00	
00000000-0000-0000-0000-000000000000	322adaff-08ae-43fc-a832-5a515ad815ef	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:57:41.630928+00	
00000000-0000-0000-0000-000000000000	c8ecda04-b1d3-4b55-aee2-d62b0e8a28be	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:57:46.383237+00	
00000000-0000-0000-0000-000000000000	60067597-d246-43de-8a0d-49e8f269ac22	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:58:20.210384+00	
00000000-0000-0000-0000-000000000000	b75a26e8-11cd-4156-916a-fd2d00a497f3	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:58:32.690029+00	
00000000-0000-0000-0000-000000000000	3b53d0a7-f2e9-4d67-8405-70fa0a4db27b	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 05:58:49.171833+00	
00000000-0000-0000-0000-000000000000	892d4cd8-e265-41b0-b043-9d3aa14f5072	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 05:59:17.213879+00	
00000000-0000-0000-0000-000000000000	34136220-090e-4c33-9969-c867a0f17a37	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 06:57:46.952409+00	
00000000-0000-0000-0000-000000000000	4ada92bb-0970-40d1-97c7-2802ab7c63c3	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 06:57:46.956132+00	
00000000-0000-0000-0000-000000000000	46da74eb-ded6-4d8b-8a6d-b26daac3d635	{"action":"user_confirmation_requested","actor_id":"c178bcfe-be46-459b-b324-70f8d1a07f98","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-08-05 07:12:35.406688+00	
00000000-0000-0000-0000-000000000000	b1f84a4f-0d4b-48d4-8b3c-06c3ac0de2d2	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 07:15:27.514495+00	
00000000-0000-0000-0000-000000000000	f49c821d-d726-441a-982f-4fdd0b6e26f5	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@test.com","user_id":"c178bcfe-be46-459b-b324-70f8d1a07f98","user_phone":""}}	2024-08-05 07:17:15.546085+00	
00000000-0000-0000-0000-000000000000	7c05005d-4686-447d-acaf-3b9053f8a142	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 07:17:47.102755+00	
00000000-0000-0000-0000-000000000000	f285d0e5-cac1-4b1d-ab5f-d2c04efcbe30	{"action":"user_signedup","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2024-08-05 07:22:32.531777+00	
00000000-0000-0000-0000-000000000000	af031eea-dd33-4de7-9a7a-1128f1d43fe3	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 07:22:32.537688+00	
00000000-0000-0000-0000-000000000000	43924d68-d478-4f83-a816-547e5aa38252	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 07:22:35.776903+00	
00000000-0000-0000-0000-000000000000	719ec506-01fb-4167-9950-6a9d009295ce	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 07:22:40.397006+00	
00000000-0000-0000-0000-000000000000	de138653-de3e-4986-bd8a-3325e7e2fbf2	{"action":"user_confirmation_requested","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-08-05 07:28:58.555334+00	
00000000-0000-0000-0000-000000000000	a4a2daf8-0024-4064-a363-dbd4b524f5d8	{"action":"user_signedup","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"team"}	2024-08-05 07:29:26.874446+00	
00000000-0000-0000-0000-000000000000	13611363-59d2-4ff7-9e90-7609731c9269	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 08:27:42.457849+00	
00000000-0000-0000-0000-000000000000	484540f0-0e00-4929-8498-ed1e1ae3bc10	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 08:27:42.459678+00	
00000000-0000-0000-0000-000000000000	3947499e-545a-4f03-950f-4bce4651ab25	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 09:25:46.657092+00	
00000000-0000-0000-0000-000000000000	36e7f844-8e46-4c48-9133-5e503fdcd85a	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 09:25:46.660537+00	
00000000-0000-0000-0000-000000000000	8883a246-ab71-4843-a598-87c655a816d4	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 10:24:16.107739+00	
00000000-0000-0000-0000-000000000000	8b83d76a-6e4a-410a-ba1f-930e8c3d923e	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 10:24:16.109868+00	
00000000-0000-0000-0000-000000000000	f4130dca-a947-4601-abe0-c01f3e1b1d0d	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 11:22:45.986845+00	
00000000-0000-0000-0000-000000000000	d632c44d-e279-494d-8079-772d3c2db1b8	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 11:22:45.98986+00	
00000000-0000-0000-0000-000000000000	d2661ef0-d33c-46b4-922b-aff40b733a53	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 12:20:46.145398+00	
00000000-0000-0000-0000-000000000000	7e07d361-2a25-403b-a32c-1d4bd0291422	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 12:20:46.146818+00	
00000000-0000-0000-0000-000000000000	e6ad6cf9-8ce2-4378-8dcc-aeed3cbee6fc	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 13:19:16.096433+00	
00000000-0000-0000-0000-000000000000	e3a05874-ccd0-4f6d-8561-ecd0ec0e9e4b	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 13:19:16.099956+00	
00000000-0000-0000-0000-000000000000	5dc1c76a-9494-462b-b76e-32bc0d2a29d1	{"action":"token_refreshed","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 20:37:37.497518+00	
00000000-0000-0000-0000-000000000000	7755daf1-877a-4f1a-960a-523e0e092789	{"action":"token_revoked","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 20:37:37.500432+00	
00000000-0000-0000-0000-000000000000	e91cfce3-5614-4626-9999-58d32f473c11	{"action":"logout","actor_id":"0faca622-1c6b-4855-b535-1e5da1e9d789","actor_username":"jokaci5953@eixdeal.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 20:47:20.086008+00	
00000000-0000-0000-0000-000000000000	e7ca2cbe-293a-48f5-89b0-963292fd200f	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 20:55:04.85401+00	
00000000-0000-0000-0000-000000000000	92210fa7-8ec0-4998-bcce-8e2c6e5cd445	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 20:55:21.416761+00	
00000000-0000-0000-0000-000000000000	103315bf-0428-41e9-a397-2b75c306053b	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 20:57:36.605268+00	
00000000-0000-0000-0000-000000000000	be993e6a-1a54-43f0-ba3a-24ea59664aee	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 21:17:53.761422+00	
00000000-0000-0000-0000-000000000000	4d6d8b98-857a-4419-990a-1ada4acc82ae	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 21:17:59.456275+00	
00000000-0000-0000-0000-000000000000	d229e769-6cc3-4a55-943d-587baac2ae95	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 21:25:47.928781+00	
00000000-0000-0000-0000-000000000000	9aab84fe-0dda-40cd-853a-633d027b13dd	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 21:54:53.461905+00	
00000000-0000-0000-0000-000000000000	110e8cff-5cac-4d86-a6e6-f6ab3cedbff5	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 21:55:16.35017+00	
00000000-0000-0000-0000-000000000000	ec93cd3e-f2a9-4798-b8d3-b447f79bb7a3	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 21:55:23.574252+00	
00000000-0000-0000-0000-000000000000	905fc4ec-a0c5-43d9-b587-d2f26bfd8fd4	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 21:55:38.904423+00	
00000000-0000-0000-0000-000000000000	5f120991-2d57-4fea-9020-ab9541696723	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 21:55:40.053832+00	
00000000-0000-0000-0000-000000000000	e6ec098f-c9ba-4857-911c-5d58caae4072	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 21:57:44.719657+00	
00000000-0000-0000-0000-000000000000	d2fefb7e-a3d0-44d7-9181-87df799212d2	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 21:57:49.43868+00	
00000000-0000-0000-0000-000000000000	bcb5639e-ab6d-4ae0-82cd-59c47c8a18d4	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-05 22:03:25.988212+00	
00000000-0000-0000-0000-000000000000	dd4c069d-2539-4b36-8b03-790f169b3d2d	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-05 22:03:36.111814+00	
00000000-0000-0000-0000-000000000000	abc0c5d0-3f8c-446a-ae70-df09f110043a	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 22:03:46.753941+00	
00000000-0000-0000-0000-000000000000	e26cd3cf-3830-481e-856c-49eb9c5c07ef	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-05 22:03:48.736012+00	
00000000-0000-0000-0000-000000000000	b3b9f20d-f5c7-4875-be25-120a702a7012	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 23:08:27.195932+00	
00000000-0000-0000-0000-000000000000	a14774fc-399c-4f80-8952-d2d6264ebc55	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-05 23:08:27.198513+00	
00000000-0000-0000-0000-000000000000	49c82844-fb58-48d5-8fd6-dfb584ab107e	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 00:06:56.999535+00	
00000000-0000-0000-0000-000000000000	ffb34acf-ed51-4950-a198-4e8143ac747f	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 00:06:57.001717+00	
00000000-0000-0000-0000-000000000000	164342f6-af14-4f7b-8c38-647575604711	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 01:05:27.013151+00	
00000000-0000-0000-0000-000000000000	9fdee1df-7512-4c04-8e6e-e80134a5b675	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 01:05:27.015505+00	
00000000-0000-0000-0000-000000000000	7ae161b0-ee43-4805-802e-2d8116ada7ed	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 02:03:57.14939+00	
00000000-0000-0000-0000-000000000000	003e5bdb-3d44-4ab0-a605-bdcc9c87f9dd	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 02:03:57.156768+00	
00000000-0000-0000-0000-000000000000	15cce30a-1553-4d48-9a1a-09c628b39e4d	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 03:02:07.575059+00	
00000000-0000-0000-0000-000000000000	ab5a0328-f71b-4238-bafc-21ba4008d554	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 03:02:07.576827+00	
00000000-0000-0000-0000-000000000000	ccada5e8-b943-4dea-bb4b-792de0716307	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 04:09:19.518553+00	
00000000-0000-0000-0000-000000000000	471a2bd5-9076-4d75-9b9a-9d7459fbcd65	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 04:09:19.521139+00	
00000000-0000-0000-0000-000000000000	b8759863-9579-41dd-8566-701fcee285c6	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 05:59:44.469483+00	
00000000-0000-0000-0000-000000000000	91c392ea-3481-471e-b1df-3c48eaabeab1	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-06 05:59:44.47666+00	
00000000-0000-0000-0000-000000000000	281f6cde-15fe-4143-adde-dbe611535767	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 18:14:41.955737+00	
00000000-0000-0000-0000-000000000000	75a2b5a4-1489-48f1-893b-67bc6d6bdb0a	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 18:14:41.963073+00	
00000000-0000-0000-0000-000000000000	1dccc482-4e19-48f6-995f-bc19f08bde1c	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-08 18:55:15.601371+00	
00000000-0000-0000-0000-000000000000	34db802f-1d87-4a4f-b3cf-ee9cca82c37d	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 18:55:34.653144+00	
00000000-0000-0000-0000-000000000000	85d534cb-18d5-4589-b0b3-2a17d1ac4ce3	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 18:55:51.378645+00	
00000000-0000-0000-0000-000000000000	7de8443d-6039-4841-8f52-f637f48f6d64	{"action":"user_updated_password","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:05:03.069597+00	
00000000-0000-0000-0000-000000000000	c4a1dc7b-961e-43a1-8dc1-e11eb917ec6b	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:05:03.071363+00	
00000000-0000-0000-0000-000000000000	392c29ee-3214-47c9-8812-c690b3d521a6	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-08 19:05:11.999042+00	
00000000-0000-0000-0000-000000000000	8f5b0b44-38ea-4e9c-952e-e9bf7d63b2dd	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-08 19:05:31.515679+00	
00000000-0000-0000-0000-000000000000	beda9e22-a8da-4293-9c3c-a2bc7a3abef8	{"action":"user_updated_password","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:05:58.823949+00	
00000000-0000-0000-0000-000000000000	9d2e670f-4e6e-4512-b951-359d906a71b7	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:05:58.824585+00	
00000000-0000-0000-0000-000000000000	afed314a-ac47-495b-8967-0aa0cbd0e565	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:13:22.389282+00	
00000000-0000-0000-0000-000000000000	78f665a0-e063-4b21-a519-2b68734f890c	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:13:27.73342+00	
00000000-0000-0000-0000-000000000000	2aa9d290-2973-4238-8a76-385750bec027	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:13:29.964856+00	
00000000-0000-0000-0000-000000000000	b6f53ec2-229e-40d1-b73b-837ff84c92f3	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:17:44.259868+00	
00000000-0000-0000-0000-000000000000	7baea907-4455-4731-854b-6cfd9103f129	{"action":"user_modified","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"user"}	2024-08-08 19:17:45.951539+00	
00000000-0000-0000-0000-000000000000	163c8c8a-ff46-4b76-a43d-68f269443db4	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-08 19:46:31.570693+00	
00000000-0000-0000-0000-000000000000	46e3b17e-dc2c-4b74-8224-768422722e76	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-08 19:46:36.089507+00	
00000000-0000-0000-0000-000000000000	96a3c182-d336-436c-84c5-40a4e894385e	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 20:44:50.634111+00	
00000000-0000-0000-0000-000000000000	3a0f92f7-933a-4b48-b8e2-b32239a90cd9	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 20:44:50.63661+00	
00000000-0000-0000-0000-000000000000	164b0fd2-1df9-490f-b1cf-7ad8eb7a0ef9	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 22:02:00.841279+00	
00000000-0000-0000-0000-000000000000	022860ea-a9c8-45dc-9694-5dab29753b6f	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 22:02:00.843161+00	
00000000-0000-0000-0000-000000000000	0f8e82f9-bc35-413a-b982-7c4741436eee	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 23:00:47.32581+00	
00000000-0000-0000-0000-000000000000	b99739e9-a593-42f8-b25f-11b7dd9f811a	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 23:00:47.328194+00	
00000000-0000-0000-0000-000000000000	e8c74771-f822-4484-93fb-5abd5e5bd6f0	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 23:59:13.332926+00	
00000000-0000-0000-0000-000000000000	b495563e-0c07-43e2-a40b-0aed5911fc92	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-08 23:59:13.33495+00	
00000000-0000-0000-0000-000000000000	6be2bd06-cb20-49e3-9ed2-f8b9654a0ff7	{"action":"user_modified","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"user"}	2024-08-09 00:06:30.089418+00	
00000000-0000-0000-0000-000000000000	4cc84e57-493c-4958-bfea-32a53effb0a4	{"action":"user_modified","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"user"}	2024-08-09 00:06:31.046866+00	
00000000-0000-0000-0000-000000000000	6a00d1f2-2fe8-4c06-88c7-973e50e3ddea	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-09 00:26:35.817085+00	
00000000-0000-0000-0000-000000000000	c316eb66-9d3e-4fd1-a915-e11e472713da	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-09 00:26:39.965281+00	
00000000-0000-0000-0000-000000000000	d0020c21-257d-4b5d-b368-bf5d5a14c806	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-09 01:15:17.52879+00	
00000000-0000-0000-0000-000000000000	330e135a-c6ff-4181-8906-2d7b89b8b50e	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-09 01:15:36.281877+00	
00000000-0000-0000-0000-000000000000	ca524725-d27a-4eef-ba67-5773990df46d	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-09 01:38:39.755187+00	
00000000-0000-0000-0000-000000000000	82c1da16-c1a3-43d6-95be-65622b8d5931	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-09 02:06:00.167793+00	
00000000-0000-0000-0000-000000000000	d6338e7d-a8d4-4bc9-ab4d-72bb1ac48279	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-17 03:16:35.475587+00	
00000000-0000-0000-0000-000000000000	bc4fd792-a1e6-445d-99c3-524683312f6e	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 04:19:19.07166+00	
00000000-0000-0000-0000-000000000000	a5044e54-1e53-4d4a-a9c3-3c1d23d65e3c	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 04:19:19.072874+00	
00000000-0000-0000-0000-000000000000	a645cc4f-a8bb-46a6-841a-75056556aaa4	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 05:30:45.203246+00	
00000000-0000-0000-0000-000000000000	5bac57e9-9b93-4bd6-8ceb-191d78deecce	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 05:30:45.204049+00	
00000000-0000-0000-0000-000000000000	db23e4a5-7991-4148-aca8-3ed6ecc05929	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 06:32:57.384868+00	
00000000-0000-0000-0000-000000000000	f95e0c95-2510-434f-996d-2ae6773d4339	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 06:32:57.385682+00	
00000000-0000-0000-0000-000000000000	1a715426-aee2-4607-a911-684a7452be58	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 07:36:19.520897+00	
00000000-0000-0000-0000-000000000000	0bdc461b-bc40-49d6-a2ae-ea498f5276a2	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 07:36:19.521739+00	
00000000-0000-0000-0000-000000000000	1e81fb48-1743-448c-8665-2c0f2609f871	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 08:40:24.068992+00	
00000000-0000-0000-0000-000000000000	99f47a65-b0e3-45d0-bb89-c0b38109e87a	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 08:40:24.069879+00	
00000000-0000-0000-0000-000000000000	c934ecbe-d224-46cd-ac5e-92afa81a454e	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 18:04:56.105095+00	
00000000-0000-0000-0000-000000000000	26b38f81-0904-4c35-8ef8-5f31c835b369	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 18:04:56.105887+00	
00000000-0000-0000-0000-000000000000	dd3cc808-f560-4f06-a892-5dfb6be33987	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 21:14:04.067038+00	
00000000-0000-0000-0000-000000000000	37463b77-c09b-480b-91b2-385865899869	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 21:14:04.067808+00	
00000000-0000-0000-0000-000000000000	24ae5b06-4d6b-4f6d-92bf-58edbfb4b652	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-17 21:14:54.559811+00	
00000000-0000-0000-0000-000000000000	eaac63ac-e64a-4546-9d67-dd7691925389	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 22:35:38.388689+00	
00000000-0000-0000-0000-000000000000	0a1977bb-6bbb-4090-8122-a54035bc6358	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-17 22:35:38.392416+00	
00000000-0000-0000-0000-000000000000	79512ac1-4d93-45b4-8be1-09485329c611	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-18 00:55:00.969161+00	
00000000-0000-0000-0000-000000000000	6407653c-53f0-499e-aea5-613faa1f4cc7	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-18 00:55:00.970686+00	
00000000-0000-0000-0000-000000000000	11fcc81c-9355-4bed-93ec-46dce029b45b	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-19 23:58:38.637119+00	
00000000-0000-0000-0000-000000000000	bc5dac6f-e11e-4ecb-ad56-aaf533f53602	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-19 23:58:38.649819+00	
00000000-0000-0000-0000-000000000000	d52cafd2-c8b7-4870-9431-96d9c99c4258	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-21 23:02:00.453269+00	
00000000-0000-0000-0000-000000000000	5f1a05e9-e0ff-488b-94b9-d4e1e675c7b4	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-21 23:02:00.462016+00	
00000000-0000-0000-0000-000000000000	89a08a44-1dc8-46be-8c61-1e950a2ae7fa	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 07:03:07.78427+00	
00000000-0000-0000-0000-000000000000	c2a7f43d-558c-4aaf-89d7-b5e98dc8fa65	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 07:03:07.790437+00	
00000000-0000-0000-0000-000000000000	c10275d3-b9be-4686-874f-7e9a0701f116	{"action":"token_refreshed","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 07:49:10.750904+00	
00000000-0000-0000-0000-000000000000	ba18cc21-4ba6-412d-9b8c-d5ec33a1633a	{"action":"token_revoked","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 07:49:10.753117+00	
00000000-0000-0000-0000-000000000000	2e992a24-8d5c-4e85-a36d-69521b7c962c	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 07:49:15.636231+00	
00000000-0000-0000-0000-000000000000	4e5fdd67-3caa-4454-af4e-ee75108b2889	{"action":"logout","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account"}	2024-08-23 08:25:00.09221+00	
00000000-0000-0000-0000-000000000000	63bdba7e-2eca-4572-8184-9d4bf68e6000	{"action":"login","actor_id":"d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6","actor_username":"test@test.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 08:25:04.643885+00	
00000000-0000-0000-0000-000000000000	16a39155-4ac2-4a28-ba48-e7da7cf3bfb9	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 13:16:22.574499+00	
00000000-0000-0000-0000-000000000000	da4de2b8-d7e4-428b-becc-cbf50767334a	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 13:16:22.578366+00	
00000000-0000-0000-0000-000000000000	423b00de-3465-424f-8e9f-6696b83ade1f	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 13:16:47.724508+00	
00000000-0000-0000-0000-000000000000	a59ee088-d5cf-463e-90f6-91078028eed5	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 13:16:52.013287+00	
00000000-0000-0000-0000-000000000000	450c10c8-a309-477f-94f1-59168ab27e51	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 13:17:45.716164+00	
00000000-0000-0000-0000-000000000000	574e0323-54a2-43fb-a3e6-76dfdfe3f404	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-23 13:18:31.965751+00	
00000000-0000-0000-0000-000000000000	fc6d46cb-91dd-43ec-9d92-965bfe8891b8	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 13:18:36.404404+00	
00000000-0000-0000-0000-000000000000	6a99a4ef-1e6a-4fee-a743-b50c97010971	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-23 14:05:46.900083+00	
00000000-0000-0000-0000-000000000000	a0a929c6-cc7d-4fcb-ab99-bcca7572c402	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 14:05:51.933086+00	
00000000-0000-0000-0000-000000000000	83a4b4ad-d11c-41ee-8ee1-c1dfd5dbb644	{"action":"logout","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account"}	2024-08-23 14:08:54.411021+00	
00000000-0000-0000-0000-000000000000	57a3b511-4f5b-438e-b3e8-dbc6df69c402	{"action":"login","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-08-23 14:08:59.064015+00	
00000000-0000-0000-0000-000000000000	37615722-a74c-418e-b3af-716828a0b7f2	{"action":"user_modified","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"user"}	2024-08-23 14:09:38.517337+00	
00000000-0000-0000-0000-000000000000	cc06d9fa-2130-4a55-abfa-1cf7b2ad9cc0	{"action":"user_updated_password","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"user"}	2024-08-23 14:10:04.005977+00	
00000000-0000-0000-0000-000000000000	8e6e7239-3831-46c0-bea8-9594f3446bad	{"action":"user_modified","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"user"}	2024-08-23 14:10:04.006628+00	
00000000-0000-0000-0000-000000000000	0b498220-1c6d-4d5a-85df-ad3312d10971	{"action":"user_confirmation_requested","actor_id":"205bb5ea-6c0d-4b49-b0ba-7677f0198c29","actor_username":"chai@example.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-08-23 14:10:44.976375+00	
00000000-0000-0000-0000-000000000000	3e6397df-064f-4c07-8c8a-93110819bf87	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 15:18:56.331194+00	
00000000-0000-0000-0000-000000000000	f3a21c5b-46f3-4152-ac63-8d38c43f31ed	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 15:18:56.33257+00	
00000000-0000-0000-0000-000000000000	4c487ac9-0bd3-452b-a611-b2bc0e04c3ea	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 16:25:17.201139+00	
00000000-0000-0000-0000-000000000000	56565ea4-5866-4108-b024-6a2f1a6f069a	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 16:25:17.203156+00	
00000000-0000-0000-0000-000000000000	542a128c-208a-48c8-a122-8397a1091e46	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 20:04:49.108463+00	
00000000-0000-0000-0000-000000000000	e5d58561-2346-42f6-b358-129bb57ba3e9	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 20:04:49.112304+00	
00000000-0000-0000-0000-000000000000	fd1ff368-ee24-418d-b372-1eb15962f1da	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 21:24:06.985888+00	
00000000-0000-0000-0000-000000000000	6aa1abb5-6bcf-4e9a-92e8-023d256585cc	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-23 21:24:06.98821+00	
00000000-0000-0000-0000-000000000000	b4a618e0-2beb-49fc-95c0-2b5af3ea7ebe	{"action":"token_refreshed","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-24 05:08:06.454914+00	
00000000-0000-0000-0000-000000000000	847bd9f6-fabe-463b-9e20-c53bfcc7a289	{"action":"token_revoked","actor_id":"19533556-80f0-4370-87ba-8f69f9aa2670","actor_username":"yasuaki@example.com","actor_via_sso":false,"log_type":"token"}	2024-08-24 05:08:06.456667+00	
00000000-0000-0000-0000-000000000000	3f20d729-be87-4cb2-8fbd-986dc1e244c7	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@user.com","user_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","user_phone":""}}	2024-10-18 00:19:54.708082+00	
00000000-0000-0000-0000-000000000000	1d0fc3b3-8906-4622-95c4-4653c74cf670	{"action":"login","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-18 00:20:16.556576+00	
00000000-0000-0000-0000-000000000000	c4109e04-ed44-40bd-9458-3692993acc6f	{"action":"token_refreshed","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 02:14:30.60601+00	
00000000-0000-0000-0000-000000000000	b4560c9a-57dd-4ebc-a445-d49a28a19977	{"action":"token_revoked","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 02:14:30.61569+00	
00000000-0000-0000-0000-000000000000	c70cc340-ae2f-4d3b-b88b-690905e72403	{"action":"token_refreshed","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 03:26:34.871911+00	
00000000-0000-0000-0000-000000000000	3c39f037-dcc4-4425-b241-b01d636c92ce	{"action":"token_revoked","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 03:26:34.873699+00	
00000000-0000-0000-0000-000000000000	e43fc41b-bdc8-4a75-9294-20497fc4027b	{"action":"token_refreshed","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 04:51:28.80897+00	
00000000-0000-0000-0000-000000000000	e6bb4aae-c62b-4e7a-8f8c-3a6f63fb86a2	{"action":"token_revoked","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 04:51:28.814147+00	
00000000-0000-0000-0000-000000000000	35d0f816-749c-4ddb-bee6-fee077a1ab3b	{"action":"token_refreshed","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 14:01:46.798515+00	
00000000-0000-0000-0000-000000000000	9cf0d59b-1ce4-4044-9585-cf3e54f4a75d	{"action":"token_revoked","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-18 14:01:46.816942+00	
00000000-0000-0000-0000-000000000000	90a74998-1162-4270-b5f7-9f6a123d506f	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"user@user.com","user_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","user_phone":""}}	2024-10-21 02:46:40.003388+00	
00000000-0000-0000-0000-000000000000	5a2d8766-0632-46d9-92c7-0d8477f1d396	{"action":"login","actor_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","actor_username":"user@user.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 02:46:59.836614+00	
00000000-0000-0000-0000-000000000000	0d11758c-52dc-4d6c-8333-3c364f501072	{"action":"logout","actor_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","actor_username":"user@user.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 02:49:55.110209+00	
00000000-0000-0000-0000-000000000000	9d444307-4247-4965-a272-deeba759fdd6	{"action":"login","actor_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","actor_username":"user@user.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 02:57:02.792997+00	
00000000-0000-0000-0000-000000000000	0b8e1bf4-575b-4118-8ef5-008632e61e4a	{"action":"token_refreshed","actor_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","actor_username":"user@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 03:59:33.043233+00	
00000000-0000-0000-0000-000000000000	5d3319a0-c6a3-4ed3-a1d3-0a23c9344fb1	{"action":"token_revoked","actor_id":"cd80ca0a-1314-4ef4-be5d-fbed5a83f49a","actor_username":"user@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 03:59:33.046265+00	
00000000-0000-0000-0000-000000000000	cb20a050-acdd-4bad-b5c2-478be261ff96	{"action":"token_refreshed","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 19:59:43.529+00	
00000000-0000-0000-0000-000000000000	2fa6c29b-302d-4da9-a59e-b44294accd49	{"action":"token_revoked","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 19:59:43.537604+00	
00000000-0000-0000-0000-000000000000	7885377a-c4d9-4785-9222-a5601bd04eb4	{"action":"user_modified","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"user"}	2024-10-21 20:01:05.137279+00	
00000000-0000-0000-0000-000000000000	f412fe74-fd57-4f10-b9aa-4b50e81c05c8	{"action":"user_modified","actor_id":"a20b192f-f559-494a-ad3f-66a2d9b0f81b","actor_username":"test@user.com","actor_via_sso":false,"log_type":"user"}	2024-10-21 20:01:06.113552+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
19533556-80f0-4370-87ba-8f69f9aa2670	19533556-80f0-4370-87ba-8f69f9aa2670	{"sub": "19533556-80f0-4370-87ba-8f69f9aa2670", "email": "yasuaki@example.com", "email_verified": false, "phone_verified": false}	email	2024-08-05 02:12:56.299106+00	2024-08-05 02:12:56.300189+00	2024-08-05 02:12:56.300189+00	63f2c44d-2949-472d-b6f6-d3f373c01e48
d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	{"sub": "d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6", "email": "test@test.com", "avatar": "", "fullName": "", "email_verified": false, "phone_verified": false}	email	2024-08-05 07:22:32.527744+00	2024-08-05 07:22:32.5278+00	2024-08-05 07:22:32.5278+00	0062fb69-9b18-4805-bc66-273238e1cf4d
0faca622-1c6b-4855-b535-1e5da1e9d789	0faca622-1c6b-4855-b535-1e5da1e9d789	{"sub": "0faca622-1c6b-4855-b535-1e5da1e9d789", "email": "jokaci5953@eixdeal.com", "avatar": "", "fullName": "", "email_verified": false, "phone_verified": false}	email	2024-08-05 07:28:58.552221+00	2024-08-05 07:28:58.552267+00	2024-08-05 07:28:58.552267+00	fc598fce-2de5-43b9-b57e-8848eee9bcb1
205bb5ea-6c0d-4b49-b0ba-7677f0198c29	205bb5ea-6c0d-4b49-b0ba-7677f0198c29	{"sub": "205bb5ea-6c0d-4b49-b0ba-7677f0198c29", "email": "chai@example.com", "avatar": "", "email_verified": false, "phone_verified": false}	email	2024-08-23 14:10:44.971874+00	2024-08-23 14:10:44.971935+00	2024-08-23 14:10:44.971935+00	4125d454-8700-47b5-9703-0404a536ad70
a20b192f-f559-494a-ad3f-66a2d9b0f81b	a20b192f-f559-494a-ad3f-66a2d9b0f81b	{"sub": "a20b192f-f559-494a-ad3f-66a2d9b0f81b", "email": "test@user.com", "email_verified": false, "phone_verified": false}	email	2024-10-18 00:19:54.700153+00	2024-10-18 00:19:54.700741+00	2024-10-18 00:19:54.700741+00	0566d59a-810c-4514-b394-6a8bce3e587f
cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	{"sub": "cd80ca0a-1314-4ef4-be5d-fbed5a83f49a", "email": "user@user.com", "email_verified": false, "phone_verified": false}	email	2024-10-21 02:46:39.997906+00	2024-10-21 02:46:39.997976+00	2024-10-21 02:46:39.997976+00	c3b67685-d025-4668-ad45-08ede63ce772
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
d9682bc1-691e-438e-963a-da223dc04e00	2024-08-23 08:25:04.647684+00	2024-08-23 08:25:04.647684+00	password	477d7452-8a1c-4a42-87a4-eb67ea7c0216
bb14311d-d8b7-4568-89fe-7b582d87564a	2024-08-23 14:08:59.068972+00	2024-08-23 14:08:59.068972+00	password	97e72998-e497-4f0c-bd2a-91283baf6cf5
423a08db-4f26-4eea-ae4f-adc766387ac0	2024-10-18 00:20:16.591206+00	2024-10-18 00:20:16.591206+00	password	a78517ee-e352-4a88-86e4-64fbc0f8d274
24138074-8c5c-44f6-aa6c-18f8ee95aa17	2024-10-21 02:57:02.800877+00	2024-10-21 02:57:02.800877+00	password	d461c1de-5e97-45b9-b242-dae110a61c13
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
8eb9971f-bc6a-4bc6-aaf6-e8475d017e7a	205bb5ea-6c0d-4b49-b0ba-7677f0198c29	confirmation_token	7e97b6044d31df23a3e16cc4ecb9a335a75577f633a14ebf6b40617e	chai@example.com	2024-08-23 14:10:46.826723	2024-08-23 14:10:46.826723
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	203	pLXPHTVP89yMi1PqmK_qTQ	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	f	2024-08-23 08:25:04.645555+00	2024-08-23 08:25:04.645555+00	\N	d9682bc1-691e-438e-963a-da223dc04e00
00000000-0000-0000-0000-000000000000	210	ka6wO33EN5GE5VPM_E-UnQ	19533556-80f0-4370-87ba-8f69f9aa2670	t	2024-08-23 14:08:59.066449+00	2024-08-23 15:18:56.333088+00	\N	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	211	xlfUBnoed22pTHwUaujGUw	19533556-80f0-4370-87ba-8f69f9aa2670	t	2024-08-23 15:18:56.334853+00	2024-08-23 16:25:17.204892+00	ka6wO33EN5GE5VPM_E-UnQ	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	212	Emew9Q0bvF9fth6PLEVQEw	19533556-80f0-4370-87ba-8f69f9aa2670	t	2024-08-23 16:25:17.207014+00	2024-08-23 20:04:49.114801+00	xlfUBnoed22pTHwUaujGUw	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	213	BbzdEAyoX4WRDFAgOVakGg	19533556-80f0-4370-87ba-8f69f9aa2670	t	2024-08-23 20:04:49.116697+00	2024-08-23 21:24:06.98935+00	Emew9Q0bvF9fth6PLEVQEw	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	214	SmUnUuTBjMGzKS-7V0V1Hw	19533556-80f0-4370-87ba-8f69f9aa2670	t	2024-08-23 21:24:06.990056+00	2024-08-24 05:08:06.457259+00	BbzdEAyoX4WRDFAgOVakGg	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	215	E2jw5uMW6iaghMCKBP0dDA	19533556-80f0-4370-87ba-8f69f9aa2670	f	2024-08-24 05:08:06.458963+00	2024-08-24 05:08:06.458963+00	SmUnUuTBjMGzKS-7V0V1Hw	bb14311d-d8b7-4568-89fe-7b582d87564a
00000000-0000-0000-0000-000000000000	216	MVyaAJ81rZz9L-DyvLkwUw	a20b192f-f559-494a-ad3f-66a2d9b0f81b	t	2024-10-18 00:20:16.574831+00	2024-10-18 02:14:30.616389+00	\N	423a08db-4f26-4eea-ae4f-adc766387ac0
00000000-0000-0000-0000-000000000000	217	ULAgpURB38d6WNckJOKNvw	a20b192f-f559-494a-ad3f-66a2d9b0f81b	t	2024-10-18 02:14:30.624335+00	2024-10-18 03:26:34.874707+00	MVyaAJ81rZz9L-DyvLkwUw	423a08db-4f26-4eea-ae4f-adc766387ac0
00000000-0000-0000-0000-000000000000	218	YAUgz5q1wCSTR1WY8lQVNg	a20b192f-f559-494a-ad3f-66a2d9b0f81b	t	2024-10-18 03:26:34.876012+00	2024-10-18 04:51:28.815241+00	ULAgpURB38d6WNckJOKNvw	423a08db-4f26-4eea-ae4f-adc766387ac0
00000000-0000-0000-0000-000000000000	219	CHm1HaNhqVIiJhBbL3VxbA	a20b192f-f559-494a-ad3f-66a2d9b0f81b	t	2024-10-18 04:51:28.816354+00	2024-10-18 14:01:46.819813+00	YAUgz5q1wCSTR1WY8lQVNg	423a08db-4f26-4eea-ae4f-adc766387ac0
00000000-0000-0000-0000-000000000000	222	XMMR9Oq4Vj7WGHWJsH8zNw	cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	t	2024-10-21 02:57:02.798176+00	2024-10-21 03:59:33.046809+00	\N	24138074-8c5c-44f6-aa6c-18f8ee95aa17
00000000-0000-0000-0000-000000000000	223	8HO-qBnSTyh6TlOYG7oL-w	cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	f	2024-10-21 03:59:33.049131+00	2024-10-21 03:59:33.049131+00	XMMR9Oq4Vj7WGHWJsH8zNw	24138074-8c5c-44f6-aa6c-18f8ee95aa17
00000000-0000-0000-0000-000000000000	220	vIWg2EkM3c3M_4N30GctrA	a20b192f-f559-494a-ad3f-66a2d9b0f81b	t	2024-10-18 14:01:46.828429+00	2024-10-21 19:59:43.53881+00	CHm1HaNhqVIiJhBbL3VxbA	423a08db-4f26-4eea-ae4f-adc766387ac0
00000000-0000-0000-0000-000000000000	224	sF0l5nAr8_sZEBlrX2oaOA	a20b192f-f559-494a-ad3f-66a2d9b0f81b	f	2024-10-21 19:59:43.541924+00	2024-10-21 19:59:43.541924+00	vIWg2EkM3c3M_4N30GctrA	423a08db-4f26-4eea-ae4f-adc766387ac0
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
d9682bc1-691e-438e-963a-da223dc04e00	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	2024-08-23 08:25:04.644644+00	2024-08-23 08:25:04.644644+00	\N	aal1	\N	\N	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	142.114.201.87	\N
bb14311d-d8b7-4568-89fe-7b582d87564a	19533556-80f0-4370-87ba-8f69f9aa2670	2024-08-23 14:08:59.064754+00	2024-08-24 05:08:06.462359+00	\N	aal1	\N	2024-08-24 05:08:06.462291	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	142.114.201.87	\N
24138074-8c5c-44f6-aa6c-18f8ee95aa17	cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	2024-10-21 02:57:02.794803+00	2024-10-21 03:59:33.052435+00	\N	aal1	\N	2024-10-21 03:59:33.052362	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	99.239.136.11	\N
423a08db-4f26-4eea-ae4f-adc766387ac0	a20b192f-f559-494a-ad3f-66a2d9b0f81b	2024-10-18 00:20:16.560483+00	2024-10-21 19:59:43.549645+00	\N	aal1	\N	2024-10-21 19:59:43.549553	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	99.238.160.169	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	0faca622-1c6b-4855-b535-1e5da1e9d789	authenticated	authenticated	jokaci5953@eixdeal.com	$2a$10$jxEiNv9bDEChZuw5N.cc2e1ghbNT0wJdFZHFZGDl.bk.o3rYHHuPa	2024-08-05 07:29:26.875035+00	\N		2024-08-05 07:28:58.557757+00		\N			\N	2024-08-05 07:29:26.879573+00	{"provider": "email", "providers": ["email"]}	{"sub": "0faca622-1c6b-4855-b535-1e5da1e9d789", "email": "jokaci5953@eixdeal.com", "avatar": "", "fullName": "", "email_verified": false, "phone_verified": false}	\N	2024-08-05 07:28:58.548125+00	2024-08-05 20:37:37.503045+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	authenticated	authenticated	test@test.com	$2a$10$7eI8bpmoIa9v8X/yrapGn.Q56o6HUhP3xo/Mg30slnvm2XNyW2vVG	2024-08-05 07:22:32.534746+00	\N		\N		\N			\N	2024-08-23 08:25:04.644573+00	{"provider": "email", "providers": ["email"]}	{"sub": "d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6", "email": "test@test.com", "avatar": "https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/avatars/avatar-d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6-0.5302629676880419", "fullName": "Update User", "email_verified": false, "phone_verified": false}	\N	2024-08-05 07:22:32.516621+00	2024-08-23 08:25:04.647131+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	205bb5ea-6c0d-4b49-b0ba-7677f0198c29	authenticated	authenticated	chai@example.com	$2a$10$XR8l5Htz3e9yluyc/GX7OOleOMCmZrvMj8PdxNplLfdL4Cx/OXWqi	\N	\N	7e97b6044d31df23a3e16cc4ecb9a335a75577f633a14ebf6b40617e	2024-08-23 14:10:44.977557+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "205bb5ea-6c0d-4b49-b0ba-7677f0198c29", "email": "chai@example.com", "avatar": "", "email_verified": false, "phone_verified": false}	\N	2024-08-23 14:10:44.958689+00	2024-08-23 14:10:46.825064+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	19533556-80f0-4370-87ba-8f69f9aa2670	authenticated	authenticated	yasuaki@example.com	$2a$10$GJ936PsVHztQif5.0h8/d.FCQBiqbU1kaTHKyb2aIV7TYiYmLiClq	2024-08-05 02:12:56.308892+00	\N		\N		\N			\N	2024-08-23 14:08:59.064685+00	{"provider": "email", "providers": ["email"]}	{"avatar": "https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/avatars/avatar-19533556-80f0-4370-87ba-8f69f9aa2670-0.8956835394419747", "fullName": "yasuaki"}	\N	2024-08-05 02:12:56.289576+00	2024-08-24 05:08:06.459951+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	cd80ca0a-1314-4ef4-be5d-fbed5a83f49a	authenticated	authenticated	user@user.com	$2a$10$6Kz010Z.Rl637YjguDma/uVtDaSGGKcG4nTy4SJ87VcuEaaUKH4z.	2024-10-21 02:46:40.015033+00	\N		\N		\N			\N	2024-10-21 02:57:02.79468+00	{"provider": "email", "providers": ["email"]}	{}	\N	2024-10-21 02:46:39.984924+00	2024-10-21 03:59:33.050239+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a20b192f-f559-494a-ad3f-66a2d9b0f81b	authenticated	authenticated	test@user.com	$2a$10$PDla2igoYzr3532Kajtiv.G1oamiZ388HdZPAREl7SCGY9dCEwF3m	2024-10-18 00:19:54.721025+00	\N		\N		\N			\N	2024-10-18 00:20:16.559754+00	{"provider": "email", "providers": ["email"]}	{"avatar": "https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/avatars/avatar-a20b192f-f559-494a-ad3f-66a2d9b0f81b-0.8268759040239895", "fullName": "Test User"}	\N	2024-10-18 00:19:54.682446+00	2024-10-21 20:01:06.113028+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, created_at, "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") FROM stdin;
935	2024-10-01 03:14:28.094+00	2024-10-21 00:00:00	2024-10-28 00:00:00	7	1	1750	105	1855	unconfirmed	t	f	I have a gluten allergy and would like to request a gluten-free breakfast.	316	825
936	2024-09-18 03:14:28.094+00	2024-09-28 00:00:00	2024-10-08 00:00:00	10	2	2500	300	2800	checked-out	t	t		316	826
937	2024-09-24 03:14:28.094+00	2024-11-02 00:00:00	2024-11-08 00:00:00	6	2	1500	0	1500	unconfirmed	f	f		316	827
938	2024-09-06 03:14:28.094+00	2024-09-06 00:00:00	2024-09-22 00:00:00	16	2	5200	0	5200	checked-out	f	t		317	828
939	2024-10-19 03:14:28.094+00	2024-11-05 00:00:00	2024-11-08 00:00:00	3	2	975	90	1065	unconfirmed	t	t		317	829
940	2024-10-16 03:14:28.095+00	2024-11-23 00:00:00	2024-12-08 00:00:00	15	2	4875	450	5325	unconfirmed	t	f		317	830
941	2024-08-17 03:14:28.095+00	2024-09-26 00:00:00	2024-10-01 00:00:00	5	4	1500	300	1800	checked-out	t	t		318	831
942	2024-10-19 03:14:28.095+00	2024-10-19 00:00:00	2024-10-21 00:00:00	2	3	600	0	600	checked-in	f	t	We will be bringing our small dog with us	318	832
943	2024-10-07 03:14:28.095+00	2024-10-07 00:00:00	2024-10-10 00:00:00	3	4	900	180	1080	checked-out	t	t		318	833
944	2024-09-21 03:14:28.095+00	2024-10-17 00:00:00	2024-10-29 00:00:00	12	4	5400	720	6120	checked-in	t	t		319	834
945	2024-10-20 03:14:28.095+00	2024-11-02 00:00:00	2024-11-07 00:00:00	5	4	2250	300	2550	unconfirmed	t	f		319	835
946	2024-10-18 03:14:28.095+00	2024-11-08 00:00:00	2024-11-09 00:00:00	1	1	450	0	450	unconfirmed	f	t		319	836
947	2024-10-21 03:14:28.095+00	2024-11-04 00:00:00	2024-11-11 00:00:00	7	5	2450	525	2975	unconfirmed	t	f		320	837
948	2024-10-15 03:14:28.095+00	2024-10-15 00:00:00	2024-10-17 00:00:00	2	4	700	120	820	checked-out	t	t		320	838
949	2024-10-17 03:14:28.095+00	2024-10-17 00:00:00	2024-10-20 00:00:00	3	6	1050	0	1050	checked-in	f	t		320	839
950	2024-10-18 03:14:28.095+00	2024-10-21 00:00:00	2024-11-01 00:00:00	11	6	7700	0	7700	unconfirmed	f	t	We will be checking in late, around midnight. Hope that's okay :)	321	840
951	2024-10-05 03:14:28.095+00	2024-10-05 00:00:00	2024-10-12 00:00:00	7	4	4900	420	5320	checked-out	t	t	I will need a rollaway bed for one of the guests	321	841
952	2024-10-03 03:14:28.095+00	2024-10-17 00:00:00	2024-10-20 00:00:00	3	6	2100	270	2370	checked-in	t	t		321	842
953	2024-10-19 03:14:28.095+00	2024-11-07 00:00:00	2024-11-13 00:00:00	6	8	3000	0	3000	unconfirmed	f	f		322	843
954	2024-10-14 03:14:28.095+00	2024-11-30 00:00:00	2024-12-10 00:00:00	10	7	5000	1050	6050	unconfirmed	t	t		322	844
955	2024-08-27 03:14:28.095+00	2024-11-22 00:00:00	2024-11-27 00:00:00	5	6	2500	450	2950	unconfirmed	t	t		322	845
956	2024-10-13 03:14:28.095+00	2024-10-16 00:00:00	2024-10-21 00:00:00	5	9	7000	675	7675	checked-in	t	t	My wife has a gluten allergy so I would like to request a gluten-free breakfast if possible	323	824
957	2024-10-21 03:14:28.095+00	2024-10-21 00:00:00	2024-10-26 00:00:00	5	10	7000	750	7750	unconfirmed	t	t	I am celebrating my anniversary, can you arrange for any special amenities or decorations?	323	846
958	2024-10-11 03:14:28.095+00	2024-10-31 00:00:00	2024-11-03 00:00:00	3	7	4200	0	4200	unconfirmed	f	t		323	847
\.


--
-- Data for Name: cabins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cabins (id, created_at, name, "maxCapacity", "regularPrice", discount, description, image) FROM stdin;
316	2024-10-21 03:21:17.410768+00	001	2	250	0	Discover the ultimate luxury getaway for couples in the cozy wooden cabin 001. Nestled in a picturesque forest, this stunning cabin offers a secluded and intimate retreat. Inside, enjoy modern high-quality wood interiors, a comfortable seating area, a fireplace and a fully-equipped kitchen. The plush king-size bed, dressed in fine linens guarantees a peaceful nights sleep. Relax in the spa-like shower and unwind on the private deck with hot tub.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-001.jpg
317	2024-10-21 03:21:17.410768+00	002	2	350	25	Escape to the serenity of nature and indulge in luxury in our cozy cabin 002. Perfect for couples, this cabin offers a secluded and intimate retreat in the heart of a picturesque forest. Inside, you will find warm and inviting interiors crafted from high-quality wood, a comfortable living area, a fireplace and a fully-equipped kitchen. The luxurious bedroom features a plush king-size bed and spa-like shower. Relax on the private deck with hot tub and take in the beauty of nature.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-002.jpg
318	2024-10-21 03:21:17.410768+00	003	4	300	0	Experience luxury family living in our medium-sized wooden cabin 003. Perfect for families of up to 4 people, this cabin offers a comfortable and inviting space with all modern amenities. Inside, you will find warm and inviting interiors crafted from high-quality wood, a comfortable living area, a fireplace, and a fully-equipped kitchen. The bedrooms feature plush beds and spa-like bathrooms. The cabin has a private deck with a hot tub and outdoor seating area, perfect for taking in the natural surroundings.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-003.jpg
319	2024-10-21 03:21:17.410768+00	004	4	500	50	Indulge in the ultimate luxury family vacation in this medium-sized cabin 004. Designed for families of up to 4, this cabin offers a sumptuous retreat for the discerning traveler. Inside, the cabin boasts of opulent interiors crafted from the finest quality wood, a comfortable living area, a fireplace, and a fully-equipped gourmet kitchen. The bedrooms are adorned with plush beds and spa-inspired en-suite bathrooms. Step outside to your private deck and soak in the natural surroundings while relaxing in your own hot tub.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-004.jpg
320	2024-10-21 03:21:17.410768+00	005	6	350	0	Enjoy a comfortable and cozy getaway with your group or family in our spacious cabin 005. Designed to accommodate up to 6 people, this cabin offers a secluded retreat in the heart of nature. Inside, the cabin features warm and inviting interiors crafted from quality wood, a living area with fireplace, and a fully-equipped kitchen. The bedrooms are comfortable and equipped with en-suite bathrooms. Step outside to your private deck and take in the natural surroundings while relaxing in your own hot tub.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-005.jpg
321	2024-10-21 03:21:17.410768+00	006	6	800	100	Experience the epitome of luxury with your group or family in our spacious wooden cabin 006. Designed to comfortably accommodate up to 6 people, this cabin offers a lavish retreat in the heart of nature. Inside, the cabin features opulent interiors crafted from premium wood, a grand living area with fireplace, and a fully-equipped gourmet kitchen. The bedrooms are adorned with plush beds and spa-like en-suite bathrooms. Step outside to your private deck and soak in the natural surroundings while relaxing in your own hot tub.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-006.jpg
322	2024-10-21 03:21:17.410768+00	007	8	600	100	Accommodate your large group or multiple families in the spacious and grand wooden cabin 007. Designed to comfortably fit up to 8 people, this cabin offers a secluded retreat in the heart of beautiful forests and mountains. Inside, the cabin features warm and inviting interiors crafted from quality wood, multiple living areas with fireplace, and a fully-equipped kitchen. The bedrooms are comfortable and equipped with en-suite bathrooms. The cabin has a private deck with a hot tub and outdoor seating area, perfect for taking in the natural surroundings.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-007.jpg
323	2024-10-21 03:21:17.410768+00	008	10	1400	0	Experience the epitome of luxury and grandeur with your large group or multiple families in our grand cabin 008. This cabin offers a lavish retreat that caters to all your needs and desires. The cabin features an opulent design and boasts of high-end finishes, intricate details and the finest quality wood throughout. Inside, the cabin features multiple grand living areas with fireplaces, a formal dining area, and a gourmet kitchen that is a chef's dream. The bedrooms are designed for ultimate comfort and luxury, with plush beds and en-suite spa-inspired bathrooms. Step outside and immerse yourself in the beauty of nature from your private deck, featuring a luxurious hot tub and ample seating areas for ultimate relaxation and enjoyment.	https://wyepzrmhsudkuidtnabf.supabase.co/storage/v1/object/public/cabin-images/cabin-008.jpg
\.


--
-- Data for Name: guests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guests (id, created_at, "fullName", email, "nationalID", nationality, "countryFlag") FROM stdin;
824	2024-10-21 03:21:17.33345+00	Jonas Schmedtmann	hello@jonas.io	3525436345	Portugal	https://flagcdn.com/pt.svg
825	2024-10-21 03:21:17.33345+00	Jonathan Smith	johnsmith@test.eu	4534593454	Great Britain	https://flagcdn.com/gb.svg
826	2024-10-21 03:21:17.33345+00	Jonatan Johansson	jonatan@example.com	9374074454	Finland	https://flagcdn.com/fi.svg
827	2024-10-21 03:21:17.33345+00	Jonas Mueller	jonas@example.eu	1233212288	Germany	https://flagcdn.com/de.svg
828	2024-10-21 03:21:17.33345+00	Jonas Anderson	anderson@example.com	0988520146	Bolivia (Plurinational State of)	https://flagcdn.com/bo.svg
829	2024-10-21 03:21:17.33345+00	Jonathan Williams	jowi@gmail.com	633678543	United States of America	https://flagcdn.com/us.svg
830	2024-10-21 03:21:17.33345+00	Emma Watson	emma@gmail.com	1234578901	United Kingdom	https://flagcdn.com/gb.svg
831	2024-10-21 03:21:17.33345+00	Mohammed Ali	mohammedali@yahoo.com	987543210	Egypt	https://flagcdn.com/eg.svg
832	2024-10-21 03:21:17.33345+00	Maria Rodriguez	maria@gmail.com	1098765321	Spain	https://flagcdn.com/es.svg
833	2024-10-21 03:21:17.33345+00	Li Mei	li.mei@hotmail.com	102934756	China	https://flagcdn.com/cn.svg
834	2024-10-21 03:21:17.33345+00	Khadija Ahmed	khadija@gmail.com	1023457890	Sudan	https://flagcdn.com/sd.svg
835	2024-10-21 03:21:17.33345+00	Gabriel Silva	gabriel@gmail.com	109283465	Brazil	https://flagcdn.com/br.svg
836	2024-10-21 03:21:17.33345+00	Maria Gomez	maria@example.com	108765421	Mexico	https://flagcdn.com/mx.svg
837	2024-10-21 03:21:17.33345+00	Ahmed Hassan	ahmed@gmail.com	1077777777	Egypt	https://flagcdn.com/eg.svg
838	2024-10-21 03:21:17.33345+00	John Doe	johndoe@gmail.com	3245908744	United States	https://flagcdn.com/us.svg
839	2024-10-21 03:21:17.33345+00	Fatima Ahmed	fatima@example.com	1089999363	Pakistan	https://flagcdn.com/pk.svg
840	2024-10-21 03:21:17.33345+00	David Smith	david@gmail.com	44450960283	Australia	https://flagcdn.com/au.svg
841	2024-10-21 03:21:17.33345+00	Marie Dupont	marie@gmail.com	06934233728	France	https://flagcdn.com/fr.svg
842	2024-10-21 03:21:17.33345+00	Ramesh Patel	ramesh@gmail.com	9875412303	India	https://flagcdn.com/in.svg
843	2024-10-21 03:21:17.33345+00	Fatimah Al-Sayed	fatimah@gmail.com	0123456789	Kuwait	https://flagcdn.com/kw.svg
844	2024-10-21 03:21:17.33345+00	Nina Williams	nina@hotmail.com	2345678901	South Africa	https://flagcdn.com/za.svg
845	2024-10-21 03:21:17.33345+00	Taro Tanaka	taro@gmail.com	3456789012	Japan	https://flagcdn.com/jp.svg
846	2024-10-21 03:21:17.33345+00	Abdul Rahman	abdul@gmail.com	4567890123	Saudi Arabia	https://flagcdn.com/sa.svg
847	2024-10-21 03:21:17.33345+00	Julie Nguyen	julie@gmail.com	5678901234	Vietnam	https://flagcdn.com/vn.svg
848	2024-10-21 03:21:17.33345+00	Sara Lee	sara@gmail.com	6789012345	South Korea	https://flagcdn.com/kr.svg
849	2024-10-21 03:21:17.33345+00	Carlos Gomez	carlos@yahoo.com	7890123456	Colombia	https://flagcdn.com/co.svg
850	2024-10-21 03:21:17.33345+00	Emma Brown	emma@gmail.com	8901234567	Canada	https://flagcdn.com/ca.svg
851	2024-10-21 03:21:17.33345+00	Juan Hernandez	juan@yahoo.com	4343433333	Argentina	https://flagcdn.com/ar.svg
852	2024-10-21 03:21:17.33345+00	Ibrahim Ahmed	ibrahim@yahoo.com	2345678009	Nigeria	https://flagcdn.com/ng.svg
853	2024-10-21 03:21:17.33345+00	Mei Chen	mei@gmail.com	3456117890	Taiwan	https://flagcdn.com/tw.svg
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inquiries (id, created_at, "fullName", email, subject, message) FROM stdin;
1	2024-08-22 07:41:06.780697+00	jonas	test	booking	Hey!
2	2024-08-22 07:42:22.491209+00	jonas	test	booking	Hey!
3	2024-08-22 07:45:54.474961+00	jonas	test	booking	Hey!
4	2024-08-22 07:46:26.871103+00	jonas	test	booking	Hey!
5	2024-08-22 08:25:36.621297+00	jonas	test	booking	Hey!
6	2024-08-22 08:25:37.168934+00	jonas	test	booking	Hey!
7	2024-08-22 08:25:45.512123+00	jonas	test	booking	Hey!
8	2024-08-22 08:25:46.252769+00	jonas	test	booking	Hey!
9	2024-08-22 08:27:15.928888+00	\N	\N	\N	\N
10	2024-08-22 08:27:53.417651+00	Yasuaki Toyoda	ytoyoda27@gmail.com	booking-enquiry	test
11	2024-08-22 08:28:07.709025+00	Yasuaki Toyoda	ytoyoda27@gmail.com	booking-enquiry	test
12	2024-08-22 08:28:17.231255+00	Yasuaki Toyoda	ytoyoda27@gmail.com	booking-enquiry	test 3
13	2024-08-22 08:30:24.370148+00	Yasuaki Toyoda	ytoyoda27@gmail.com	booking-enquiry	test 3
14	2024-08-22 08:32:23.393374+00	Yasuaki Toyoda	ytoyoda27@gmail.com	cabin-information	test
15	2024-08-22 08:35:07.794298+00	Yasuaki Toyoda	ytoyoda27@gmail.com	cabin-information	test
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, created_at, "minBookingLength", "maxBookingLength", "maxGuestsPerBooking", "breakfastPrice") FROM stdin;
1	2024-07-23 23:46:52.994861+00	1	28	4	16
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-07-23 23:35:30
20211116045059	2024-07-23 23:35:30
20211116050929	2024-07-23 23:35:30
20211116051442	2024-07-23 23:35:30
20211116212300	2024-07-23 23:35:31
20211116213355	2024-07-23 23:35:31
20211116213934	2024-07-23 23:35:31
20211116214523	2024-07-23 23:35:31
20211122062447	2024-07-23 23:35:31
20211124070109	2024-07-23 23:35:31
20211202204204	2024-07-23 23:35:32
20211202204605	2024-07-23 23:35:32
20211210212804	2024-07-23 23:35:32
20211228014915	2024-07-23 23:35:32
20220107221237	2024-07-23 23:35:33
20220228202821	2024-07-23 23:35:33
20220312004840	2024-07-23 23:35:33
20220603231003	2024-07-23 23:35:33
20220603232444	2024-07-23 23:35:33
20220615214548	2024-07-23 23:35:33
20220712093339	2024-07-23 23:35:33
20220908172859	2024-07-23 23:35:34
20220916233421	2024-07-23 23:35:34
20230119133233	2024-07-23 23:35:34
20230128025114	2024-07-23 23:35:34
20230128025212	2024-07-23 23:35:34
20230227211149	2024-07-23 23:35:34
20230228184745	2024-07-23 23:35:35
20230308225145	2024-07-23 23:35:35
20230328144023	2024-07-23 23:35:35
20231018144023	2024-07-23 23:35:35
20231204144023	2024-07-23 23:35:35
20231204144024	2024-07-23 23:35:35
20231204144025	2024-07-23 23:35:36
20240108234812	2024-07-23 23:35:36
20240109165339	2024-07-23 23:35:36
20240227174441	2024-07-23 23:35:36
20240311171622	2024-07-23 23:35:36
20240321100241	2024-07-23 23:35:37
20240401105812	2024-07-23 23:35:37
20240418121054	2024-07-23 23:35:37
20240523004032	2024-07-23 23:35:38
20240618124746	2024-07-23 23:35:38
20240801235015	2024-08-17 04:56:48
20240805133720	2024-08-17 04:56:49
20240827160934	2024-10-21 19:46:19
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
avatars	avatars	\N	2024-07-24 05:14:36.465237+00	2024-07-24 05:14:36.465237+00	t	f	\N	\N	\N
cabin-images	cabin-images	\N	2024-07-24 05:15:13.949582+00	2024-07-24 05:15:13.949582+00	t	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-07-23 23:33:59.578895
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-07-23 23:33:59.646261
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-07-23 23:33:59.69698
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-07-23 23:33:59.77336
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-07-23 23:33:59.84581
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-07-23 23:33:59.908293
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-07-23 23:33:59.923812
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-07-23 23:33:59.98535
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-07-23 23:34:00.03726
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-07-23 23:34:00.088962
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-07-23 23:34:00.14678
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-07-23 23:34:00.201036
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-07-23 23:34:00.253093
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-07-23 23:34:00.306707
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-07-23 23:34:00.3612
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-07-23 23:34:00.445873
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-07-23 23:34:00.50121
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-07-23 23:34:00.556989
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-07-23 23:34:00.567527
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-07-23 23:34:00.621046
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-07-23 23:34:00.672927
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-07-23 23:34:00.690161
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-07-23 23:34:00.771941
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-07-23 23:34:00.842317
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-07-23 23:34:00.895546
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2024-08-19 23:58:41.484271
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
7768cea8-96f1-43ee-9607-5d219405a668	cabin-images	cabin-004.jpg	\N	2024-07-24 05:17:08.184483+00	2024-07-24 05:17:08.184483+00	2024-07-24 05:17:08.184483+00	{"eTag": "\\"d5f99c5227847b5561807cd24afd4a16-1\\"", "size": 250312, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:08.000Z", "contentLength": 250312, "httpStatusCode": 200}	297ce6fe-dbe7-4afd-a95e-fcdb3e38a2e4	\N	\N
a88a24bb-772c-4ef9-b986-4d33db78f0d9	cabin-images	cabin-002.jpg	\N	2024-07-24 05:17:08.317432+00	2024-07-24 05:17:08.317432+00	2024-07-24 05:17:08.317432+00	{"eTag": "\\"9da847f783d7018791464aa4befd1cc5-1\\"", "size": 211817, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:08.000Z", "contentLength": 211817, "httpStatusCode": 200}	dfd0b8eb-a28c-48c0-bc9d-2fe04bce4c8a	\N	\N
5f26f4d0-06fe-4c14-924e-2f2d2bd25294	cabin-images	cabin-007.jpg	\N	2024-07-24 05:17:08.789782+00	2024-07-24 05:17:08.789782+00	2024-07-24 05:17:08.789782+00	{"eTag": "\\"18377cc1afd74a13dd267c495093216d-1\\"", "size": 231604, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:09.000Z", "contentLength": 231604, "httpStatusCode": 200}	6710baef-eddc-43b6-ac50-f14d2fa2d78b	\N	\N
54e7f2bf-b145-4051-b324-897fad733698	cabin-images	cabin-003.jpg	\N	2024-07-24 05:17:09.240053+00	2024-07-24 05:17:09.240053+00	2024-07-24 05:17:09.240053+00	{"eTag": "\\"4b2b22bdcd724936b9a6dc09fe5e0fe6-1\\"", "size": 254300, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:09.000Z", "contentLength": 254300, "httpStatusCode": 200}	badfc73c-9b2e-4ccc-870a-3efaa544c778	\N	\N
4e74b11a-ce4f-472a-be6c-91c96ba27319	cabin-images	cabin-008.jpg	\N	2024-07-24 05:17:09.3139+00	2024-07-24 05:17:09.3139+00	2024-07-24 05:17:09.3139+00	{"eTag": "\\"9ab32ab61d756f5bce580da74e66b202-1\\"", "size": 252747, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:09.000Z", "contentLength": 252747, "httpStatusCode": 200}	6c60e119-8fb0-4893-8815-34d7b5242067	\N	\N
738a4188-5254-41d0-9b79-43b7c2ecfdaa	cabin-images	cabin-001.jpg	\N	2024-07-24 05:17:09.367053+00	2024-07-24 05:17:09.367053+00	2024-07-24 05:17:09.367053+00	{"eTag": "\\"45afb2ebfe28f136a081cca47924dd54-1\\"", "size": 261067, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:10.000Z", "contentLength": 261067, "httpStatusCode": 200}	964544ce-4151-4cdf-841f-e6b34484a92b	\N	\N
3825cc3f-a671-48da-aaff-4673cced5d89	cabin-images	cabin-006.jpg	\N	2024-07-24 05:17:09.536778+00	2024-07-24 05:17:09.536778+00	2024-07-24 05:17:09.536778+00	{"eTag": "\\"cf79d9caf48c24639ca629a06271f760-1\\"", "size": 262253, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:10.000Z", "contentLength": 262253, "httpStatusCode": 200}	b0575bc4-bd83-4635-a341-c7292c1f56e0	\N	\N
66f9cda8-1370-44c1-b7f8-49e9f508355a	cabin-images	cabin-005.jpg	\N	2024-07-24 05:17:09.563091+00	2024-07-24 05:17:09.563091+00	2024-07-24 05:17:09.563091+00	{"eTag": "\\"671afbb6c6bab3546973f776f6732de3-1\\"", "size": 298446, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-24T05:17:10.000Z", "contentLength": 298446, "httpStatusCode": 200}	cacf64e0-34f2-4f3f-9cdc-419e5898262c	\N	\N
b7b4e50a-2140-4a65-8546-878215c8b6d0	cabin-images	0.8746882199619086-default-user.jpg	\N	2024-07-25 07:27:47.765816+00	2024-07-25 07:27:47.765816+00	2024-07-25 07:27:47.765816+00	{"eTag": "\\"5578482ea3700923d89ee20620461a60\\"", "size": 8104, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-25T07:27:48.000Z", "contentLength": 8104, "httpStatusCode": 200}	afef3cd1-2d08-4ad0-b6c6-85a96da819a2	\N	\N
76dbc909-9236-42a2-a0f5-ff0f4b3d1b13	cabin-images	0.21697550849601122-cabin-008.jpg	\N	2024-07-25 15:33:25.500977+00	2024-07-25 15:33:25.500977+00	2024-07-25 15:33:25.500977+00	{"eTag": "\\"c4c9d33aabf06bdd7cb18fbef5837a7f\\"", "size": 252747, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-25T15:33:26.000Z", "contentLength": 252747, "httpStatusCode": 200}	cf5932d8-9f15-42c5-9bd8-d45a5913542f	\N	\N
29938467-38bd-4db9-b563-9c43eb7308d7	cabin-images	0.5116390732668983-undefined	\N	2024-07-25 16:07:03.027484+00	2024-07-25 16:07:03.027484+00	2024-07-25 16:07:03.027484+00	{"eTag": "\\"2510c39011c5be704182423e3a695e91\\"", "size": 1, "mimetype": "text/plain;charset=UTF-8", "cacheControl": "max-age=3600", "lastModified": "2024-07-25T16:07:03.000Z", "contentLength": 1, "httpStatusCode": 200}	164bdea7-3929-4756-9d19-044b02134e98	\N	\N
665ad797-2632-42f4-b46d-920d1967b8c1	cabin-images	0.2518234813866347-cabin-002.jpg	\N	2024-07-25 17:59:36.167943+00	2024-07-25 17:59:36.167943+00	2024-07-25 17:59:36.167943+00	{"eTag": "\\"066647c2de6f1de34d0253f8fcd26ed8\\"", "size": 211817, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-25T17:59:37.000Z", "contentLength": 211817, "httpStatusCode": 200}	573b742e-12c2-4507-b34a-b28bc539acd3	\N	\N
e90332d5-18df-42d3-9593-3ff8a2033a91	cabin-images	0.14581961776132224-cabin-002.jpg	\N	2024-07-25 20:58:28.39976+00	2024-07-25 20:58:28.39976+00	2024-07-25 20:58:28.39976+00	{"eTag": "\\"066647c2de6f1de34d0253f8fcd26ed8\\"", "size": 211817, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-07-25T20:58:29.000Z", "contentLength": 211817, "httpStatusCode": 200}	cadd3b64-fc89-4b83-b609-5f3138cad989	\N	\N
5e0714af-1ca6-42f1-8943-0d567c4681a9	avatars	avatar-d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6-0.7705573213877002	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	2024-08-05 21:55:39.580955+00	2024-08-05 21:55:39.580955+00	2024-08-05 21:55:39.580955+00	{"eTag": "\\"c4c9d33aabf06bdd7cb18fbef5837a7f\\"", "size": 252747, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-05T21:55:40.000Z", "contentLength": 252747, "httpStatusCode": 200}	f66420f9-fec5-4b9d-ae1d-ad9068f07c18	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	\N
bde25370-cf3e-46dc-8e5b-2d76b5e3520f	avatars	avatar-d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6-0.25744006349928394	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	2024-08-05 22:03:48.241476+00	2024-08-05 22:03:48.241476+00	2024-08-05 22:03:48.241476+00	{"eTag": "\\"70bc8192eddc7bc8aaa156219831fa10\\"", "size": 261067, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-05T22:03:49.000Z", "contentLength": 261067, "httpStatusCode": 200}	5d9b453e-bd7a-41cb-83d5-ee9edec38843	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	\N
6591fdc8-e2f2-4fc1-b442-6ba45d156323	avatars	avatar-d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6-0.6155388219027029	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	2024-08-08 19:13:29.130576+00	2024-08-08 19:13:29.130576+00	2024-08-08 19:13:29.130576+00	{"eTag": "\\"066647c2de6f1de34d0253f8fcd26ed8\\"", "size": 211817, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-08T19:13:29.000Z", "contentLength": 211817, "httpStatusCode": 200}	b2c2016b-9b2a-430d-94f0-010eb10b00d6	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	\N
3a84327a-09c3-410e-856d-a8da8807538d	avatars	avatar-d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6-0.5302629676880419	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	2024-08-08 19:17:45.302609+00	2024-08-08 19:17:45.302609+00	2024-08-08 19:17:45.302609+00	{"eTag": "\\"2fcf85bc519e417824215fc7c148c288\\"", "size": 51772, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-08T19:17:46.000Z", "contentLength": 51772, "httpStatusCode": 200}	2a9de1e4-b797-4108-acca-9102e5847c9a	d2b6ed87-df41-4c72-b8a7-14bccb1cf7e6	\N
89d96b7f-ce01-432e-8c29-8915391978ed	avatars	avatar-19533556-80f0-4370-87ba-8f69f9aa2670-0.8956835394419747	19533556-80f0-4370-87ba-8f69f9aa2670	2024-08-09 00:06:30.568597+00	2024-08-09 00:06:30.568597+00	2024-08-09 00:06:30.568597+00	{"eTag": "\\"b85796090e0e7287ea1f96dcdcc7bed3\\"", "size": 55454, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-09T00:06:31.000Z", "contentLength": 55454, "httpStatusCode": 200}	12d77e0c-b517-4b80-95b3-213b77bb8d16	19533556-80f0-4370-87ba-8f69f9aa2670	\N
de717c61-1843-4cc5-94c2-187119016370	cabin-images	0.8325041918997835-9720037.jpg	19533556-80f0-4370-87ba-8f69f9aa2670	2024-08-23 20:51:48.158161+00	2024-08-23 20:51:48.158161+00	2024-08-23 20:51:48.158161+00	{"eTag": "\\"c5fc3be75d0b5f185041e89bd47d407b\\"", "size": 673836, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-08-23T20:51:49.000Z", "contentLength": 673836, "httpStatusCode": 200}	dad580e2-a9fa-44c6-b119-82622894a3fc	19533556-80f0-4370-87ba-8f69f9aa2670	{}
bef54108-50b2-499e-bf8e-62056f39986f	avatars	avatar-a20b192f-f559-494a-ad3f-66a2d9b0f81b-0.8268759040239895	a20b192f-f559-494a-ad3f-66a2d9b0f81b	2024-10-21 20:01:05.731607+00	2024-10-21 20:01:05.731607+00	2024-10-21 20:01:05.731607+00	{"eTag": "\\"7ae2856b83fef48f19f6701913835c96\\"", "size": 44209, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-10-21T20:01:06.000Z", "contentLength": 44209, "httpStatusCode": 200}	14173562-907f-4e82-bb78-25e79bd6a0a2	a20b192f-f559-494a-ad3f-66a2d9b0f81b	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 224, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: Bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Bookings_id_seq"', 958, true);


--
-- Name: Cabin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cabin_id_seq"', 323, true);


--
-- Name: Guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Guests_id_seq"', 853, true);


--
-- Name: Settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Settings_id_seq"', 1, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 15, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: bookings Bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_pkey" PRIMARY KEY (id);


--
-- Name: cabins Cabin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cabins
    ADD CONSTRAINT "Cabin_pkey" PRIMARY KEY (id);


--
-- Name: guests Guests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guests
    ADD CONSTRAINT "Guests_pkey" PRIMARY KEY (id);


--
-- Name: settings Settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT "Settings_pkey" PRIMARY KEY (id);


--
-- Name: inquiries inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: bookings Bookings_cabinId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_cabinId_fkey" FOREIGN KEY ("cabinId") REFERENCES public.cabins(id);


--
-- Name: bookings Bookings_guestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT "Bookings_guestId_fkey" FOREIGN KEY ("guestId") REFERENCES public.guests(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: cabins Enable All; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable All" ON public.cabins USING (true);


--
-- Name: bookings Enable delete access for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable delete access for authenticated users" ON public.bookings FOR DELETE TO authenticated USING (true);


--
-- Name: cabins Enable delete for all users ; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable delete for all users " ON public.cabins FOR DELETE USING (true);


--
-- Name: bookings Enable insert access for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable insert access for authenticated users" ON public.bookings FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: cabins Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.cabins FOR SELECT USING (true);


--
-- Name: guests Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.guests FOR SELECT USING (true);


--
-- Name: settings Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.settings FOR SELECT USING (true);


--
-- Name: bookings Enable read access for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for authenticated users" ON public.bookings FOR SELECT TO authenticated USING (true);


--
-- Name: settings Enable update access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable update access for all users" ON public.settings FOR UPDATE USING (true);


--
-- Name: bookings Enable update access for authenticated users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable update access for authenticated users" ON public.bookings FOR UPDATE TO authenticated USING (true);


--
-- Name: guests Grant access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Grant access for all users" ON public.guests USING (true);


--
-- Name: bookings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

--
-- Name: cabins; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.cabins ENABLE ROW LEVEL SECURITY;

--
-- Name: guests; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.guests ENABLE ROW LEVEL SECURITY;

--
-- Name: inquiries; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.inquiries ENABLE ROW LEVEL SECURITY;

--
-- Name: settings; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.settings ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow all operations qy2d3w_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations qy2d3w_0" ON storage.objects FOR SELECT USING ((bucket_id = 'cabin-images'::text));


--
-- Name: objects Allow all operations qy2d3w_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations qy2d3w_1" ON storage.objects FOR UPDATE USING ((bucket_id = 'cabin-images'::text));


--
-- Name: objects Allow all operations qy2d3w_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations qy2d3w_2" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'cabin-images'::text));


--
-- Name: objects Allow all operations qy2d3w_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow all operations qy2d3w_3" ON storage.objects FOR DELETE USING ((bucket_id = 'cabin-images'::text));


--
-- Name: objects Allow full access for authenticated users 1oj01fe_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow full access for authenticated users 1oj01fe_0" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Allow full access for authenticated users 1oj01fe_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow full access for authenticated users 1oj01fe_1" ON storage.objects FOR INSERT TO authenticated WITH CHECK ((bucket_id = 'avatars'::text));


--
-- Name: objects Allow full access for authenticated users 1oj01fe_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow full access for authenticated users 1oj01fe_2" ON storage.objects FOR UPDATE TO authenticated USING ((bucket_id = 'avatars'::text));


--
-- Name: objects Allow full access for authenticated users 1oj01fe_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow full access for authenticated users 1oj01fe_3" ON storage.objects FOR DELETE TO authenticated USING ((bucket_id = 'avatars'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION comment_directive(comment_ text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO postgres;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO anon;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO authenticated;
GRANT ALL ON FUNCTION graphql.comment_directive(comment_ text) TO service_role;


--
-- Name: FUNCTION exception(message text); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.exception(message text) TO postgres;
GRANT ALL ON FUNCTION graphql.exception(message text) TO anon;
GRANT ALL ON FUNCTION graphql.exception(message text) TO authenticated;
GRANT ALL ON FUNCTION graphql.exception(message text) TO service_role;


--
-- Name: FUNCTION get_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.get_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.get_schema_version() TO service_role;


--
-- Name: FUNCTION increment_schema_version(); Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql.increment_schema_version() TO postgres;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO anon;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO authenticated;
GRANT ALL ON FUNCTION graphql.increment_schema_version() TO service_role;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION operation(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.operation() TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: SEQUENCE seq_schema_version; Type: ACL; Schema: graphql; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE graphql.seq_schema_version TO postgres;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO anon;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO authenticated;
GRANT ALL ON SEQUENCE graphql.seq_schema_version TO service_role;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE bookings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bookings TO anon;
GRANT ALL ON TABLE public.bookings TO authenticated;
GRANT ALL ON TABLE public.bookings TO service_role;


--
-- Name: SEQUENCE "Bookings_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Bookings_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Bookings_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Bookings_id_seq" TO service_role;


--
-- Name: TABLE cabins; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cabins TO anon;
GRANT ALL ON TABLE public.cabins TO authenticated;
GRANT ALL ON TABLE public.cabins TO service_role;


--
-- Name: SEQUENCE "Cabin_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Cabin_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Cabin_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Cabin_id_seq" TO service_role;


--
-- Name: TABLE guests; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.guests TO anon;
GRANT ALL ON TABLE public.guests TO authenticated;
GRANT ALL ON TABLE public.guests TO service_role;


--
-- Name: SEQUENCE "Guests_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Guests_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Guests_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Guests_id_seq" TO service_role;


--
-- Name: TABLE settings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.settings TO anon;
GRANT ALL ON TABLE public.settings TO authenticated;
GRANT ALL ON TABLE public.settings TO service_role;


--
-- Name: SEQUENCE "Settings_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Settings_id_seq" TO anon;
GRANT ALL ON SEQUENCE public."Settings_id_seq" TO authenticated;
GRANT ALL ON SEQUENCE public."Settings_id_seq" TO service_role;


--
-- Name: TABLE inquiries; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.inquiries TO anon;
GRANT ALL ON TABLE public.inquiries TO authenticated;
GRANT ALL ON TABLE public.inquiries TO service_role;


--
-- Name: SEQUENCE inquiries_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.inquiries_id_seq TO anon;
GRANT ALL ON SEQUENCE public.inquiries_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.inquiries_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

