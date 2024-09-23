@implementation TimedMetadataViewController

- (_TtC8VideosUI27TimedMetadataViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C8F4A8();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI27TimedMetadataViewController *v2;

  v2 = self;
  sub_1D9C8F5E0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewDidLoad
{
  _TtC8VideosUI27TimedMetadataViewController *v2;

  v2 = self;
  sub_1D9C8FBE0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8VideosUI27TimedMetadataViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9C9009C(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI27TimedMetadataViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9C902E0(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)dealloc
{
  _TtC8VideosUI27TimedMetadataViewController *v2;

  v2 = self;
  sub_1D9C91568();
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_templateController));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_currentTimedEntityMapping, &qword_1F0212A40);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  v3 = sub_1DA13FFD4();
  OUTLINED_FUNCTION_236_2(*(_QWORD *)(v3 - 8));
  sub_1D9A67D78(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController____lazy_storage___emptyStateViewModel));
  OUTLINED_FUNCTION_15_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_emptyStateView));
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI27TimedMetadataViewController_nowPlayingTabDelegate);
}

- (BOOL)_canShowWhileLocked
{
  return sub_1D9C91760() & 1;
}

- (_TtC8VideosUI27TimedMetadataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9C91794();
}

- (void)setPlayerViewSize:(CGSize)a3
{
  double height;
  double width;
  _TtC8VideosUI27TimedMetadataViewController *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1D9C926E0(width, height);
  OUTLINED_FUNCTION_12_4(v5);
}

- (void)setNowPlayingTabDelegate:(id)a3
{
  _TtC8VideosUI27TimedMetadataViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D9C9286C();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_8(v4);
}

- (id)getNowPlayingTabContextData
{
  return 0;
}

- (void)setNowPlayingTabContextData:(id)a3
{
  sub_1DA143C7C();
  swift_bridgeObjectRelease();
}

- (double)nowPlayingTabHeight
{
  _TtC8VideosUI27TimedMetadataViewController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1D9C92988();
  v4 = v3;

  return v4;
}

- (void)updatePlaybackRate:(double)a3 elapsedTime:(id)a4 elapsedTimeTimestamp:(id)a5
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8VideosUI27TimedMetadataViewController *v14;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877D0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14_6();
  if (a5)
  {
    sub_1DA13F4F4();
    v11 = OUTLINED_FUNCTION_11_8();
    v12 = 0;
  }
  else
  {
    v11 = OUTLINED_FUNCTION_11_8();
    v12 = 1;
  }
  OUTLINED_FUNCTION_15_3(v5, v12, v10, v11);
  v13 = a4;
  v14 = self;
  OUTLINED_FUNCTION_239();
  sub_1D9C92A58();

  sub_1D970F43C(v5, (uint64_t *)&unk_1EDA877D0);
}

- (void)updatePlaybackInfo:(id)a3
{
  id v4;
  _TtC8VideosUI27TimedMetadataViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9C92EA0();

  OUTLINED_FUNCTION_12_4(v5);
}

@end
