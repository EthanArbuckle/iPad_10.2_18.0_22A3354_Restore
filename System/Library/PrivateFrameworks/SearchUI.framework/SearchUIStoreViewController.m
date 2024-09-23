@implementation SearchUIStoreViewController

- (SearchUIStoreViewController)initWithIdentifier:(id)a3 feedbackListener:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  id v9;
  SearchUIStoreViewController *v10;
  SearchUIStoreViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIStoreViewController;
  v10 = -[SearchUIStoreViewController init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SearchUIStoreViewController setFeedbackListener:](v10, "setFeedbackListener:", v9);
    v12 = (void *)MEMORY[0x1E0C99E08];
    v17 = *MEMORY[0x1E0CD8110];
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD80B8], *MEMORY[0x1E0CD8100]);
    -[SKStoreProductViewController setDelegate:](v11, "setDelegate:", v11);
    -[SKStoreProductViewController loadProductWithParameters:completionBlock:](v11, "loadProductWithParameters:completionBlock:", v14, 0);
    -[SearchUIStoreViewController setQueryId:](v11, "setQueryId:", a5);

  }
  return v11;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIStoreViewController;
  -[SKStoreProductViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[SearchUIStoreViewController feedbackListener](self, "feedbackListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SearchUIStoreViewController feedbackListener](self, "feedbackListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willDismissViewController:", self);

  }
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  SearchUIGeneralLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "dismissing storevc", v13, 2u);
  }

  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[SearchUIStoreViewController feedbackListener](self, "feedbackListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    if ((unint64_t)a4 > 1)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C760]), "initWithProductPageResult:", a4);
    }
    else
    {
      if (a4 == 1)
        v9 = 7;
      else
        v9 = 4;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C238]), "initWithEvent:", v9);
    }
    v11 = (void *)v10;
    -[SearchUIStoreViewController feedbackListener](self, "feedbackListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportFeedback:queryId:", v11, -[SearchUIStoreViewController queryId](self, "queryId"));

  }
}

- (SFFeedbackListener)feedbackListener
{
  return (SFFeedbackListener *)objc_loadWeakRetained((id *)&self->_feedbackListener);
}

- (void)setFeedbackListener:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackListener, a3);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackListener);
}

@end
