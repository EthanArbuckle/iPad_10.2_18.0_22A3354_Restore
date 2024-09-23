@implementation LibraryArtistsContainerViewController

- (_TtC5Music37LibraryArtistsContainerViewController)initWithCoder:(id)a3
{
  _TtC5Music37LibraryArtistsContainerViewController *result;

  result = (_TtC5Music37LibraryArtistsContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/LibraryArtistsContainerViewController.swift", 49, 2, 29, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_layoutContainer), "navigationItem");
}

- (void)viewDidLoad
{
  _TtC5Music37LibraryArtistsContainerViewController *v2;

  v2 = self;
  sub_100452910();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Music37LibraryArtistsContainerViewController *v2;

  v2 = self;
  sub_100452B20();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC5Music37LibraryArtistsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100452D64(a3);

}

- (_TtC5Music37LibraryArtistsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_10035A2A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Music.LibraryArtistsContainerViewController", 43);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music37LibraryArtistsContainerViewController_layoutContainer));
}

@end
