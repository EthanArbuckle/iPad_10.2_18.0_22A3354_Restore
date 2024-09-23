@implementation PBFPosterRackCollectionViewController

+ (id)simplifiedHomeScreenSwitcherFor:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5
{
  CGSize size;
  CGSize v8;
  objc_class *v9;
  char *v10;
  id v11;
  id v12;
  char *v13;
  objc_super v15;
  _OWORD v16[4];

  size = a5->leadingTopButtonFrame.size;
  v16[0] = a5->leadingTopButtonFrame.origin;
  v16[1] = size;
  v8 = a5->trailingTopButtonFrame.size;
  v16[2] = a5->trailingTopButtonFrame.origin;
  v16[3] = v8;
  v9 = (objc_class *)type metadata accessor for SinglePosterConfigurationFilter();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR___PBFSinglePosterConfigurationFilter_configuration] = a3;
  v15.receiver = v10;
  v15.super_class = v9;
  v11 = a3;
  swift_unknownObjectRetain();
  v12 = objc_msgSendSuper2(&v15, sel_init);
  v13 = sub_1CBAEAFC4(v12, (uint64_t)a4, v16);

  swift_unknownObjectRelease();
  return v13;
}

+ (id)simplifiedHomeScreenSwitcherWithFilter:(id)a3 delegate:(id)a4 topButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a5
{
  CGSize size;
  CGSize v8;
  char *v9;
  _OWORD v11[4];

  size = a5->leadingTopButtonFrame.size;
  v11[0] = a5->leadingTopButtonFrame.origin;
  v11[1] = size;
  v8 = a5->trailingTopButtonFrame.size;
  v11[2] = a5->trailingTopButtonFrame.origin;
  v11[3] = v8;
  swift_getObjCClassMetadata();
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = sub_1CBAEB22C((uint64_t)a3, (uint64_t)a4, v11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

- (PBFPosterRackCollectionViewController)init
{
  void *v2;
  char *v3;
  char *v4;

  if (qword_1ED899A70 != -1)
    swift_once();
  v2 = (void *)qword_1ED89B338;
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionViewController());
  v4 = sub_1CBB61A08(v2, v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFPosterRackCollectionViewController *)v4;
}

- (PBFPosterRackCollectionViewController)initWithPosterFilter:(id)a3
{
  char *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;

  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterStore());
  swift_getObjectType();
  v4 = swift_unknownObjectRetain_n();
  v5 = sub_1CBAFD7B4(v4, v3);
  v6 = (char *)objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionViewController());
  v7 = v5;
  v8 = sub_1CBB61A08(v7, v6);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (PBFPosterRackCollectionViewController *)v8;
}

- (PBFPosterRackCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB6385C();
}

- (void)dealloc
{
  PBFPosterRackCollectionViewController *v2;

  v2 = self;
  PosterRackCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR___PBFPosterRackCollectionViewController_posterRackDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_dateProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockVibrancyConfiguration));
  sub_1CBAFFB5C((uint64_t)self + OBJC_IVAR___PBFPosterRackCollectionViewController_stashedLockscreenSnapshots, &qword_1ED89A0F8);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonTrailingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonTrailingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_centeredPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_addPosterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_actionsMenuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___duplicateAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenConfigurationView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___feedbackGenerator));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_switcherApplicationStateNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_centeredLockPosterOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockPosterLiveContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_lockPosterLiveFloatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenIconContentLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenIconContentViewConnector));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_legacyMigrationHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___widgetHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController____lazy_storage___lockScreenWidgetMetricsSpecifications));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_galleryDataProvider));
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PBFPosterRackCollectionViewController_homeScreenService));
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  PBFPosterRackCollectionViewController *v2;

  v2 = self;
  PosterRackCollectionViewController.viewDidLoad()();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  PBFPosterRackCollectionViewController *v8;

  v7 = a3;
  v8 = self;
  PosterRackCollectionViewController.viewDidMove(to:shouldAppearOrDisappear:)((UIWindow_optional *)a3, a4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  PBFPosterRackCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  PosterRackCollectionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (unint64_t)supportedInterfaceOrientations
{
  PBFPosterRackCollectionViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[PBFPosterRackCollectionViewController traitCollection](v2, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (v4 == (id)1)
    return 30;
  else
    return 2;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PosterRackCollectionViewController();
  v2 = v3.receiver;
  -[PBFPosterRackCollectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  sub_1CBB5480C();

}

- (void)viewDidLayoutSubviews
{
  PBFPosterRackCollectionViewController *v2;

  v2 = self;
  PosterRackCollectionViewController.viewDidLayoutSubviews()();

}

- (void)dismissPresentedViewControllersAnimated:(BOOL)a3 dismissHandler:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  _QWORD *v12;
  PBFPosterRackCollectionViewController *v13;

  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_1CBB67460;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v10 = sub_1CBB67F6C;
LABEL_6:
  v13 = self;
  PosterRackCollectionViewController.dismissPresentedViewControllers(animated:dismissHandler:completion:)(a3, (uint64_t)v8, v11, (uint64_t (*)(void *))v10, v12);
  sub_1CBB08008((uint64_t)v10);
  sub_1CBB08008((uint64_t)v8);

}

- (PBFPosterRackCollectionViewControllerDelegate)posterRackDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_posterRackDelegate;
  swift_beginAccess();
  return (PBFPosterRackCollectionViewControllerDelegate *)(id)MEMORY[0x1D17A3DF0](v2);
}

- (void)setPosterRackDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PROverridableDateProvider)dateProvider
{
  return (PROverridableDateProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                              + OBJC_IVAR___PBFPosterRackCollectionViewController_dateProvider));
}

- (BOOL)managesLiveWidgetHosting
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_managesLiveWidgetHosting;
  swift_beginAccess();
  return *v2;
}

- (void)setManagesLiveWidgetHosting:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_managesLiveWidgetHosting;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldDisplayCancelButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayCancelButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayCancelButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayCancelButton;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldDisplayGalleryAffordance
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayGalleryAffordance;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayGalleryAffordance:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayGalleryAffordance;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldDisplayAddButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayAddButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayAddButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayAddButton;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldDisplayActionsButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayActionsButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayActionsButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayActionsButton;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldDisplayConfigurationTopButtons
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayConfigurationTopButtons;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDisplayConfigurationTopButtons:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldDisplayConfigurationTopButtons;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)allowsLeavingHomeConfiguringLayout
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsLeavingHomeConfiguringLayout;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsLeavingHomeConfiguringLayout:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsLeavingHomeConfiguringLayout;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)allowsEnteringFullscreenLayout
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsEnteringFullscreenLayout;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEnteringFullscreenLayout:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PBFPosterRackCollectionViewController_allowsEnteringFullscreenLayout;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldTransitionLayoutToConfiguringHomeForFirstPoster
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldTransitionLayoutToConfiguringHomeForFirstPoster;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldTransitionLayoutToConfiguringHomeForFirstPoster:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self
     + OBJC_IVAR___PBFPosterRackCollectionViewController_shouldTransitionLayoutToConfiguringHomeForFirstPoster;
  swift_beginAccess();
  *v4 = a3;
}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl));
}

- (void)setPageControl:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_pageControl) = (Class)a3;
  v3 = a3;

}

- (void)pageControlDidChangePage:(id)a3
{
  id v4;
  PBFPosterRackCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB57A30((uint64_t)objc_msgSend(v4, sel_currentPage), 1, 0);

}

- (void)didTapEmptyViewArea:(id)a3
{
  id v4;
  PBFPosterRackCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB63DCC();

}

- (unint64_t)layoutMode
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___PBFPosterRackCollectionViewController_layoutMode);
}

- (void)setLayoutMode:(unint64_t)a3
{
  PBFPosterRackCollectionViewController *v3;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_layoutMode) = (Class)a3;
  v3 = self;
  sub_1CBB45FA0();

}

- (void)reset:(id)a3
{
  void *v4;
  uint64_t (*v5)();
  PBFPosterRackCollectionViewController *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v4;
    v5 = sub_1CBB67F6C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  PosterRackCollectionViewController.transitionLayout(to:animated:options:completion:)(0, 0, 0, 0, 0);
  type metadata accessor for PosterStore();
  swift_dynamicCastClassUnconditional();
  sub_1CBB62DAC();
  if (v4)
  {
    v5();
    sub_1CBB08008((uint64_t)v5);
  }

}

- (void)scrollToFirstPoster:(BOOL)a3 completion:(id)a4
{
  void *v5;
  PBFPosterRackCollectionViewController *v6;
  PBFPosterRackCollectionViewController *v7;

  v5 = _Block_copy(a4);
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v6 = self;
    sub_1CBB57A30(0, a3, 0);
    sub_1CBB67474();
    sub_1CBB08008((uint64_t)sub_1CBB67474);
  }
  else
  {
    v7 = self;
    sub_1CBB57A30(0, a3, 0);
  }

}

- (id)posterExtensionDataStore
{
  void *v3;
  PBFPosterRackCollectionViewController *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  v6 = objc_msgSend(v5, sel_dataStore);

  return v6;
}

- (void)presentPosterGallery:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  PBFPosterRackCollectionViewController *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1CBB67460;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_1CBB44924((uint64_t (*)())sub_1CBB681EC, (uint64_t)v6);

  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  PBFPosterRackCollectionViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _s11PosterBoard0A28RackCollectionViewControllerC16numberOfSections2inSiSo012UICollectionE0C_tF_0();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  PBFPosterRackCollectionViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1CBB63F9C(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  PBFPosterRackCollectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1CBB8234C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1CBB822F8();
  v10 = a3;
  v11 = self;
  v12 = (void *)PosterRackCollectionViewController.collectionView(_:cellForItemAt:)(v10, v9);

  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  PBFPosterRackCollectionViewController *v15;
  void *v16;
  uint64_t v18;

  v7 = sub_1CBB8234C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CBB824CC();
  v13 = v12;
  sub_1CBB822F8();
  v14 = a3;
  v15 = self;
  v16 = (void *)PosterRackCollectionViewController.collectionView(_:viewForSupplementaryElementOfKind:at:)(v14, v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  PBFPosterRackCollectionViewController *v11;
  uint64_t v12;

  v6 = sub_1CBB8234C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v10 = a3;
  v11 = self;
  PosterRackCollectionViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1CBB4E360(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1CBB641EC);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_1CBB4E360(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_1CBB64354);
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  id v12;
  char *v13;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v9 = self;
    v10 = objc_allocWithZone((Class)type metadata accessor for PosterRackCollectionView());
    v11 = v9;
    v12 = a4;
    v13 = (char *)objc_msgSend(v10, sel_initWithFrame_collectionViewLayout_, v12, x, y, width, height);
    *(_QWORD *)&v13[OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate + 8] = &off_1E86FB0B8;
    swift_unknownObjectWeakAssign();

    return v13;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  PBFPosterRackCollectionViewController *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89A0D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  PosterRackCollectionViewController._indexPathOfReferenceItemForLayoutTransition(in:)(a3, (uint64_t)v7);

  v10 = sub_1CBB8234C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    v12 = (void *)sub_1CBB822E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v12;
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  PBFPosterRackCollectionViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  PosterRackCollectionViewController.scrollViewDidScroll(_:)(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___PBFPosterRackCollectionViewController_isScrollingOrSettling) = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  PBFPosterRackCollectionViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1CBB64588(&a5->x);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  PBFPosterRackCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB64758();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6;
  PBFPosterRackCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1CBB647BC(a4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  PBFPosterRackCollectionViewController *v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1CBB64828(v7);

  return v9 & 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  PBFPosterRackCollectionViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_presentedViewController);
  sub_1CBB48EF0(v6);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  PBFPosterRackCollectionViewController *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_msgSend(v7, sel_presentedViewController);
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  if (v6)
    sub_1CBB5C6D8(v6);

}

- (void)fontAndColorPickerViewController:(id)a3 didUpdateDesiredDetent:(double)a4
{
  id v5;
  PBFPosterRackCollectionViewController *v6;

  v5 = a3;
  v6 = self;
  _s11PosterBoard0A28RackCollectionViewControllerC018fontAndColorPickereF0_22didUpdateDesiredDetentySo013PREditingFonthijeF0C_12CoreGraphics7CGFloatVtF_0();

}

- (void)posterSectionRemovalView:(id)a3 didRequestRemovalOfPosterWithID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  PBFPosterRackCollectionViewController *v10;

  v6 = sub_1CBB824CC();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1CBB5050C((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (NSIndexPath)centeredPosterIndexPath
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PBFPosterRackCollectionViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89A0D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1CBB54434(v5);

  v7 = sub_1CBB8234C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1CBB822E0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSIndexPath *)v9;
}

- (PBFPosterPair)centeredPoster
{
  PBFPosterRackCollectionViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1CBB54674();

  return (PBFPosterPair *)v3;
}

- (void)dateProvider:(id)a3 didUpdateDate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  PBFPosterRackCollectionViewController *v9;
  uint64_t v10;

  v5 = sub_1CBB82208();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB821E4();
  swift_unknownObjectRetain();
  v9 = self;
  sub_1CBB55550((uint64_t)v8);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  id v6;
  PBFPosterRackCollectionViewController *v7;
  CGPoint *v8;
  CGFloat x;
  CGFloat y;
  char *v11;
  PREditingSceneViewControllerTopButtonLayout *result;
  CGSize v13;
  CGPoint v14;
  CGPoint v15;

  v6 = a4;
  v7 = self;
  objc_msgSend(v6, sel_addObserver_, v7);
  v8 = (CGPoint *)((char *)v7 + OBJC_IVAR___PBFPosterRackCollectionViewController_leadingTopButtonFrame);
  swift_beginAccess();
  v15 = *v8;
  x = v8[1].x;
  y = v8[1].y;
  v11 = (char *)v7 + OBJC_IVAR___PBFPosterRackCollectionViewController_trailingTopButtonFrame;
  swift_beginAccess();
  v13 = (CGSize)*((_OWORD *)v11 + 1);
  v14 = *(CGPoint *)v11;

  retstr->leadingTopButtonFrame.origin = v15;
  retstr->leadingTopButtonFrame.size.width = x;
  retstr->leadingTopButtonFrame.size.height = y;
  retstr->trailingTopButtonFrame.origin = v14;
  retstr->trailingTopButtonFrame.size = v13;
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  PBFPosterRackCollectionViewController *v16;

  v12 = _Block_copy(a7);
  _Block_copy(v12);
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = self;
  sub_1CBB64D38(v13, a4, a5, a6, (char *)v16, v12);
  _Block_release(v12);
  _Block_release(v12);

}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  PREditingSceneViewController *v4;
  PBFPosterRackCollectionViewController *v5;

  v4 = (PREditingSceneViewController *)a3;
  v5 = self;
  PosterRackCollectionViewController.editingSceneViewControllerDidFinalize(_:)(v4);

}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v8;
  id v9;
  PBFPosterRackCollectionViewController *v10;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  PosterRackCollectionViewController.galleryViewController(_:didSelect:from:)(v8, a4, (uint64_t)v9);

  swift_unknownObjectRelease();
}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  PBFPosterRackCollectionViewController *v11;

  v8 = OBJC_IVAR___PBFPosterRackCollectionViewController_editingSessionInProgressAssertion;
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PBFPosterRackCollectionViewController_editingSessionInProgressAssertion);
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  if (v9)
    objc_msgSend(v9, sel_invalidate);
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = 0;

  swift_unknownObjectRelease();
  return a4;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8;
  id v9;
  PBFPosterRackCollectionViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1CBB66AF4((uint64_t)v8, a5);

}

- (void)focusSelectionViewController:(id)a3 hasSelected:(BOOL)a4 activity:(id)a5
{
  id v8;
  PBFPosterRackCollectionViewController *v9;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  PosterRackCollectionViewController.focusSelectionViewController(_:hasSelected:activity:)(v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)homeScreenServiceLayoutDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  PBFPosterRackCollectionViewController *v9;

  v4 = a3;
  v9 = self;
  v5 = -[PBFPosterRackCollectionViewController collectionView](v9, sel_collectionView);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = v6;
    sub_1CBB4864C(1, (uint64_t)sub_1CBB68178, v7);

    swift_release();
  }
  else
  {

  }
}

- (PBFPosterRackCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  PBFPosterRackCollectionViewController *result;

  v3 = a3;
  result = (PBFPosterRackCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (PBFPosterRackCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PBFPosterRackCollectionViewController *result;

  v4 = a4;
  result = (PBFPosterRackCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
