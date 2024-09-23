@implementation REMetadataPredictor

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
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature sectionFeature](REFeature, "sectionFeature", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  +[REFeature interactionFeature](REFeature, "interactionFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REFeatureSet initWithFeatures:](v2, "initWithFeatures:", v6);

  return v7;
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REMetadataPredictor;
  v2 = -[REPredictor _init](&v8, sel__init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[8];
    v2[8] = v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[9];
    v2[9] = v5;

  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (!v11)
  {
    +[REFeature sectionFeature](REFeature, "sectionFeature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "isEqual:", v14);

    if (v15)
    {
      objc_msgSend(v9, "section");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_13;
      v16 = 72;
    }
    else
    {
      +[REFeature interactionFeature](REFeature, "interactionFeature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "isEqual:", v17);

      if (!v18)
      {
        v13 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v9, "interaction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_13;
      v16 = 64;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "objectForKeyedSubscript:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v16), "setObject:forKeyedSubscript:", v19, v12);
    }
    v13 = v19;

    goto LABEL_14;
  }
  objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFeatureValueCache, 0);
  objc_storeStrong((id *)&self->_interactionFeatureValueCache, 0);
}

@end
