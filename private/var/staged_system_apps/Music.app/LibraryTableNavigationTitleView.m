@implementation LibraryTableNavigationTitleView

- (_TtC5Music31LibraryTableNavigationTitleView)initWithTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC5Music31LibraryTableNavigationTitleView *)sub_1000521B8(v3, v4);
}

- (_TtC5Music31LibraryTableNavigationTitleView)initWithCoder:(id)a3
{
  _TtC5Music31LibraryTableNavigationTitleView *result;

  result = (_TtC5Music31LibraryTableNavigationTitleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/LibraryTableNavigationTitleView.swift", 43, 2, 35, 0);
  __break(1u);
  return result;
}

- (UIButton)filterButton
{
  return (UIButton *)*(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton];
}

- (void)setFilterButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(id *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton];
  *(_QWORD *)&self->_UINavigationBarTitleView_opaque[OBJC_IVAR____TtC5Music31LibraryTableNavigationTitleView_filterButton] = a3;
  v3 = a3;

}

- (_TtC5Music31LibraryTableNavigationTitleView)initWithFrame:(CGRect)a3
{
  sub_1000535F0((uint64_t)self, (uint64_t)a2, (uint64_t)"Music.LibraryTableNavigationTitleView", 37);
}

- (void).cxx_destruct
{

}

@end
