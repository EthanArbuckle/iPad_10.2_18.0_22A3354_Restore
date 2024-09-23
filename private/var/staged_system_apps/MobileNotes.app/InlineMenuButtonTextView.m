@implementation InlineMenuButtonTextView

- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithCoder:(id)a3
{
  char *v3;
  _TtC11MobileNotes24InlineMenuButtonTextView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_menu) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_preservesMenuLineHeight) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_fontSymbolicTraits;
  *(_DWORD *)v3 = 0;
  v3[4] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView____lazy_storage___menuAttachment) = 0;

  result = (_TtC11MobileNotes24InlineMenuButtonTextView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004796E0, "MobileNotes/InlineMenuButtonTextView.swift", 42, 2, 58, 0);
  __break(1u);
  return result;
}

- (NSAttributedString)attributedText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[InlineMenuButtonTextView attributedText](&v3, "attributedText");
}

- (void)setAttributedText:(id)a3
{
  id v5;
  _TtC11MobileNotes24InlineMenuButtonTextView *v6;

  v5 = a3;
  v6 = self;
  sub_1003DA6A0(a3);

}

- (NSArray)accessibilityElements
{
  objc_class *ObjectType;
  _TtC11MobileNotes24InlineMenuButtonTextView *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  Class isa;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  if (UIAccessibilityIsVoiceOverRunning()
    || (v10.receiver = v4,
        v10.super_class = ObjectType,
        (v5 = -[InlineMenuButtonTextView accessibilityElements](&v10, "accessibilityElements")) == 0))
  {

    return (NSArray *)0;
  }
  else
  {
    v6 = v5;
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, (char *)&type metadata for Any + 8);

    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    return (NSArray *)isa;
  }
}

- (NSAttributedString)accessibilityAttributedValue
{
  _TtC11MobileNotes24InlineMenuButtonTextView *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1003DB2C0();
  v4 = v3;

  return (NSAttributedString *)v4;
}

- (NSString)accessibilityHint
{
  _TtC11MobileNotes24InlineMenuButtonTextView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1003DB8F0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  objc_class *ObjectType;
  _TtC11MobileNotes24InlineMenuButtonTextView *v4;
  void *v5;
  unint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  if (UIAccessibilityIsVoiceOverRunning() && (v5 = (void *)sub_1003DB5A0(), v5, v5))
  {
    v6 = UIAccessibilityTraitButton;
  }
  else
  {
    v8.receiver = v4;
    v8.super_class = ObjectType;
    v6 = -[InlineMenuButtonTextView accessibilityTraits](&v8, "accessibilityTraits");
  }

  return v6;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  -[InlineMenuButtonTextView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (BOOL)accessibilityActivate
{
  _TtC11MobileNotes24InlineMenuButtonTextView *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1003DBAC0();
  v4 = v3;

  return v4 & 1;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_class *ObjectType;
  _TtC11MobileNotes24InlineMenuButtonTextView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGPoint result;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = (void *)sub_1003DB5A0();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "accessibilityActivationPoint");
    v8 = v7;
    v10 = v9;

  }
  else
  {
    v15.receiver = v4;
    v15.super_class = ObjectType;
    -[InlineMenuButtonTextView accessibilityActivationPoint](&v15, "accessibilityActivationPoint");
    v8 = v11;
    v10 = v12;

  }
  v13 = v8;
  v14 = v10;
  result.y = v14;
  result.x = v13;
  return result;
}

- (UIButton)filterButton
{
  _TtC11MobileNotes24InlineMenuButtonTextView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1003DB5A0();

  return (UIButton *)v3;
}

- (_TtC11MobileNotes24InlineMenuButtonTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC11MobileNotes24InlineMenuButtonTextView *result;

  v4 = a4;
  result = (_TtC11MobileNotes24InlineMenuButtonTextView *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.InlineMenuButtonTextView", 36, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->menuReplacementSubstring[OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_menuReplacementSubstring]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_foregroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView____lazy_storage___menuAttachment));
}

@end
