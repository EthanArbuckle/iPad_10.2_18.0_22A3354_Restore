@implementation QUData

- (QUData)initWithQueryContext:(id)a3
{
  id v4;
  QUData *v5;
  int v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSString *intentLabel;
  void *v19;
  float v20;
  uint64_t v21;
  NSSet *intentBundleIds;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)QUData;
  v5 = -[QUData init](&v24, sel_init);
  if (v5)
  {
    v6 = _os_feature_enabled_impl();
    if (v4)
    {
      if (v6)
      {
        objc_msgSend(v4, "queryUnderstandingOutput");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8 >= 2)
        {
          objc_msgSend(v4, "queryUnderstandingOutput");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kQPQUIntentIds"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "queryUnderstandingOutput");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kQPQUIntentLabels"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "queryUnderstandingOutput");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kQPQUIntentScores"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");

          if (v16 >= 1)
          {
            objc_msgSend(v12, "firstObject");
            v17 = objc_claimAutoreleasedReturnValue();
            intentLabel = v5->_intentLabel;
            v5->_intentLabel = (NSString *)v17;

            objc_msgSend(v14, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "floatValue");
            v5->_intentScore = v20;

            if (v5->_intentLabel)
            {
              +[SSRankingManager bundleIDSetsForQUIntent:](SSRankingManager, "bundleIDSetsForQUIntent:");
              v21 = objc_claimAutoreleasedReturnValue();
              intentBundleIds = v5->_intentBundleIds;
              v5->_intentBundleIds = (NSSet *)v21;

            }
          }

        }
      }
    }
  }

  return v5;
}

- (NSString)intentLabel
{
  return self->_intentLabel;
}

- (float)intentScore
{
  return self->_intentScore;
}

- (NSSet)intentBundleIds
{
  return self->_intentBundleIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentBundleIds, 0);
  objc_storeStrong((id *)&self->_intentLabel, 0);
}

@end
