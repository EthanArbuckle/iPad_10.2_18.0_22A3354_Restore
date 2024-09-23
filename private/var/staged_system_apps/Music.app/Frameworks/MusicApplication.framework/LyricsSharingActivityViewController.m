@implementation LyricsSharingActivityViewController

- (UIViewControllerTransitioningDelegate)transitioningDelegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController(0);
  return -[LyricsSharingActivityViewController transitioningDelegate](&v3, "transitioningDelegate");
}

- (void)setTransitioningDelegate:(id)a3
{
  char *v4;
  _BYTE *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController(0);
  v4 = (char *)v8.receiver;
  swift_unknownObjectRetain(a3);
  -[LyricsSharingActivityViewController setTransitioningDelegate:](&v8, "setTransitioningDelegate:", a3);
  v5 = *(id *)&v4[OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_selectionViewController];
  v6 = objc_msgSend(v4, "transitioningDelegate", v8.receiver, v8.super_class);
  v7 = v6;
  if (v6)
    swift_unknownObjectRelease(v6);
  v5[OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_needsCustomTransition] = v7 != 0;

  swift_unknownObjectRelease(a3);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController(0);
  v2 = v3.receiver;
  -[LyricsSharingActivityViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setCustomViewControllerVerticalInset:", 0.0, v3.receiver, v3.super_class);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC16MusicApplication35LyricsSharingActivityViewController *v4;

  v4 = self;
  sub_243664(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication35LyricsSharingActivityViewController *v4;

  v4 = self;
  sub_24454C(a3);

}

- (void)_prepareActivity:(id)a3
{
  _TtC16MusicApplication35LyricsSharingActivityViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_24462C(v5);

}

- (_TtC16MusicApplication35LyricsSharingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v4;
  _TtC16MusicApplication35LyricsSharingActivityViewController *result;

  v4 = a3;
  result = (_TtC16MusicApplication35LyricsSharingActivityViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LyricsSharingActivityViewController", 52, "init(activityItems:applicationActivities:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_mpModelSong));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_musicKitSong, &qword_14AED40);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mpModelSong[OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_lyricsID]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_headerMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_selectionViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_selectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_lyricsLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_windowBackgroundView));
  sub_56060((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_presentationSource);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_lyricsVisibilityStart, (uint64_t *)&unk_14AD5F0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_foregroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_presentationObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication35LyricsSharingActivityViewController_dismissalObserver));
}

@end
