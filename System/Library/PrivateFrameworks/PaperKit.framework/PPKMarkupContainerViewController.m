@implementation PPKMarkupContainerViewController

- (PPKMarkupContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (PPKMarkupContainerViewController *)MarkupContainerViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (PPKMarkupContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized MarkupContainerViewController.init(coder:)();
}

- (void)dealloc
{
  PPKMarkupContainerViewController *v3;
  uint64_t v4;
  PPKMarkupContainerViewController *v5;
  objc_super v6;

  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_loadContentTask))
  {
    v3 = self;
    v4 = swift_retain();
    MEMORY[0x1DF0E453C](v4, MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEDD18]);
    swift_release();
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MarkupContainerViewController();
  -[PPKMarkupContainerViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_fileCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_placeholderImageScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_imageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR___PPKMarkupContainerViewController_originalAsset, (uint64_t *)&demangling cache variable for type metadata for CRAsset?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_doubleTapGestureRecognizer));
  swift_release();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR___PPKMarkupContainerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor));
}

- (void)didBecomeActive:(id)a3
{
  void *v5;
  id v6;
  PPKMarkupContainerViewController *v7;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, sel_cancelPreviousPerformRequestsWithTarget_selector_object_, v7, sel_handleDidBecomeActive, 0);
  -[PPKMarkupContainerViewController performSelector:withObject:afterDelay:](v7, sel_performSelector_withObject_afterDelay_, sel_handleDidBecomeActive, 0, 0.25);

}

- (void)handleDidBecomeActive
{
  PPKMarkupContainerViewController *v2;

  v2 = self;
  MarkupContainerViewController.updateFirstResponderIfNecessary()();

}

- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;

  v4 = a3;
  v5 = self;
  specialized MarkupContainerViewController.handleSqueezeInteractionDidChangePaletteViewVisibilityNotification(_:)();

}

- (UIEdgeInsets)minimumContentInsets
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = (double *)((char *)self + OBJC_IVAR___PPKMarkupContainerViewController_minimumContentInsets);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setMinimumContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  PPKMarkupContainerViewController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  MarkupContainerViewController.minimumContentInsets.setter(top, left, bottom, right);

}

- (BOOL)findInteractionEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_findInteractionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setFindInteractionEnabled:(BOOL)a3
{
  PPKMarkupContainerViewController *v4;

  v4 = self;
  MarkupContainerViewController.findInteractionEnabled.setter(a3);

}

- (BOOL)isImageAnalysisEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_isImageAnalysisEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsImageAnalysisEnabled:(BOOL)a3
{
  BOOL *v5;
  void *v6;
  PPKMarkupContainerViewController *v7;
  id v8;

  v5 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_isImageAnalysisEnabled;
  swift_beginAccess();
  *v5 = a3;
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_imageViewController);
  if (v6)
  {
    v7 = self;
    v8 = v6;
    specialized CanvasElementViewController.isImageAnalysisEnabled.setter(a3);

  }
}

- (UIFindInteraction)findInteraction
{
  PPKMarkupContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = MarkupContainerViewController.findInteraction.getter();

  return (UIFindInteraction *)v3;
}

- (BOOL)documentIsLocked
{
  PPKMarkupContainerViewController *v2;
  char v3;

  v2 = self;
  v3 = MarkupContainerViewController.documentIsLocked.getter();

  return v3 & 1;
}

- (BOOL)canEncryptDocument
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.canEncryptDocument.getter();

  return v3 & 1;
}

- (PPKMarkupContainerViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___PPKMarkupContainerViewController_delegate;
  swift_beginAccess();
  return (PPKMarkupContainerViewControllerDelegate *)(id)MEMORY[0x1DF0E666C](v2);
}

- (void)setDelegate:(id)a3
{
  PPKMarkupContainerViewController *v4;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  v4 = self;
  MarkupContainerViewController.delegate.didset();

  swift_unknownObjectRelease();
}

- (BOOL)encryptPrivateMetadata
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_encryptPrivateMetadata;
  swift_beginAccess();
  return *v2;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_encryptPrivateMetadata;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)imageDescription
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.imageDescription.getter);
}

- (void)setImageDescription:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PPKMarkupContainerViewController *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  MarkupContainerViewController.imageDescription.setter(v4, v6);

}

- (BOOL)showThumbnailViewForMultipage
{
  uint64_t v2;
  _BYTE *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (v2)
  {
    v3 = (_BYTE *)(v2 + OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_isThumbnailViewCollapsed);
    swift_beginAccess();
    LOBYTE(v2) = *v3 ^ 1;
  }
  return v2 & 1;
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  char *v3;
  BOOL v5;
  char *v6;
  char v7;
  PPKMarkupContainerViewController *v8;
  char *v9;

  v3 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (v3)
  {
    v5 = !a3;
    v6 = &v3[OBJC_IVAR____TtC8PaperKit27PaperDocumentViewController_isThumbnailViewCollapsed];
    swift_beginAccess();
    v7 = *v6;
    *v6 = v5;
    v8 = self;
    v9 = v3;
    PaperDocumentViewController.isThumbnailViewCollapsed.didset(v7);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  PPKMarkupContainerViewController *v4;

  v4 = self;
  MarkupContainerViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  PPKMarkupContainerViewController *v2;

  v2 = self;
  MarkupContainerViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  PPKMarkupContainerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  MarkupContainerViewController.viewWillTransition(to:with:)(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  PPKMarkupContainerViewController *v5;
  id v6;
  UITraitCollection_optional v7;

  v6 = a3;
  v5 = self;
  v7.value.super.isa = (Class)a3;
  MarkupContainerViewController.traitCollectionDidChange(_:)(v7);

}

- (void)loadFromData:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  void (*v10)(void);
  id v11;
  PPKMarkupContainerViewController *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;

  v10 = (void (*)(void))_Block_copy(a6);
  v11 = a3;
  v12 = self;
  v18 = a4;
  v13 = a5;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  if (v10)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v10;
    v10 = (void (*)(void))thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  }
  else
  {
    v17 = 0;
  }
  MarkupContainerViewController.load(fromData:with:placeholderImage:completionHandler:)(v14, v16, (uint64_t)v18, v13, v10, v17);
  outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v10);
  outlined consume of Data._Representation(v14, v16);

}

- (void)loadFromURL:(id)a3 with:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(void);
  uint64_t v16;
  PPKMarkupContainerViewController *v17;
  id v18;
  id v19;
  uint64_t v20;

  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (void (*)(void))_Block_copy(a6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v15 = (void (*)(void))partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  }
  else
  {
    v16 = 0;
  }
  v17 = self;
  v18 = a5;
  v19 = a4;
  MarkupContainerViewController.load(fromURL:with:placeholderImage:completionHandler:)((uint64_t)v14, (uint64_t)a4, a5, v15, v16);
  outlined consume of (@escaping @callee_guaranteed () -> ())?((uint64_t)v15);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  id v19;
  PPKMarkupContainerViewController *v20;
  _BYTE v22[12];
  _BOOL4 v23;

  v23 = a6;
  v9 = type metadata accessor for UTType();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for URL();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = &v22[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = a4;
  v20 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a5) = MarkupContainerViewController.write(to:imageType:error:embeddingSourceImageAndEditModel:options:)((uint64_t)v18, (uint64_t)v13, (uint64_t)a5, v23, 0);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v9);
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
  return a5 & 1;
}

- (BOOL)writeTo:(id)a3 imageType:(id)a4 error:(id *)a5 embeddingSourceImageAndEditModel:(BOOL)a6 options:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  PPKMarkupContainerViewController *v21;
  uint64_t v23;
  id *v24;
  _BOOL4 v25;
  uint64_t v26;

  v25 = a6;
  v24 = a5;
  v26 = type metadata accessor for UTType();
  v10 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26, v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = a4;
  v20 = a7;
  v21 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a7) = MarkupContainerViewController.write(to:imageType:error:embeddingSourceImageAndEditModel:options:)((uint64_t)v18, (uint64_t)v13, (uint64_t)v24, v25, a7);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v26);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  return a7 & 1;
}

- (void)writeTo:(NSURL *)a3 imageType:(UTType *)a4 embeddingSourceImageAndEditModel:(BOOL)a5 options:(NSDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  NSURL *v22;
  UTType *v23;
  NSDictionary *v24;
  PPKMarkupContainerViewController *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  *(_BYTE *)(v18 + 32) = a5;
  *(_QWORD *)(v18 + 40) = a6;
  *(_QWORD *)(v18 + 48) = v17;
  *(_QWORD *)(v18 + 56) = self;
  v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &async function pointer to partial apply for @objc closure #1 in MarkupContainerViewController.write(to:imageType:embeddingSourceImageAndEditModel:options:);
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &_sIeghH_IeAgH_TRTATu;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = a6;
  v25 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v16, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v21);
  swift_release();
}

- (id)dataRepresentationWithError:(id *)a3
{
  PPKMarkupContainerViewController *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  Class isa;

  v4 = self;
  v5 = MarkupContainerViewController.dataRepresentation(withError:)(a3);
  v7 = v6;

  if (v7 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)v5, v7);
  }
  return isa;
}

- (id)archivedModelData
{
  PPKMarkupContainerViewController *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = MarkupContainerViewController.archivedModelData()();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v3, v5);
  }
  return isa;
}

- (UIScrollView)contentViewScrollView
{
  PPKMarkupContainerViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  MarkupContainerViewController.contentViewScrollView.getter();
  v4 = v3;

  return (UIScrollView *)v4;
}

- (BOOL)annotationEditingEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_annotationEditingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  BOOL *v5;
  PPKMarkupContainerViewController *v6;

  v5 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_annotationEditingEnabled;
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  MarkupContainerViewController.annotationEditingEnabled.didset();

}

- (BOOL)allEditingDisabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_allEditingDisabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  @objc MarkupContainerViewController.formFillingEnabled.setter((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___PPKMarkupContainerViewController_allEditingDisabled);
}

- (BOOL)pencilAlwaysDraws
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_pencilAlwaysDraws;
  swift_beginAccess();
  return *v2;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  @objc MarkupContainerViewController.formFillingEnabled.setter((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___PPKMarkupContainerViewController_pencilAlwaysDraws);
}

- (BOOL)formFillingEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_formFillingEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setFormFillingEnabled:(BOOL)a3
{
  @objc MarkupContainerViewController.formFillingEnabled.setter((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___PPKMarkupContainerViewController_formFillingEnabled);
}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  PPKMarkupContainerViewController *v6;

  v6 = self;
  MarkupContainerViewController.setFormFillingEnabled(_:didUseBanner:)(a3, a4);

}

- (BOOL)toolbarHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_toolbarHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setToolbarHidden:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_toolbarHidden;
  swift_beginAccess();
  *v4 = a3;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager));
}

- (BOOL)validateUndo:(id)a3
{
  return @objc MarkupContainerViewController.validateUndo(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canUndo);
}

- (BOOL)validateRedo:(id)a3
{
  return @objc MarkupContainerViewController.validateUndo(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_canRedo);
}

- (void)undo:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager), sel_undo, a3);
}

- (void)redo:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager), sel_redo, a3);
}

- (void)revert:(id)a3
{
  void *v3;
  PPKMarkupContainerViewController *v5;
  id v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_contentUndoManager);
  if (v3)
  {
    swift_unknownObjectRetain();
    v5 = self;
    v6 = v3;
    if (objc_msgSend(v6, sel_canUndo))
    {
      do
        objc_msgSend(v6, sel_undo);
      while ((objc_msgSend(v6, sel_canUndo) & 1) != 0);
    }
    objc_msgSend(v6, sel_removeAllActions);
    swift_unknownObjectRelease();

  }
}

- (UIColor)backgroundColor
{
  PPKMarkupContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = MarkupContainerViewController.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  PPKMarkupContainerViewController *v6;

  v5 = a3;
  v6 = self;
  MarkupContainerViewController.backgroundColor.setter(a3);

}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MarkupContainerViewController.isTouchInThumbnailView(_:)((UITouch)v4);

  return self & 1;
}

- (BOOL)isTouchInPageLabelView:(id)a3
{
  void *v3;
  id v5;
  PPKMarkupContainerViewController *v6;
  id v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (!v3)
    return 0;
  v5 = a3;
  v6 = self;
  v7 = v3;
  v8 = PaperDocumentViewController.pageLabelView.getter();

  objc_msgSend(v5, sel_locationInView_, v8);
  LOBYTE(v7) = objc_msgSend(v8, sel_pointInside_withEvent_, 0);

  return (char)v7;
}

- (BOOL)isTouchInBannerView:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MarkupContainerViewController.isTouchInBannerView(_:)((UITouch)v4);

  return self & 1;
}

- (BOOL)viewAcceptSingleTouch:(id)a3
{
  objc_class *v4;
  PPKMarkupContainerViewController *v5;
  UITouch v6;

  v4 = (objc_class *)a3;
  v5 = self;
  v6.super.isa = v4;
  LOBYTE(self) = MarkupContainerViewController.viewAcceptSingleTouch(_:)(v6);

  return self & 1;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MarkupContainerViewController.acceptSingleTouch(_:)((UITouch)v4);

  return self & 1;
}

- (UIView)bannerView
{
  return (UIView *)MarkupContainerViewController.bannerView.getter();
}

- (void)showBannerViewWith:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;

  v4 = a3;
  v5 = self;
  MarkupContainerViewController.showBannerView(with:)(v4);

}

- (BOOL)showBannerView
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PPKMarkupContainerViewController_showBannerView;
  swift_beginAccess();
  return *v2;
}

- (void)setShowBannerView:(BOOL)a3
{
  PPKMarkupContainerViewController *v4;

  v4 = self;
  MarkupContainerViewController.showBannerView.setter(a3);

}

- (CGRect)pdfFrame
{
  PPKMarkupContainerViewController *v2;
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
  CGRect result;

  v2 = self;
  MarkupContainerViewController.pdfFrame.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIScrollView)pdfScrollView
{
  PPKMarkupContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = MarkupContainerViewController.pdfScrollView.getter();

  return (UIScrollView *)v3;
}

- (UIColor)pdfBackgroundColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setPdfBackgroundColor:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  PPKMarkupContainerViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfBackgroundColor);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  MarkupContainerViewController.updateBackgroundColor()();
}

- (BOOL)canBecomeFirstResponder
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_canBecomeFirstResponder);

  return v3 & 1;
}

- (BOOL)becomeFirstResponder
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_becomeFirstResponder);

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.canBecomeFirstResponder.getter((SEL *)&selRef_resignFirstResponder);

  return v3 & 1;
}

- (void)pdfViewScaleChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  PPKMarkupContainerViewController *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  MarkupContainerViewController.pdfViewScaleChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)doubleTapped:(id)a3
{
  UITapGestureRecognizer *v4;
  PPKMarkupContainerViewController *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  MarkupContainerViewController.doubleTapped(_:)(v4);

}

- (BOOL)isInteractionActive
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.isInteractionActive.getter();

  return v3 & 1;
}

- (BOOL)hasResultsForVisualSearch
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.hasResultsForVisualSearch.getter();

  return v3 & 1;
}

- (BOOL)isVisualSearchEnabled
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.isVisualSearchEnabled.getter();

  return v3 & 1;
}

- (void)setShouldHighlightTextAndODAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  PPKMarkupContainerViewController *v4;

  v3 = a3;
  v4 = self;
  MarkupContainerViewController.shouldHighlightTextAndODAfterNextAnalysis.setter((char *)v3);

}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  PPKMarkupContainerViewController *v2;
  char v3;

  v2 = self;
  v3 = MarkupContainerViewController.shouldEnterVisualSearchAfterNextAnalysis.getter();

  return v3 & 1;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  PPKMarkupContainerViewController *v4;

  v3 = a3;
  v4 = self;
  MarkupContainerViewController.shouldEnterVisualSearchAfterNextAnalysis.setter((char *)v3);

}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  PPKMarkupContainerViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MarkupContainerViewController.shouldUpliftSubjectAfterNextAnalysis.getter();

  return v3 & 1;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  PPKMarkupContainerViewController *v4;

  v3 = a3;
  v4 = self;
  MarkupContainerViewController.shouldUpliftSubjectAfterNextAnalysis.setter((char *)v3);

}

- (NSString)infoButtonGlyphName
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.infoButtonGlyphName.getter);
}

- (NSString)filledInfoButtonGlyphName
{
  return (NSString *)@objc MarkupContainerViewController.imageDescription.getter(self, (uint64_t)a2, MarkupContainerViewController.filledInfoButtonGlyphName.getter);
}

- (void)updateForFullscreen:(BOOL)a3 animated:(BOOL)a4
{
  void *v4;
  PPKMarkupContainerViewController *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PPKMarkupContainerViewController_pdfViewController);
  if (v4)
  {
    v6 = self;
    v7 = v4;
    PaperDocumentViewController.showPageNumberOverlayIfNeeded(animated:)(a4);

  }
}

- (void)setShouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  PPKMarkupContainerViewController *v6;

  v6 = self;
  MarkupContainerViewController.setShouldHideMarkupOverlays(_:animated:)(a3, a4);

}

- (void)infoButtonTapped
{
  PPKMarkupContainerViewController *v2;

  v2 = self;
  MarkupContainerViewController.infoButtonTapped()();

}

- (void)setupAndStartImageAnalysisIfNeeded
{
  PPKMarkupContainerViewController *v2;

  v2 = self;
  MarkupContainerViewController.setupAndStartImageAnalysisIfNeeded()();

}

- (id)viewForZoomingInScrollView:(id)a3
{
  id v4;
  PPKMarkupContainerViewController *v5;
  id v6;
  unint64_t v7;
  id result;
  void *v9;
  id v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_subviews);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIView);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = (void *)_CocoaArrayWrapper.endIndex.getter();
    result = (id)swift_bridgeObjectRelease();
    if (!v9)
      goto LABEL_7;
  }
  else
  {
    v9 = *(void **)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v9)
    {
LABEL_7:

      swift_bridgeObjectRelease();
      return v9;
    }
  }
  if ((v7 & 0xC000000000000001) != 0)
  {
    v10 = (id)MEMORY[0x1DF0E4D64](0, v7);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v10 = *(id *)(v7 + 32);
LABEL_6:
    v9 = v10;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

@end
