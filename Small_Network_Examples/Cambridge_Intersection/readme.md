# Broadway at Ames Street, Cambridge, MA

This example shows the GMNS v0.90 specification implemented around one intersection in Cambridge, MA, near the Volpe Center.

It includes several intermodal features:

An east-west road (Broadway) with marked bike lanes and sidewalks. The sidewalks are their own links, while the bikelanes are an attribute of the road.

A bike path and a separate pedestrian path approaching from the north

A road (Ames Street) with two-way cycletrack and sidewalks approaching from the south.

The QGZ file in this folder can be used for visualizing the network; you may need to change the filepaths to where GitHub is located on your machine.

The nodes and links are shown below. Red links are roads, green links are sidewalks and other pedestrian pathways, blue links are bicycle facilities. 

![Nodes and links](https://github.com/zephyr-data-specs/GMNS/blob/master/Images/Node11Network.png)

An aerial image of the intersection, and signal phasings are shown below. Note that these may not be the current phasings and timings; they are only used to illustrate how the signal files are used.

![Aerial image, movements and signal phase/timing](https://github.com/zephyr-data-specs/GMNS/blob/master/Images/node11.png)
