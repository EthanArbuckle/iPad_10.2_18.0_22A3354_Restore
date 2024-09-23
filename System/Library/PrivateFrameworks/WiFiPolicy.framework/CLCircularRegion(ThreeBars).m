@implementation CLCircularRegion(ThreeBars)

- (double)longitude
{
  double v1;

  objc_msgSend(a1, "center");
  return v1;
}

- (void)boundingBox
{
  double v4;
  long double v5;
  long double v6;
  long double v7;
  long double v8;
  double v9;
  long double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  long double v15;
  long double v16;
  double v17;
  CLLocationDegrees v18;
  double v19;
  CLLocationDegrees v20;
  long double v21;
  double v22;
  CLLocationDegrees v23;
  double v24;
  CLLocationDegrees v25;

  objc_msgSend(a1, "center");
  v5 = v4 * 0.0174532925;
  v6 = cos(v5 + v5) * -559.82 + 111132.92;
  v7 = v6 + cos(v5 * 4.0) * 1.175;
  v8 = v7 + cos(v5 * 6.0) * -0.0023;
  v9 = cos(v5);
  v10 = cos(v5 * 3.0) * -93.5 + v9 * 111412.84;
  v11 = v10 + cos(v5 * 5.0) * 0.118;
  objc_msgSend(a1, "radius");
  v13 = (v12 + v12) / v8;
  objc_msgSend(a1, "radius");
  v15 = (v14 + v14) / v11;
  objc_msgSend(a1, "center");
  v16 = v13 * 0.5;
  v18 = v17 - v16;
  objc_msgSend(a1, "center");
  v20 = v19 + v16;
  objc_msgSend(a1, "center");
  v21 = v15 * 0.5;
  v23 = v22 - v15 * 0.5;
  objc_msgSend(a1, "center");
  v25 = v24 + v21;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[1] = CLLocationCoordinate2DMake(v20, v25);
  a2[3] = CLLocationCoordinate2DMake(v18, v25);
  *a2 = CLLocationCoordinate2DMake(v20, v23);
  a2[2] = CLLocationCoordinate2DMake(v18, v23);
}

- (id)searchPredicateWithLatitudeKey:()ThreeBars longitudeKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "boundingBox");
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v16 + 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v19 + 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ >= %@ && %@ <= %@ && %@ >= %@ && %@ <= %@"), v7, v9, v7, v10, v6, v11, v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
