CREATE TABLE IF NOT EXISTS movement (
	mvmt_id INTEGER NOT NULL, 
	node_id INTEGER NOT NULL, 
	name TEXT, 
	ib_link_id INTEGER NOT NULL, 
	start_ib_lane INTEGER, 
	end_ib_lane INTEGER, 
	ob_link_id INTEGER NOT NULL, 
	start_ob_lane INTEGER, 
	end_ob_lane INTEGER, 
	type TEXT NOT NULL, 
	penalty FLOAT, 
	capacity FLOAT, 
	ctrl_type TEXT, 
	mvmt_code TEXT, 
	allowed_uses TEXT, 
	geometry TEXT, 
	PRIMARY KEY (mvmt_id), 
	FOREIGN KEY(node_id) REFERENCES node (node_id), 
	FOREIGN KEY(ib_link_id) REFERENCES link (link_id), 
	FOREIGN KEY(ob_link_id) REFERENCES link (link_id)
)