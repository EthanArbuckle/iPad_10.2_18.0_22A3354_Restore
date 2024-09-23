@implementation CatchUpToLiveViewController

- (_TtC8VideosUI27CatchUpToLiveViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI27CatchUpToLiveViewController *result;

  sub_1DA070BAC(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)dealloc
{
  _TtC8VideosUI27CatchUpToLiveViewController *v2;

  v2 = self;
  sub_1DA070D94();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_timeObserverToken, &qword_1F0236ED8);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_metadataView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_fetchController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_mediaController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController____lazy_storage___exitButton);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_playableDataSource);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_nextAXView);
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI27CatchUpToLiveViewController_previousAXView));
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  void *v3;
  id v5;
  id v6;

  v5 = a3;
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1DA070EE4((uint64_t)a3);

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI27CatchUpToLiveViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1DA071B6C(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI27CatchUpToLiveViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1DA071C88(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27CatchUpToLiveViewController *v2;

  v2 = self;
  sub_1DA074680();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)axViewTappedWithGesture:(id)a3
{
  id v4;
  _TtC8VideosUI27CatchUpToLiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DA074FE4(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (_TtC8VideosUI27CatchUpToLiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA0770C4();
}

@end
