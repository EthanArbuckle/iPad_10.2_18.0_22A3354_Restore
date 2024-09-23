@implementation DeprecatedText.StackView

- (void)layoutSubviews
{
  _TtCV12NowPlayingUI14DeprecatedText9StackView *v2;

  v2 = self;
  sub_4E57C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtCV12NowPlayingUI14DeprecatedText9StackView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11[8];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[DeprecatedText.StackView traitCollection](v5, "traitCollection");
  v7 = UITraitCollection.safeDisplayScale.getter();

  if (height <= 5.99231045e307)
    v8 = height;
  else
    v8 = 5.99231045e307;
  sub_4F378(v11, 0.0, 0.0, width, v8, v7);
  sub_52644(v11);

  v9 = v11[3];
  v10 = v11[4];
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  id v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_s9StackViewCMa();
  v4 = a3;
  v5 = v10.receiver;
  -[DeprecatedText.StackView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1FCAE8);
  v7 = Optional<A>.safeDisplayScale.getter(v6, &protocol witness table for UITraitCollection);
  v8 = objc_msgSend(v5, "traitCollection");
  v9 = UITraitCollection.safeDisplayScale.getter();

  if ((static CGFloat.==~ infix(_:_:)(v7, v9) & 1) == 0)
    objc_msgSend(v5, "setNeedsLayout");

}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithFrame:(CGRect)a3
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)sub_50BDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV12NowPlayingUI14DeprecatedText9StackView)initWithCoder:(id)a3
{
  return (_TtCV12NowPlayingUI14DeprecatedText9StackView *)sub_50D18(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_textDrawingCache));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_orderedComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_indexedComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_recycledTextDrawingViews));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_textDrawingCacheInvalidationNotificationObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCV12NowPlayingUI14DeprecatedText9StackView_cacheKeyStackViewLayoutMetrics));
}

@end
