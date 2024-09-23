@implementation PXStoryDummyStyleProducer

- (PXStoryDummyStyleProducer)init
{
  return -[PXStoryDummyStyleProducer initWithStyleConfiguration:](self, "initWithStyleConfiguration:", &__block_literal_global_9023);
}

- (PXStoryDummyStyleProducer)initWithStyleConfiguration:(id)a3
{
  id v4;
  PXStoryDummyStyleProducer *v5;
  uint64_t v6;
  id styleConfiguration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDummyStyleProducer;
  v5 = -[PXStoryDummyStyleProducer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    styleConfiguration = v5->_styleConfiguration;
    v5->_styleConfiguration = (id)v6;

  }
  return v5;
}

- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9
{
  PXStoryDummyStyle *v10;
  void *v11;
  PXStoryDummyStyle *v12;

  v10 = [PXStoryDummyStyle alloc];
  -[PXStoryDummyStyleProducer styleConfiguration](self, "styleConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXStoryDummyStyle initWithConfiguration:](v10, "initWithConfiguration:", v11);

  return v12;
}

- (id)styleConfiguration
{
  return self->_styleConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_styleConfiguration, 0);
}

@end
