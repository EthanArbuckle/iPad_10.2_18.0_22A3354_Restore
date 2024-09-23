@implementation MultiGroupHorizontalCollectionController

- (void)vui_loadView
{
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9FEF57C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9FEF5D8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1D9FEFB6C();
  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_5_8(v5);
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)init
{
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *result;

  sub_1D9FF0214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9FF0350();
}

- (_TtC8VideosUI40MultiGroupHorizontalCollectionController)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9FF0448();
}

- (void).cxx_destruct
{
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_viewImpressioner, &qword_1EDA8B248);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_contextMenuInteractor);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController____lazy_storage___shelfViewLayout);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController____lazy_storage___groupCollectionContainerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_dataSource);
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI40MultiGroupHorizontalCollectionController_lastFocusedIndexPath, (uint64_t *)&unk_1EDA877F0);
  swift_bridgeObjectRelease();
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v8;
  id v9;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v10;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_216();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_1_7();
  v9 = a3;
  v10 = self;
  sub_1D9FF1DCC((uint64_t)v10, v4);

  OUTLINED_FUNCTION_160_0(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v11;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_20_29();
  v9 = a3;
  v10 = OUTLINED_FUNCTION_132_4();
  v11 = self;
  sub_1D9FF2074((uint64_t)v11, v10);

  OUTLINED_FUNCTION_94_40();
  OUTLINED_FUNCTION_90();
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v11;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_20_29();
  v9 = a3;
  v10 = OUTLINED_FUNCTION_132_4();
  v11 = self;
  sub_1D9FF229C();

  OUTLINED_FUNCTION_94_40();
  OUTLINED_FUNCTION_90();
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v7 = OUTLINED_FUNCTION_29_8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_12();
  sub_1DA143E80();
  sub_1DA13F6BC();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_5_0(v6, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiScrollViewDidEndDecelerating:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v4 = a3;
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_115_2();
  sub_1D9FF2460();

  OUTLINED_FUNCTION_12_4(v5);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_4_11();
  sub_1D9FF24B0(v3);

  OUTLINED_FUNCTION_12_4(v5);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v16;
  uint64_t v17;
  double v18;
  double v19;
  CGSize result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_13_0();
  if (a5)
  {
    OUTLINED_FUNCTION_121_28();
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 0;
  }
  else
  {
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 1;
  }
  OUTLINED_FUNCTION_15_3(v5, v13, v11, v12);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_1D9FF25B0((uint64_t)v16, v17, v5);
  OUTLINED_FUNCTION_134_24();

  sub_1D970F43C(v5, (uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_21_7();
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  CGSize result;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_70_8();
  v8 = v6;
  sub_1D9FF2CE4((uint64_t)v8, v9, v5);
  OUTLINED_FUNCTION_134_24();

  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_21_7();
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v8 = OUTLINED_FUNCTION_70_8();
  v9 = v6;
  sub_1D9FF2FDC((uint64_t)v9, v10, v5);
  OUTLINED_FUNCTION_42();

  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_56_78();
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 selectionMarginsForItemAtIndexPath:(id)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_13_0();
  if (a5)
  {
    OUTLINED_FUNCTION_121_28();
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 0;
  }
  else
  {
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 1;
  }
  OUTLINED_FUNCTION_15_3(v5, v13, v11, v12);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_1D9FF309C(a3, v17, v5);
  OUTLINED_FUNCTION_42();

  sub_1D970F43C(v5, (uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_56_78();
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  void *v4;
  id v6;
  void *v7;
  void *v8;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9FF4C78(v4, a4);
  v8 = v7;

  return v8;
}

- (id)vuiCollectionView:(id)a3 contextMenuConfigurationForItemAt:(id)a4 point:(CGPoint)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  _TtC8VideosUI40MultiGroupHorizontalCollectionController *v11;
  void *v12;
  void *v13;
  void *v14;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_216();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_7();
  v10 = a3;
  v11 = self;
  v12 = (void *)OUTLINED_FUNCTION_35_1();
  sub_1D9FF4CFC(v12, v5);
  v14 = v13;

  OUTLINED_FUNCTION_160_0(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return v14;
}

- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5
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
  OUTLINED_FUNCTION_115_2();
  sub_1D9FF4E50();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v9);
}

- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_98_0();
  v9 = v6;
  sub_1D9FF4EBC((uint64_t)v9, v8, v5);

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v9);
}

@end
