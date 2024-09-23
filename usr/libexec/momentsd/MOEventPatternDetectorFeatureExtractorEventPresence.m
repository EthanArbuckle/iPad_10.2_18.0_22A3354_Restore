@implementation MOEventPatternDetectorFeatureExtractorEventPresence

- (MOEventPatternDetectorFeatureExtractorEventPresence)init
{
  MOEventPatternDetectorFeatureExtractorEventPresence *v2;
  MOEventPatternDetectorFeatureExtractorEventPresence *v3;
  MOEventPatternDetectorFeatureExtractorEventPresence *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorEventPresence;
  v2 = -[MOEventPatternDetectorFeatureExtractorEventPresence init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_new(NSMutableArray);
        if (objc_msgSend(v10, "count", (_QWORD)v14))
        {
          v12 = 0;
          do
          {
            -[NSMutableArray addObject:](v11, "addObject:", &off_1002D8618);
            ++v12;
          }
          while ((unint64_t)objc_msgSend(v10, "count") > v12);
        }
        -[NSMutableArray addObject:](v4, "addObject:", v11);

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
