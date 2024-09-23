@implementation MainToolbarView

- (_TtC5Books15MainToolbarView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15MainToolbarView *)sub_1004C82FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15MainToolbarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004C9898();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books15MainToolbarView *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_1004C8CF8(a4);

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MainToolbarView();
  v2 = (char *)v10.receiver;
  -[MainToolbarView layoutSubviews](&v10, "layoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Books15MainToolbarView_backgroundView], "layer", v10.receiver, v10.super_class);
  objc_msgSend(v2, "bounds");
  v8 = objc_msgSend((id)objc_opt_self(UIBezierPath), "bezierPathWithRect:", v4, v5, v6, v7);
  v9 = objc_msgSend(v8, "CGPath");

  objc_msgSend(v3, "setShadowPath:", v9);
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 1;
}

- (void)didPressBackButtonItem
{
  _TtC5Books15MainToolbarView *v2;

  v2 = self;
  sub_1004C8F30();

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _TtC5Books15MainToolbarView *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books15MainToolbarView_backgroundView);
  v8 = a4;
  v9 = self;
  if (!objc_msgSend(v7, "isHidden"))
    goto LABEL_4;
  v10 = *(uint64_t *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC5Books15MainToolbarView_itemViews);
  if ((unint64_t)v10 >> 62)
  {
    if (v10 < 0)
      v13 = *(uint64_t *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC5Books15MainToolbarView_itemViews);
    else
      v13 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(Class *)((char *)&v9->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books15MainToolbarView_itemViews));
    v11 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(v10);
    if (v11)
      goto LABEL_4;
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
    {
LABEL_4:
      v14.receiver = v9;
      v14.super_class = (Class)type metadata accessor for MainToolbarView();
      LOBYTE(v11) = -[MainToolbarView pointInside:withEvent:](&v14, "pointInside:withEvent:", v8, x, y);
    }
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  UIAccessibilityTraits v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MainToolbarView();
  v2 = v7.receiver;
  v3 = -[MainToolbarView accessibilityTraits](&v7, "accessibilityTraits");
  v4 = UIAccessibilityTraitHeader;

  if ((v4 & ~v3) != 0)
    v5 = v4;
  else
    v5 = 0;
  return v5 | v3;
}

- (NSString)accessibilityLabel
{
  _TtC5Books15MainToolbarView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1004C9288();
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

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books15MainToolbarView_itemViews));

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books15MainToolbarView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___flexibleSpacerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___titleContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books15MainToolbarView_leadingStackViewConstraint));
}

@end
