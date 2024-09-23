@implementation IMViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMViewControllerAccessibility;
  v6 = -[IMViewControllerAccessibility _transitionFromViewController:toViewController:transition:reverse:](&v10, "_transitionFromViewController:toViewController:transition:reverse:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = dispatch_time(0, 250000000);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, &stru_290110);
  return v7;
}

@end
