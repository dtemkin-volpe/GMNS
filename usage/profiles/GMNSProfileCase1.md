# Case 1: Basic motor vehicle routing on a static network
 
A user-equilibrium routing algorithm is run on a static node-link network, which is also shown (perhaps crudely, with “stick” links) in a Geographic Information System (GIS). The GMNS tables required for this use case include
 
- config
- node
- link
 
The config table is needed because it contains the units for the other tables, as well as the coordinate reference system (CRS)
 
Table   Config table for case 1
 
| **name** | **type** | **description** | **needed** | **comment** |
| --- | --- | --- | --- | --- |
| dataset_name | any | Name used to describe this GMNS network | Yes |     |
| short_length | any | Length unit used for lane/ROW widths and linear references for segments, locations, etc. along links | No  | Simple node-link network does not use short-length units |
| long_length | any | Length unit used for link lengths | Yes | Typically, miles or km |
| speed | any | Units for speed. Usually long_length units per hour | Yes | Typically, mph or kph |
| crs | any | Coordinate system used for geometry data in this dataset. Preferably a string that can be accepted by pyproj (e.g., EPSG code or proj string) | Yes | Typically, WGS 84 (EPSG:4326) |
| geometry_field_format | any | The format used for geometry fields in the dataset. For example, WKT for files stored as plaintext | Yes | Typically, wkt |
| currency | any | Currency used in toll fields | Yes | Needed if tolls are modeled. Typically in cents (U.S.) |
| version_number | number | The version of the GMNS spec to which this dataset conforms | Yes |     |
| id_type | string | The type of primary key IDs for interopability (node_id, zone_id, etc.). May be enforced by user, database schema, or downstream software. Must be either string or integer. | {'enum': \['string', 'integer'\]} | Depends on whether the routing software needs primary keys of a particular type |
 
The node table is needed because it locates the network on the Earth and indicates how links are connected.
 
Table   Node table for case 1
 
| **name** | **type** | **description** | **needed** | **comments** |
| --- | --- | --- | --- | --- |
| node_id | any | Primary key | Yes |     |
| name | string |     | No  |     |
| x_coord | number | Coordinate system specified in config file (longitude, UTM-easting etc.) | Yes | To locate the nodes on a map |
| y_coord | number | Coordinate system specified in config file (latitude, UTM-northing etc.) | Yes | To locate the nodes on a map |
| z_coord | number | Optional. Altitude in short_length units. | No  |     |
| node_type | string | Optional. What it represents (intersection, transit station, park & ride). | Maybe | Depends on the routing algorithm. Some may require centroid nodes to be labeled as such. |
| ctrl_type | string | Optional. Intersection control type - one of ControlType_Set. | No  |     |
| zone_id | any | Optional. Could be a Transportation Analysis Zone (TAZ) or city, or census tract, or census block. | No  |     |
| parent_node_id | any | Optional. Associated node. For example, if this node is a sidewalk, a parent_nodek_id could represent the intersection it is associated with. | No  |     |
 
The link table is needed for routing.
 
Table   Link table for case 1
 
| **name** | **type** | **description** | **needed** | **comments** |
| --- | --- | --- | --- | --- |
| link_id | any | Primary key - could be SharedStreets Reference ID | Yes |     |
| name | string | Optional. Street or Path Name | No  |     |
| from_node_id | any | Required. Origin Node | Yes |     |
| to_node_id | any | Required. Destination Node | Yes |     |
| directed | boolean | Required. Whether the link is directed (travel only occurs from the from_node to the to_node) or undirected. | Yes |     |
| geometry_id | any | Optional. Foreign key (Link_Geometry table). | Maybe |     |
| geometry | any | Optional. Link geometry, in well-known text (WKT) format. Optionally, other formats supported by geopandas (GeoJSON, PostGIS) may be used if specified in geometry_field_format in gmns.spec.json | Maybe | Either geometry_id or geometry is needed if the links are to be displayed using true shapes (and not as a stick network). |
| parent_link_id | any | Optional. The parent of this link. For example,for a sidewalk, this is the adjacent road. | No  |     |
| dir_flag | integer | Optional.  <br>1 shapepoints go from from_node to to_node;  <br>\-1 shapepoints go in the reverse direction;  <br>0 link is undirected or no geometry information is provided. | No  |     |
| length | number | Optional. Length of the link in long_length units | Yes | Can by computed by the GIS based on the geometry |
| grade | number | % grade, negative is downhill | No  |     |
| facility_type | string | Facility type (e.g., freeway, arterial, etc.) | No  |     |
| capacity | number | Optional. Saturation capacity (passenger car equivalents / hr / lane) | Yes | Needed for capacitated minimum time routing |
| free_speed | number | Optional. Free flow speed, units defined by config file | Yes | Needed for capacitated minimum time routing |
| lanes | integer | Optional. Number of permanent lanes (not including turn pockets) in the direction of travel open to motor vehicles. It does not include bike lanes, shoulders or parking lanes. | Yes | Needed to compute overall link capacity, when capacity is per lane. |
| bike_facility | string | Optional. Types of bicycle accommodation based on the National Bikeway Network Data Template (Table 1-A at https://nmtdev.ornl.gov/assets/templates/NBN_DataTemplates_final.pdf) | No  |     |
| ped_facility | string | Optional. Type of pedestrian accommodation: unknown, none, shoulder, sidewalk, offstreet path | No  |     |
| parking | string | Optional. Type of parking: unknown, none, parallel, angle, other | No  |     |
| allowed_uses | string | Optional. Set of allowed uses that should appear in either the use_definition or use_group tables; comma-separated. | No  |     |
| toll | number | Optional. Toll on the link, in currency units. | No  |     |
| jurisdiction | string | Optional. Owner/operator of the link. | No  |     |
| row_width | number | Optional. Width (short_length units) of the entire right-of-way (both directions). | No  |     |
 
---------------------------------


