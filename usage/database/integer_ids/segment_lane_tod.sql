CREATE TABLE IF NOT EXISTS segment_lane_tod (
	segment_lane_tod_id INTEGER NOT NULL, 
	segment_lane_id INTEGER NOT NULL, 
	timeday_id INTEGER, 
	time_day TEXT, 
	lane_num INTEGER NOT NULL CHECK (lane_num >= -10) CHECK (lane_num <= 10), 
	allowed_uses TEXT, 
	r_barrier TEXT, 
	l_barrier TEXT, 
	width FLOAT CHECK (width >= 0), 
	PRIMARY KEY (segment_lane_tod_id), 
	FOREIGN KEY(timeday_id) REFERENCES time_set_definitions (timeday_id), 
	FOREIGN KEY(segment_lane_id) REFERENCES segment_lane (segment_lane_id)
)