@implementation TBCentroidCalculator

- (NSMutableArray)points
{
  NSMutableArray *points;
  NSMutableArray *v4;
  NSMutableArray *v5;

  points = self->_points;
  if (!points)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_points;
    self->_points = v4;

    points = self->_points;
  }
  return points;
}

- (BOOL)_validLatitudeValue:(double)a3
{
  return a3 >= -90.0 && a3 <= 90.0;
}

- (BOOL)_validLongitudeValue:(double)a3
{
  return a3 >= -180.0 && a3 <= 180.0;
}

- (void)addLatitude:(double)a3 longitude:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[TBCentroidCalculator _validLatitudeValue:](self, "_validLatitudeValue:"))
  {
    if (-[TBCentroidCalculator _validLongitudeValue:](self, "_validLongitudeValue:", a4))
    {
      v7 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      -[TBCentroidCalculator points](self, "points");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }
}

- (CLLocationCoordinate2D)centroid
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  __double2 v23;
  __double2 v24;
  long double v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CLLocationCoordinate2D result;

  v39 = *MEMORY[0x1E0C80C00];
  -[TBCentroidCalculator points](self, "points");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[TBCentroidCalculator points](self, "points", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v13, "count") == 2)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          v16 = v15;

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v19 = v18;

          v20 = v16 * 0.0174532925;
          v21 = v19 * 0.0174532925;
          v22 = v21;
          v23 = __sincos_stret(v20);
          v24 = __sincos_stret(v22);
          v11 = v11 + v23.__cosval * v24.__cosval;
          v10 = v10 + v23.__cosval * v24.__sinval;
          v9 = v9 + v23.__sinval;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
  }

  v25 = v9 / (double)v4;
  v26 = atan2(v10 / (double)v4, v11 / (double)v4);
  v27 = atan2(v25, sqrt(v10 / (double)v4 * (v10 / (double)v4) + v11 / (double)v4 * (v11 / (double)v4)));
  v28 = v27 * 57.2957795;
  v29 = v26;
  v30 = v29 * 57.2957795;
  v33 = CLLocationCoordinate2DMake(v28, v30);
  longitude = v33.longitude;
  latitude = v33.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
}

@end
