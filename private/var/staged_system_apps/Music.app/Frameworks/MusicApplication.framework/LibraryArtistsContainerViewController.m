@implementation LibraryArtistsContainerViewController

- (_TtC16MusicApplication37LibraryArtistsContainerViewController)initWithCoder:(id)a3
{
  _TtC16MusicApplication37LibraryArtistsContainerViewController *result;

  result = (_TtC16MusicApplication37LibraryArtistsContainerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryArtistsContainerViewController.swift", 60, 2, 29, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication37LibraryArtistsContainerViewController_layoutContainer), "navigationItem");
}

- (void)viewDidLoad
{
  _TtC16MusicApplication37LibraryArtistsContainerViewController *v2;

  v2 = self;
  sub_509518();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication37LibraryArtistsContainerViewController *v2;

  v2 = self;
  sub_5096F8();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MusicApplication37LibraryArtistsContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_50993C(a3);

}

- (_TtC16MusicApplication37LibraryArtistsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.LibraryArtistsContainerViewController", 54);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication37LibraryArtistsContainerViewController_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication37LibraryArtistsContainerViewController_layoutContainer));
}

@end
