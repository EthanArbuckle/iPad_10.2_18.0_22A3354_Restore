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
  uint64_t v5;
  _BYTE *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LyricsSharingActivityViewController(0);
  v4 = (char *)v9.receiver;
  swift_unknownObjectRetain(a3, v5);
  -[LyricsSharingActivityViewController setTransitioningDelegate:](&v9, "setTransitioningDelegate:", a3);
  v6 = *(id *)&v4[OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_selectionViewController];
  v7 = objc_msgSend(v4, "transitioningDelegate", v9.receiver, v9.super_class);
  v8 = v7;
  if (v7)
    swift_unknownObjectRelease(v7);
  v6[OBJC_IVAR____TtC5Music29LyricsSelectionViewController_needsCustomTransition] = v8 != 0;

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
  _TtC5Music35LyricsSharingActivityViewController *v4;

  v4 = self;
  sub_1001568FC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Music35LyricsSharingActivityViewController *v4;

  v4 = self;
  sub_1001577A8(a3);

}

- (void)_prepareActivity:(id)a3
{
  _TtC5Music35LyricsSharingActivityViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100157888(v5);

}

- (_TtC5Music35LyricsSharingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  _TtC5Music35LyricsSharingActivityViewController *result;

  result = (_TtC5Music35LyricsSharingActivityViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LyricsSharingActivityViewController", 41, "init(activityItems:applicationActivities:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_mpModelSong));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_musicKitSong, &qword_10119E480);
  swift_bridgeObjectRelease(*(_QWORD *)&self->mpModelSong[OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_lyricsID]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_headerMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_selectionViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_selectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_lyricsLoader));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_windowBackgroundView));
  sub_100064B4C((uint64_t)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_presentationSource);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_lyricsVisibilityStart, (uint64_t *)&unk_1011A30A0);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_foregroundObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_presentationObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music35LyricsSharingActivityViewController_dismissalObserver));
}

@end
