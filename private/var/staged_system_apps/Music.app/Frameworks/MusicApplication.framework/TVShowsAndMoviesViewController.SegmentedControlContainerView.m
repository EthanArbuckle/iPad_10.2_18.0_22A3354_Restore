@implementation TVShowsAndMoviesViewController.SegmentedControlContainerView

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)init
{
  return (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *)sub_18F8EC();
}

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_190198();
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *v2;

  v2 = self;
  sub_18FC08();

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl);
  v3 = self;
  objc_msgSend(v2, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;
  v8 = UIEdgeInsets.negated()(-[TVShowsAndMoviesViewController.SegmentedControlContainerView layoutMargins](v3, "layoutMargins"));
  v12 = CGSize.inset(by:)(v8, v9, v10, v11, v5, v7);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl);
  v6 = self;
  objc_msgSend(v5, "intrinsicContentSize");
  v8 = v7;
  v10 = v9;
  v11 = UIEdgeInsets.negated()(-[TVShowsAndMoviesViewController.SegmentedControlContainerView layoutMargins](v6, "layoutMargins"));
  v15 = CGSize.inset(by:)(v11, v12, v13, v14, v8, v10);
  v17 = v16;

  if (width > v15)
    v18 = width;
  else
    v18 = v15;
  if (width <= 0.0)
    v18 = v15;
  if (height > v17)
    v19 = height;
  else
    v19 = v17;
  if (height <= 0.0)
    v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVShowsAndMoviesViewController.SegmentedControlContainerView();
  v2 = v3.receiver;
  -[TVShowsAndMoviesViewController.SegmentedControlContainerView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "music_inheritedLayoutInsets", v3.receiver, v3.super_class);
  objc_msgSend(v2, "layoutMargins");
  objc_msgSend(v2, "setLayoutMargins:");
  objc_msgSend(v2, "music_inheritedLayoutInsets");
  objc_msgSend(v2, "layoutMargins");
  objc_msgSend(v2, "setLayoutMargins:");

}

- (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView)initWithFrame:(CGRect)a3
{
  _TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *result;

  result = (_TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SegmentedControlContainerView", 46, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication30TVShowsAndMoviesViewControllerP33_0A44ACF94072246E8AD16A61955F73C029SegmentedControlContainerView_backgroundView));
}

@end
