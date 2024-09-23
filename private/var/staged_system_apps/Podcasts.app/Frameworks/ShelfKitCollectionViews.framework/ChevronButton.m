@implementation ChevronButton

- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews13ChevronButton *)sub_221A5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)tintColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel), "tintColor");
}

- (void)setTintColor:(id)a3
{
  void *v4;
  _TtC23ShelfKitCollectionViews13ChevronButton *v5;
  id v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_imageView);
  v7 = a3;
  v5 = self;
  objc_msgSend(v4, "setTintColor:", v7);
  v6 = objc_retain(*(id *)((char *)&v5->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
  objc_msgSend(v6, "setTextColor:", v7);

}

- (_TtC23ShelfKitCollectionViews13ChevronButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_222120();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_imageView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_viewConstraints));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews13ChevronButton_objectGraph));
}

@end
