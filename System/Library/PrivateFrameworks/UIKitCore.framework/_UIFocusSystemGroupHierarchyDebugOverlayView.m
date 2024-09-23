@implementation _UIFocusSystemGroupHierarchyDebugOverlayView

- (id)updatedAttributedLabelContent
{
  void *v2;
  void *v3;

  +[UIFocusDebugger focusGroupsForEnvironment:](UIFocusDebugger, "focusGroupsForEnvironment:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
