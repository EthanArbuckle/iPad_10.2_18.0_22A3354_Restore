@implementation PMLAWDBaseTracker

- (PMLAWDBaseTracker)initWithModel:(id)a3
{
  id v5;
  PMLAWDBaseTracker *v6;
  PMLAWDBaseTracker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLAWDBaseTracker;
  v6 = -[PMLAWDBaseTracker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modelInfo, a3);

  return v7;
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  AWDPostMetric();
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

+ (id)trackerForModelName:(id)a3 modelVersion:(id)a4 modelLocale:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setName:", v10);

  objc_msgSend(v11, "setVersion:", v9);
  objc_msgSend(v11, "setLocale:", v8);

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModel:", v11);
  return v12;
}

+ (id)trackerForPlanId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PMLPlanDescriptor descriptorFromPlanId:](PMLPlanDescriptor, "descriptorFromPlanId:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trackerForModelName:modelVersion:modelLocale:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
