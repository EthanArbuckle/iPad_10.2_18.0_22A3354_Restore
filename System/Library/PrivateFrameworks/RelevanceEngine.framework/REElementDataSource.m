@implementation REElementDataSource

- (void)setActivityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activityDelegate, a3);
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 1;
  return result;
}

- (REElementDataSource)init
{
  REElementDataSource *v2;
  REElementDataSource *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REElementDataSource;
  v2 = -[REElementDataSource init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 1;
    -[REElementDataSource loadLoggingHeader](v2, "loadLoggingHeader");
  }
  return v3;
}

- (void)setUnlockedSinceBoot:(BOOL)a3
{
  self->_unlockedSinceBoot = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)loadLoggingHeader
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *logHeader;
  id v9;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("REUpNext"), &stru_24CF92178, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("DataSource"), &stru_24CF92178, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("Watch"), &stru_24CF92178, 1, 0, objc_msgSend(v9, "length"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[DS: %@]"), v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  logHeader = self->_logHeader;
  self->_logHeader = v7;

}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  return 1;
}

+ (BOOL)wantsPrivateQueue
{
  return 0;
}

+ (unint64_t)elementContentMode
{
  return 2;
}

+ (BOOL)drivenByUserInteraction
{
  return 0;
}

+ (id)contentAttributes
{
  if (contentAttributes_onceToken != -1)
    dispatch_once(&contentAttributes_onceToken, &__block_literal_global_9);
  return (id)contentAttributes_ContentAttributes;
}

void __40__REElementDataSource_contentAttributes__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("REContentHeaderTextKey");
  v2[1] = CFSTR("REContentDescription1TextKey");
  v2[2] = CFSTR("REContentDescription2TextKey");
  v2[3] = CFSTR("REContentDescription3TextKey");
  v2[4] = CFSTR("REContentCLKHeaderTextKey");
  v2[5] = CFSTR("REContentCLKDescription1TextKey");
  v2[6] = CFSTR("REContentCLKDescription2TextKey");
  v2[7] = CFSTR("REContentCLKDescription3TextKey");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contentAttributes_ContentAttributes;
  contentAttributes_ContentAttributes = v0;

}

+ (id)overrideDataSourceImage
{
  return 0;
}

+ (id)overrideLocalizedDataSourceName
{
  return 0;
}

+ (BOOL)wantsAppPrewarm
{
  return 1;
}

+ (BOOL)wantsLocationInUseAsserton
{
  return 0;
}

+ (BOOL)supportsPersistence
{
  return 0;
}

- (NSArray)supportedSections
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, MEMORY[0x24BDBD1A8]);
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (id)complicationDescriptor
{
  return 0;
}

+ (BOOL)wantsReloadForFirstDeviceUnlock
{
  return 1;
}

+ (BOOL)wantsAutomaticFetching
{
  return 1;
}

- (void)beginFetchingData
{
  -[REElementDataSource beginActivity:](self, "beginActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

- (void)finishFetchingData
{
  -[REElementDataSource finishActivity:](self, "finishActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

- (id)activityDelegate
{
  return objc_loadWeakRetained((id *)&self->_activityDelegate);
}

- (void)beginActivity:(id)a3
{
  REElementDataSourceActivityDelegate **p_activityDelegate;
  id v5;
  id WeakRetained;

  p_activityDelegate = &self->_activityDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activityDelegate);
  objc_msgSend(WeakRetained, "dataSource:didBeginActivity:", self, v5);

}

- (void)finishActivity:(id)a3
{
  REElementDataSourceActivityDelegate **p_activityDelegate;
  id v5;
  id WeakRetained;

  p_activityDelegate = &self->_activityDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activityDelegate);
  objc_msgSend(WeakRetained, "dataSource:didFinishActivity:", self, v5);

}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSDictionary)dataSourceProperties
{
  return 0;
}

- (REElementDataSourceDelegate)delegate
{
  return (REElementDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (BOOL)allowsLocationUse
{
  return self->_allowsLocationUse;
}

- (void)setAllowsLocationUse:(BOOL)a3
{
  self->_allowsLocationUse = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)logHeader
{
  return self->_logHeader;
}

- (BOOL)hasUnlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHeader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityDelegate);
}

- (void)collectLoggableState:(id)a3
{
  if (a3)
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, &stru_24CF92178);
}

+ (NSString)bundleIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(unint64_t)a4 withHandler:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
