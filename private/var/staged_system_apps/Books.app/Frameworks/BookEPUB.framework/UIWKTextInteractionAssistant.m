@implementation UIWKTextInteractionAssistant

+ (void)initialize
{
  BESwizzleInstanceMethods((objc_class *)a1, "rangeSelectionStarted:", "be_rangeSelectionStarted:");
  BESwizzleInstanceMethods((objc_class *)a1, "rangeSelectionEnded:", "be_rangeSelectionEnded:");
  BESwizzleInstanceMethods((objc_class *)a1, "addGestureRecognizersToView:", "be_addGestureRecognizersToView:");
}

- (void)be_rangeSelectionStarted:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIWKTextInteractionAssistant view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_textInteractionAssistantDelegate"));
  objc_msgSend(v7, "setIgnorePageTurnGestures:", 1);

  -[UIWKTextInteractionAssistant be_rangeSelectionStarted:](self, "be_rangeSelectionStarted:", x, y);
}

- (void)be_rangeSelectionEnded:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIWKTextInteractionAssistant view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_textInteractionAssistantDelegate"));
  objc_msgSend(v7, "setIgnorePageTurnGestures:", 0);

  -[UIWKTextInteractionAssistant be_rangeSelectionEnded:](self, "be_rangeSelectionEnded:", x, y);
}

- (void)be_addGestureRecognizersToView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIWKTextInteractionAssistant be_addGestureRecognizersToView:](self, "be_addGestureRecognizersToView:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UIWKTextInteractionAssistant view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_textInteractionAssistantDelegate"));
  objc_msgSend(v5, "adjustGesturesForTextInteractionAssistant:view:", self, v4);

}

@end
