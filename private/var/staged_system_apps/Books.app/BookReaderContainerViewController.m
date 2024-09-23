@implementation BookReaderContainerViewController

- (BAUpSellData)upSellData
{
  return (BAUpSellData *)sub_1004CE998((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_upSellData);
}

- (void)setUpSellData:(id)a3
{
  sub_1004CEA34((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_upSellData);
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return (BAAppAnalyticsAdditionalData *)sub_1004CE998((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appAnalyticsAdditionalData);
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
  sub_1004CEA34((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appAnalyticsAdditionalData);
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  return (BCAppIntentsAssetViewControllerInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appIntentsInfo));
}

- (void)setAppIntentsInfo:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004CEAE4(v4);

}

- (BCBookPositionProcessing)bookPositionProcessor
{
  return (BCBookPositionProcessing *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookPositionProcessor));
}

- (void)setBookPositionProcessor:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookPositionProcessor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookPositionProcessor) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (REBuyBookServiceDelegate)serviceDelegate
{
  return (REBuyBookServiceDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_serviceDelegate);
}

- (void)setServiceDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_serviceDelegate, a3);
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  return (AEAssetViewControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate, a3);
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return (AEAssetOpenAnimating *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentOpenAnimator);
}

- (void)setContentOpenAnimator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentOpenAnimator, a3);
}

- (AEAsset)asset
{
  return (AEAsset *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
                                                            + OBJC_IVAR___REBookProviderService_bookInfo));
}

- (_TtC5Books33BookReaderContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DACF8();
}

- (void)viewDidLoad
{
  _TtC5Books33BookReaderContainerViewController *v2;

  v2 = self;
  sub_1004CF1DC();

}

- (void)handleTapDuringPageTurn:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004D04E8();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BookReaderContainerViewController(0);
  v2 = (char *)v13.receiver;
  -[BookReaderContainerViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = objc_msgSend(v2, "view", v13.receiver, v13.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider], "setFrame:", v6, v8, v10, v12);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Books33BookReaderContainerViewController *v4;

  v4 = self;
  sub_1004D0888(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Books33BookReaderContainerViewController *v4;

  v4 = self;
  sub_1004D0C94(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Books33BookReaderContainerViewController *v4;

  v4 = self;
  sub_1004D0E2C(a3);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t ObjectType;
  id v10;
  id v11;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BookReaderContainerViewController(0);
  v6 = (char *)v12.receiver;
  v7 = a3;
  -[BookReaderContainerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v12, "viewDidMoveToWindow:shouldAppearOrDisappear:", v7, v4);
  if (v7)
  {
    v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationService + 8];
    ObjectType = swift_getObjectType();
    dispatch thunk of Paginating.registerBackgroundHostView(backgroundHostView:)(*(_QWORD *)&v6[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationHostView], ObjectType, v8);
  }
  v10 = objc_msgSend(v6, "viewIfLoaded", v12.receiver, v12.super_class);
  v11 = objc_msgSend(v10, "window");

}

- (void)dragToDismiss:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004D13D0(v4);

}

- (void)swipeToDismiss:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "direction") == (id)8 && (sub_1004D25F0() & 1) != 0)
    sub_1004DAFDC(1);

}

- (void)readingLoupeSelectLine:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004D1BC0();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC5Books33BookReaderContainerViewController *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1004D1EA0(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;
  char v6;

  v4 = a3;
  v5 = self;
  sub_1004D2214(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter)
                                                                     + OBJC_IVAR____TtC5Books19BookReaderPresenter_presentedExpandedContentViewController));
}

- (BOOL)accessibilityPerformEscape
{
  _TtC5Books33BookReaderContainerViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1004D29EC();

  return v3 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Books33BookReaderContainerViewController *v7;
  uint64_t v8;
  _TtC5Books33BookReaderContainerViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  sub_1004D2BB4((uint64_t)a3, (uint64_t)v18, v19);

  sub_100010960((uint64_t)v18, (uint64_t *)&unk_1009D04E0);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_10003F198(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  _s5Books15CurrentPageViewVwxx_0(v19);
  return v16;
}

- (NSArray)keyCommands
{
  _TtC5Books33BookReaderContainerViewController *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1004D3068();

  if (v3)
  {
    sub_100009E04(0, &qword_1009D76A0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (_TtC5Books33BookReaderContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *result;

  v4 = a4;
  result = (_TtC5Books33BookReaderContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderContainerViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_readerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_upSellData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appAnalyticsAdditionalData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_panDismissGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_swipeDismissGesture));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_windowSceneTraitRegistration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_tapDuringPageTurnGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_selectLineGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_purchaseHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_configurationHandler));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_orientationLocking));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_statusBarStateProvider);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_buyButtonHost));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_toolbarPresenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_layoutModeProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_layoutController));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_pageTurnController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController__actionTarget));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_closeGestureManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appIntentsInfo));
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_buyButtonPresenter, (uint64_t *)&unk_1009D7450);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_endOfBookExperienceController));
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_viewModel);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookPositionProcessor));
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_serviceDelegate);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentOpenAnimator);
  v3 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_signposter;
  v6 = type metadata accessor for OSSignposter(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_signpostID;
  v8 = type metadata accessor for OSSignpostID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentReadyIntervalState));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_cancellables));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_manualCurlDriver));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentModule));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_viewSnapshotter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_blurView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_themeChangeWatcher));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationHostView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_currentLocationController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_currentLocationProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentLayoutController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_analyticsProvider));
  sub_10002AD00(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_undoTemporaryThemeStyle), *(_QWORD *)&self->readerController[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_undoTemporaryThemeStyle]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationService));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_lookupCompleteSubscription));
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC5Books33BookReaderContainerViewController *v8;

  v6 = _Block_copy(a4);
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_purchaseHandler);
  _Block_copy(v6);
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_10023E080((uint64_t)a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

}

- (void)setAssetIsPreordered:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  _TtC5Books33BookReaderContainerViewController *v11;

  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_purchaseHandler);
  v11 = self;
  if (a3)
    v5 = objc_msgSend(a3, "BOOLValue");
  else
    v5 = 0;
  Strong = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC5Books25BookReaderPurchaseHandler_delegate);
  if (Strong)
  {
    v8 = Strong;
    v9 = *(_QWORD *)(Strong + OBJC_IVAR____TtC5Books21BookReaderDataManager_bookProviderService + 8);
    ObjectType = swift_getObjectType(*(_QWORD *)(Strong + OBJC_IVAR____TtC5Books21BookReaderDataManager_bookProviderService), v7);
    dispatch thunk of BookProviding.setPreordered(_:)(v5, ObjectType, v9);

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
}

- (int64_t)readerType
{
  return 6;
}

- (BOOL)snapshotDuringLiveResize
{
  return 1;
}

- (void)assetViewControllerWillOpen
{
  _TtC5Books33BookReaderContainerViewController *v2;

  v2 = self;
  sub_1004D3870();

}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  void *v3;
  _TtC5Books33BookReaderContainerViewController *v4;
  id v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  v4 = self;
  v5 = v3;
  sub_1005E469C();

}

- (void)assetViewControllerWillEnterForeground
{
  _TtC5Books33BookReaderContainerViewController *v2;

  v2 = self;
  sub_1004D3B08();

}

- (void)assetViewControllerDidEnterBackground
{
  _TtC5Books33BookReaderContainerViewController *v2;

  v2 = self;
  sub_1004D3D44();

}

- (void)setFinishedForAssetID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *Strong;
  void *v7;
  _TtC5Books33BookReaderContainerViewController *v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
  if (Strong)
  {
    v7 = Strong;
    if ((objc_msgSend(Strong, "respondsToSelector:", "setFinishedForAssetID:") & 1) != 0)
    {
      v8 = self;
      v9 = String._bridgeToObjectiveC()();
      objc_msgSend(v7, "setFinishedForAssetID:", v9);

      swift_bridgeObjectRelease(v5);
      swift_unknownObjectRelease(v7);

    }
    else
    {
      swift_bridgeObjectRelease(v5);
      swift_unknownObjectRelease(v7);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v5);
  }
}

- (void)setBuyButtonProgress:(float)a3
{
  _TtC5Books33BookReaderContainerViewController *v4;

  v4 = self;
  sub_1004D3F58(a3);

}

- (void)open:(BOOL)a3
{
  _TtC5Books33BookReaderContainerViewController *v4;

  v4 = self;
  sub_1004D40E0(a3);

}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *Strong;
  _TtC5Books33BookReaderContainerViewController *v8;
  id v9;

  v4 = a4;
  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
  swift_unknownObjectRetain(a3);
  v8 = self;
  if (Strong)
  {
    objc_msgSend(Strong, "assetViewController:willOpen:", v8, v4);
    swift_unknownObjectRelease(Strong);
  }
  v9 = objc_retain(*(id *)((char *)&v8->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter));
  sub_1005EE194((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
  char *v3;
  void *v4;
  _TtC5Books33BookReaderContainerViewController *v5;
  char *v6;
  id v7;

  v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  v4 = *(void **)(*(_QWORD *)&v3[OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor] + 168);
  v5 = self;
  v6 = v3;
  v7 = v4;
  sub_10062C074(1);

}

- (void)close:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t Strong;
  void *v6;
  _TtC5Books33BookReaderContainerViewController *v7;

  v3 = a3;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = self;
    objc_msgSend(v6, "assetViewController:willClose:", v7, v3);

    swift_unknownObjectRelease(v6);
  }
}

- (void)saveStateClosing:(BOOL)a3
{
  void *v3;
  _TtC5Books33BookReaderContainerViewController *v4;
  id v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  v4 = self;
  v5 = v3;
  sub_100439B48();
  sub_10043AFD8(0);

}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  _TtC5Books33BookReaderContainerViewController *v6;

  v6 = self;
  sub_1004D43C4(a3, a4);

}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1004D4838(v4);

  return self & 1;
}

- (void)assetViewControllerDidCloseAnimated:(BOOL)a3
{
  _TtC5Books33BookReaderContainerViewController *v3;

  v3 = self;
  sub_1004DB1BC();

}

- (uint64_t)assetViewControllerUpdateToolbars
{
  uint64_t result;

  result = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(a1 + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_configurationHandler)+ OBJC_IVAR____TtC5Books30BookReaderConfigurationHandler_delegate);
  if (result)
    return swift_unknownObjectRelease(result);
  return result;
}

- (void)assetViewControllerPrepareForReload
{
  void *v2;
  _TtC5Books33BookReaderContainerViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  v3 = self;
  v4 = v2;
  sub_10043AFD8(1);

}

- (int64_t)pageCountIncludingUpsell
{
  int64_t result;

  result = swift_unknownObjectWeakLoadStrong(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_configurationHandler)+ OBJC_IVAR____TtC5Books30BookReaderConfigurationHandler_delegate);
  if (result)
  {
    swift_unknownObjectRelease(result);
    return 1;
  }
  return result;
}

- (id)transitionContentView
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_readerController), "view");
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  _TtC5Books33BookReaderContainerViewController *v6;
  uint64_t v7;

  v3 = *(_QWORD *)&self->readerController[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_orientationLocking];
  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_orientationLocking), a2);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  v6 = self;
  if ((v5(ObjectType, v3) & 1) != 0)
  {
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);

    if ((unint64_t)(v7 - 1) >= 4)
      return 0;
    else
      return qword_100729920[v7 - 1];
  }
  else
  {

    return 26;
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  _TtC5Books33BookReaderContainerViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1004D59C8();

  return v3 & 1;
}

- (BOOL)prefersStatusBarHidden
{
  _TtC5Books33BookReaderContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1004D5B0C();

  return v3 & 1;
}

- (int64_t)preferredStatusBarStyle
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  _TtC5Books33BookReaderContainerViewController *v10;

  v3 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_statusBarStateProvider;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_statusBarStateProvider);
  if (!Strong)
    return 1;
  v6 = Strong;
  v7 = *((_QWORD *)v3 + 1);
  ObjectType = swift_getObjectType(Strong, v5);
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
  v10 = self;
  LOBYTE(v7) = v9(ObjectType, v7);

  swift_unknownObjectRelease(v6);
  if ((v7 & 1) != 0)
    return 3;
  else
    return 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)buyBookWithCompletion:(id)a3
{
  void *v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1004DB280((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (BOOL)isPreordered
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _TtC5Books33BookReaderContainerViewController *v6;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
     + OBJC_IVAR___REBookProviderService_bookEntity;
  swift_beginAccess(v3, &v8, 0, 0);
  sub_10002E418(v3, (uint64_t)v9);
  v4 = v10;
  v5 = v11;
  sub_10003F198(v9, v10);
  v6 = self;
  LOBYTE(v3) = dispatch thunk of BookEntityType.preordered.getter(v4, v5);
  _s5Books15CurrentPageViewVwxx_0(v9);

  return v3 & 1;
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 0;
}

- (BOOL)isDownloading
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BookReaderContainerViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = (char *)v14.receiver;
  -[BookReaderContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(v7, "view", v14.receiver, v14.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "frame");
    v11 = v10;
    v13 = v12;

    objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider], "setFrame:", v11, v13, width, height);
    swift_unknownObjectRelease(a4);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BookReaderContainerViewController(0);
  v2 = (char *)v14.receiver;
  -[BookReaderContainerViewController viewSafeAreaInsetsDidChange](&v14, "viewSafeAreaInsetsDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider];
  v4 = objc_msgSend(v2, "view", v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "safeAreaInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, "setSafeAreaInsets:", v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books33BookReaderContainerViewController *v8;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  sub_1004DB3D0((uint64_t)v9);

  _s5Books15CurrentPageViewVwxx_0(v9);
}

- (void)buildContextTree:(id)a3
{
  uint64_t v4;
  _TtC5Books33BookReaderContainerViewController *v5;

  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v5 = self;
  sub_1004D7C54();

  swift_bridgeObjectRelease(v4);
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)forceRepagination
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC5Books33BookReaderContainerViewController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
     + OBJC_IVAR___REBookProviderService_bookEntity;
  swift_beginAccess(v3, &v12, 0, 0);
  sub_10002E418((uint64_t)v3, (uint64_t)v13);
  v4 = v14;
  v5 = v15;
  sub_10003F198(v13, v14);
  v6 = self;
  v7 = dispatch thunk of BookEntityType.assetID.getter(v4, v5);
  v9 = v8;
  _s5Books15CurrentPageViewVwxx_0(v13);
  v10 = *(_QWORD *)&v6->readerController[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationService];
  ObjectType = swift_getObjectType();
  dispatch thunk of Paginating.forceRepagination(forAssetID:)(v7, v9, ObjectType, v10);

  swift_bridgeObjectRelease(v9);
}

@end
