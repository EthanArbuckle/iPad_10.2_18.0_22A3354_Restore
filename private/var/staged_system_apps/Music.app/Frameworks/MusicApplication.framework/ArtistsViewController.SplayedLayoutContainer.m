@implementation ArtistsViewController.SplayedLayoutContainer

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer)init
{
  return (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *)sub_342C40();
}

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_artistListViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer____lazy_storage___verticalSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_leftViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_rightViewController) = 0;
  v4 = a3;

  result = (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ArtistsViewController.swift", 44, 2, 217, 0);
  __break(1u);
  return result;
}

- (id)contentScrollView
{
  return 0;
}

- (void)viewDidLoad
{
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *v2;

  v2 = self;
  sub_342EE4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *v4;

  v4 = self;
  sub_343094(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer *v2;

  v2 = self;
  sub_34337C();

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  sub_3437F4(self, (uint64_t)a2, (const char **)&selRef_music_viewInheritedLayoutInsetsDidChange);
}

- (void)viewLayoutMarginsDidChange
{
  sub_3437F4(self, (uint64_t)a2, (const char **)&selRef_viewLayoutMarginsDidChange);
}

- (_TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.SplayedLayoutContainer", 39);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer____lazy_storage___verticalSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_leftViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication21ArtistsViewControllerP33_35FACAB5C669DED431E3D95E003C94B622SplayedLayoutContainer_rightViewController));
}

@end
