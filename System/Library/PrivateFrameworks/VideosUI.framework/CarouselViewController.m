@implementation CarouselViewController

- (void)loadView
{
  _TtC8VideosUI22CarouselViewController *v2;

  v2 = self;
  sub_1D9A94B70();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9A94DB4(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  void *v3;
  id v5;

  OUTLINED_FUNCTION_91_0();
  v5 = OUTLINED_FUNCTION_63_1();
  sub_1D9A94E44((uint64_t)a3);

  OUTLINED_FUNCTION_12_4(v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9A94F0C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9A954C4(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI22CarouselViewController *v2;

  v2 = self;
  sub_1D9A9565C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8VideosUI22CarouselViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1D9A95790(a4, width, height);
  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_12_4(v8);
}

- (void)dealloc
{
  _TtC8VideosUI22CarouselViewController *v2;

  v2 = self;
  sub_1D9A95A14();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22CarouselViewController_viewImpressioner, &qword_1EDA8B248);
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22CarouselViewController_headerViewModel, &qword_1EDA92388);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CarouselViewController_contextMenuInteractor));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CarouselViewController____lazy_storage___carouselViewContainer));
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_10_3();
}

- (_TtC8VideosUI22CarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI22CarouselViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  sub_1D9A961F4(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI22CarouselViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI22CarouselViewController *result;

  sub_1D9A9637C((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  unint64_t result;

  sub_1D9A97338();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_63_1();
  v7 = (void *)sub_1D9A9738C((uint64_t)v6, v4);

  return OUTLINED_FUNCTION_15_14(v7);
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_70_8();
  v8 = v5;
  OUTLINED_FUNCTION_41_20();
  sub_1D9A97848(v9, v10, v11);

  OUTLINED_FUNCTION_3_5(v12);
}

- (void)carouselView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndex:(unint64_t)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_70_8();
  v8 = v5;
  OUTLINED_FUNCTION_41_20();
  sub_1D9A97A9C(v9, v10, v11);

  OUTLINED_FUNCTION_3_5(v12);
}

- (void)carouselView:(id)a3 didCenterItemAtIndex:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1D9A97CD8((uint64_t)v6, v4);

  OUTLINED_FUNCTION_12_4(v6);
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(unint64_t)a4
{
  unint64_t v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1D9A97DA8((uint64_t)v6, v4);

  OUTLINED_FUNCTION_12_4(v6);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC8VideosUI22CarouselViewController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1D9A981B8((uint64_t)v5);

  return OUTLINED_FUNCTION_15_14(v7);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = v4;
  v8 = v5;
  sub_1D9A984D4((uint64_t)v8, v7);
  v10 = v9;

  return OUTLINED_FUNCTION_15_14(v10);
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_98_0();
  v8 = v5;
  sub_1D9A9856C();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v8);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_98_0();
  v8 = v5;
  OUTLINED_FUNCTION_41_20();
  sub_1D9A985DC(v9, v10, v11);

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v12);
}

- (void)handleFullscreenPlaybackUIDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI22CarouselViewController *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9A98C60();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
