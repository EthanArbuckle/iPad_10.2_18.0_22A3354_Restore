@implementation WFURLOpenResource

- (WFURLOpenResource)initWithDefinition:(id)a3
{
  WFURLOpenResource *v3;
  void *v4;
  void *v5;
  WFURLOpenResource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFURLOpenResource;
  v3 = -[WFResource initWithDefinition:](&v8, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFResource sharedInstance](WFUserInteractionResource, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_refreshAvailabilityWithNotification, CFSTR("WFResourceAvailabilityChangedNotification"), v5);

    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFResource sharedInstance](WFUserInteractionResource, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("WFResourceAvailabilityChangedNotification"), v4);

  v5.receiver = self;
  v5.super_class = (Class)WFURLOpenResource;
  -[WFResource dealloc](&v5, sel_dealloc);
}

- (void)refreshAvailability
{
  id v3;

  +[WFResource sharedInstance](WFUserInteractionResource, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", objc_msgSend(v3, "isAvailable"), 0);

}

+ (BOOL)isSingleton
{
  return 1;
}

@end
