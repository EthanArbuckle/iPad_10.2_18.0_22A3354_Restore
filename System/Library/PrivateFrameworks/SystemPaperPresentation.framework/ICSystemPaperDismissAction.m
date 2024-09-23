@implementation ICSystemPaperDismissAction

- (ICSystemPaperDismissAction)initWithReason:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  ICSystemPaperDismissAction *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x24BE38018];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forSetting:", v5, 1);

  v9.receiver = self;
  v9.super_class = (Class)ICSystemPaperDismissAction;
  v7 = -[ICSystemPaperDismissAction initWithInfo:responder:](&v9, sel_initWithInfo_responder_, v6, 0);

  return v7;
}

- (NSString)dismissalReason
{
  void *v2;
  void *v3;

  -[ICSystemPaperDismissAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_expectsResponse
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("dismissalReason");
  else
    return 0;
}

@end
