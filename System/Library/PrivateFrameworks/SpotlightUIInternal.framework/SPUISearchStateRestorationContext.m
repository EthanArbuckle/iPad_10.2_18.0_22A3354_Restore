@implementation SPUISearchStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUISearchStateRestorationContext)initWithCoder:(id)a3
{
  id v4;
  SPUISearchStateRestorationContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *viewControllerContexts;
  uint64_t v12;
  SPUIResultsViewStateRestorationContext *searchViewContext;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SPUISearchStateRestorationContext;
  v5 = -[SPUISearchStateRestorationContext init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("viewControllerContexts"));
    v10 = objc_claimAutoreleasedReturnValue();
    viewControllerContexts = v5->_viewControllerContexts;
    v5->_viewControllerContexts = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchViewContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    searchViewContext = v5->_searchViewContext;
    v5->_searchViewContext = (SPUIResultsViewStateRestorationContext *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeAtDismissal"));
    v5->_timeAtDismissal = v14;
    v5->_wantsGo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsGo"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *viewControllerContexts;
  id v5;

  viewControllerContexts = self->_viewControllerContexts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", viewControllerContexts, CFSTR("viewControllerContexts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchViewContext, CFSTR("searchViewContext"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeAtDismissal"), self->_timeAtDismissal);
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsGo, CFSTR("wantsGo"));

}

- (SPUIResultsViewStateRestorationContext)searchViewContext
{
  return (SPUIResultsViewStateRestorationContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchViewContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)timeAtDismissal
{
  return self->_timeAtDismissal;
}

- (void)setTimeAtDismissal:(double)a3
{
  self->_timeAtDismissal = a3;
}

- (NSArray)viewControllerContexts
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setViewControllerContexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)wantsGo
{
  return self->_wantsGo;
}

- (void)setWantsGo:(BOOL)a3
{
  self->_wantsGo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerContexts, 0);
  objc_storeStrong((id *)&self->_searchViewContext, 0);
}

@end
