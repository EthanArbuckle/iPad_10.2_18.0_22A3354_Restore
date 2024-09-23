@implementation MusicNowPlayingLyricsViewController

- (MPCPlayerResponse)nowPlaying
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying));
}

- (void)setNowPlaying:(id)a3
{
  void *v4;
  id v5;
  MusicNowPlayingLyricsViewController *v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying) = (Class)a3;
  v5 = a3;
  v6 = self;

  sub_5273A0();
}

- (double)cardHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_cardHeight);
}

- (void)setCardHeight:(double)a3
{
  _QWORD *v3;
  void (*v5)(double);
  MusicNowPlayingLyricsViewController *v6;
  _QWORD *v7;

  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_cardHeight) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingLyricsViewController_syncedLyricsViewController);
  if (v3)
  {
    v5 = *(void (**)(double))&stru_158.segname[swift_isaMask & *v3];
    v6 = self;
    v7 = v3;
    v5(a3);

  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  void *v3;
  MusicNowPlayingLyricsViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(ICEnvironmentMonitor);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedMonitor");
  objc_msgSend(v5, "unregisterObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController(0);
  -[MusicNowPlayingLyricsViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  sub_64880((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_delegate);
  sub_56024((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsCompositingFilter, (uint64_t *)&unk_14AD640);
  sub_49EFF0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_state), self->nowPlaying[OBJC_IVAR___MusicNowPlayingLyricsViewController_state]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_syncedLyricsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_staticLyricsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_gradientMaskLayer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationSliderConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationSliderSplitViewConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_tapToRadarButtonConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_tapToRadarButtonSplitViewConstraints));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_modelPlayEvent));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingLyricsViewController_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingLyricsViewController_foregroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingLyricsViewController_presentationObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingLyricsViewController_dismissalObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_sharingTransitionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationToggleSlider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalCommandsFilter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_tapToRadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_reportingController));
  sub_56024((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsVisibilityStart, (uint64_t *)&unk_14AD5F0);
}

- (void)viewDidLoad
{
  MusicNowPlayingLyricsViewController *v2;

  v2 = self;
  sub_52850C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  objc_class *v8;
  MusicNowPlayingLyricsViewController *v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];
  objc_super v15;

  v3 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5F0);
  __chkstk_darwin(v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = (objc_class *)type metadata accessor for NowPlayingLyricsViewController(0);
  v15.receiver = self;
  v15.super_class = v8;
  v9 = self;
  -[MusicNowPlayingLyricsViewController viewDidAppear:](&v15, "viewDidAppear:", v3);
  Date.init()(v10);
  v11 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 1, v11);
  v12 = (uint64_t)v9 + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsVisibilityStart;
  swift_beginAccess((char *)v9 + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsVisibilityStart, v14, 33, 0);
  sub_5C1F4((uint64_t)v7, v12, (uint64_t *)&unk_14AD5F0);
  swift_endAccess(v14);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController(0);
  v4 = (char *)v7.receiver;
  -[MusicNowPlayingLyricsViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  sub_530E08();
  v5 = *(void **)&v4[OBJC_IVAR___MusicNowPlayingLyricsViewController_song];
  v6 = v5;
  sub_530FB8(v5);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController(0);
  v2 = v3.receiver;
  -[MusicNowPlayingLyricsViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_52A8C4();

}

- (MusicVocalsAttenuationSlider)accessibilityVocalAttenuationToggleSlider
{
  return (MusicVocalsAttenuationSlider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationToggleSlider));
}

- (id)contentScrollView
{
  MusicNowPlayingLyricsViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_531544();

  return v3;
}

- (MusicNowPlayingLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  MusicNowPlayingLyricsViewController *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  v9 = (MusicNowPlayingLyricsViewController *)sub_53220C(v5, v7, (uint64_t)a4);

  return v9;
}

- (MusicNowPlayingLyricsViewController)initWithCoder:(id)a3
{
  id v3;
  MusicNowPlayingLyricsViewController *v4;

  v3 = a3;
  v4 = (MusicNowPlayingLyricsViewController *)sub_532504((uint64_t)v3);

  return v4;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4;
  MusicNowPlayingLyricsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_5317A0(v4);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  MusicNowPlayingLyricsViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_5327B8();

  return v12;
}

@end
