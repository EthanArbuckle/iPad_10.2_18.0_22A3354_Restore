@implementation PlaylistViewController

- (BOOL)prefersStatusBarHidden
{
  BOOL result;

  sub_1D9AB3CE0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  BOOL result;

  sub_1D9AB3D18();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI22PlaylistViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9AB57D4();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI22PlaylistViewController *v2;

  v2 = self;
  sub_1D9AB64CC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9AB6590(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9AB6604();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9AB66F8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI22PlaylistViewController *v2;

  v2 = self;
  sub_1D9AB677C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI22PlaylistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9AB8784();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_collectionImpressioner, &qword_1EDA8E6B0);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_headerView);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_backgroundMediaInfo);
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_hostMetadataView));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_playbackDidBegin));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_initialMediaLoaded));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_indexDidChange));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI22PlaylistViewController_onClosePressed));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22PlaylistViewController____lazy_storage___backgroundMediaController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22PlaylistViewController_interactionManager);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAAF5E8);
  v3 = OUTLINED_FUNCTION_160_2();
  OUTLINED_FUNCTION_102_1(v3, v4, v5);
}

@end
