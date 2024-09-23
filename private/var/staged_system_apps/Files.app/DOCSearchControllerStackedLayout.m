@implementation DOCSearchControllerStackedLayout

- (void)_searchBarWillLayoutSubviews:(id)a3 inSearchFieldContainer:(id)a4 searchTextFieldFrame:(CGRect)a5 cancelButtonFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v17;
  id v18;
  _TtC5Files32DOCSearchControllerStackedLayout *v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1004634CC(a3, a4, v13, v12, v11, v10, x, y, width, height);

}

- (_TtC5Files32DOCSearchControllerStackedLayout)init
{
  _TtC5Files32DOCSearchControllerStackedLayout *result;

  result = (_TtC5Files32DOCSearchControllerStackedLayout *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSearchControllerStackedLayout", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files32DOCSearchControllerStackedLayout_searchController);

}

@end
