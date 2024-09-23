@implementation SocialProfileHeaderRow

- (_TtC16MusicApplication22SocialProfileHeaderRow)init
{
  return (_TtC16MusicApplication22SocialProfileHeaderRow *)sub_9B5254();
}

- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9B673C();
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  return -[SocialProfileHeaderRow isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication22SocialProfileHeaderRow *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SocialProfileHeaderRow();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SocialProfileHeaderRow isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SocialProfileHeaderRow setHighlighted:](&v8, "setHighlighted:", v3);
  sub_9B58B0(v7);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication22SocialProfileHeaderRow *v2;

  v2 = self;
  sub_9B5998();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC16MusicApplication22SocialProfileHeaderRow *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (-[SocialProfileHeaderRow pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y))
  {
    v9 = -[SocialProfileHeaderRow isEnabled](v8, "isEnabled");

    if ((v9 & 1) != 0)
      return v8;
  }
  else
  {

  }
  v8 = 0;
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication22SocialProfileHeaderRow *v4;
  double v5;
  double v6;
  char v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = self;
  -[SocialProfileHeaderRow intrinsicContentSize](v4, "intrinsicContentSize");
  v6 = v5;
  v11 = width;
  v10 = 0;
  sub_15BC44();
  v7 = static ApproximatelyEquatable<>.==~ infix(_:_:)(&v11, &v10);

  if (width >= v6)
    v8 = v6;
  else
    v8 = width;
  if ((v7 & 1) != 0)
    v8 = v6;
  v9 = 48.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplication22SocialProfileHeaderRow *v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = self;
  v3 = sub_9B5E80();

  v4 = 48.0;
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication22SocialProfileHeaderRow *v6;

  v5 = a3;
  v6 = self;
  sub_9B5F58((uint64_t)a3);

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
  v4.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  -[SocialProfileHeaderRow setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  char *v2;
  uint64_t v3;
  NSString v4;

  v2 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_titleCompositingView)
     + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text;
  v3 = *((_QWORD *)v2 + 1);
  if (v3)
  {
    swift_bridgeObjectRetain(*((_QWORD *)v2 + 1));
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_9B62F8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  _TtC16MusicApplication22SocialProfileHeaderRow *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_9B6234();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_9B62F8(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialProfileHeaderRow();
  -[SocialProfileHeaderRow setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (_TtC16MusicApplication22SocialProfileHeaderRow)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication22SocialProfileHeaderRow *result;

  result = (_TtC16MusicApplication22SocialProfileHeaderRow *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SocialProfileHeaderRow", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_title]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22SocialProfileHeaderRow_titleCompositingView));
}

@end
