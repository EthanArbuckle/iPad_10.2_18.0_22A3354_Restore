@implementation AudioTraitDisclosureViewController.HeaderSymbolViewController

- (void)loadView
{
  _TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController *v2;

  v2 = self;
  sub_69415C();

}

- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController *v9;
  objc_super v11;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
    v6 = a4;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  v9 = -[AudioTraitDisclosureViewController.HeaderSymbolViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController)initWithCoder:(id)a3
{
  id v4;
  _TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudioTraitDisclosureViewController.HeaderSymbolViewController();
  v4 = a3;
  v5 = -[AudioTraitDisclosureViewController.HeaderSymbolViewController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication34AudioTraitDisclosureViewControllerP33_6498FC44AD81D431952734329910828A26HeaderSymbolViewController_image));
}

@end
