@implementation MOEventPatternDetectorFeatureExtractorContactFrequency

- (MOEventPatternDetectorFeatureExtractorContactFrequency)init
{
  MOEventPatternDetectorFeatureExtractorContactFrequency *v2;
  MOEventPatternDetectorFeatureExtractorContactFrequency *v3;
  MOEventPatternDetectorFeatureExtractorContactFrequency *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorContactFrequency;
  v2 = -[MOEventPatternDetectorFeatureExtractorContactFrequency init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *j;
  unint64_t v17;
  void *v19;
  id obj;
  uint64_t v22;
  NSMutableArray *v23;
  id v24;
  uint64_t v25;
  id v26;
  NSMutableArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = a3;
  v23 = objc_opt_new(NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v37;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(obj);
        v25 = v4;
        v5 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v4);
        v27 = objc_opt_new(NSMutableArray);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v26 = v5;
        v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(_QWORD *)v33 != v8)
                objc_enumerationMutation(v26);
              v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
              v28 = 0u;
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactions"));
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
              if (v12)
              {
                v13 = v12;
                v14 = 0;
                v15 = *(_QWORD *)v29;
                do
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v29 != v15)
                      objc_enumerationMutation(v11);
                    v17 = (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), "mechanism");
                    if (v17 <= 0x11 && ((1 << v17) & 0x33B1F) != 0)
                      v14 = (v14 + 1);
                  }
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                }
                while (v13);
              }
              else
              {
                v14 = 0;
              }

              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
              -[NSMutableArray addObject:](v27, "addObject:", v19);

            }
            v7 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          }
          while (v7);
        }

        -[NSMutableArray addObject:](v23, "addObject:", v27);
        v4 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v24);
  }

  return v23;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
