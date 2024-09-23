@implementation PXFeedbackManager

- (PXFeedbackManager)init
{
  PXFeedbackManager *v2;
  PXFeedbackCollector *v3;
  PXFeedbackCollector *feedbackCollector;
  PXFeedbackSender *v5;
  PXFeedbackSender *feedbackSender;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFeedbackManager;
  v2 = -[PXFeedbackManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXFeedbackCollector);
    feedbackCollector = v2->_feedbackCollector;
    v2->_feedbackCollector = v3;

    v5 = objc_alloc_init(PXFeedbackSender);
    feedbackSender = v2->_feedbackSender;
    v2->_feedbackSender = v5;

  }
  return v2;
}

- (id)provideUserFeedbackFromDictionary:(id)a3 forFeedbackType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  self->_feedbackCollectionType = a4;
  if (v6)
  {
    -[PXFeedbackManager feedbackCollector](self, "feedbackCollector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedbackEntryFromDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PXFeedbackManager provideUserFeedbackEntry:](self, "provideUserFeedbackEntry:", v8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)provideUserFeedbackEntry:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PXFeedbackManager feedbackSender](self, "feedbackSender");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendFeedback:forFeedbackType:", v4, self->_feedbackCollectionType);

  }
}

- (void)removeFeedbackEntry:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PXFeedbackManager feedbackCollector](self, "feedbackCollector");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFeedbackEntry:", v4);

  }
}

- (PXFeedbackCollector)feedbackCollector
{
  return self->_feedbackCollector;
}

- (PXFeedbackSender)feedbackSender
{
  return self->_feedbackSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackSender, 0);
  objc_storeStrong((id *)&self->_feedbackCollector, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_70038);
  return (id)sharedManager_sharedManager;
}

void __34__PXFeedbackManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

@end
