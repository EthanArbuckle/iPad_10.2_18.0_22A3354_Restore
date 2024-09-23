@implementation RootSplitViewController

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;
  _TtC8VideosUI23RootSplitViewController *v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_1D9F2AFCC(v4);
  v7 = v6;

  return v7;
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TtC8VideosUI23RootSplitViewController *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  sub_1D9F2CFC4(width, height);

  OUTLINED_FUNCTION_12_4(v8);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v6 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = v5;
  v8 = v4;
  sub_1D9F2D16C();

  OUTLINED_FUNCTION_12_4(v8);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v6 = OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = v4;
  v8 = v5;
  sub_1D9F2D27C();

  OUTLINED_FUNCTION_12_4(v8);
}

- (UINavigationController)currentNavigationController
{
  void *v2;
  _TtC8VideosUI23RootSplitViewController *v3;

  v3 = self;
  sub_1D9FEA41C();
  OUTLINED_FUNCTION_214();
  return (UINavigationController *)OUTLINED_FUNCTION_111(v2);
}

- (UIViewController)currentViewController
{
  void *v2;
  _TtC8VideosUI23RootSplitViewController *v3;

  v3 = self;
  sub_1D9FEA47C();
  OUTLINED_FUNCTION_214();
  return (UIViewController *)OUTLINED_FUNCTION_111(v2);
}

- (int64_t)preferredDisplayMode
{
  _TtC8VideosUI23RootSplitViewController *v2;
  int64_t result;

  v2 = self;
  sub_1D9FEAA90();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  _TtC8VideosUI23RootSplitViewController *v4;

  v4 = self;
  sub_1D9FEAAF8(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (_TtC8VideosUI23RootSplitViewController)init
{
  _TtC8VideosUI23RootSplitViewController *result;

  sub_1D9FEAE48();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI23RootSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9FEB3CC();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI23RootSplitViewController *v3;
  void *v4;
  void *v5;

  v3 = self;
  v4 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9FEB5BC(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8VideosUI23RootSplitViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9FEB75C(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)willEnterForeground:(id)a3
{
  sub_1D9FEB974(self, (uint64_t)a2, (uint64_t)a3, sub_1D9FEB804);
}

- (void)didEnterBackground:(id)a3
{
  sub_1D9FEB974(self, (uint64_t)a2, (uint64_t)a3, sub_1D9FEB924);
}

- (void)dealloc
{
  _TtC8VideosUI23RootSplitViewController *v2;

  v2 = self;
  sub_1D9FEB9FC();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_rootControllerConfig));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController_manager);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController____lazy_storage___sideBarController);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController____lazy_storage___splitTabBarController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController_libraryManager);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController_secondaryColumnHostingController);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23RootSplitViewController_presentedTipViewController);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23RootSplitViewController_accountMessageViewController));
}

- (_TtC8VideosUI23RootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    OUTLINED_FUNCTION_63_30();
  v5 = a4;
  sub_1D9FEBB28();
}

- (_TtC8VideosUI23RootSplitViewController)initWithStyle:(int64_t)a3
{
  sub_1D9FEBB74();
}

- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  id v7;
  _TtC8VideosUI23RootSplitViewController *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92080);
  OUTLINED_FUNCTION_40_11();
  v7 = a5;
  v8 = self;
  sub_1D9FED354();

  swift_bridgeObjectRelease();
}

- (void)setSelectedIndexForIdentifier:(id)a3 withDeeplinkURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8VideosUI23RootSplitViewController *v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_61();
  v10 = v9 - v8;
  if (!a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_5:
    v11 = sub_1DA13F428();
    v12 = 1;
    goto LABEL_6;
  }
  sub_1DA143E80();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  sub_1DA13F3EC();
  v11 = sub_1DA13F428();
  v12 = 0;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v10, v12, 1, v11);
  v13 = self;
  OUTLINED_FUNCTION_7_126();
  sub_1D9FED6B4();

  OUTLINED_FUNCTION_46();
  sub_1D970F43C(v10, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_28_0();
}

- (BOOL)controllerExistsForIdentifier:(id)a3
{
  BOOL v4;

  OUTLINED_FUNCTION_63_30();
  OUTLINED_FUNCTION_450();
  OUTLINED_FUNCTION_427();
  v4 = sub_1D9FED7F0();

  OUTLINED_FUNCTION_46();
  return v4;
}

- (id)controllerForIdentifier:(id)a3
{
  OUTLINED_FUNCTION_63_30();
  OUTLINED_FUNCTION_450();
  OUTLINED_FUNCTION_427();
  sub_1D9FED878();
}

- (BOOL)isTabbarMode
{
  _TtC8VideosUI23RootSplitViewController *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1D9FED95C();

  return v3;
}

- (void)removeAllChildViewControllers
{
  _TtC8VideosUI23RootSplitViewController *v2;

  v2 = self;
  sub_1D9FED9CC();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  _TtC8VideosUI23RootSplitViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1D9FEDCEC((uint64_t)v7, a4);

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5
{
  id v8;
  _TtC8VideosUI23RootSplitViewController *v9;

  v8 = a3;
  v9 = self;
  sub_1D9FEDF8C((uint64_t)v9, a4, a5);

  OUTLINED_FUNCTION_4_3(v9);
}

@end
