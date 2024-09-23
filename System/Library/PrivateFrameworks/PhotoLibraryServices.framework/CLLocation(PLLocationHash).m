@implementation CLLocation(PLLocationHash)

- (uint64_t)pl_locationHash
{
  CLLocationDegrees v1;
  CLLocationDegrees v2;

  objc_msgSend(a1, "coordinate");
  return PLCalculateAreaHashImpl(14, 0, 0, v1, v2, 90.0, -180.0, -90.0, 180.0);
}

- (id)pl_newSurroundingLocationsHashes
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "pl_locationHash");
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  PLGetGeohashCoordinates(v1);
  v4 = 0;
  *(double *)v9 = v5;
  *(double *)&v9[1] = v6 + 1.0;
  *(double *)&v9[2] = v5;
  *(double *)&v9[3] = v6 + -1.0;
  *(double *)&v9[4] = v5 + 1.0;
  *(double *)&v9[5] = v6;
  *(double *)&v9[6] = v5 + -1.0;
  *(double *)&v9[7] = v6;
  *(double *)&v9[8] = v5 + 1.0;
  *(double *)&v9[9] = v6 + 1.0;
  *(double *)&v9[10] = v5 + -1.0;
  *(double *)&v9[11] = v6 + 1.0;
  *(double *)&v9[12] = v5 + 1.0;
  *(double *)&v9[13] = v6 + -1.0;
  *(double *)&v9[14] = v5 + -1.0;
  *(double *)&v9[15] = v6 + -1.0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", PLGetCoordinatesGeohash(*(double *)&v9[v4], *(double *)&v9[v4 + 1]));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

    v4 += 2;
  }
  while (v4 != 16);
  return v2;
}

@end
