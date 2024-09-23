@implementation TTRListAppearanceGridView

- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore25TTRListAppearanceGridView *)TTRListAppearanceGridView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore25TTRListAppearanceGridView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore25TTRListAppearanceGridView *)TTRListAppearanceGridView.init(coder:)(a3);
}

- (CGSize)intrinsicContentSize
{
  double *v3;
  double v4;
  _TtC15RemindersUICore25TTRListAppearanceGridView *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_preferredMaxLayoutWidth);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  v6 = TTRListAppearanceGridView.height(forWidth:)();

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)badgeSize
{
  double *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_badgeSize);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setBadgeSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat *v6;

  height = a3.height;
  width = a3.width;
  v6 = (CGFloat *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_badgeSize);
  swift_beginAccess();
  *v6 = width;
  v6[1] = height;
  -[TTRListAppearanceGridView invalidateIntrinsicContentSize](self, sel_invalidateIntrinsicContentSize);
}

- (double)minimumGap
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_minimumGap);
  swift_beginAccess();
  return *v2;
}

- (void)setMinimumGap:(double)a3
{
  double *v5;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC15RemindersUICore25TTRListAppearanceGridView_minimumGap);
  swift_beginAccess();
  *v5 = a3;
  -[TTRListAppearanceGridView invalidateIntrinsicContentSize](self, sel_invalidateIntrinsicContentSize);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListAppearanceGridView();
  v2 = v3.receiver;
  -[TTRListAppearanceGridView layoutSubviews](&v3, sel_layoutSubviews);
  TTRListAppearanceGridView.performLayout()();

}

- (NSArray)accessibilityElements
{
  _TtC15RemindersUICore25TTRListAppearanceGridView *v3;
  unint64_t v4;
  void *v5;

  swift_beginAccess();
  v3 = self;
  v4 = _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  sub_1B461F8AC(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1B4906DA0();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
