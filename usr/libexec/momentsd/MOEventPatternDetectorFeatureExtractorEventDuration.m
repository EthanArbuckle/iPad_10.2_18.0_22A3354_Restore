@implementation MOEventPatternDetectorFeatureExtractorEventDuration

- (MOEventPatternDetectorFeatureExtractorEventDuration)init
{
  MOEventPatternDetectorFeatureExtractorEventDuration *v2;
  MOEventPatternDetectorFeatureExtractorEventDuration *v3;
  MOEventPatternDetectorFeatureExtractorEventDuration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorEventDuration;
  v2 = -[MOEventPatternDetectorFeatureExtractorEventDuration init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _UNKNOWN **v14;
  uint64_t v15;
  double v16;
  void *j;
  void *v18;
  unint64_t v19;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  id obj;
  uint64_t v30;
  NSMutableArray *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  v3 = a3;
  v31 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v3;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v47;
    v4 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v47 != v30)
          objc_enumerationMutation(obj);
        v33 = v5;
        v6 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v5);
        v7 = objc_opt_new(NSMutableArray);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v36 = v6;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v37)
        {
          v8 = *(_QWORD *)v43;
          v34 = *(_QWORD *)v43;
          v35 = v7;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v43 != v8)
                objc_enumerationMutation(v36);
              v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v10, "category") == (id)10)
              {
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactions"));
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                if (v12)
                {
                  v13 = v12;
                  v14 = v4;
                  v15 = *(_QWORD *)v39;
                  v16 = 0.0;
                  do
                  {
                    for (j = 0; j != v13; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v39 != v15)
                        objc_enumerationMutation(v11);
                      v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
                      v19 = (unint64_t)objc_msgSend(v18, "mechanism");
                      if (v19 <= 0x11 && ((1 << v19) & 0x31B01) != 0)
                      {
                        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "endDate"));
                        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
                        objc_msgSend(v21, "timeIntervalSinceDate:", v22);
                        v24 = v23;

                        v16 = v16 + v24;
                      }
                    }
                    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                  }
                  while (v13);
                  v4 = v14;
                  v8 = v34;
                  v7 = v35;
                }
                else
                {
                  v16 = 0.0;
                }
              }
              else
              {
                v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endDate"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startDate"));
                objc_msgSend(v11, "timeIntervalSinceDate:", v25);
                v16 = v26;

              }
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[317], "numberWithDouble:", v16));
              -[NSMutableArray addObject:](v7, "addObject:", v27);

            }
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v37);
        }

        -[NSMutableArray addObject:](v31, "addObject:", v7);
        v5 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v32);
  }

  return v31;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
