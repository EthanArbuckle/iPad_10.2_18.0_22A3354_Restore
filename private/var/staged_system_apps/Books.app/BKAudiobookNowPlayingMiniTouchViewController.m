@implementation BKAudiobookNowPlayingMiniTouchViewController

- (BKAudiobookNowPlayingMiniTouchViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10033F27C();
}

- (void)loadView
{
  BKAudiobookNowPlayingMiniTouchViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_10033B06C();
  -[BKAudiobookNowPlayingMiniTouchViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  BKAudiobookNowPlayingMiniTouchViewController *v2;

  v2 = self;
  sub_10033B3F4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  char *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[BKAudiobookNowPlayingTouchViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = sub_10033B06C();
  objc_msgSend(*(id *)&v5[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleContainer], "setMarqueeEnabled:withOptions:", 1, 0, v6.receiver, v6.super_class);
  objc_msgSend(*(id *)&v5[OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleContainer], "setMarqueeEnabled:withOptions:", 1, 0);

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  BKAudiobookNowPlayingMiniTouchViewController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_10033F3C0();

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)setHelper:(id)a3 completion:(id)a4
{
  void *v6;
  char *Strong;
  BKAudiobookNowPlayingMiniTouchViewController *v8;
  _OWORD v9[2];
  uint64_t v10;

  v6 = _Block_copy(a4);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_helperProvider)+ 16);
  _Block_copy(v6);
  swift_unknownObjectRetain(a3);
  v8 = self;
  if (Strong)
  {
    sub_1003951C8((uint64_t)a3, Strong, v6);
    swift_unknownObjectRelease(Strong);
  }
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_10033C74C((uint64_t)v9);
  sub_100010960((uint64_t)v9, (uint64_t *)&unk_1009D4CE0);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_cancellables));
  sub_100010960((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_buyButtonProvider, (uint64_t *)&unk_1009D4CE0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_buyButtonViewController));
  sub_100010960((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_contextMenuAppearDate, &qword_1009D7440);
  v3 = (char *)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController____lazy_storage___miniPlayerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_springLoadedInteraction));
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  BKAudiobookNowPlayingMiniTouchViewController *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10033F800();

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  id v13;
  BKAudiobookNowPlayingMiniTouchViewController *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[24];

  v9 = sub_10004CFD4(&qword_1009D7440);
  __chkstk_darwin(v9);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = a3;
  v13 = a4;
  swift_unknownObjectRetain(a5);
  v14 = self;
  static Date.now.getter(v14);
  v15 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 0, 1, v15);
  v16 = (uint64_t)v14 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_contextMenuAppearDate;
  swift_beginAccess((char *)v14 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchViewController_contextMenuAppearDate, v18, 33, 0);
  sub_10006CD88((uint64_t)v11, v16);
  swift_endAccess(v18);

  swift_unknownObjectRelease(a5);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  BKAudiobookNowPlayingMiniTouchViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10033F8F4();

  swift_unknownObjectRelease(a5);
}

- (void)addSpringLoadedInteractionWith:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  BKAudiobookNowPlayingMiniTouchViewController *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;

  v5 = swift_allocObject(&unk_1008FE770, 24, 7);
  *(_QWORD *)(v5 + 16) = a3;
  v6 = objc_allocWithZone((Class)UISpringLoadedInteraction);
  v11[4] = sub_10033F23C;
  v12 = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10033F1A8;
  v11[3] = &unk_1008FE788;
  v7 = _Block_copy(v11);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v6, "initWithActivationHandler:", v7);
  _Block_release(v7);
  swift_release(v12);
  sub_10033CD44(v10);

}

- (void)willUndock
{
  BKAudiobookNowPlayingMiniTouchViewController *v2;

  v2 = self;
  sub_10033F048((uint64_t)v2);

}

@end
