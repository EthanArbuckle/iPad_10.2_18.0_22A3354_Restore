@implementation WBSInternalFeedbackRadarComponent

+ (WBSInternalFeedbackRadarComponent)safariAutoFill
{
  if (safariAutoFill_onceToken != -1)
    dispatch_once(&safariAutoFill_onceToken, &__block_literal_global_71);
  return (WBSInternalFeedbackRadarComponent *)(id)safariAutoFill_component;
}

void __51__WBSInternalFeedbackRadarComponent_safariAutoFill__block_invoke()
{
  WBSInternalFeedbackRadarComponent *v0;
  void *v1;

  v0 = -[WBSInternalFeedbackRadarComponent initWithIdentifier:name:version:]([WBSInternalFeedbackRadarComponent alloc], "initWithIdentifier:name:version:", CFSTR("1549076"), CFSTR("Safari AutoFill"), CFSTR("All"));
  v1 = (void *)safariAutoFill_component;
  safariAutoFill_component = (uint64_t)v0;

}

+ (WBSInternalFeedbackRadarComponent)safariIOS
{
  if (safariIOS_onceToken != -1)
    dispatch_once(&safariIOS_onceToken, &__block_literal_global_6_0);
  return (WBSInternalFeedbackRadarComponent *)(id)safariIOS_component;
}

void __46__WBSInternalFeedbackRadarComponent_safariIOS__block_invoke()
{
  WBSInternalFeedbackRadarComponent *v0;
  void *v1;

  v0 = -[WBSInternalFeedbackRadarComponent initWithIdentifier:name:version:]([WBSInternalFeedbackRadarComponent alloc], "initWithIdentifier:name:version:", CFSTR("224849"), CFSTR("Safari"), CFSTR("iOS"));
  v1 = (void *)safariIOS_component;
  safariIOS_component = (uint64_t)v0;

}

+ (WBSInternalFeedbackRadarComponent)safariNewBugs
{
  if (safariNewBugs_onceToken != -1)
    dispatch_once(&safariNewBugs_onceToken, &__block_literal_global_13_0);
  return (WBSInternalFeedbackRadarComponent *)(id)safariNewBugs_component;
}

void __50__WBSInternalFeedbackRadarComponent_safariNewBugs__block_invoke()
{
  WBSInternalFeedbackRadarComponent *v0;
  void *v1;

  v0 = -[WBSInternalFeedbackRadarComponent initWithIdentifier:name:version:]([WBSInternalFeedbackRadarComponent alloc], "initWithIdentifier:name:version:", CFSTR("144485"), CFSTR("Safari"), CFSTR("(New Bugs)"));
  v1 = (void *)safariNewBugs_component;
  safariNewBugs_component = (uint64_t)v0;

}

+ (WBSInternalFeedbackRadarComponent)safariStartPageIOS
{
  if (safariStartPageIOS_onceToken != -1)
    dispatch_once(&safariStartPageIOS_onceToken, &__block_literal_global_18_2);
  return (WBSInternalFeedbackRadarComponent *)(id)safariStartPageIOS_component;
}

void __55__WBSInternalFeedbackRadarComponent_safariStartPageIOS__block_invoke()
{
  WBSInternalFeedbackRadarComponent *v0;
  void *v1;

  v0 = -[WBSInternalFeedbackRadarComponent initWithIdentifier:name:version:]([WBSInternalFeedbackRadarComponent alloc], "initWithIdentifier:name:version:", CFSTR("1175764"), CFSTR("Safari Start Page"), CFSTR("iOS"));
  v1 = (void *)safariStartPageIOS_component;
  safariStartPageIOS_component = (uint64_t)v0;

}

+ (WBSInternalFeedbackRadarComponent)safariStartPageMacOS
{
  if (safariStartPageMacOS_onceToken != -1)
    dispatch_once(&safariStartPageMacOS_onceToken, &__block_literal_global_23_1);
  return (WBSInternalFeedbackRadarComponent *)(id)safariStartPageMacOS_component;
}

void __57__WBSInternalFeedbackRadarComponent_safariStartPageMacOS__block_invoke()
{
  WBSInternalFeedbackRadarComponent *v0;
  void *v1;

  v0 = -[WBSInternalFeedbackRadarComponent initWithIdentifier:name:version:]([WBSInternalFeedbackRadarComponent alloc], "initWithIdentifier:name:version:", CFSTR("567407"), CFSTR("Safari Start Page"), CFSTR("macOS"));
  v1 = (void *)safariStartPageMacOS_component;
  safariStartPageMacOS_component = (uint64_t)v0;

}

- (WBSInternalFeedbackRadarComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSInternalFeedbackRadarComponent *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *version;
  WBSInternalFeedbackRadarComponent *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSInternalFeedbackRadarComponent;
  v11 = -[WBSInternalFeedbackRadarComponent init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    version = v11->_version;
    v11->_version = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
