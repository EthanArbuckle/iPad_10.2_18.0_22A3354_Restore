@implementation SearchTemplateController

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D97D0C2C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D97D0E28();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI24SearchTemplateController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D97D1388();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v5 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v6 = v4;
  sub_1D97D1428(v3);

  OUTLINED_FUNCTION_4_3(v6);
}

- (CGRect)_searchBar:(id)a3 proposedSearchFieldFrame:(CGRect)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v6 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v7 = v5;
  sub_1D97D1560(v4);
  OUTLINED_FUNCTION_42();

  v8 = OUTLINED_FUNCTION_88();
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (_TtC8VideosUI24SearchTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B7E3A0();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9B7E5C8(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9B7E658(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8VideosUI24SearchTemplateController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1D9B7E714(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI24SearchTemplateController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B7EB4C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI24SearchTemplateController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B7EDB4();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_129_2((uint64_t *)((char *)self
                                    + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_savedNaturalLanguageSearchData));
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24SearchTemplateController_searchController);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_176_6((uint64_t)self + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_currentSearchTextInputSource);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24SearchTemplateController_resultsViewController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI24SearchTemplateController_landingPageViewController);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_2();
  swift_unknownObjectRelease();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_collectionImpressioner, &qword_1EDA8E6B0);
  v3 = OUTLINED_FUNCTION_177_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI24SearchTemplateController_loadingConfiguration);
  OUTLINED_FUNCTION_111_12(v3, v4, v5);
}

- (BOOL)deeplinkURLWasHandled:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_94_5();
  sub_1DA13F428();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_79_4();
  sub_1DA13F3EC();
  v7 = v3;
  sub_1D9B7F108(v4);

  OUTLINED_FUNCTION_5_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return 1;
}

- (void)willDismissSearchController:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_115_2();
  sub_1D9B7F290();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)willPresentSearchController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9B7F2CC(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_115_2();
  sub_1D9B7F71C();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9B7FEF8(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  _TtC8VideosUI24SearchTemplateController *v7;

  sub_1DA143E80();
  v6 = a3;
  v7 = self;
  sub_1D9B803AC();

  swift_bridgeObjectRelease();
}

- (void)handleWithKeyboardShowNotification:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_94_5();
  sub_1DA13F0B0();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_79_4();
  sub_1DA13F080();
  v7 = v3;
  sub_1D9B81900();

  OUTLINED_FUNCTION_5_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

@end
