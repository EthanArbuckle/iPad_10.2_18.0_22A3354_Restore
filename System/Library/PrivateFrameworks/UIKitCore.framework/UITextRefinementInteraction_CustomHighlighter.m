@implementation UITextRefinementInteraction_CustomHighlighter

- (UITextRefinementInteraction_CustomHighlighter)initWithLongPressGesture:(id)a3
{
  id v4;
  UITextRefinementInteraction_CustomHighlighter *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextRefinementInteraction_CustomHighlighter;
  v5 = -[UITextInteraction init](&v8, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "setName:", CFSTR("com.apple.UIKit.textLoupe"));
    -[UITextInteraction addGestureRecognizer:withName:](v5, "addGestureRecognizer:withName:", v6, 0x1E1778880);

  }
  return v5;
}

- (BOOL)doesControlDelegate
{
  return 0;
}

@end
