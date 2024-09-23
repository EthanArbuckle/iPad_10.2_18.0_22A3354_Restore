@implementation PMLAWDEvaluationTrackerMock

- (PMLAWDEvaluationTrackerMock)initWithAdapter:(id)a3 modelInfo:(id)a4
{
  id v7;
  PMLAWDEvaluationTrackerMock *v8;
  PMLAWDEvaluationTrackerMock *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMLAWDEvaluationTrackerMock;
  v8 = -[PMLProtoBufTracker initWithAdapter:modelInfo:](&v11, sel_initWithAdapter_modelInfo_, v7, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_adapter, a3);

  return v9;
}

- (PMLAWDEvaluationTrackerMock)initWithModel:(id)a3
{
  id v4;
  void *v5;
  PMLAWDEvaluationTrackerMock *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[PMLAWDEvaluationTrackerMock initWithAdapter:modelInfo:](self, "initWithAdapter:modelInfo:", v5, v4);

  return v6;
}

- (void)clearTrackedMessages
{
  -[PMLTrackerMockAdapter clearAllTrackedMessages](self->_adapter, "clearAllTrackedMessages");
}

- (NSArray)trackedEvaluations
{
  return (NSArray *)-[PMLTrackerMockAdapter trackedMessagesByClass:](self->_adapter, "trackedMessagesByClass:", objc_opt_class());
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapter, 0);
}

+ (id)mockTracker
{
  return (id)objc_msgSend(a1, "mockTrackerForPlanId:", CFSTR("foo-1.0-en"));
}

+ (id)mockTrackerForPlanId:(id)a3
{
  void *v4;
  void *v5;

  +[AWDProactiveModelFittingModelInfo modelInfoFromPlanId:](AWDProactiveModelFittingModelInfo, "modelInfoFromPlanId:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModel:", v4);

  return v5;
}

@end
