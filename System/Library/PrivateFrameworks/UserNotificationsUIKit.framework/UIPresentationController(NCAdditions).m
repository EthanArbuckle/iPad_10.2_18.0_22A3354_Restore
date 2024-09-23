@implementation UIPresentationController(NCAdditions)

- (id)presentedNotificationViewController
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
