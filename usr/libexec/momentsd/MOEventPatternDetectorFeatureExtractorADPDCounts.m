@implementation MOEventPatternDetectorFeatureExtractorADPDCounts

- (MOEventPatternDetectorFeatureExtractorADPDCounts)init
{
  MOEventPatternDetectorFeatureExtractorADPDCounts *v2;
  MOEventPatternDetectorFeatureExtractorADPDCounts *v3;
  MOEventPatternDetectorFeatureExtractorADPDCounts *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorADPDCounts;
  v2 = -[MOEventPatternDetectorFeatureExtractorADPDCounts init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *i;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id obj;
  uint64_t v24;
  NSMutableArray *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = a3;
  v25 = objc_opt_new(NSMutableArray);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_new(NSMutableArray);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pCount"));
              v16 = objc_msgSend(v15, "intValue");

              if ((v16 & 0x80000000) == 0)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pCount"));
                -[NSMutableArray addObject:](v8, "addObject:", v17);

              }
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "densityScore"));
              objc_msgSend(v18, "doubleValue");
              v20 = v19;

              if (v20 >= 0.0)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "densityScore"));
                -[NSMutableArray addObject:](v8, "addObject:", v21);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v11);
        }

        -[NSMutableArray addObject:](v25, "addObject:", v8);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }

  return v25;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
