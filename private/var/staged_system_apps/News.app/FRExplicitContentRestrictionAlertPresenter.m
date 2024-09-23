@implementation FRExplicitContentRestrictionAlertPresenter

- (FRExplicitContentRestrictionAlertPresenter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRExplicitContentRestrictionAlertPresenter;
  return -[FRExplicitContentRestrictionAlertPresenter init](&v3, "init");
}

- (void)presentExplicitContentRestrictionAlertWithPresentingViewController:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FA80;
  block[3] = &unk_1000D9758;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

@end
