@implementation FMListFooterActionButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  return -[FMListFooterActionButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char **v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  v4 = v8.receiver;
  -[FMListFooterActionButton setHighlighted:](&v8, "setHighlighted:", v3);
  LODWORD(v3) = objc_msgSend(v4, "isHighlighted", v8.receiver, v8.super_class);
  v5 = (void *)objc_opt_self(UIColor);
  v6 = &selRef_separatorColor;
  if (!(_DWORD)v3)
    v6 = &selRef_clearColor;
  v7 = objc_msgSend(v5, *v6);
  objc_msgSend(v4, "setBackgroundColor:", v7);

}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)init
{
  return (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *)sub_10036FB2C();
}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100371254();
}

- (void)addAction:(id)a3 forControlEvents:(unint64_t)a4
{
  id v6;
  _TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *v7;

  v6 = a3;
  v7 = self;
  sub_1003706D8(v6, a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  v4 = a3;
  v5 = v6.receiver;
  -[FMListFooterActionButton traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_10037082C();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[FMListFooterActionButton setHighlighted:](self, "setHighlighted:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGPoint v19;
  CGRect v20;

  v7 = sub_100006C5C(0, (unint64_t *)&qword_1005D3F00, UITouch_ptr);
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = self;
  v18 = a4;
  -[FMListFooterActionButton setHighlighted:](v10, "setHighlighted:", 0);
  swift_bridgeObjectRetain(v9);
  v12 = (void *)sub_1000C936C(v11);
  *(_QWORD *)&v13 = swift_bridgeObjectRelease(v9).n128_u64[0];
  if (v12)
  {
    objc_msgSend(v12, "locationInView:", v10, v13);
    v15 = v14;
    v17 = v16;

    -[FMListFooterActionButton bounds](v10, "bounds");
    v19.x = v15;
    v19.y = v17;
    if (CGRectContainsPoint(v20, v19))
      -[FMListFooterActionButton sendActionsForControlEvents:](v10, "sendActionsForControlEvents:", 64);
  }

  swift_bridgeObjectRelease(v9);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[FMListFooterActionButton setHighlighted:](self, "setHighlighted:", 0, a4);
}

- (_TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton)initWithFrame:(CGRect)a3
{
  sub_100371220((uint64_t)self, (uint64_t)a2, (uint64_t)"FindMy.FMListFooterActionButton", 31);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_separatorLeadingAXConstraint));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  -[FMListFooterActionButton setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton_textLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "accessibilityLabel");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *v6;
  NSString v7;
  _TtC6FindMyP33_ECF36241999DC0BA34D7A6B6193B019D24FMListFooterActionButton *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  -[FMListFooterActionButton setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);

}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionButton();
  -[FMListFooterActionButton setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

@end
