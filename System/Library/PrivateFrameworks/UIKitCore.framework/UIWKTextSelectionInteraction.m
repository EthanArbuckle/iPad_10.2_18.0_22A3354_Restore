@implementation UIWKTextSelectionInteraction

- (void)willUpdateSelectionWithGesture:(id)a3
{
  objc_msgSend((id)objc_msgSend(-[UITextInteraction _textInput](self, "_textInput", a3), "interactionAssistant"), "willChangeSelection");
}

- (void)didUpdateSelectionWithGesture:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;

  v5 = -[UIResponder isEditable](-[UITextInteraction view](self, "view"), "isEditable");
  v6 = (void *)objc_msgSend(-[UITextInteraction _textInput](self, "_textInput"), "interactionAssistant");
  objc_msgSend(a3, "location");
  objc_msgSend(v6, "selectionChangedWithGestureAt:withGesture:withState:withFlags:", gestureTypeForGestureRecognizer(a3, -[UIResponder isEditable](-[UITextInteraction view](self, "view"), "isEditable")), objc_msgSend(a3, "state"), v5, v7, v8);
}

- (void)twoFingerRangedSelectGesture:(id)a3
{
  UITextInteraction_AssistantDelegate *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  void *v14;

  v4 = -[UITextInteraction assistantDelegate](self, "assistantDelegate");
  -[UITextInteraction_AssistantDelegate setFirstResponderIfNecessary](v4, "setFirstResponderIfNecessary");
  -[UITextInteraction_AssistantDelegate setSelectionHighlightMode:](v4, "setSelectionHighlightMode:", 0);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "touches"), "objectAtIndex:", 0), "locationInView:", objc_msgSend((id)-[UITextInteraction_AssistantDelegate view](v4, "view"), "textInputView"));
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "touches"), "objectAtIndex:", 1), "locationInView:", objc_msgSend((id)-[UITextInteraction_AssistantDelegate view](v4, "view"), "textInputView"));
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)-[UITextInteraction_AssistantDelegate activeSelection](v4, "activeSelection"), "setGranularity:", 1);
  -[UITextInteraction_AssistantDelegate view](v4, "view");
  v13 = objc_opt_respondsToSelector();
  v14 = (void *)-[UITextInteraction_AssistantDelegate view](v4, "view");
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "changeSelectionWithTouchesFrom:to:withGesture:withState:", 11, objc_msgSend(a3, "state"), v6, v8, v10, v12);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)-[UITextInteraction_AssistantDelegate view](v4, "view"), "setSelectionFromPoint:toPoint:gesture:state:", 11, objc_msgSend(a3, "state"), v6, v8, v10, v12);
  }
}

@end
