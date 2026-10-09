-- Esquema de la réplica de ALIS (SQLite) usada en el laboratorio del portafolio.
-- Datos de prueba ficticios de Cúcuta.

CREATE TABLE profiles(id INTEGER PRIMARY KEY, full_name TEXT NOT NULL, role TEXT NOT NULL CHECK(role IN ('passenger','driver')), rating_avg REAL DEFAULT 5.0);

CREATE TABLE drivers(id INTEGER PRIMARY KEY, profile_id INTEGER NOT NULL UNIQUE REFERENCES profiles(id), status TEXT NOT NULL CHECK(status IN ('offline','available','on_trip','paused')), tier TEXT NOT NULL CHECK(tier IN ('bronze','silver','gold','diamond')), vehicle_type TEXT NOT NULL CHECK(vehicle_type IN ('car','moto')), vehicle_plate TEXT NOT NULL, current_lat REAL, current_lng REAL);

CREATE TABLE trips(id INTEGER PRIMARY KEY, passenger_id INTEGER NOT NULL REFERENCES profiles(id), driver_id INTEGER REFERENCES drivers(id), service_type TEXT NOT NULL CHECK(service_type IN ('car','moto','delivery')), status TEXT NOT NULL CHECK(status IN ('completed','cancelled','in_progress')), origin TEXT, destination TEXT, distance_km REAL, payment_method TEXT, fare_final INTEGER, commission_amount INTEGER, driver_earnings INTEGER, requested_at TEXT NOT NULL);

CREATE TABLE ratings(id INTEGER PRIMARY KEY, trip_id INTEGER NOT NULL REFERENCES trips(id), from_id INTEGER NOT NULL REFERENCES profiles(id), to_id INTEGER NOT NULL REFERENCES profiles(id), stars INTEGER NOT NULL CHECK(stars BETWEEN 1 AND 5), UNIQUE(trip_id, from_id));

CREATE TABLE wallet_transactions(id INTEGER PRIMARY KEY, driver_id INTEGER NOT NULL REFERENCES drivers(id), trip_id INTEGER REFERENCES trips(id), type TEXT NOT NULL, amount INTEGER NOT NULL, balance_after INTEGER NOT NULL, created_at TEXT NOT NULL);
