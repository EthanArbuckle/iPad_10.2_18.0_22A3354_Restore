@implementation ArtistsViewController.PlainLayoutContainer

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtistsViewController.PlainLayoutContainer();
  return -[ArtistsViewController.PlainLayoutContainer initWithNibName:bundle:](&v3, "initWithNibName:bundle:", 0, 0);
}

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_navigatedArtistDetailViewController) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ArtistsViewController.swift", 44, 2, 139, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  void *v3;
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer *v4;
  id v5;
  void *v6;
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer *v8;
  UINavigationItem *v9;
  objc_super v10;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_artistListViewController);
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
  v10.super_class = (Class)type metadata accessor for ArtistsViewController.PlainLayoutContainer();
  v9 = -[ArtistsViewController.PlainLayoutContainer navigationItem](&v10, "navigationItem");

  return v9;
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer *v2;

  v2 = self;
  sub_342314();

}

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.PlainLayoutContainer", 37);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B620PlainLayoutContainer_navigatedArtistDetailViewController));
}

@end
