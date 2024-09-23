@implementation BaseCollectionView

- (_TtC8VideosUI18BaseCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  _TtC8VideosUI18BaseCollectionView *result;

  OUTLINED_FUNCTION_2_0();
  v5 = v4;
  OUTLINED_FUNCTION_11();
  sub_1D97F7FE0(v6);
  OUTLINED_FUNCTION_6_20();
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_15_187((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidScroll_);

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1D97F8238();
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC8VideosUI18BaseCollectionView *v15;
  uint64_t v16;

  v9 = OUTLINED_FUNCTION_29_8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA143E80();
  sub_1DA13F6BC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1D97F8424();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC8VideosUI18BaseCollectionView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI18BaseCollectionView *)sub_1D9A38FA0((uint64_t)a3);
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiDelegate);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiScrollDelegate);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiContextMenuDelegate);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1D97F8238();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8VideosUI18BaseCollectionView *v12;

  v6 = OUTLINED_FUNCTION_29_8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_61();
  v10 = v9 - v8;
  sub_1DA13F6BC();
  v11 = a3;
  v12 = self;
  sub_1DA079CC4((uint64_t)v11);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  OUTLINED_FUNCTION_28_0();
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_15_187((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidEndScrollingAnimation_);

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_15_187((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidEndDecelerating_);

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  _TtC8VideosUI18BaseCollectionView *v7;

  v6 = a3;
  v7 = self;
  sub_1DA079E4C((uint64_t)v6, a4);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  OUTLINED_FUNCTION_8_14();
  v6 = v5;
  v8 = v7;
  v9 = v6;
  OUTLINED_FUNCTION_21_4();
  sub_1DA079EF8();

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  void *v3;
  id v4;
  BOOL result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1DA079FE0();

  OUTLINED_FUNCTION_9();
  return result;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  return sub_1DA07A11C();
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return sub_1DA07A11C();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  OUTLINED_FUNCTION_8_14();
  v7 = v6;
  OUTLINED_FUNCTION_29_8();
  sub_1DA1440FC();
  v8 = v7;
  v9 = OUTLINED_FUNCTION_275();
  OUTLINED_FUNCTION_21_4();
  v10 = sub_1DA07A1A4();

  swift_bridgeObjectRelease();
  return v10;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_98_0();
  v8 = v5;
  OUTLINED_FUNCTION_17_159();
  sub_1DA07A4D8();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v9);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_98_0();
  v8 = v5;
  OUTLINED_FUNCTION_17_159();
  sub_1DA07A570();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v9);
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  void *v5;
  id v6;
  id v7;

  v6 = OUTLINED_FUNCTION_70_8();
  swift_unknownObjectRetain();
  v7 = v5;
  sub_1DA07A608();

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_3_5(v7);
}

@end
