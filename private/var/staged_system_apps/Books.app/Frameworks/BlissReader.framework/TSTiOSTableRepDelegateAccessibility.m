@implementation TSTiOSTableRepDelegateAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTiOSTableRepDelegate");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_showContextMenuAtPoint:(CGPoint)a3
{
  _QWORD v3[5];
  CGPoint v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_23D968;
  v3[3] = &unk_43BBD0;
  v4 = a3;
  v3[4] = self;
  -[UIMenuController tsaxPerformBlockPreventingMakingVisible:](+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"), "tsaxPerformBlockPreventingMakingVisible:", v3);
}

@end
