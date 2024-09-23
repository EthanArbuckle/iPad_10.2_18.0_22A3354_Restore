@implementation StackTemplateController

- (_TtC8VideosUI23StackTemplateController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9ECE2E0();
}

- (void)vui_viewDidLoad
{
  self;
  sub_1D9ECE464();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9ECEE18();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9ED00C8(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9ED0134();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9ED0344(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  self;
  sub_1D9ED04C4();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  self;
  sub_1D9ED14C8((uint64_t)a4);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_63_1();
  v4 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9ED1648(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_36_5();
  sub_1D9ED16B8();

  OUTLINED_FUNCTION_4_3(v4);
}

- (int64_t)preferredStatusBarStyle
{
  _TtC8VideosUI23StackTemplateController *v2;
  int64_t result;

  v2 = self;
  sub_1D9ED174C();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)willEnterForeground:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  OUTLINED_FUNCTION_94_5();
  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_12();
  sub_1DA13F080();
  v6 = v3;
  sub_1D9ED17A4();

  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_13();
  sub_1D9ED2808();

  OUTLINED_FUNCTION_4_3(v4);
}

- (BOOL)vuiScrollViewShouldScrollToTop:(id)a3
{
  void *v3;
  id v4;
  BOOL result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9ED2CF4((uint64_t)v3);

  OUTLINED_FUNCTION_9();
  return result;
}

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  OUTLINED_FUNCTION_106_0();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  OUTLINED_FUNCTION_29_8();
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_13();
  sub_1DA13F6BC();
  v14 = v8;
  v15 = v12;
  LOBYTE(v10) = sub_1D9ED2DA8(v10, (uint64_t)v14);

  OUTLINED_FUNCTION_159(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return v10 & 1;
}

- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v5;
  id v7;
  double v8;
  uint64_t v9;
  double v10;
  id v11;

  v7 = a3;
  v11 = OUTLINED_FUNCTION_63_1();
  v8 = OUTLINED_FUNCTION_21_4();
  sub_1D9ED2EE8(v8, v10, v9, &a5->x);

  OUTLINED_FUNCTION_61_12(v11);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_2_13();
  sub_1D9ED316C();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)dealloc
{
  _TtC8VideosUI23StackTemplateController *v2;

  v2 = self;
  sub_1D9ED4120();
  OUTLINED_FUNCTION_2_1();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23StackTemplateController_notificationCenter);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23StackTemplateController_navBarGradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23StackTemplateController_statusBarGradientView);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23StackTemplateController_accountMessageViewController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI23StackTemplateController_targetParentController);
  OUTLINED_FUNCTION_131_25((uint64_t)self + OBJC_IVAR____TtC8VideosUI23StackTemplateController_pagePerformanceProvider);
}

@end
