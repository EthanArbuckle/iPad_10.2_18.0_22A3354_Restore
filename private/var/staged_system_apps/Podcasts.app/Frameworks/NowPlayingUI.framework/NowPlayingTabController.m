@implementation NowPlayingTabController

- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  _TtC12NowPlayingUI23NowPlayingTabController *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1C8C40, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_2BE9C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  NowPlayingTabController.presentNowPlaying(animated:completion:)(a3, v6, v7);
  sub_145A0((uint64_t)v6, v7);

}

- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  _TtC12NowPlayingUI23NowPlayingTabController *v8;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1C8C18, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_2BE90;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  NowPlayingTabController.dismissNowPlaying(animated:completion:)(a3, v6, v7);
  sub_145A0((uint64_t)v6, v7);

}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  _TtC12NowPlayingUI23NowPlayingTabController *v5;

  v4 = a3;
  v5 = self;
  NowPlayingTabController.encodeRestorableState(with:)((NSCoder)v4);

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingTabController();
  -[NowPlayingTabController decodeRestorableStateWithCoder:](&v4, "decodeRestorableStateWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1EC0C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI23NowPlayingTabController_nowPlayingDelegate);
}

@end
