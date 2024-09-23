@implementation _UIFocusSystemStatusDebugOverlayView

- (id)updatedAttributedLabelContent
{
  void *v2;
  void *v3;

  +[UIFocusDebugger _verboseStatus](UIFocusDebugger, "_verboseStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
