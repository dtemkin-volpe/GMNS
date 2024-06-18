## `lane`
  - `description` The lane file allocates portions of the physical right-of-way that might be used for travel. It might be a travel lane, bike lane, or a parking lane. Lanes only are included in directed links; undirected links are assumed to have no lane controls or directionality. If a lane is added, dropped, or changes properties along the link, those changes are recorded on the `segment_link` table. Lanes are numbered sequentially, starting at either the centerline (two-way street) or the left shoulder (one-way street or divided highway with two centerlines).
  - `path` lane.csv
  - `schema`
      - `missingValues` ['NaN']
    - `primaryKey` ['lane_id']
    - `foreignKeys`
      - [1]
        - `fields` ['link_id']
        - `reference`
          - `resource` link
          - `fields` ['link_id']

  | name         | type    | description                                                                                                                                                                                                                                                                                                                                                                                                                                               | constraints                                       |
|:-------------|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------|
| lane_id      | any     | Primary key                                                                                                                                                                                                                                                                                                                                                                                                                                               | {'required': True}                                |
| link_id      | any     | Required. Foreign key to link table.                                                                                                                                                                                                                                                                                                                                                                                                                      | {'required': True}                                |
| lane_num     | integer | Required. e.g., -1, 1, 2 (use left-to-right numbering). By convention, the left-most through lane is 1. Left-turn lanes have negative numbers                                                                                                                                                                                                                                                                                                             | {'required': True, 'minimum': -10, 'maximum': 10} |
| allowed_uses | string  | Optional. Set of allowed uses that should appear in either the use_definition or use_group tables; comma-separated.                                                                                                                                                                                                                                                                                                                                       |                                                   |
| r_barrier    | string  | Optional. Whether a barrier exists to prevent vehicles from changing lanes to the right.<br>- `none` (the default). Indicates that a vehicle can change lanes, provided that the vehicle-type is permitted in the destination lane<br>- `regulatory`. There is a regulatory prohibition (e.g., a double-white solid line) against changing lanes, but no physical barrier<br>- `physical`. A physical barrier (e.g., a curb, Jersey barrier) is in place. | {'enum': ['none', 'regulatory', 'physical']}      |
| l_barrier    | string  | Optional. Whether a barrier exists to prevent vehicles from changing lanes to the right.<br>- `none` (the default). Indicates that a vehicle can change lanes, provided that the vehicle-type is permitted in the destination lane<br>- `regulatory`. There is a regulatory prohibition (e.g., a double-white solid line) against changing lanes, but no physical barrier<br>- `physical`. A physical barrier (e.g., a curb, Jersey barrier) is in place. | {'enum': ['none', 'regulatory', 'physical']}      |
| width        | number  | Optional. Width of the lane, short_length units.                                                                                                                                                                                                                                                                                                                                                                                                          | {'minimum': 0}                                    |