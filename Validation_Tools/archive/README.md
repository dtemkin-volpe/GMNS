# Validation Tools
:warning: These validation tools are outdated. Please use the jupyter notebooks in the folder above. 

## Requirements:
- [Python](https://www.python.org/downloads/)
- The [NetworkX](https://networkx.github.io/) package for Python (for directed_validation.py and undirected_validation.py)
- A GMNS network with each table as its own CSV file. The field names in each table should match the specification exactly (all lower case). For examples, see the [Small Network Examples](../Small_Network_Examples) folder.
	- All required fields (and, for some validation tests, certain optional fields; see details below) must contain data.
	- The user will need to modify each script to include the path and filenames to these tables instead of the example tables.

## [directed_validation.py](directed_validation.py)  
Inputs: node.csv and link.csv from a GMNS formatted network. 
Required optional fields: 
None currently, may eventually require node_type from nodes.csv

Output: Prints to screen each pair of possible "to" and "from" nodes, and whether a path in the network exists. The user will need to interpret the results of this output based on their network -- depending on how it is configured, the existence or the non-existence of a path could signal an issue with the network.

Caveats: This method only considers routings in the network by motor vehicles (i.e., only the directed links are considered). Additionally, because this script takes the road network as the graph to be analyzed, it does not handle turn restrictions. Constructing another graph (for example, taking links as vertices and movements as edges) would handle these cases, and this may be implemented at a later time.

Additionally, this script is only appropriate for very small networks because it iterates through every ordered pair of vertices, which becomes time-consuming for larger networks, and the output requires user interpretation.

## [undirected_validation.py](undirected_validation.py)  
Inputs: node.csv and link.csv from a GMNS formatted network. 
Required optional fields:
- node.csv: node_type

Output, information and warnings printed to the screen:
- A warning highlights nodes that may have too many or too few neighbors based on their node_type,
- Either a statement that the network is connected; or, a list of links not connected to the largest component,
- A list of isolated nodes (that is, nodes not connected to any link), and
- A stick network is drawn on the screen 

## [more_validation.py](more_validation.py)  
Inputs: node.csv, geometry.csv, link.csv, lane.csv, movement.csv, segment.csv from a GMNS formatted network. 
Required optional fields:
- link.csv: lanes, length
- lane.csv: allowed_uses  

There is also one additional parameter that the user will need to edit, based on their specific network: min_length (script line 51). As the user wishes, this can also be easily changed to a maximum length, if such filtering is useful for their network.

Output, information and warnings printed to the screen: 
- A list of geometries that fall below the user-set minimum length.
- A list of links where the lanes field does not match the number of automotive travel lanes present in that direction in the lanes table. 
- A list of movements where the inbound or outbound link & lane specified in the movements table do not exist in the links or lanes table.
	- :warning: This section still needs to be updated to reflect the new `segment_lane` table.
- A list of required fields that are not present in each table, and a list of records in each table that have data missing from required fields
