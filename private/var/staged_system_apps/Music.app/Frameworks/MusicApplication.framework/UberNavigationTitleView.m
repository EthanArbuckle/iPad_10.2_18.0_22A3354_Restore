@implementation UberNavigationTitleView

- (_TtC16MusicApplication23UberNavigationTitleView)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC16MusicApplication23UberNavigationTitleView *result;

  swift_unknownObjectWeakInit(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_navigationController], 0);
  *(_OWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle] = xmmword_1060DF0;
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_splitViewDisplayMode];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_customBackButton] = 0;
  v6 = a3;

  result = (_TtC16MusicApplication23UberNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/UberNavigationTitleView.swift", 46, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication23UberNavigationTitleView *v2;

  v2 = self;
  sub_20FCE0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication23UberNavigationTitleView *v6;

  v5 = a3;
  v6 = self;
  sub_210334((uint64_t)a3);

}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _TtC16MusicApplication23UberNavigationTitleView *v6;

  v6 = self;
  sub_210488(a3, a4);

}

- (_TtC16MusicApplication23UberNavigationTitleView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication23UberNavigationTitleView *result;

  result = (_TtC16MusicApplication23UberNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.UberNavigationTitleView", 40, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView_navigationController]);
  sub_1492CC(*(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle], *(_QWORD *)&self->navigationController[OBJC_IVAR____TtC16MusicApplication23UberNavigationTitleView__backButtonStyle]);

}

@end
