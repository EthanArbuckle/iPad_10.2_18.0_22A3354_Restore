@implementation TFFeedbackFormViewDataSourceBase

- (TFFeedbackFormViewDataSourceBase)initWithPresenter:(id)a3 refreshCallback:(id)a4
{
  id v7;
  id v8;
  TFFeedbackFormViewDataSourceBase *v9;
  TFFeedbackFormViewDataSourceBase *v10;
  uint64_t v11;
  id refreshCallback;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackFormViewDataSourceBase;
  v9 = -[TFFeedbackFormViewDataSourceBase init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    v11 = MEMORY[0x219A0D03C](v8);
    refreshCallback = v10->_refreshCallback;
    v10->_refreshCallback = (id)v11;

  }
  return v10;
}

- (unint64_t)screenshotCount
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageCollectionForIdentifer:", CFSTR("c"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  return v5;
}

- (void)addScreenshots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v4 = a3;
  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageCollectionForIdentifer:", CFSTR("c"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associateScreenshotImages:", v7);

  -[TFFeedbackFormViewDataSourceBase refreshCallback](self, "refreshCallback");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();

}

- (void)removeScreenshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;

  v4 = a3;
  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedbackDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageCollectionForIdentifer:", CFSTR("c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v11, "removeObject:", v4);
  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "associateScreenshotImages:", v11);

  -[TFFeedbackFormViewDataSourceBase refreshCallback](self, "refreshCallback");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();

}

- (void)resetScreenshots:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  v4 = a3;
  -[TFFeedbackFormViewDataSourceBase presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associateScreenshotImages:", v4);

  -[TFFeedbackFormViewDataSourceBase refreshCallback](self, "refreshCallback");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();

}

- (TFFeedbackFormPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (id)refreshCallback
{
  return self->_refreshCallback;
}

- (void)setRefreshCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshCallback, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
