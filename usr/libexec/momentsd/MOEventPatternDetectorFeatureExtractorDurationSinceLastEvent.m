@implementation MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent

- (MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent)init
{
  MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent *v2;
  MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent *v3;
  MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
  v2 = -[MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id obj;
  uint64_t v17;
  NSMutableArray *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v18 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v4);
        v6 = objc_opt_new(NSMutableArray);
        if (objc_msgSend(v5, "count"))
        {
          v7 = 0;
          do
          {
            if (v7)
            {
              v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v7 - 1));
              v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v7));
              v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
              objc_msgSend(v10, "timeIntervalSinceDate:", v11);
              v13 = v12;

              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
              -[NSMutableArray addObject:](v6, "addObject:", v14);

            }
            else
            {
              -[NSMutableArray addObject:](v6, "addObject:", &off_1002D8E58);
            }
            ++v7;
          }
          while ((unint64_t)objc_msgSend(v5, "count") > v7);
        }
        -[NSMutableArray addObject:](v18, "addObject:", v6);

        v4 = (char *)v4 + 1;
      }
      while (v4 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v19);
  }

  return v18;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
