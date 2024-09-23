@implementation _UIFeedbackDragBehavior

- (void)snappedToFinalPosition
{
  void *v3;
  id v4;

  -[_UIDragFeedbackGenerator _dragConfiguration](self, "_dragConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionEndedFeedback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFeedbackGenerator _playFeedback:atLocation:](self, "_playFeedback:atLocation:", v3, 1.79769313e308, 1.79769313e308);

}

@end
