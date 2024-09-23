@implementation PRUISWillDismissSheetAction

- (PRUISWillDismissSheetAction)initWithResponse:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  PRUISWillDismissSheetAction *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x24BE0BE40];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v9.receiver = self;
  v9.super_class = (Class)PRUISWillDismissSheetAction;
  v7 = -[PRUISWillDismissSheetAction initWithInfo:responder:](&v9, sel_initWithInfo_responder_, v6, 0);

  return v7;
}

- (PRUISModalEntryPointResponse)response
{
  void *v2;
  void *v3;

  -[PRUISWillDismissSheetAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRUISModalEntryPointResponse *)v3;
}

@end
