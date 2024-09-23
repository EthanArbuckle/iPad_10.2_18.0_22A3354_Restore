@implementation UIViewInstallTintColorVisitor

void ___UIViewInstallTintColorVisitor_block_invoke()
{
  _UITintColorVisitor *v0;

  v0 = -[_UITintColorVisitor initWithNotificationReasons:]([_UITintColorVisitor alloc], "initWithNotificationReasons:", 0);
  +[UIView _addHierarchyTrackingVisitor:](UIView, "_addHierarchyTrackingVisitor:", v0);

}

@end
