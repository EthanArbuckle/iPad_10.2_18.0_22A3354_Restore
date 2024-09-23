@implementation PGFeatureExtractorMomentNodeSpecialPOI

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("SpecialPOI");
  return CFSTR("SpecialPOI");
}

- (id)featureNames
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Disney");
  v3[1] = CFSTR("Universal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 2;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5;
  PGSpecialPOIResolver *v6;
  void *v7;
  PGSpecialPOIResolver *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a3;
  v6 = [PGSpecialPOIResolver alloc];
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PGSpecialPOIResolver initWithMomentNodes:](v6, "initWithMomentNodes:", v7);
  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorMomentNodeSpecialPOI featureLength](self, "featureLength"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v8, "momentsContainSpecialPOI:withMomentRatio:", 1, 1.0))
  {
    LODWORD(v10) = 1.0;
    objc_msgSend(v9, "setFloat:atIndex:", 0, v10);
  }
  if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v8, "momentsContainSpecialPOI:withMomentRatio:", 2, 1.0))
  {
    LODWORD(v11) = 1.0;
    objc_msgSend(v9, "setFloat:atIndex:", 1, v11);
  }

  return v9;
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PGSpecialPOIResolver *v23;
  void *v24;
  PGSpecialPOIResolver *v25;
  double v26;
  double v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }

  v13 = objc_msgSend(v7, "count");
  -[PGFeatureExtractorMomentNodeSpecialPOI featureNames](self, "featureNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  objc_msgSend(MEMORY[0x1E0D42A40], "zerosWithRows:columns:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v31;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v21);
        v23 = [PGSpecialPOIResolver alloc];
        objc_msgSend(v22, "array");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PGSpecialPOIResolver initWithMomentNodes:](v23, "initWithMomentNodes:", v24);

        if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v25, "momentsContainSpecialPOI:withMomentRatio:", 1, 1.0))
        {
          LODWORD(v26) = 1.0;
          objc_msgSend(v16, "setFloat:atRow:column:", v19 + v21, 0, v26);
        }
        if (-[PGSpecialPOIResolver momentsContainSpecialPOI:withMomentRatio:](v25, "momentsContainSpecialPOI:withMomentRatio:", 2, 1.0))
        {
          LODWORD(v27) = 1.0;
          objc_msgSend(v16, "setFloat:atRow:column:", v19 + v21, 1, v27);
        }

        ++v21;
      }
      while (v18 != v21);
      v19 += v21;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v18);
  }

  return v16;
}

@end
