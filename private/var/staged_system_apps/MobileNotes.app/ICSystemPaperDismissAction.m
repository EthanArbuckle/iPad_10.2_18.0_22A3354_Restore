@implementation ICSystemPaperDismissAction

- (ICSystemPaperDismissAction)initWithReason:(id)a3
{
  id v4;
  id v5;
  ICSystemPaperDismissAction *v6;
  objc_super v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v5, "setObject:forSetting:", v4, 1);

  v8.receiver = self;
  v8.super_class = (Class)ICSystemPaperDismissAction;
  v6 = -[ICSystemPaperDismissAction initWithInfo:responder:](&v8, "initWithInfo:responder:", v5, 0);

  return v6;
}

- (NSString)dismissalReason
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSystemPaperDismissAction info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForSetting:", 1));

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
