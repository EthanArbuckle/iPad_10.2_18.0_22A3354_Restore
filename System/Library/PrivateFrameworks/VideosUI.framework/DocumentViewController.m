@implementation DocumentViewController

- (BOOL)vuiShouldAutomaticallyForwardAppearanceMethods
{
  return DocumentViewController.vuiShouldAutomaticallyForwardAppearanceMethods.getter();
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;

  DocumentViewController.supportedInterfaceOrientations.getter((uint64_t)self);
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  void *v3;
  UIViewController_optional *v4;
  void *v5;

  OUTLINED_FUNCTION_91_0();
  OUTLINED_FUNCTION_63_1();
  v4 = (UIViewController_optional *)OUTLINED_FUNCTION_36_5();
  DocumentViewController.vuiDidMove(toParent:)(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentViewController.vuiViewDidAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI22DocumentViewController *v2;

  v2 = self;
  DocumentViewController.vuiViewDidLoad()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI22DocumentViewController *v2;

  v2 = self;
  DocumentViewController.vuiViewDidLayoutSubviews()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentViewController.vuiViewWillDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentViewController.vuiViewDidDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  DocumentViewController.vuiViewWillAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v5;
  UINavigationController *v6;
  id v7;
  UIViewController *v8;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v7 = OUTLINED_FUNCTION_4_11();
  v8 = v5;
  DocumentViewController.navigationController(_:didShow:animated:)(v6, v8, 0);

  OUTLINED_FUNCTION_4_3(v8);
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v2;
  _TtC8VideosUI22DocumentViewController *v3;

  v3 = self;
  DocumentViewController.activityItemsConfiguration.getter();
  OUTLINED_FUNCTION_214();
  return (UIActivityItemsConfigurationReading *)OUTLINED_FUNCTION_111(v2);
}

- (void)setActivityItemsConfiguration:(id)a3
{
  _TtC8VideosUI22DocumentViewController *v4;
  uint64_t v5;
  void *v6;

  swift_unknownObjectRetain();
  v4 = self;
  v5 = OUTLINED_FUNCTION_36_5();
  DocumentViewController.activityItemsConfiguration.setter(v5);
  OUTLINED_FUNCTION_5_8(v6);
}

- (_TtC8VideosUI22DocumentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  DocumentViewController.init(coder:)();
}

- (void)dealloc
{
  _TtC8VideosUI22DocumentViewController *v2;

  v2 = self;
  DocumentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22DocumentViewController_templateViewController));
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI22DocumentViewController_pendingDeeplinkURL, &qword_1EDA92BE0);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22DocumentViewController_bubbletipOverlayController);
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI22DocumentViewController_documentDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22DocumentViewController_documentDidSetHandler));
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22DocumentViewController_navBarTintColor);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI22DocumentViewController_navBarTitleView);
  OUTLINED_FUNCTION_19_5();
}

- (void)willEnterForeground:(id)a3
{
  sub_1D9F93724(self, (uint64_t)a2, (uint64_t)a3, DocumentViewController.willEnterForeground(_:));
}

- (void)willTerminate:(id)a3
{
  sub_1D9F93724(self, (uint64_t)a2, (uint64_t)a3, DocumentViewController.willTerminate(_:));
}

- (void)didEnterBackground:(id)a3
{
  sub_1D9F93724(self, (uint64_t)a2, (uint64_t)a3, DocumentViewController.didEnterBackground(_:));
}

- (int64_t)preferredStatusBarStyle
{
  _TtC8VideosUI22DocumentViewController *v2;
  int64_t result;

  v2 = self;
  DocumentViewController.preferredStatusBarStyle.getter();
  OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (NSArray)preferredFocusEnvironments
{
  _TtC8VideosUI22DocumentViewController *v2;
  void *v3;

  v2 = self;
  DocumentViewController.preferredFocusEnvironments.getter();
  OUTLINED_FUNCTION_214();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F022FE00);
  v3 = (void *)sub_1DA1440F0();
  OUTLINED_FUNCTION_79();
  return (NSArray *)OUTLINED_FUNCTION_111(v3);
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  void *v2;
  _TtC8VideosUI22DocumentViewController *v3;

  v3 = self;
  DocumentViewController.childForStatusBarHidden.getter();
  OUTLINED_FUNCTION_214();
  return (UIViewController *)OUTLINED_FUNCTION_111(v2);
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 toViewController:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_228_10((uint64_t)self, (uint64_t)a2, a3, a4);
  OUTLINED_FUNCTION_63_1();
  v6 = OUTLINED_FUNCTION_185_12();
  DocumentViewController.customAnimator(for:to:)(v6, v7);
  OUTLINED_FUNCTION_20_1();

  return OUTLINED_FUNCTION_15_14(v4);
}

- (id)customAnimatorForNavigationControllerOperation:(int64_t)a3 fromViewController:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_228_10((uint64_t)self, (uint64_t)a2, a3, a4);
  OUTLINED_FUNCTION_63_1();
  v6 = OUTLINED_FUNCTION_185_12();
  DocumentViewController.customAnimator(for:from:)(v6, v7);
  OUTLINED_FUNCTION_20_1();

  return OUTLINED_FUNCTION_15_14(v4);
}

- (BOOL)handleDeeplink:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL result;

  v5 = OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_299();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_6();
  sub_1DA13F3EC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  OUTLINED_FUNCTION_9();
  return result;
}

- (void)scrollToTopWithAnimated:(BOOL)a3 needsFocusUpdate:(BOOL)a4
{
  _TtC8VideosUI22DocumentViewController *v6;

  v6 = self;
  DocumentViewController.scrollToTop(animated:needsFocusUpdate:)(a3, a4);
  OUTLINED_FUNCTION_5_8(v6);
}

- (_TtC8VideosUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  DocumentViewController.init(nibName:bundle:)();
}

- (void)playbackUIChanged:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  OUTLINED_FUNCTION_94_5();
  sub_1DA13F0B0();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_79_4();
  sub_1DA13F080();
  v6 = v3;
  sub_1D9F95BF8();

  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_28_0();
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  void *v4;
  id v5;
  id v6;

  v5 = a3;
  v6 = OUTLINED_FUNCTION_91_0();
  DocumentViewController.messageViewController(_:didUpdate:)();

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_63_1();
  v6 = OUTLINED_FUNCTION_91_0();
  DocumentViewController.messageViewController(_:didFailWithError:)();

  OUTLINED_FUNCTION_4_3(v6);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  OUTLINED_FUNCTION_8_30((uint64_t)self, (uint64_t)a2, a3);
  v6 = OUTLINED_FUNCTION_4_11();
  v7 = v4;
  OUTLINED_FUNCTION_181_0();
  DocumentViewController.messageViewController(_:didSelectActionWith:)();

  OUTLINED_FUNCTION_4_3(v7);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v7 = sub_1DA143C7C();
  if (a5)
  {
    v8 = sub_1DA143E80();
    a5 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = a3;
  v11 = OUTLINED_FUNCTION_63_1();
  DocumentViewController.messageViewController(_:enqueueEventWithFields:inTopic:)((uint64_t)v11, v7, v8, (uint64_t)a5);

  OUTLINED_FUNCTION_79();
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (BOOL)deeplinkURLWasHandled:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _TtC8VideosUI22DocumentViewController *v7;
  BOOL result;

  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_44_8();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_79_4();
  sub_1DA13F3EC();
  v7 = self;
  DocumentViewController.deeplinkURLWasHandled(_:)(v3);

  OUTLINED_FUNCTION_38_6(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_28_0();
  return result;
}

@end
