@implementation PGFeatureExtractorCartesianLocation

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("Location");
  return CFSTR("Location");
}

- (int64_t)featureLength
{
  return 3;
}

- (id)featureNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("LOCATION_X");
  v3[1] = CFSTR("LOCATION_Y");
  v3[2] = CFSTR("LOCATION_Z");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  id v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    *(float *)&v6 = v6;
    *(float *)&v7 = v7;
    objc_msgSend(MEMORY[0x1E0D71860], "cartesianCoordinateFromLatitude:longitude:", v6, v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = objc_alloc(MEMORY[0x1E0D42A20]);
    LODWORD(v15) = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v18;
    LODWORD(v19) = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v14, "initWithArray:", v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D42A20], "zerosOfCount:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

@end
