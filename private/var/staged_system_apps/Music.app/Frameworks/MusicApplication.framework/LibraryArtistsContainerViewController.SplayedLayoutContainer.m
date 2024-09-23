@implementation LibraryArtistsContainerViewController.SplayedLayoutContainer

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer)init
{
  return (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *)sub_50AA30();
}

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer____lazy_storage___verticalSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_leftViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_rightViewController) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryArtistsContainerViewController.swift", 60, 2, 227, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *v2;

  v2 = self;
  sub_50AD68();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *v4;

  v4 = self;
  sub_50AF18(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer *v2;

  v2 = self;
  sub_50B1C0();

}

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.SplayedLayoutContainer", 39);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer____lazy_storage___verticalSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_leftViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC22SplayedLayoutContainer_rightViewController));
}

@end
