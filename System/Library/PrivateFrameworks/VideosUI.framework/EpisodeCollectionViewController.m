@implementation EpisodeCollectionViewController

- (void)vui_loadView
{
  _TtC8VideosUI31EpisodeCollectionViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B134BC();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI31EpisodeCollectionViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B1375C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI31EpisodeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI31EpisodeCollectionViewController *result;

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
  sub_1D9B14778(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI31EpisodeCollectionViewController)initWithCoder:(id)a3
{
  _TtC8VideosUI31EpisodeCollectionViewController *result;

  sub_1D9B148F0((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_viewImpressioner, &qword_1EDA8B248);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_dataSource));
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_currentSnapshot, &qword_1F0207A08);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_cachedPrototypeCell));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI31EpisodeCollectionViewController_contextMenuInteractor));
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC8VideosUI31EpisodeCollectionViewController *v8;
  uint64_t v9;
  void (*v10)(uint64_t);

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_26();
  sub_1DA13F6BC();
  v7 = a3;
  v8 = self;
  OUTLINED_FUNCTION_35_1();
  sub_1D9B1594C();

  v9 = OUTLINED_FUNCTION_101_1();
  v10(v9);
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_12();
  sub_1DA143E80();
  sub_1DA13F6BC();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_0(v6, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  id v11;
  id v12;
  _TtC8VideosUI31EpisodeCollectionViewController *v13;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_105_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_20_29();
  v11 = a3;
  v12 = OUTLINED_FUNCTION_132_4();
  v13 = self;
  sub_1D9B15CD8();

  OUTLINED_FUNCTION_159(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  id v11;
  id v12;
  _TtC8VideosUI31EpisodeCollectionViewController *v13;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_105_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_20_29();
  v11 = a3;
  v12 = OUTLINED_FUNCTION_132_4();
  v13 = self;
  sub_1D9B15FB4();

  OUTLINED_FUNCTION_159(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_90();
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9B1617C(v3);

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_115_2();
  sub_1D9B162D4();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double *v5;
  void *v6;
  id v7;
  id v8;

  v7 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v8 = v6;
  sub_1D9B16310((uint64_t)v7, v5);

  OUTLINED_FUNCTION_4_3(v8);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  double y;
  double x;
  id v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_4_11();
  v8 = (void *)sub_1D9B17C14((uint64_t)v4, x, y);

  return v8;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9B17E90();
  v8 = v7;

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v9 = v5;
  OUTLINED_FUNCTION_98_0();
  v10 = v6;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B17F24();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v11);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v9 = OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v10 = v6;
  OUTLINED_FUNCTION_98_0();
  v11 = v7;
  sub_1D9B17F94((uint64_t)v11, v8, v5);

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v11);
}

@end
