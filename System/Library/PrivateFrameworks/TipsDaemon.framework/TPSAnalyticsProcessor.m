@implementation TPSAnalyticsProcessor

- (TPSAnalyticsProcessor)init
{
  TPSAnalyticsProcessor *v2;
  uint64_t v3;
  TPSAnalyticsEventController *analyticsEventController;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSString *dateLastRunKey;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsProcessor;
  v2 = -[TPSAnalyticsProcessor init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DBF2D0], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    analyticsEventController = v2->_analyticsEventController;
    v2->_analyticsEventController = (TPSAnalyticsEventController *)v3;

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v7, CFSTR("_DateLastRun"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateLastRunKey = v2->_dateLastRunKey;
    v2->_dateLastRunKey = (NSString *)v8;

  }
  return v2;
}

- (NSDate)dateLastRun
{
  void *v3;

  v3 = (void *)objc_opt_class();
  return (NSDate *)objc_msgSend(v3, "loadValueForKey:class:", self->_dateLastRunKey, objc_opt_class());
}

- (void)setDateLastRun:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "saveValue:forKey:", v4, self->_dateLastRunKey);

}

+ (void)saveValue:(id)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x1E0DBF400], "archivedDataWithRootObject:forKey:", a3, a4);
}

+ (id)loadValueForKey:(id)a3 class:(Class)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithObject:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBF400], "unarchivedObjectOfClasses:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processAnalytics:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (TPSDuetDataProvider)duetDataProvider
{
  return self->_duetDataProvider;
}

- (TPSAnalyticsProcessorDataSource)dataSource
{
  return (TPSAnalyticsProcessorDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_duetDataProvider, 0);
  objc_storeStrong((id *)&self->_dateLastRunKey, 0);
  objc_storeStrong((id *)&self->_analyticsEventController, 0);
}

@end
