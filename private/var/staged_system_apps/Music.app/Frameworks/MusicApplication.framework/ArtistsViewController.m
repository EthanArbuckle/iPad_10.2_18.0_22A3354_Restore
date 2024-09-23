@implementation ArtistsViewController

- (_TtC16MusicApplication21ArtistsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication21ArtistsViewController *result;

  v5 = OBJC_IVAR____TtC16MusicApplication21ArtistsViewController_artistListViewController;
  v6 = objc_allocWithZone((Class)type metadata accessor for ArtistListViewController(0));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MusicApplication21ArtistsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ArtistsViewController.swift", 44, 2, 38, 0);
  __break(1u);
  return result;
}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21ArtistsViewController_layoutContainer), "navigationItem");
}

- (id)contentScrollView
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21ArtistsViewController_layoutContainer), "contentScrollView");
}

- (void)viewDidLoad
{
  _TtC16MusicApplication21ArtistsViewController *v2;

  v2 = self;
  sub_341BAC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ArtistsViewController();
  v4 = a3;
  v5 = v12.receiver;
  -[ArtistsViewController traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "navigationItem", v12.receiver, v12.super_class);
  v7 = objc_msgSend(v5, "traitCollection");
  v8 = sub_693AE4();
  v10 = v9;

  sub_8149EC(v8, v10);
  v11 = objc_msgSend(v5, "traitCollection");
  LOBYTE(v6) = sub_344AFC(v11);

  sub_341AAC(v6 & 1);
}

- (_TtC16MusicApplication21ArtistsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.ArtistsViewController", 38);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21ArtistsViewController_artistListViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21ArtistsViewController_layoutContainer));
}

@end
