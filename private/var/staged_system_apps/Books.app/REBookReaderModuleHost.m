@implementation REBookReaderModuleHost

- (AEAsset)asset
{
  return (AEAsset *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___REBookReaderModuleHost_bookProviderService)
                                                            + OBJC_IVAR___REBookProviderService_bookInfo));
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  char *v2;
  _BYTE v4[24];

  v2 = (char *)self + OBJC_IVAR___REBookReaderModuleHost_assetViewControllerDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR___REBookReaderModuleHost_assetViewControllerDelegate, v4, 0, 0);
  return (AEAssetViewControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  sub_10050B224(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10050D81C);
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return (AEAssetOpenAnimating *)sub_100246CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___REBookReaderModuleHost_contentOpenAnimator);
}

- (void)setContentOpenAnimator:(id)a3
{
  id *v4;
  id v5;
  char v6[24];

  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_contentOpenAnimator);
  swift_beginAccess((char *)self + OBJC_IVAR___REBookReaderModuleHost_contentOpenAnimator, v6, 1, 0);
  v5 = *v4;
  *v4 = a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v5);
}

- (int64_t)readerType
{
  return 6;
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo);
  swift_beginAccess((char *)self + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo, v4, 0, 0);
  return (BCAppIntentsAssetViewControllerInfo *)*v2;
}

- (void)setAppIntentsInfo:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  REBookReaderModuleHost *v8;
  _BYTE v9[24];

  swift_getObjectType(self, a2);
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo);
  swift_beginAccess((char *)self + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  BCAppIntentsAssetViewController.notifyAppIntentsInfoChanged()();
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  REBookReaderModuleHost *v7;
  uint64_t v8;
  REBookReaderModuleHost *v9;
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
  BookReaderModuleHost.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v18, (uint64_t)v19);

  sub_10004A7B8((uint64_t)v18);
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

- (BOOL)snapshotDuringLiveResize
{
  REBookReaderModuleHost *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)sub_10050D8AC();
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "respondsToSelector:", "snapshotDuringLiveResize") & 1) != 0)
      LOBYTE(v4) = objc_msgSend(v4, "snapshotDuringLiveResize");
    else
      LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (void)open:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.open(_:)(a3);

}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  REBookReaderModuleHost *v7;

  swift_unknownObjectRetain(a3);
  v7 = self;
  BookReaderModuleHost.open(toLocation:animated:)((uint64_t)a3, a4);
  swift_unknownObjectRelease(a3);

}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.jumpToBeginning(animated:)(a3);

}

- (void)close:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.close(_:)(a3);

}

- (void)saveStateClosing:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.saveStateClosing(_:)(a3);

}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  REBookReaderModuleHost *v6;

  v6 = self;
  BookReaderModuleHost.saveStateClosing(_:suspending:)(a3, a4);

}

- (BOOL)dismissShouldBegin:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v3)
    return objc_msgSend(v3, "dismissShouldBegin:", a3);
  else
    return objc_msgSend(a3, "proposedBeginState", a3);
}

- (void)assetViewControllerUpdateToolbars
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbars()();

}

- (void)assetViewControllerUpdateCloseStateTypeIfNeeded
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateCloseStateTypeIfNeeded()();

}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbarsAfterOpenAnimation()();

}

- (void)assetViewControllerUpdateToolbarsForOpenAnimation
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbarsForOpenAnimation()();

}

- (void)assetViewControllerWillAddView
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerWillAddView()();

}

- (void)assetViewControllerPrepareForReload
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerPrepareForReload()();

}

- (void)setAssetIsPreordered:(id)a3
{
  id v5;
  REBookReaderModuleHost *v6;
  REBookReaderModuleHost *v7;
  NSNumber_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.super.isa = (Class)a3;
  BookReaderModuleHost.setAssetIsPreordered(_:)(v8);

}

- (void)assetViewControllerWillOpen
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerWillOpen()();

}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.assetViewControllerDidOpen(animated:)(a3);

}

- (void)assetViewControllerWillEnterForeground
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerWillEnterForeground()();

}

- (void)assetViewControllerDidEnterBackground
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.assetViewControllerDidEnterBackground()();

}

- (void)assetViewControllerDidCloseAnimated:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.assetViewControllerDidClose(animated:)(a3);

}

- (int64_t)pageCountIncludingUpsell
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (!v2)
    return 1;
  if ((objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController), "respondsToSelector:", "pageCountIncludingUpsell") & 1) != 0)return (int64_t)objc_msgSend(v2, "pageCountIncludingUpsell");
  return 0;
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  REBookReaderModuleHost *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10090C830, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  BookReaderModuleHost.didPurchase(withProductProfile:completion:)((uint64_t)a3, (uint64_t)sub_10004DE24, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

- (void)setBuyButtonProgress:(float)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.setBuyButtonProgress(_:)(a3);

}

- (void)requestClose:(BOOL)a3
{
  REBookReaderModuleHost *v4;

  v4 = self;
  BookReaderModuleHost.requestClose(_:)(a3);

}

- (BCBookPositionProcessing)bookPositionProcessor
{
  return (BCBookPositionProcessing *)sub_100246CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___REBookReaderModuleHost_bookPositionProcessor);
}

- (void)setBookPositionProcessor:(id)a3
{
  sub_10050B224(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10050DA34);
}

- (REBookReaderModuleHost)initWithHostEnvironmentProvider:(id)a3 book:(id)a4 annotationProvider:(id)a5 storeController:(id)a6 styleManager:(id)a7 engagementManager:(id)a8
{
  objc_class *ObjectType;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  char *v23;
  uint64_t v24;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for ContentSizeCategoryManager(0);
  swift_unknownObjectRetain(a3);
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = static ContentSizeCategoryManager.shared.getter();
  v22 = objc_allocWithZone(ObjectType);
  v23 = sub_10050B608((uint64_t)a3, v16, v17, v18, v19, v20, v21);
  v24 = swift_getObjectType();
  swift_deallocPartialClassInstance(self, v24, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x34));
  return (REBookReaderModuleHost *)v23;
}

- (void)dealloc
{
  REBookReaderModuleHost *v2;

  v2 = self;
  BookReaderModuleHost.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___REBookReaderModuleHost_hostEnvironmentProvider));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___REBookReaderModuleHost_contentSizeCategoryManager));

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR___REBookReaderModuleHost_assetViewControllerDelegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___REBookReaderModuleHost_contentOpenAnimator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfoTracker));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfoChangeObserver));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController));
  v3 = (char *)self + OBJC_IVAR___REBookReaderModuleHost_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->hostEnvironmentProvider[OBJC_IVAR___REBookReaderModuleHost_hostID]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___REBookReaderModuleHost_methodCalls));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___REBookReaderModuleHost_bookPositionProcessor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___REBookReaderModuleHost_subscribers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___REBookReaderModuleHost_readerHostViewConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___REBookReaderModuleHost_fixedSizeConstraints));

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  REBookReaderModuleHost *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  BookReaderModuleHost.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (REBookReaderModuleHost)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10050E030();
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  REBookReaderModuleHost *v6;
  objc_super v7;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  sub_100509618();
  v7.receiver = v6;
  v7.super_class = ObjectType;
  -[REBookReaderModuleHost viewIsAppearing:](&v7, "viewIsAppearing:", v3);
  -[REBookReaderModuleHost bc_analyticsVisibilityUpdateSubtree](v6, "bc_analyticsVisibilityUpdateSubtree");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  -[REBookReaderModuleHost viewDidAppear:](&v6, "viewDidAppear:", v3);
  objc_msgSend(v4, "bc_analyticsVisibilityUpdateSubtree", v6.receiver, v6.super_class);
  swift_getObjectType();
  v5 = objc_msgSend(v4, "traitCollection");
  dispatch thunk of ContentSizeCategoryManaging.updateContentSizeCategory(withTraitCollection:)();

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  -[REBookReaderModuleHost viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, v4);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_10050CE84(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_10050CE84(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v2)
    return (unint64_t)objc_msgSend(v2, "supportedInterfaceOrientations");
  else
    return 30;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController));
}

- (REBookReaderModuleHost)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  REBookReaderModuleHost *result;

  v4 = a4;
  result = (REBookReaderModuleHost *)_swift_stdlib_reportUnimplementedInitializer("Books.BookReaderModuleHost", 26, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (id)transitionContentView
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController))
    self = *(REBookReaderModuleHost **)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  return -[REBookReaderModuleHost view](self, "view");
}

- (BOOL)prefersStatusBarHiddenDuringTransition
{
  REBookReaderModuleHost *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = BookReaderModuleHost.prefersStatusBarHiddenDuringTransition()();

  return v3;
}

- (BAUpSellData)upSellData
{
  return (BAUpSellData *)sub_10050D40C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_upSellData);
}

- (void)setUpSellData:(id)a3
{
  sub_10050D494((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setUpSellData_);
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return (BAAppAnalyticsAdditionalData *)sub_10050D40C((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_appAnalyticsAdditionalData);
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
  sub_10050D494((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAppAnalyticsAdditionalData_);
}

- (void)forceRepagination
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v2)
    objc_msgSend(v2, "forceRepagination");
}

- (void)setFinishedForAssetID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  REBookReaderModuleHost *v7;
  id v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v6
    && (objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController), "respondsToSelector:", "setFinishedForAssetID:") & 1) != 0)
  {
    v7 = self;
    v8 = v6;
    v9 = String._bridgeToObjectiveC()();
    objc_msgSend(v8, "setFinishedForAssetID:", v9);

    swift_bridgeObjectRelease(v5);
  }
  else
  {
    swift_bridgeObjectRelease(v5);
  }
}

@end
