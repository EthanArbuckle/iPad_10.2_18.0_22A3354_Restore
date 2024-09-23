@implementation UIStatusBarLockScreenStyleAttributes

- (double)heightForMetrics:(int64_t)a3
{
  return 24.0;
}

- (Class)foregroundStyleClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  objc_super v5;

  if (a3 == 49)
    return -[UIStatusBarStyleAttributes style](self, "style", *(_QWORD *)&a3, a4) == 1001;
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarLockScreenStyleAttributes;
  return -[UIStatusBarStyleAttributes shouldShowInternalItemType:withScreenCapabilities:](&v5, sel_shouldShowInternalItemType_withScreenCapabilities_, *(_QWORD *)&a3, a4);
}

- (BOOL)isLockScreen
{
  return 1;
}

@end
