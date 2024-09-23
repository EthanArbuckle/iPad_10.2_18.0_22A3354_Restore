@implementation UIViewInstallAccessibilityInterfaceStyleIntentVisitor

void ___UIViewInstallAccessibilityInterfaceStyleIntentVisitor_block_invoke()
{
  _UIAccessibilityInterfaceStyleVisitor *v0;

  v0 = -[_UIViewVisitor initWithTraversalDirection:]([_UIAccessibilityInterfaceStyleVisitor alloc], "initWithTraversalDirection:", 2);
  +[UIView _addHierarchyTrackingVisitor:](UIView, "_addHierarchyTrackingVisitor:", v0);

}

@end
