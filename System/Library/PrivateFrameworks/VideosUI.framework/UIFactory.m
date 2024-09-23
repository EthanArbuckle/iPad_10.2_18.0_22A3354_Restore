@implementation UIFactory

- (_TtC8VideosUI9UIFactory)init
{
  _TtC8VideosUI9UIFactory *result;

  sub_1D97B5E84();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  id v8;
  id v9;
  _TtC8VideosUI9UIFactory *v10;

  if (a5)
    sub_1DA143C7C();
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1D97B8FBC();
  OUTLINED_FUNCTION_32_83();

  OUTLINED_FUNCTION_46();
  return OUTLINED_FUNCTION_11_91(a4);
}

- (void)recordImpressionsForViewController:(id)a3
{
  void *v3;
  id v5;
  id v6;

  v5 = a3;
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1D9DEFD20(a3);

  OUTLINED_FUNCTION_4_3(v6);
}

- (id)playbackContainerViewController
{
  void *v2;
  _TtC8VideosUI9UIFactory *v3;

  v3 = self;
  sub_1D9DEFDDC();
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_111(v2);
}

- (id)clipsViewControllerWithIndex:(unint64_t)a3 collectionData:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  sub_1DA143C7C();
  v6 = OUTLINED_FUNCTION_63_1();
  sub_1D9DEFE28(a3, v4);
  v8 = v7;

  OUTLINED_FUNCTION_46();
  return OUTLINED_FUNCTION_15_14(v8);
}

- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 playable:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7
{
  return sub_1D9DF0190(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D9DEFF0C);
}

- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 mediaInfo:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7
{
  return sub_1D9DF0190(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_1D9DF00F4);
}

- (BOOL)isDocumentViewController:(id)a3 equalToViewController:(id)a4
{
  void *v4;
  id v7;
  id v8;
  id v9;

  v7 = OUTLINED_FUNCTION_63_1();
  v8 = a4;
  v9 = v4;
  LOBYTE(a4) = sub_1D9DF027C((uint64_t)a3);

  return a4 & 1;
}

- (id)createMultiPlayerViewControllerWithPlayerViewControllers:(id)a3 showingDetails:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  _TtC8VideosUI9UIFactory *v7;

  v4 = a4;
  sub_1D972BC38(0, &qword_1F0207478);
  v6 = OUTLINED_FUNCTION_302_0();
  v7 = self;
  sub_1D9DF03B0(v6, v4);
}

- (id)timedMetadataDebuggerViewController
{
  void *v2;
  _TtC8VideosUI9UIFactory *v3;

  v3 = self;
  sub_1D9DF04D8();
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_111(v2);
}

- (id)performanceDebuggerViewController
{
  void *v2;
  _TtC8VideosUI9UIFactory *v3;

  v3 = self;
  sub_1D9DF0524();
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_111(v2);
}

- (void)scrollViewControllerToTop:(id)a3 animated:(BOOL)a4 needsFocusUpdate:(BOOL)a5
{
  id v9;
  _TtC8VideosUI9UIFactory *v10;

  v9 = a3;
  v10 = self;
  sub_1D9DF0570(a3, a4, a5);

  OUTLINED_FUNCTION_3_5(v10);
}

- (id)rootSplitViewController
{
  void *v2;
  _TtC8VideosUI9UIFactory *v3;

  v3 = self;
  sub_1D9DF0658();
  OUTLINED_FUNCTION_7_8();
  return OUTLINED_FUNCTION_111(v2);
}

- (id)URLForResource:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  _TtC8VideosUI9UIFactory *v6;
  uint64_t v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_12_0();
  sub_1DA143E80();
  v6 = self;
  sub_1D9DF06C0(v3);

  swift_bridgeObjectRelease();
  v7 = OUTLINED_FUNCTION_13_7();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) != 1)
  {
    v8 = (void *)sub_1DA13F3A4();
    OUTLINED_FUNCTION_18(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8));
  }
  return OUTLINED_FUNCTION_15_14(v8);
}

- (id)imageForResource:(id)a3
{
  void *v4;
  _TtC8VideosUI9UIFactory *v5;

  v4 = (void *)sub_1DA143E80();
  v5 = self;
  sub_1D9DF0838();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_46();
  return OUTLINED_FUNCTION_15_14(v4);
}

- (id)_viewForIKElement:(id)a3 existingView:(id)a4
{
  return sub_1D9DF0A90(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_viewForElement_existingView_);
}

- (id)_imageProxyForIKElement:(id)a3 withLayout:(id)a4
{
  id v6;
  id v7;
  _TtC8VideosUI9UIFactory *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D9DF0960();
  v10 = v9;

  return OUTLINED_FUNCTION_15_14(v10);
}

- (id)_viewControllerForIKElement:(id)a3 existingViewController:(id)a4
{
  return sub_1D9DF0A90(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_viewControllerForElement_existingViewController_);
}

@end
