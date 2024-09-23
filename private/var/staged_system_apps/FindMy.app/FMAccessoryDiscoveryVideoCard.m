@implementation FMAccessoryDiscoveryVideoCard

- (void)viewDidLoad
{
  _TtC6FindMy29FMAccessoryDiscoveryVideoCard *v2;

  v2 = self;
  sub_100165120();

}

- (_TtC6FindMy29FMAccessoryDiscoveryVideoCard)initWithContentView:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy29FMAccessoryDiscoveryVideoCard *v8;
  _TtC6FindMy29FMAccessoryDiscoveryVideoCard *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC6FindMy29FMAccessoryDiscoveryVideoCard_videoPlayer;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMAVPlayerView());
  v7 = a3;
  v8 = self;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[v5] = sub_10028491C(0, 0.25);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMAccessoryDiscoveryVideoCard();
  v9 = -[FMAccessoryDiscoveryVideoCard initWithContentView:](&v11, "initWithContentView:", v7);

  return v9;
}

- (void).cxx_destruct
{

}

@end
