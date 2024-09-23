@implementation AlertTemplateController

- (NSArray)preferredFocusEnvironments
{
  _TtC8VideosUI23AlertTemplateController *v2;
  void *v3;

  v2 = self;
  sub_1D9E931AC();
  OUTLINED_FUNCTION_214();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F022FE00);
  v3 = (void *)sub_1DA1440F0();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)vui_loadView
{
  _TtC8VideosUI23AlertTemplateController *v2;

  v2 = self;
  sub_1D9E937E4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI23AlertTemplateController *v4;

  v4 = self;
  sub_1D9E938E8(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI23AlertTemplateController *v2;

  v2 = self;
  sub_1D9E939F0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI23AlertTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI23AlertTemplateController *result;

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
  sub_1D9E94774(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI23AlertTemplateController)initWithCoder:(id)a3
{
  _TtC8VideosUI23AlertTemplateController *result;

  sub_1D9E948B0((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI23AlertTemplateController_contextMenuDelegate);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  swift_release();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI23AlertTemplateController_lastFocusedIndexPath, (uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_2_1();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t result;

  sub_1D9E94B98();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI23AlertTemplateController *v10;
  void *v11;

  v7 = OUTLINED_FUNCTION_29_8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_26();
  sub_1DA13F6BC();
  v9 = a3;
  v10 = self;
  v11 = (void *)sub_1D9E94BC8(v9);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v4, v7);
  return v11;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = OUTLINED_FUNCTION_29_8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_14_6();
  sub_1DA13F6BC();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return 0;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8VideosUI23AlertTemplateController *v10;
  uint64_t v11;
  void *v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA877F0);
  OUTLINED_FUNCTION_0_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_61();
  v8 = v7 - v6;
  v9 = a3;
  v10 = self;
  sub_1D9E950BC(v9, v8);

  v11 = OUTLINED_FUNCTION_29_8();
  v12 = 0;
  if (__swift_getEnumTagSinglePayload(v8, 1, v11) != 1)
  {
    v12 = (void *)sub_1DA13F6A4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v8, v11);
  }
  return v12;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8VideosUI23AlertTemplateController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D9E952C0((uint64_t)v11, v9);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_1D9E95560(self, (uint64_t)a2, a3, (uint64_t)a4, 2);
}

- (void)collectionView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  sub_1D9E95560(self, (uint64_t)a2, a3, (uint64_t)a4, 1);
}

@end
