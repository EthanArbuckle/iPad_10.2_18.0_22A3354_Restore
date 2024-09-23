@implementation PUStoryViewController

- (void)loadStoryViewIfNeeded
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC61500();

}

- (PXStoryView)storyView
{
  id v2;

  sub_1AAC61564();
  return (PXStoryView *)v2;
}

- (void)setStoryView:(id)a3
{
  id v5;
  PUStoryViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC615E8(a3);

}

- (BOOL)remainsActiveWhileApplicationIsHidden
{
  char v2;

  sub_1AAC616C4();
  return v2 & 1;
}

- (void)setRemainsActiveWhileApplicationIsHidden:(BOOL)a3
{
  PUStoryViewController *v4;

  v4 = self;
  sub_1AAC61738(a3);

}

- (PXStoryViewControllerNavigationItemHelper)navigationItemHelper
{
  id v2;

  sub_1AAC61894();
  return (PXStoryViewControllerNavigationItemHelper *)v2;
}

- (void)setNavigationItemHelper:(id)a3
{
  PUStoryViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC618EC((uint64_t)a3);

}

- (Class)gridDecorationViewClass
{
  Class result;

  sub_1AAC6198C();
  if (result)
    return (Class)swift_getObjCClassFromMetadata();
  return result;
}

- (void)setGridDecorationViewClass:(Class)a3
{
  uint64_t ObjCClassMetadata;

  if (a3)
    ObjCClassMetadata = swift_getObjCClassMetadata();
  else
    ObjCClassMetadata = 0;
  sub_1AAC619F4(ObjCClassMetadata);
}

- (PXStoryViewControllerShareActionDelegate)shareActionDelegate
{
  sub_1AAC61A8C();
}

- (void)setShareActionDelegate:(id)a3
{
  PUStoryViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC61AE4();

}

- (PXStoryViewControllerDismissalDelegate)dismissalDelegate
{
  sub_1AAC61B94();
}

- (void)setDismissalDelegate:(id)a3
{
  PUStoryViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC61C1C();

}

- (PXStoryViewEnvironmentActionDelegate)viewEnvironmentActionDelegate
{
  id v2;

  sub_1AAC61D74();
  return (PXStoryViewEnvironmentActionDelegate *)v2;
}

- (void)setViewEnvironmentActionDelegate:(id)a3
{
  PUStoryViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC61E00((uint64_t)a3);

}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  PUStoryViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AAC62378();
  v4 = v3;

  return (UIActivityItemsConfigurationReading *)v4;
}

- (void)setActivityItemsConfiguration:(id)a3
{
  PUStoryViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC62470((uint64_t)a3);

}

- (PUStoryViewController)initWithConfiguration:(id)a3
{
  return (PUStoryViewController *)StoryViewController.init(configuration:)(a3);
}

- (PUStoryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  StoryViewController.init(coder:)();
}

- (void)viewDidLoad
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC62980();

}

- (void)viewWillAppear:(BOOL)a3
{
  PUStoryViewController *v4;

  v4 = self;
  sub_1AAC631D4(a3, (SEL *)&selRef_viewWillAppear_, (SEL *)&selRef_storyViewControllerWillAppear_);

}

- (void)viewWillDisappear:(BOOL)a3
{
  PUStoryViewController *v4;

  v4 = self;
  sub_1AAC631D4(a3, (SEL *)&selRef_viewWillDisappear_, (SEL *)&selRef_storyViewControllerWillDisappear_);

}

- (void)viewDidAppear:(BOOL)a3
{
  PUStoryViewController *v4;

  v4 = self;
  sub_1AAC632A8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  PUStoryViewController *v4;

  v4 = self;
  sub_1AAC63538(a3);

}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return sub_1AAC63F74() & 1;
}

- (BOOL)prefersViewEnvironmentChromeHidden
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)px_determinesPreferredStatusBarStyle
{
  return 1;
}

- (UIEdgeInsets)px_layoutMargins
{
  PUStoryViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  sub_1AAC63FF4();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)userInterfaceFeature
{
  return 7;
}

- (void)installViewDidLoadHandler:(id)a3
{
  void *v4;
  PUStoryViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1AAC6478C((char *)v5, (void (**)(_QWORD))v4);
  _Block_release(v4);

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  PUStoryViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC649C4(a3);
  swift_unknownObjectRelease();

}

- (void)presentStyleSwitcher
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC64B54();

}

- (void)presentBrowserGrid
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC64DFC();

}

- (void)presentMusicEditor
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC64ECC();

}

- (void)presentSharingViewWithSender:(id)a3
{
  sub_1AAC6894C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))sub_1AAC64F34);
}

- (PXStoryExportActivityHelper)exportActivityHelper
{
  OUTLINED_FUNCTION_10_2();
  return (PXStoryExportActivityHelper *)self;
}

- (void)performActionForChromeActionMenuItem:(int64_t)a3 withValue:(int64_t)a4 sender:(id)a5
{
  PUStoryViewController *v8;
  PUStoryViewController *v9;
  _OWORD v10[2];

  if (a5)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_1AB08DCA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  sub_1AAC67ABC(a3, (void *)a4);

  sub_1AAB73A64((uint64_t)v10, (uint64_t *)&unk_1EEBB9EF0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  PUStoryViewController *v5;
  PUStoryViewController *v6;
  char v7;
  char v8;
  _OWORD v10[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_1AB08DCA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v6 = self;
  }
  sub_1AAC68328();
  v8 = v7;

  sub_1AAB73A64((uint64_t)v10, (uint64_t *)&unk_1EEBB9EF0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  PUStoryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1AAC684FC(v4);

}

- (void)selectAll:(id)a3
{
  PUStoryViewController *v4;
  PUStoryViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB08DCA8();
    v5 = (PUStoryViewController *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AAC68768((uint64_t)v5, (uint64_t)sub_1AAC6869C, (uint64_t)&block_descriptor_51);

  sub_1AAB73A64((uint64_t)v6, (uint64_t *)&unk_1EEBB9EF0);
}

- (void)deselectAll:(id)a3
{
  sub_1AAC6B950(self, (uint64_t)a2, (uint64_t)a3, sub_1AAC68754);
}

- (void)makeKeyPhoto:(id)a3
{
  sub_1AAC6B950(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AAC68820);
}

- (void)moveLeft:(id)a3
{
  sub_1AAC6894C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))sub_1AAC68844);
}

- (void)moveRight:(id)a3
{
  sub_1AAC6894C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))sub_1AAC6885C);
}

- (void)togglePlayback:(id)a3
{
  sub_1AAC6894C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *))sub_1AAC68934);
}

- (void)toggleViewer:(id)a3
{
  sub_1AAC6B950(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AAC689AC);
}

- (void)makeAssetKeyPhoto:(id)a3
{
  PUStoryViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1AAC68A78((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)removeAssetsFromCuration:(id)a3
{
  PUStoryViewController *v4;

  sub_1AB08D6FC();
  v4 = self;
  sub_1AAC68D2C();
  swift_bridgeObjectRelease();

}

- (void)deleteMemory
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC69048();

}

- (void)dismissStoryViewController
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC693F4();

}

- (id)dismissStoryViewControllerInteractively
{
  PUStoryViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1AAC694B0();

  return v3;
}

- (BOOL)needs79067616Workaround
{
  PUStoryViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AAC69540((uint64_t)v2);

  return v3 & 1;
}

- (void)presentAppleMusicPreviewForSelectedSong:(id)a3 curatedSongs:(id)a4
{
  PUStoryViewController *v7;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1AAC696FC(a3, a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dismissAppleMusicPreview
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6A6E8();

}

- (void)presentAppleMusicSignupWithSender:(id)a3
{
  PUStoryViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1AAC6A74C();

}

- (void)a_customTapToRadar:(id)a3
{
  sub_1AAC6B950(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AAC6B904);
}

- (void)fileRadar
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6B9AC();

}

- (void)fileRadarForErrorRepository:(id)a3
{
  PUStoryViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1AAC6BA20(v5);

}

- (void)provideFeedback
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6BFCC();

}

- (void)copyInternalURL
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6C140();

}

- (void)showVisualDiagnostics
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6C7D4();

}

- (void)toggleFavoriteState
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6C8A4();

}

- (void)toggleMuteState
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6C9E0();

}

- (void)presentTitleEditor
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6CABC();

}

- (void)presentAssetPicker
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6CC7C();

}

- (id)musicFeedbackContextMenuDelegateWithAudioAssetProvidingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  PUStoryViewController *v6;
  void *v7;
  void *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1AAC6D700((uint64_t)sub_1AAC7430C, v5);
  v8 = v7;

  swift_release();
  return v8;
}

- (BOOL)prepareForPopTransition
{
  return 1;
}

- (id)detailItemReferenceForTransitionWithSummaryEndPoint:(id)a3
{
  return sub_1AAC6DA10();
}

- (id)summaryItemReferenceForTransitionWithSummaryEndPoint:(id)a3
{
  return sub_1AAC6DA10();
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  PUStoryViewController *v4;
  _QWORD *v5;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  v5 = sub_1AAC6DAE0();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
  return v5;
}

- (BOOL)allowsTransition:(id)a3 withEndPoint:(id)a4
{
  id v5;
  PUStoryViewController *v6;
  char v7;
  char v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1AAC6DBE8();
  v8 = v7;

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5
{
  id v7;
  PUStoryViewController *v8;
  id v9;
  PUStoryViewController *v10;
  _OWORD v11[2];

  if (a5)
  {
    v7 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    swift_unknownObjectRetain();
    sub_1AB08DCA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
  }
  sub_1AAC6DCE8();

  swift_unknownObjectRelease();
  sub_1AAB73A64((uint64_t)v11, (uint64_t *)&unk_1EEBB9EF0);
}

- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5
{
  id v6;
  PUStoryViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1AAC6DE48();

  swift_unknownObjectRelease();
}

- (void)willDismissWithoutTransitionToEndPoint:(id)a3
{
  PUStoryViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1AAC6DF68();
  swift_unknownObjectRelease();

}

- (void)presentColorGradeEditor
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6E178();

}

- (void)presentChapterEditor
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC6FC44();

}

- (void)presentChapterInsertor
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC70264();

}

- (void)deleteCurrentChapter
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC709C4();

}

- (void)willEnterForeground
{
  PUStoryViewController *v2;

  v2 = self;
  sub_1AAC71148();

}

- (PUStoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB08D498();
  v5 = a4;
  StoryViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_initialConfiguration);
  OUTLINED_FUNCTION_16_16(OBJC_IVAR___PUStoryViewController_onViewDidLoad);
  OUTLINED_FUNCTION_53_1();
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUStoryViewController_shareActionDelegate);
  sub_1AAB8CAB0((uint64_t)self + OBJC_IVAR___PUStoryViewController_dismissalDelegate);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController____lazy_storage___viewModel);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_browserGridPhotoViewModel);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_applicationState);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_transitionsCoordinator);
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController____lazy_storage___analyticsController);
  swift_release();
  OUTLINED_FUNCTION_16_16(OBJC_IVAR___PUStoryViewController_exportConfigurationCompletionBlock);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_assetPicker);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_originalToolbarScrollEdgeAppearance);
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_boopableItemsProvider);
  sub_1AAB73A64((uint64_t)self + OBJC_IVAR___PUStoryViewController_lastAppVisibilityChangeDate, &qword_1EEBB7E00);
  swift_release();
  OUTLINED_FUNCTION_5_5(OBJC_IVAR___PUStoryViewController_appleMusicPreviewVC);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  UIPresentationController *v4;
  PUStoryViewController *v5;

  v4 = (UIPresentationController *)a3;
  v5 = self;
  StoryViewController.presentationControllerDidDismiss(_:)(v4);

}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v6;
  PUStoryViewController *v7;
  BOOL v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = StoryViewController.actionPerformer(_:transitionTo:transitionType:)();

  swift_unknownObjectRelease();
  return v8;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  PUStoryViewController *v10;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  LOBYTE(v8) = StoryViewController.actionPerformer(_:dismiss:completionHandler:)((uint64_t)v10, a4);

  swift_unknownObjectRelease();
  swift_release();
  return v8 & 1;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  id v4;
  PUStoryViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)StoryViewController.undoManager(for:)((PXActionPerformer *)v5);

  return v6;
}

- (void)requestExportConfigurationWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  PUStoryViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  StoryViewController.requestExportConfiguration(completionHandler:)((uint64_t)sub_1AAC0E378, v5);

  swift_release();
}

- (PXDisplayAsset)iconAsset
{
  PUStoryViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)StoryViewController.iconAsset.getter();

  return (PXDisplayAsset *)v3;
}

- (NSString)preferredExportFilename
{
  PUStoryViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  StoryViewController.preferredExportFilename.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB08D468();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (PXDisplayCollection)collection
{
  PUStoryViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)StoryViewController.collection.getter();

  return (PXDisplayCollection *)v3;
}

- (void)didBeginExportWithConfiguration:(id)a3
{
  id v4;
  PUStoryViewController *v5;

  v4 = a3;
  v5 = self;
  StoryViewController.didBeginExport(with:)();

}

- (void)didEndExportWithConfiguration:(id)a3
{
  id v4;
  PUStoryViewController *v5;

  v4 = a3;
  v5 = self;
  StoryViewController.didEndExport(with:)();

}

- (NSString)appIntentsDebugDescription
{
  PUStoryViewController *v2;
  void *v3;

  v2 = self;
  StoryViewController.appIntentsDebugDescription.getter();

  v3 = (void *)sub_1AB08D468();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  PUStoryViewController *v9;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v9 = self;
  StoryViewController.appIntentsEnumerateAssetCollections(_:completionHandler:)((void (*)(uint64_t, uint64_t))sub_1AAC73E40, v8, (void (*)(uint64_t))sub_1AAC606D8);

  swift_release();
  swift_release();
}

@end
