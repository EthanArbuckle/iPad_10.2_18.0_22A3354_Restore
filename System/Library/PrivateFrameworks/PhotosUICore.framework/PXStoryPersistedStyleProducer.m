@implementation PXStoryPersistedStyleProducer

- (PXStoryPersistedStyleProducer)initWithPersistedRecipe:(id)a3 songResource:(id)a4 autoEditDecisionList:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStoryPersistedStyleProducer *v12;
  objc_class *v13;
  id v14;
  const char *v15;
  os_log_t v16;
  OS_os_log *log;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryPersistedStyleProducer;
  v12 = -[PXStoryPersistedStyleProducer init](&v19, sel_init);
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");

    v16 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v15);
    log = v12->_log;
    v12->_log = (OS_os_log *)v16;

    objc_storeStrong((id *)&v12->_songResource, a4);
    objc_storeStrong((id *)&v12->_persistedRecipe, a3);
    objc_storeStrong((id *)&v12->_autoEditDecisionList, a5);
  }

  return v12;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PXStoryStyleConfiguration *v14;
  PXStoryProducerResult *v15;
  void *v16;
  PXStoryProducerResult *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  -[PXStoryPersistedStyleProducer persistedRecipe](self, "persistedRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryPersistedStyleProducer autoEditDecisionList](self, "autoEditDecisionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryPersistedStyleProducer songResource](self, "songResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalColorGradeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "customColorGradeKind");
  v12 = objc_msgSend(v7, "isCustomized");
  if (!v11)
  {
    +[PXStoryColorGradingRepositoryFactory sharedRepository](PXStoryColorGradingRepositoryFactory, "sharedRepository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "colorGradeKindForColorGradeCategory:", v10);

  }
  v14 = -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:]([PXStoryStyleConfiguration alloc], "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v10, v11, v9, v8, v12);
  v15 = [PXStoryProducerResult alloc];
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXStoryProducerResult initWithObject:](v15, "initWithObject:", v16);
  -[PXStoryProducerResult flags:](v17, "flags:", v8 == 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v18);

  return 0;
}

- (PFStoryRecipe)persistedRecipe
{
  return self->_persistedRecipe;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_persistedRecipe, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
