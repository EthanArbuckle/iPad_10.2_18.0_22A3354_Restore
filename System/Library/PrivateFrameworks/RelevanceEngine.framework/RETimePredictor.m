@implementation RETimePredictor

+ (id)supportedFeatures
{
  REFeatureSet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  REFeatureSet *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = [REFeatureSet alloc];
  +[REFeature isWeekendFeature](REFeature, "isWeekendFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dayOfWeekFeature](REFeature, "dayOfWeekFeature", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[REFeature currentTimeFeature](REFeature, "currentTimeFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v6);

  return v7;
}

+ (double)updateInterval
{
  return 1800.0;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v7 = a3;
  objc_msgSend(a6, "attributeForKey:", CFSTR("RETrainingContextDateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature isWeekendFeature](REFeature, "isWeekendFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_msgSend(v9, "isDateInWeekend:", v8);
LABEL_10:
    +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  +[REFeature dayOfWeekFeature](REFeature, "dayOfWeekFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqual:", v13);

  if (v14)
  {
    v12 = objc_msgSend(v9, "component:fromDate:", 512, v8);
    goto LABEL_10;
  }
  +[REFeature currentTimeFeature](REFeature, "currentTimeFeature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "isEqual:", v18);

  if (!v19)
  {
    v16 = 0;
    goto LABEL_12;
  }
  v20 = objc_msgSend(v9, "component:fromDate:", 32, v8);
  v21 = objc_msgSend(v9, "maximumRangeOfUnit:", 32);
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", (float)((float)(unint64_t)(v20 - v21) / (float)v22));
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = (void *)v15;
LABEL_12:

  return v16;
}

@end
