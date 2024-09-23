@implementation PostPlayTemplateController

- (BOOL)prefersStatusBarHidden
{
  _TtC8VideosUI26PostPlayTemplateController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1D9B85854();

  return v3 & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  _TtC8VideosUI26PostPlayTemplateController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1D9B858AC();

  return v3 & 1;
}

- (_TtC8VideosUI26PostPlayTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B86224();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI26PostPlayTemplateController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8632C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI26PostPlayTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9B864E0();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI26PostPlayTemplateController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9B865BC();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI26PostPlayTemplateController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B8663C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI26PostPlayTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B887C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_collectionImpressioner, &qword_1EDA8E6B0);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_playlistViewController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_attentionMonitor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_featuredContentLogo);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI26PostPlayTemplateController_playbackUpNextDelegate);
  OUTLINED_FUNCTION_19_5();
}

- (void)setPlaybackUpNextDelegate:(id)a3
{
  _TtC8VideosUI26PostPlayTemplateController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D9B889FC();
  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)startAutoPlayAnimation
{
  _TtC8VideosUI26PostPlayTemplateController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B88A80();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)setPlaybackUpNextContextData:(id)a3
{
  sub_1DA143C7C();
  swift_bridgeObjectRelease();
}

- (double)playbackUpNextViewHeight
{
  return 0.0;
}

@end
