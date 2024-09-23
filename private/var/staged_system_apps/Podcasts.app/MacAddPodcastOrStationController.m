@implementation MacAddPodcastOrStationController

- (void)presentAddPodcastUIWithUrl:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Podcasts32MacAddPodcastOrStationController *v9;
  uint64_t v10;

  sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  v9 = self;
  sub_100294E80((uint64_t)v6);

  sub_1001C9958((uint64_t)v6);
}

- (void)presentAddStationUI
{
  _TtC8Podcasts32MacAddPodcastOrStationController *v2;

  v2 = self;
  sub_10029572C();

}

- (_TtC8Podcasts32MacAddPodcastOrStationController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MacAddPodcastOrStationController();
  return -[MTAddPodcastOrStationController init](&v3, "init");
}

@end
