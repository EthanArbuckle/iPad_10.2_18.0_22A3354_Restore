@implementation UberNavigationTitleView

- (_TtC5Music23UberNavigationTitleView)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC5Music23UberNavigationTitleView *result;

  swift_unknownObjectWeakInit(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_navigationController], 0);
  *(_OWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle] = xmmword_100EA85A0;
  v5 = &self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_splitViewDisplayMode];
  *(_QWORD *)v5 = 0;
  v5[8] = 1;
  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_customBackButton] = 0;
  v6 = a3;

  result = (_TtC5Music23UberNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/UberNavigationTitleView.swift", 35, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC5Music23UberNavigationTitleView *v2;

  v2 = self;
  sub_10055ADC0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Music23UberNavigationTitleView *v6;

  v5 = a3;
  v6 = self;
  sub_10055B42C((uint64_t)a3);

}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  _TtC5Music23UberNavigationTitleView *v6;

  v6 = self;
  sub_10055B580(a3, a4);

}

- (_TtC5Music23UberNavigationTitleView)initWithFrame:(CGRect)a3
{
  _TtC5Music23UberNavigationTitleView *result;

  result = (_TtC5Music23UberNavigationTitleView *)_swift_stdlib_reportUnimplementedInitializer("Music.UberNavigationTitleView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView_navigationController], a2);
  sub_10013B670(*(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle], *(_QWORD *)&self->navigationController[OBJC_IVAR____TtC5Music23UberNavigationTitleView__backButtonStyle]);

}

@end
