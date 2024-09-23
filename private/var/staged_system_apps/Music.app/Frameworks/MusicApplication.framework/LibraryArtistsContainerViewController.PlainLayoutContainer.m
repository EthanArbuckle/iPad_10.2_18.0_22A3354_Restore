@implementation LibraryArtistsContainerViewController.PlainLayoutContainer

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  return -[LibraryArtistsContainerViewController.PlainLayoutContainer initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
}

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/LibraryArtistsContainerViewController.swift", 60, 2, 151, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  void *v3;
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer *v4;
  id v5;
  void *v6;
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer *v8;
  UINavigationItem *v9;
  objc_super v10;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_artistListViewController);
  if (v3)
  {
    v4 = self;
    v5 = objc_msgSend(v3, "navigationItem");
    if (v5)
    {
      v6 = v5;

      return (UINavigationItem *)v6;
    }
  }
  else
  {
    v8 = self;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LibraryArtistsContainerViewController.PlainLayoutContainer();
  v9 = -[LibraryArtistsContainerViewController.PlainLayoutContainer navigationItem](&v10, "navigationItem");

  return v9;
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer *v2;

  v2 = self;
  sub_50A17C();

}

- (_TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.PlainLayoutContainer", 37);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication37LibraryArtistsContainerViewControllerP33_6880D9879903E53971BFC75B8D781AAC20PlainLayoutContainer_navigatedArtistDetailViewController));
}

@end
