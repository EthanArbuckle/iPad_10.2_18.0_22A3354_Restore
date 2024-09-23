@implementation SearchHeaderView

- (_TtC8ShelfKit16SearchHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_5A6C4();
}

- (void)layoutSubviews
{
  _TtC8ShelfKit16SearchHeaderView *v2;

  v2 = self;
  SearchHeaderView.layoutSubviews()();

}

- (_TtC8ShelfKit16SearchHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8ShelfKit16SearchHeaderView *result;

  result = (_TtC8ShelfKit16SearchHeaderView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.SearchHeaderView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchScopeControl));

  sub_3B5A8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm), *(_QWORD *)&self->searchScopeControl[OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm], self->bottomMargin[OBJC_IVAR____TtC8ShelfKit16SearchHeaderView_searchTerm]);
}

@end
