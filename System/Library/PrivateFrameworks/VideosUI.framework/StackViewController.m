@implementation StackViewController

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  id v11;
  _TtC8VideosUI19StackViewController *v12;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_13();
  sub_1DA13F6BC();
  v11 = a4;
  v12 = self;
  LOBYTE(a3) = sub_1D97EB468(a3, v11);

  OUTLINED_FUNCTION_159(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return a3 & 1;
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D97EDC90(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI19StackViewController *v4;

  v4 = self;
  sub_1D97EDE7C(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLoad
{
  self;
  sub_1D97EE054();
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI19StackViewController *v2;

  v2 = self;
  sub_1D97EE294();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vuiCollectionView:(id)a3 willDisplay:(id)a4 for:(id)a5
{
  sub_1D97EF224(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1D97EF2D0);
}

- (void)vuiCollectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 at:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_316();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_12();
  sub_1DA143E80();
  sub_1DA13F6BC();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  _TtC8VideosUI19StackViewController *v11;
  uint64_t v12;
  void *v13;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_105_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10_67();
  sub_1DA13F6BC();
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  sub_1D9C02CC0((uint64_t)v11, v12, v5);

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_159(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  sub_1D972BC38(0, &qword_1F020E528);
  v13 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2_89(v13);
}

- (BOOL)collectionView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  char v7;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_29_36();
  v6 = v4;
  v7 = sub_1D9C031EC();

  OUTLINED_FUNCTION_107_0();
  return v7 & 1;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_1D9C03704(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D9C03384);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return sub_1D9C03704(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D9C042F0);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_29_36();
  v7 = v5;
  sub_1D9C0378C(v6, v4);

  OUTLINED_FUNCTION_107_0();
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC8VideosUI19StackViewController *v15;
  id v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877F0);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_61();
  v11 = v10 - v9;
  if (a5)
  {
    sub_1DA13F6BC();
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 0;
  }
  else
  {
    v12 = OUTLINED_FUNCTION_29_8();
    v13 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v13, 1, v12);
  v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  v16 = sub_1D9C04098();

  OUTLINED_FUNCTION_107_0();
  sub_1D970F474(v11, (uint64_t *)&unk_1EDA877F0);
  return v16;
}

- (_TtC8VideosUI19StackViewController)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1DA0CA8D0();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8VideosUI19StackViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1DA0CB328(a4, width, height);
  OUTLINED_FUNCTION_107_0();

}

- (_TtC8VideosUI19StackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1DA0CC700();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1D970F4B0((uint64_t)self + OBJC_IVAR____TtC8VideosUI19StackViewController_collectionImpressioner, &qword_1EDA8E6B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19StackViewController____lazy_storage___collectionView));
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19StackViewController____lazy_storage___dataSource));
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI19StackViewController_cellConfigurator));
  OUTLINED_FUNCTION_33_14((uint64_t *)((char *)self + OBJC_IVAR____TtC8VideosUI19StackViewController_cellActionInterceptor));
  OUTLINED_FUNCTION_72_2();
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI19StackViewController__showcasePercentage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA87868);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D97C7954(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI19StackViewController_verticalPaginationMonitor));
  OUTLINED_FUNCTION_83_54(*(id *)((char *)&self->super.super.super.super.isa
                                + OBJC_IVAR____TtC8VideosUI19StackViewController_contextMenuInteractor));
}

- (void)vuiCollectionView:(id)a3 didEndDisplaying:(id)a4 for:(id)a5
{
  sub_1D97EF224(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))sub_1DA0CCAE8);
}

- (void)vuiCollectionView:(id)a3 didSelectItemAt:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  id v9;
  _TtC8VideosUI19StackViewController *v10;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_216();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_1_7();
  v9 = a3;
  v10 = self;
  OUTLINED_FUNCTION_34_37();
  sub_1DA0CCB50();

  OUTLINED_FUNCTION_197(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiCollectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  void *v5;
  os_log_type_t v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  swift_unknownObjectRetain();
  v9 = v5;
  sub_1DA0CCD28((uint64_t)v8, v7, a5);

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4_3(v9);
}

- (id)vuiCollectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = v4;
  sub_1DA0CD59C(v5, v6);
  v9 = v8;

  return v9;
}

- (id)vuiCollectionView:(id)a3 contextMenuConfigurationForItemAt:(id)a4 point:(CGPoint)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  id v10;
  _TtC8VideosUI19StackViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_216();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_7();
  v10 = a3;
  v11 = self;
  v12 = (void *)OUTLINED_FUNCTION_34_37();
  sub_1DA0CD624(v12, v13);
  v15 = v14;

  OUTLINED_FUNCTION_197(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return v15;
}

- (void)vuiCollectionView:(id)a3 willPerformPreviewActionForMenuWith:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_113_33();
  v8 = v5;
  sub_1DA0CD788();

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v8);
}

- (void)vuiCollectionView:(id)a3 willEndContextMenuInteraction:(id)a4 animator:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  OUTLINED_FUNCTION_19_23((uint64_t)self, (uint64_t)a2, a3);
  v8 = OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_113_33();
  v9 = v6;
  sub_1DA0CD7FC((uint64_t)v9, v8, v5);

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_3_5(v9);
}

- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1DA0CD930(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (BOOL)vuiScrollViewShouldScrollToTop:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v5 = (void *)OUTLINED_FUNCTION_183_0();
  v6 = sub_1DA0CDA04(v5);

  return v6;
}

- (void)vui_cellNeedsReloading:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_13();
  sub_1DA0CDAB8();

  OUTLINED_FUNCTION_4_3(v4);
}

- (BOOL)vui_handleActionInCell:(id)a3 fromSubview:(id)a4 details:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  _TtC8VideosUI19StackViewController *v10;
  BOOL result;

  sub_1DA143C7C();
  v8 = OUTLINED_FUNCTION_70_8();
  v9 = a4;
  v10 = self;
  sub_1DA0CDDE4((uint64_t)v8, (uint64_t)a4, v5);

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_28_0();
  return result;
}

@end
