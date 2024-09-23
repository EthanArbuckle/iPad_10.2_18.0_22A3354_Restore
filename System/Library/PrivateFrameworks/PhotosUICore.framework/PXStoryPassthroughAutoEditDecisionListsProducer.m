@implementation PXStoryPassthroughAutoEditDecisionListsProducer

- (PXStoryPassthroughAutoEditDecisionListsProducer)init
{
  return -[PXStoryPassthroughAutoEditDecisionListsProducer initWithAutoEditDecisionLists:](self, "initWithAutoEditDecisionLists:", 0);
}

- (PXStoryPassthroughAutoEditDecisionListsProducer)initWithAutoEditDecisionLists:(id)a3
{
  id v4;
  PXStoryPassthroughAutoEditDecisionListsProducer *v5;
  uint64_t v6;
  NSArray *autoEditDecisionLists;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughAutoEditDecisionListsProducer;
  v5 = -[PXStoryPassthroughAutoEditDecisionListsProducer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    autoEditDecisionLists = v5->_autoEditDecisionLists;
    v5->_autoEditDecisionLists = (NSArray *)v6;

  }
  return v5;
}

- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6
{
  id v8;
  PXStoryProducerResult *v9;
  void *v10;
  PXStoryProducerResult *v11;

  v8 = a6;
  v9 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughAutoEditDecisionListsProducer autoEditDecisionLists](self, "autoEditDecisionLists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXStoryProducerResult initWithObject:](v9, "initWithObject:", v10);
  (*((void (**)(id, PXStoryProducerResult *))a6 + 2))(v8, v11);

  return 0;
}

- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7;
  PXStoryProducerResult *v8;
  void *v9;
  PXStoryProducerResult *v10;

  v7 = a5;
  v8 = [PXStoryProducerResult alloc];
  -[PXStoryPassthroughAutoEditDecisionListsProducer autoEditDecisionLists](self, "autoEditDecisionLists");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryProducerResult initWithObject:](v8, "initWithObject:", v9);
  (*((void (**)(id, PXStoryProducerResult *))a5 + 2))(v7, v10);

  return 0;
}

- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return &stru_1E5149688;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (NSArray)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionLists, 0);
}

@end
