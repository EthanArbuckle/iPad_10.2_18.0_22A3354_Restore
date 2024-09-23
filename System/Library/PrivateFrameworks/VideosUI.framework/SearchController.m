@implementation SearchController

- (UISearchBar)searchBar
{
  return (UISearchBar *)sub_1D9743080();
}

- (_TtC8VideosUI16SearchController)initWithSearchResultsController:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D97FC9E0();
}

- (_TtC8VideosUI16SearchController)initWithCoder:(id)a3
{
  sub_1DA04623C();
}

- (_TtC8VideosUI16SearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA0462A0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16SearchController_customSearchBar));
}

@end
