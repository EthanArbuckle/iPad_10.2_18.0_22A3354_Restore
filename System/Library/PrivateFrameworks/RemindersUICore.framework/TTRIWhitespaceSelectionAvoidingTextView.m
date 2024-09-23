@implementation TTRIWhitespaceSelectionAvoidingTextView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC15RemindersUICore39TTRIWhitespaceSelectionAvoidingTextView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  TTRIWhitespaceSelectionAvoidingTextView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (_TtC15RemindersUICore39TTRIWhitespaceSelectionAvoidingTextView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIWhitespaceSelectionAvoidingTextView();
  return -[TTRIReminderTitleTextView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
