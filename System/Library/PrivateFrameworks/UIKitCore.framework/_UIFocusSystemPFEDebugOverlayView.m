@implementation _UIFocusSystemPFEDebugOverlayView

- (id)updatedAttributedLabelContent
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView _focusSystem](self, "_focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusDebugger preferredFocusEnvironmentsForEnvironment:](UIFocusDebugger, "preferredFocusEnvironmentsForEnvironment:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
