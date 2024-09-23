@implementation PadRootSplitViewController

- (UINavigationController)currentNavigationController
{
  _TtC8VideosUI26PadRootSplitViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D9E5FED8();
  v4 = v3;

  return (UINavigationController *)OUTLINED_FUNCTION_111(v4);
}

- (UIViewController)currentViewController
{
  _TtC8VideosUI26PadRootSplitViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1D9E5FF3C();
  v4 = v3;

  return (UIViewController *)OUTLINED_FUNCTION_111(v4);
}

- (_TtC8VideosUI26PadRootSplitViewController)init
{
  _TtC8VideosUI26PadRootSplitViewController *result;

  sub_1D9E60C38();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9E62B80();
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI26PadRootSplitViewController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E62D58();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8VideosUI26PadRootSplitViewController *v3;
  void *v4;

  v3 = self;
  OUTLINED_FUNCTION_36_5();
  sub_1D9E62E38();
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI26PadRootSplitViewController *v2;

  v2 = self;
  sub_1D9E62EB0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)willEnterForeground:(id)a3
{
  sub_1D9E63278();
}

- (void)didEnterBackground:(id)a3
{
  sub_1D9E63278();
}

- (void)dealloc
{
  _TtC8VideosUI26PadRootSplitViewController *v2;

  v2 = self;
  sub_1D9E632CC();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_libraryManager));
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_manager);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_rootControllerConfig);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_profileView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI26PadRootSplitViewController_accountMessageViewController);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithTabs:(id)a3
{
  OUTLINED_FUNCTION_236((uint64_t)self, (unint64_t *)&unk_1F02255A0);
  OUTLINED_FUNCTION_72_3();
  sub_1D9E633DC();
}

- (_TtC8VideosUI26PadRootSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    OUTLINED_FUNCTION_63_30();
  v5 = a4;
  sub_1D9E63434();
}

- (void)updateWithBarItems:(id)a3 setSelectedIdentifierFromDefaults:(BOOL)a4 appContext:(id)a5
{
  id v6;
  _TtC8VideosUI26PadRootSplitViewController *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92080);
  sub_1DA1440FC();
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = self;
  sub_1D9E65418();

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
  _TtC8VideosUI26PadRootSplitViewController *v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA92BE0);
  OUTLINED_FUNCTION_1_1();
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
  sub_1D9E65B7C();

  OUTLINED_FUNCTION_46();
  sub_1D970F43C(v10, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_28_0();
}

- (BOOL)controllerExistsForIdentifier:(id)a3
{
  BOOL result;

  OUTLINED_FUNCTION_63_30();
  OUTLINED_FUNCTION_450();
  OUTLINED_FUNCTION_427();
  sub_1D9E6681C();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_9();
  return result;
}

- (id)controllerForIdentifier:(id)a3
{
  OUTLINED_FUNCTION_63_30();
  OUTLINED_FUNCTION_450();
  OUTLINED_FUNCTION_427();
  sub_1D9E66894();
}

- (BOOL)isTabbarMode
{
  _TtC8VideosUI26PadRootSplitViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9E66984();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isSidebarEditing
{
  _TtC8VideosUI26PadRootSplitViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9E669E4();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)isSidebarButtonVisible
{
  _TtC8VideosUI26PadRootSplitViewController *v2;
  BOOL result;

  v2 = self;
  sub_1D9E66A50();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)removeAllChildViewControllers
{
  _TtC8VideosUI26PadRootSplitViewController *v2;

  v2 = self;
  sub_1D9E66AE8();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)accountStoreDidChange:(id)a3
{
  sub_1D9E63278();
}

- (void)isLibraryOnlyCountryChanged:(id)a3
{
  sub_1D9E63278();
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  BOOL result;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9E6E35C();

  OUTLINED_FUNCTION_9();
  return result;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  OUTLINED_FUNCTION_276_1();
  OUTLINED_FUNCTION_19_23(v8, v9, v10);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_276_5();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_158_16();
  sub_1D9E6E6E4();

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  OUTLINED_FUNCTION_276_1();
  OUTLINED_FUNCTION_19_23(v8, v9, v10);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_276_5();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_158_16();
  sub_1D9E6F110();

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9E6F484();

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  void *v14;

  OUTLINED_FUNCTION_276_1();
  OUTLINED_FUNCTION_19_23(v8, v9, v10);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_276_5();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_158_16();
  sub_1D9E6F684(v11, v12, v13);

  OUTLINED_FUNCTION_3_5(v14);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  id v13;
  void *v14;

  OUTLINED_FUNCTION_276_1();
  OUTLINED_FUNCTION_19_23(v8, v9, v10);
  OUTLINED_FUNCTION_70_8();
  OUTLINED_FUNCTION_276_5();
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_158_16();
  sub_1D9E6F684(v11, v12, v13);

  OUTLINED_FUNCTION_3_5(v14);
}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  OUTLINED_FUNCTION_276_1();
  v7 = v6;
  v9 = v8;
  v10 = OUTLINED_FUNCTION_70_8();
  v11 = v7;
  sub_1D9E6F838();

  OUTLINED_FUNCTION_3_5(v11);
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v6 = OUTLINED_FUNCTION_132_4();
  sub_1D9E6FEE4();

  OUTLINED_FUNCTION_4_3(v6);
}

@end
