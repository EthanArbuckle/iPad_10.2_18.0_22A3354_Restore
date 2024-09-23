@implementation SPUIPPTTypingHelper

- (SPUIPPTTypingHelper)initWithString:(id)a3 viewController:(id)a4 queryKind:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  SPUIPPTTypingHelper *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SPUIPPTTypingHelper;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = -[SPUIPPTTypingHelper init](&v16, sel_init);
  -[SPUIPPTTypingHelper setQueryString:](v12, "setQueryString:", v11, v16.receiver, v16.super_class);

  -[SPUIPPTTypingHelper setCurrentQueryString:](v12, "setCurrentQueryString:", &stru_24F9D6A70);
  -[SPUIPPTTypingHelper setTimeSinceLastFire:](v12, "setTimeSinceLastFire:", CACurrentMediaTime());
  objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", v12, sel_fire_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addToRunLoop:forMode:", v14, *MEMORY[0x24BDBCB80]);

  -[SPUIPPTTypingHelper setSearchViewController:](v12, "setSearchViewController:", v10);
  -[SPUIPPTTypingHelper setQueryKind:](v12, "setQueryKind:", a5);
  -[SPUIPPTTypingHelper setCompletion:](v12, "setCompletion:", v9);

  return v12;
}

- (void)fire:(id)a3
{
  double v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = CACurrentMediaTime();
  -[SPUIPPTTypingHelper timeSinceLastFire](self, "timeSinceLastFire");
  v5 = v20;
  if (v4 - v6 > 0.150000006)
  {
    -[SPUIPPTTypingHelper setTimeSinceLastFire:](self, "setTimeSinceLastFire:", CACurrentMediaTime());
    -[SPUIPPTTypingHelper currentQueryString](self, "currentQueryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length") + 1;
    -[SPUIPPTTypingHelper queryString](self, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v8 == v10)
    {
      -[SPUIPPTTypingHelper completion](self, "completion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SPUIPPTTypingHelper completion](self, "completion");
        v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v12[2]();

      }
      objc_msgSend(v20, "invalidate");
      -[SPUIPPTTypingHelper setCompletion:](self, "setCompletion:", 0);
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[SPUIPPTTypingHelper currentQueryString](self, "currentQueryString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIPPTTypingHelper queryString](self, "queryString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIPPTTypingHelper currentQueryString](self, "currentQueryString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%c"), v14, objc_msgSend(v15, "characterAtIndex:", objc_msgSend(v16, "length")));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIPPTTypingHelper setCurrentQueryString:](self, "setCurrentQueryString:", v17);

      -[SPUIPPTTypingHelper searchViewController](self, "searchViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUIPPTTypingHelper currentQueryString](self, "currentQueryString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "performTestSearchWithQuery:event:queryKind:", v19, 1, -[SPUIPPTTypingHelper queryKind](self, "queryKind"));

    }
    v5 = v20;
  }

}

- (double)timeSinceLastFire
{
  return self->_timeSinceLastFire;
}

- (void)setTimeSinceLastFire:(double)a3
{
  self->_timeSinceLastFire = a3;
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)queryString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)currentQueryString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentQueryString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end
