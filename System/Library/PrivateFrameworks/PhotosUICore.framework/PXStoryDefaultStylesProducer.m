@implementation PXStoryDefaultStylesProducer

- (PXStoryDefaultStylesProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDefaultStylesProducer.m"), 35, CFSTR("%s is not available as initializer"), "-[PXStoryDefaultStylesProducer init]");

  abort();
}

- (PXStoryDefaultStylesProducer)initWithAutoEditDecisionLists:(id)a3
{
  id v5;
  PXStoryDefaultStylesProducer *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  os_log_t v10;
  OS_os_log *log;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryDefaultStylesProducer;
  v6 = -[PXStoryDefaultStylesProducer init](&v13, sel_init);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    v10 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v9);
    log = v6->_log;
    v6->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v6->_autoEditDecisionLists, a3);
  }

  return v6;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  void (**v5)(id, PXStoryProducerResult *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  PXStoryStyleConfiguration *v13;
  void *v14;
  PXStoryStyleConfiguration *v15;
  void *v16;
  PXStoryProducerResult *v17;

  v5 = (void (**)(id, PXStoryProducerResult *))a4;
  -[PXStoryDefaultStylesProducer autoEditDecisionLists](self, "autoEditDecisionLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v6)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    if (v8 >= 1)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "song");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [PXStoryStyleConfiguration alloc];
        objc_msgSend(v12, "colorGradeCategory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:](v13, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v14, 0, v12, v11, 0);

        objc_msgSend(v9, "addObject:", v15);
      }
    }
    v16 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  v17 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v16);
  v5[2](v5, v17);

  return 0;
}

- (NSArray)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
