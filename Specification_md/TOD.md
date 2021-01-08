# Time of Day files

Four time-of-day files handle day-of-week and time-of-day restrictions and other attributes on links, segments, lanes, lane_segments and movements

# time_set_definitions
The specification currently allows for times of day to be represented in the following format: 
`XXXXXXXX_HHMM_HHMM`, where `XXXXXXXX` is a bitmap of days of the week, Sunday-Saturday, Holiday. The HHMM are the start and end times. This is adapted from the Synchro Universal Traffic Data Format (UTDF) TimeOfDay table structure. For example, Monday-Friday 0700-0900 would be `01111100_0700_0900`. Alternatively, these can be coded in the following time_set_definitions table and `timeday_id` referenced instead of this format. 

Field Name | Type | Required? | Description
-- | -- | -- | --
timeday_id | TimeDay\_ID | Required | Primary key, similar to service_id in GTFS. Unique name of the time of day. Preferable legible rather than a number.
monday | boolean | Required | Whether Mondays are included (and so on for the other boolean fields)
tuesday | boolean | Required | 0 or 1
wednesday | boolean | Required | 0 or 1
thursday | boolean | Required | 0 or 1
friday | boolean | Required | 0 or 1
saturday | boolean | Required | 0 or 1
sunday | boolean | Required | 0 or 1
holiday | boolean | Required | 0 or 1
start_time | timeofday | Required | HH:MM  (24hr format)
end_time | timeofday | Required | HH:MM  (24hr format)

Optional ad-hoc fields could define other types of day (`snow`, `unknown`, etc.).

# link_tod

link_tod is an optional file that handles day-of-week and time-of-day
restrictions on links. It is used for tolls (which may differ by
time-of-day), and part-time changes in link capacity. Since tolls often vary by time of day, they are placed in
this file.

link_tod data dictionary

| Field			| Type 			| Required? | Comment									|
| ------------- | ------------- | --------- | ----------------------------------------- |
| link_tod\_id  | Link_TOD\_ID  | Required  | Primary key                               |
| link\_id 		| Link\_ID 		| Required  | Foreign key, link table                    |
| time_day      | TimeDay\_Set 	| Conditionally required  | Define the availability/role of lane at different dates and times (either time_day or timeday_id is required)   |
| timeday_id      | TimeDay\_ID 	| Conditionally required  | Used if times-of-day are defined on the time_set_definitions table   |
| capacity 		| INTEGER 		| Optional  | Capacity (veh / hr / lane)   |
| free_speed		| INTEGER		| Optional	| Free flow speed   |
| lanes			| INTEGER		| Optional	| Number of lanes in the direction of travel   |
| bike\_facility	| TEXT			| Optional	| Type of bicycle accommodation: unknown, none, wcl, bikelane, cycletrack   |
| ped\_facility	| TEXT			| Optional	| Type of pedestrian accommodation: unknown, none, shoulder, sidewalk   |
| parking	| TEXT			| Optional	|	Type of parking: unknown, none, parallel, angle, other    |
| allowed\_uses | Use\_Set      | Optional  | Set of allowed uses: shoulder, parking, walk, all, bike, auto, hov2, hov3, truck, bus, etc.   |
| toll          | INTEGER       | Optional  | cents                                     |

# segment_tod

segment_tod is an optional file that handles day-of-week and time-of-day restrictions on segments. 
It is used for part-time changes in segment capacity and number of lanes.

segment_tod data dictionary

| Field			| Type 			| Required? | Comment									|
| ------------- | ------------- | --------- | ----------------------------------------- |
| segment\_tod\_id  | Segment\_TOD\_ID  | Required  | Primary key                               |
| segment\_id 	| Segment\_ID 	| Required	| Foreign key, segment table.  |
| time_day      | TimeDay\_Set 	| Conditionally required  | Define the availability/role of segment at different dates and times (either time_day or timeday_id is required)   |
| timeday_id      | TimeDay\_ID 	| Conditionally required  | Used if times-of-day are defined on the time_set_definitions table   |
| capacity 		| INTEGER 		| Optional  | Capacity (veh / hr / lane)   |
| free_speed		| INTEGER		| Optional	|Free flow speed   |
| lanes			| INTEGER		| Optional	| Number of lanes in the direction of travel (must be consistent with link lanes + lanes added) 	 |
| l\_lanes\_added	| INTEGER		| Optional	|	# of lanes added on the left of the link (negative indicates a lane drop).	 |
| r\_lanes\_added	| INTEGER		| Optional	|	# of lanes added on the right of the link (negative indicates a lane drop).	 |
| bike\_facility	| TEXT			| Optional	| Type of bicycle accommodation: unknown, none, wcl, bikelane, cycletrack   |
| ped\_facility	| TEXT			| Optional	| Type of pedestrian accommodation: unknown, none, shoulder, sidewalk   |
| parking	| TEXT			| Optional	|	Type of parking: unknown, none, parallel, angle, other    |
| allowed\_uses | Use\_Set      | Optional  | Set of allowed uses: shoulder, parking, walk, all, bike, auto, hov2, hov3, truck, bus, etc.   |
| toll          | INTEGER       | Optional  | cents                                     |

# lane_tod

| Field			| Type 			| Required? | Comment									|
| ------------- | ------------- | --------- | ----------------------------------------- |
| lane_tod\_id  | Lane_TOD\_ID  | Required  | Primary key                               |
| lane\_id 		| Lane\_ID 		| Required  | Foreign key, lane table                    |
| time_day      | TimeDay\_Set 	| Conditionally required  | Define the availability/role of lane at different dates and times (either time_day or timeday_id is required)   |
| timeday_id      | TimeDay\_ID 	| Conditionally required  | Used if times-of-day are defined on the time_set_definitions table   |
| lane\_num      | INTEGER       | Required  | e.g., -1, 1, 2 (use left-to-right numbering)   |
| allowed\_uses  | Use\_Set     | Optional  | Set of allowed uses: shoulder, parking, walk, all, bike, auto, hov2, hov3, truck, bus, etc.   |
| r_barrier      | Barrier_ID   | Optional  | Whether a barrier exists to prevent vehicles from changing lanes to the right (default is NONE)   |
| l_barrier      | Barrier_ID   | Optional   | Whether a barrier exists to prevent vehicles from changing lanes to the right (default is NONE)   |
| width          | DOUBLE       | Optional   | Width of the lane (feet)   |

# segment_lane_tod

| Field			| Type 			| Required? | Comment									|
| ------------- | ------------- | --------- | ----------------------------------------- |
| segment\_lane\_tod\_id  | Segment\_Lane\_TOD\_ID  | Required  | Primary key                               |
| segment\_lane\_id 		| Segment\_Lane\_ID 		| Required  | Foreign key, segment_lane table                    |
| time_day      | TimeDay\_Set 	| Conditionally required  | Define the availability/role of lane at different dates and times (either time_day or timeday_id is required)   |
| timeday_id      | TimeDay\_ID 	| Conditionally required  | Used if times-of-day are defined on the time_set_definitions table   |
| lane\_num      | INTEGER       | Required  | e.g., -1, 1, 2 (use left-to-right numbering)   |
| allowed\_uses  | Use\_Set     | Optional  | Set of allowed uses: shoulder, parking, walk, all, bike, auto, hov2, hov3, truck, bus, etc.   |
| r_barrier      | Barrier_ID   | Optional  | Whether a barrier exists to prevent vehicles from changing lanes to the right (default is NONE)   |
| l_barrier      | Barrier_ID   | Optional   | Whether a barrier exists to prevent vehicles from changing lanes to the right (default is NONE)   |
| width          | DOUBLE       | Optional   | Width of the lane (feet)   |

Ad hoc fields, such as notes, may also be added to any of these tables.
