--SELECT de prueba para comprobar que está bien cargada la base de datos
SELECT * FROM bookings.flights LIMIT 10;

-- Ejercicio 1: Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
SELECT flight_id, route_no, status
FROM bookings.flights
WHERE status = 'On Time';

-- Ejercicio 2: Escribe una consulta que extraiga todas las columnas de la tabla bookings y refleje todas las reservas que han supuesto una cantidad total mayor a 1.000.000 (Unidades monetarias).
-- NOTA: No hay ninguna reserva que haya costado más de 1000000
SELECT *
FROM bookings.bookings
WHERE total_amount > 1000000;

-- Ejercicio 3:  Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.
SELECT *
FROM bookings.airplanes_data;

-- Ejercicio 4: Con el resultado anterior visualizado previamente, escribe una consulta que extraiga los identificadores de vuelo que han volado con un Boeing 737. (Código Modelo Avión = 733)
-- NOTA: La base de datos ha cambiado y no me aparece ningún avión con el código "733"
SELECT f.flight_id
FROM bookings.flights f
JOIN bookings.routes r ON r.route_no = f.route_no
WHERE r.airplane_code = '733';
-- Ejercicio 5: Escribe una consulSELECT * FROM bookings.routes LIMIT 1;ta que te muestre la información detallada de los tickets que han comprado las personas que se llaman Irina.
SELECT *
FROM bookings.tickets
WHERE passenger_name ILIKE 'irina%';

--EJERCICIOS OPCIONALES

-- Ejercicio 6: Mostrar las ciudades con más de un aeropuerto.
SELECT city, COUNT(*) AS num_aeropuertos
FROM bookings.airports
GROUP BY city
HAVING COUNT(*) > 1;

-- Ejercicio 7: Mostrar el número de vuelos por modelo de avión.
SELECT a.model, COUNT(f.flight_id) AS num_vuelos
FROM bookings.airplanes a
JOIN bookings.routes r ON r.airplane_code = a.airplane_code
JOIN bookings.flights f ON f.route_no = r.route_no
GROUP BY a.model;

-- Ejercicio 8: Reservas con más de un billete (varios pasajeros).
SELECT book_ref, COUNT(*) AS num_billetes
FROM bookings.tickets
GROUP BY book_ref
HAVING COUNT(*) > 1;

-- Ejercicio 9: Vuelos con retraso de salida superior a una hora.
SELECT flight_id, route_no, scheduled_departure, actual_departure
FROM bookings.flights
WHERE actual_departure - scheduled_departure > INTERVAL '1 hour';