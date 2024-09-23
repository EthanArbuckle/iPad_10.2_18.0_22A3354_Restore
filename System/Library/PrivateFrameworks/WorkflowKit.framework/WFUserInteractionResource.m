@implementation WFUserInteractionResource

- (WFUserInteractionResource)initWithDefinition:(id)a3
{
  WFUserInteractionResource *v3;
  void *v4;
  WFUserInteractionResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFUserInteractionResource;
  v3 = -[WFResource initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addApplicationStateObserver:forEvent:", v3, 0);
    objc_msgSend(v4, "addApplicationStateObserver:forEvent:", v3, 1);
    v5 = v3;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeApplicationStateObserver:forEvent:", self, 0);
  objc_msgSend(v3, "removeApplicationStateObserver:forEvent:", self, 1);

  v4.receiver = self;
  v4.super_class = (Class)WFUserInteractionResource;
  -[WFResource dealloc](&v4, sel_dealloc);
}

- (void)refreshAvailability
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", objc_msgSend(v3, "applicationState") == 0, 0);

}

+ (BOOL)isSingleton
{
  return 1;
}

@end
