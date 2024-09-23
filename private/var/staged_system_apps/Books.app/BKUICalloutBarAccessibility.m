@implementation BKUICalloutBarAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UICalloutBar");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)appear
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKUICalloutBarAccessibility;
  -[BKUICalloutBarAccessibility appear](&v7, "appear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUICalloutBarAccessibility subviews](self, "subviews"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = dispatch_time(0, 750000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001412AC;
    block[3] = &unk_1008E72C0;
    v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (void)fade
{
  objc_super v2;

  if (!byte_100A1E248)
  {
    v2.receiver = self;
    v2.super_class = (Class)BKUICalloutBarAccessibility;
    -[BKUICalloutBarAccessibility fade](&v2, "fade");
  }
}

@end
