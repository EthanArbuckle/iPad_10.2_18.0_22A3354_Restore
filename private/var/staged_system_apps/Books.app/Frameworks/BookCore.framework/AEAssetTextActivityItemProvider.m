@implementation AEAssetTextActivityItemProvider

+ (id)textItemWithPropertySource:(id)a3
{
  id v3;
  AEAssetActivityPropertyProvider *v4;
  id Text;
  void *v6;

  v3 = a3;
  v4 = -[AEAssetActivityPropertyProvider initWithPropertySource:]([AEAssetActivityPropertyProvider alloc], "initWithPropertySource:", v3);

  Text = _generateText(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(Text);

  return v6;
}

- (AEAssetTextActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  AEAssetTextActivityItemProvider *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v9 = (objc_class *)objc_opt_class(self, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14.receiver = self;
  v14.super_class = (Class)AEAssetTextActivityItemProvider;
  v12 = -[AEAssetBaseActivityItemProvider initWithDelegate:placeholderItem:propertySource:](&v14, "initWithDelegate:placeholderItem:propertySource:", v7, v11, v6);

  return v12;
}

- (BOOL)supportsActivityType:(id)a3
{
  return 1;
}

- (id)placeholderItem
{
  return &stru_296430;
}

- (id)item
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id Text;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetTextActivityItemProvider activityType](self, "activityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
  objc_msgSend(v4, "setActivityType:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetTextActivityItemProvider activityType](self, "activityType"));
  if (-[AEAssetBaseActivityItemProvider shouldShareActivityType:](self, "shouldShareActivityType:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    Text = _generateText(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(Text);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
