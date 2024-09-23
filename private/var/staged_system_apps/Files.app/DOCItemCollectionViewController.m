@implementation DOCItemCollectionViewController

- (NSString)title
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCItemCollectionViewController.title.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100042448(v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (UIView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  return -[DOCItemCollectionViewController view](&v3, "view");
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  void (*v15)(void);
  id v16;
  id v17;
  _TtC5Files31DOCItemCollectionViewController *v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for DOCItemCollectionCell();
  v14 = (_QWORD *)swift_dynamicCastClass(a4, v13);
  if (v14)
  {
    v15 = *(void (**)(void))((swift_isaMask & *v14) + 0x218);
    v16 = a3;
    v17 = a4;
    v18 = self;
    v15();

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  _TtC5Files31DOCItemCollectionViewController *v16;
  uint64_t v17;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_100063478(v15, (uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  objc_class *v4;
  DOCContentUnavailableConfigurationState v5;
  NSCopying *impl;

  v4 = (objc_class *)a3;
  v5.super._impl = (NSCopying *)self;
  impl = v5.super._impl;
  v5.super.super.isa = v4;
  DOCItemCollectionViewController.docUpdateContentUnavailableConfiguration(using:)(v5);

}

- (DOCContentUnavailableConfigurationState)docContentUnavailableConfigurationState
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  id v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.docContentUnavailableConfigurationState.getter();

  return (DOCContentUnavailableConfigurationState *)v3;
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  DOCItemCollectionViewController.effectiveAppearanceDidChange(_:)(v4);

}

- (BOOL)hidesNavigationBackButton
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  char v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.hidesNavigationBackButton.getter();

  return v3 & 1;
}

- (BOOL)wantsAppearanceOverride
{
  return 1;
}

- (BOOL)establishFirstResponder
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  id v3;
  unsigned __int8 v4;

  v2 = self;
  -[DOCItemCollectionViewController setNeedsFocusUpdate](v2, "setNeedsFocusUpdate");
  v3 = objc_msgSend((id)objc_opt_self(DOCKeyboardFocusManager), "sharedManager");
  v4 = objc_msgSend(v3, "requestCurrentFocus:", v2);

  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return -[DOCItemCollectionViewController _appearState](self, "_appearState") - 1 < 2;
}

- (void)viewWillLayoutSubviews
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  DOCItemCollectionViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  DOCItemCollectionViewController.viewDidLayoutSubviews()();

}

- (BOOL)becomeKeyboardFocused
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.becomeKeyboardFocused()();

  return v3;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_configuration);
  v8 = self;
  if (objc_msgSend(v7, "shouldAdjustContentInset"))
  {
    v12.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    -[DOCItemCollectionViewController _setContentOverlayInsets:](&v12, "_setContentOverlayInsets:", top, left, bottom, right, v8, v12.super_class, v13.receiver, v13.super_class);
  }
  else
  {
    v9 = UIEdgeInsetsZero.left;
    v10 = UIEdgeInsetsZero.bottom;
    v11 = UIEdgeInsetsZero.right;
    v13.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    -[DOCItemCollectionViewController _setContentOverlayInsets:](&v13, "_setContentOverlayInsets:", UIEdgeInsetsZero.top, v9, v10, v11, v12.receiver, v12.super_class, v8, v13.super_class);
  }

}

- (BOOL)acceptsKeyboardFocus
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  char v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.acceptsKeyboardFocus.getter();

  return v3 & 1;
}

- (void)setActionReporting:(id)a3
{
  _TtC5Files31DOCItemCollectionViewController *v5;

  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting, a3);
  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_10002C4B8();

  swift_unknownObjectRelease(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  char v9;
  _TtC5Files31DOCItemCollectionViewController *v10;
  UIWindow_optional v11;

  v7 = a3;
  v8 = self;
  v9 = (char)v8;
  v10 = v8;
  v11.value.super.super.super.isa = (Class)a3;
  v11.is_nil = a4;
  DOCItemCollectionViewController.viewDidMove(to:shouldAppearOrDisappear:)(v11, v9);

}

- (void)viewDidLoad
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  DOCItemCollectionViewController.viewDidLoad()();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  DOCItemCollectionViewController.scrollViewDidScroll(_:)((UIScrollView)v4);

}

- (void)loadView
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  DOCItemCollectionViewController.loadView()();

}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5Files31DOCItemCollectionViewController *v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  sub_1000E1990(a4, (uint64_t)v12);
  v16 = v15;

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10004F2F0(0, (unint64_t *)&unk_100648460, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  char *v16;
  Class isa;
  uint64_t v19;

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = sub_1000E1B88(a4, (uint64_t)v13);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_10004F2F0(0, (unint64_t *)&unk_100648460, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  sub_1000E01B0(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1000E1EC8);
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1000E1FB8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  sub_1000E0260(self, (uint64_t)a2, a3, (uint64_t)a4, _s5Files31DOCItemCollectionViewControllerC010collectionD0_17dragSessionDidEndySo012UICollectionD0C_So06UIDragH0_ptF_0);
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  _TtC5Files31DOCItemCollectionViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  DOCItemCollectionViewController.collectionView(_:performDropWith:)(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  _TtC5Files31DOCItemCollectionViewController *v7;
  char v8;
  char v9;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1000E21CC(a4);
  v9 = v8;

  swift_unknownObjectRelease(a4);
  return v9 & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  DOCItemCollectionViewController.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)(v14, a4, (uint64_t)v11);
  v17 = v16;

  swift_unknownObjectRelease(a4);
  sub_10000CB4C((uint64_t)v11, (uint64_t *)&unk_100642710);
  return v17;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  sub_1000E01B0(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1000E2770);
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  uint64_t v4;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentDropSession);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentDropSession) = 0;
  swift_unknownObjectRelease(v4);
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  sub_1000E0260(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))_s5Files31DOCItemCollectionViewControllerC010collectionD0_18dropSessionDidExitySo012UICollectionD0C_So06UIDropH0_ptF_0);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t result;
  _TtC5Files31DOCItemCollectionViewController *v18;
  id v19;
  void *v20;
  int64_t v21;
  uint64_t v22;

  v9 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v22 - v13;
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v15 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    v15 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  }
  sub_1000E26E0((uint64_t)v14, (uint64_t)v11);
  type metadata accessor for IndexPath(0);
  v16 = *(_QWORD *)(v15 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_unknownObjectRetain(a4);
    v18 = self;
    v19 = a3;
    v20 = sub_1000E1318((uint64_t)v11);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
    if (v20)
    {
      swift_getObjectType(v20);
      v21 = sub_1003F4BFC();
      swift_unknownObjectRelease(a4);

      swift_unknownObjectRelease(v20);
    }
    else
    {
      swift_unknownObjectRelease(a4);

      v21 = 0;
    }

    sub_10000CB4C((uint64_t)v14, (uint64_t *)&unk_100642710);
    return v21;
  }
  return result;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  void *v16;
  uint64_t v18;

  v9 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain(a4);
  v15 = self;
  v16 = DOCItemCollectionViewController._collectionView(_:dataOwnerFor:withDestinationIndexPath:)(a3, a4, (uint64_t)v11);

  swift_unknownObjectRelease(a4);
  sub_10000CB4C((uint64_t)v11, (uint64_t *)&unk_100642710);
  return (int64_t)v16;
}

- (void)pasteboardPasteInCollectionView:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10014BF28);
}

- (void)pasteboardMoveToCollectionView:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10014C518);
}

- (void)startFolderCreation:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10014CAE8);
}

- (void)displayInfoForCurrentItem:(id)a3
{
  _TtC5Files31DOCItemCollectionViewController *v5;
  uint64_t v6;
  _TtC5Files31DOCItemCollectionViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_10014CC10((uint64_t)v8);

  sub_10000CB4C((uint64_t)v8, &qword_100642730);
}

- (void)scanDocument:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_10014D2BC);
}

- (_TtP5Files27DOCScannedDocumentReceiving_)doc_documentScannerReceivingTarget
{
  void *Strong;
  void *v3;
  __objc2_prot *v5;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_interactionDelegate, a2);
  if (Strong)
  {
    v3 = Strong;
    v5 = &OBJC_PROTOCOL____TtP5Files27DOCScannedDocumentReceiving_;
    Strong = (void *)swift_dynamicCastObjCProtocolConditional(Strong, 1, &v5);
    if (!Strong)
    {
      swift_unknownObjectRelease(v3);
      Strong = 0;
    }
  }
  return (_TtP5Files27DOCScannedDocumentReceiving_ *)Strong;
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  uint64_t v7;
  id v8;
  _TtC5Files31DOCItemCollectionViewController *v9;
  id v10;
  id v11;

  v7 = swift_allocObject(&unk_1005CA840, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = a3;
  v9 = self;
  v10 = v8;
  v11 = a4;
  sub_100469270(v11, (uint64_t)sub_100152054, v7);

  swift_release(v7);
}

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting, a2);
}

- (_TtC5Files31DOCItemCollectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001BE4C4();
}

- (NSString)description
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  DOCItemCollectionViewController.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (UITraitCollection)traitCollection
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  id v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.traitCollection.getter();

  return (UITraitCollection *)v3;
}

- (int64_t)displayMode
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_displayMode);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_displayMode, v4, 0, 0);
  return *v2;
}

- (void)setDisplayMode:(int64_t)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.displayMode.setter(a3);

}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC5Files31DOCItemCollectionViewController *v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  NSArray *v9;
  uint64_t v10;
  id v11;
  Class isa;
  uint64_t v14;
  objc_super v15;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController__loadedCollectionView);
  if (v3)
  {
    v4 = sub_10006922C((uint64_t *)&unk_1006441A0);
    v5 = swift_allocObject(v4, 40, 7);
    *(_OWORD *)(v5 + 16) = xmmword_1004D9B40;
    *(_QWORD *)(v5 + 32) = v3;
    v14 = v5;
    specialized Array._endMutation()(v5);
    v6 = v14;
    v7 = self;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
    v8 = self;
    v9 = -[DOCItemCollectionViewController preferredFocusEnvironments](&v15, "preferredFocusEnvironments");
    v10 = sub_10006922C((uint64_t *)&unk_100648EE0);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

    v3 = 0;
  }
  v11 = v3;

  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (UISplitViewController)splitViewController
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  DOCItemCollectionViewController.splitViewController.getter();
  v4 = v3;

  return (UISplitViewController *)v4;
}

- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5
{
  sub_1001A2BB0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))DOCItemCollectionViewController.prepareSnapshotForSplitStateChanging(fromState:toState:alongside:));
}

- (void)setTitle:(id)a3
{
  self;
  _s5Files31DOCItemCollectionViewControllerC5titleSSSgvs_0();
}

- (void)dealloc
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  DOCItemCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_tipsManager));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___familySharedFolderTip));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_subscriptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_pendingTasks));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_collectionViewPool));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_emptyTargetedPreview));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_existingOverlayTitleBeforeRename]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_tipsHeaderView));
  sub_100068588((Class *)((char *)&self->super.super.super.super.super.isa
                        + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_familyFetcher));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentDragSession));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentDropSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentClickyOrbMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentClickyOrbConfiguration));
  sub_100087534(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_blockToRunWhenMenuInteractionFinishedDismissing), *(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_blockToRunWhenMenuInteractionFinishedDismissing]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_registeredItemCellClassByIdentifier));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemHierarchyEventListener);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_sortOptionsAccessibilityModelView));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_lastDropIndexPath, (uint64_t *)&unk_100642710);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_dropTargetHighlightedCell));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_scrollDragSessionContext));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_titleMenuContext));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_pendingTitleMenuContext));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration);
  v4 = *(void **)&self->super.eventReporting[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration
                                           + 8];
  v5 = *(_QWORD *)&self->super.actionReporting[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration];
  v6 = *(void **)&self->super.overlayDelegate[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration];
  v7 = *(_QWORD *)&self->super.overlayDelegate[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration
                                             + 8];
  v8 = *(void **)&self->super.needsOverlayUpdateWithAnimation[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionConfiguration];

  swift_bridgeObjectRelease(v5);
  swift_unknownObjectRelease(v7);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_urlToItemCache));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_interactionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_linkCreateFolderInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_linkTrashFileInteraction));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___visibleItemsCorpus));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionListCellIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionGridCellIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionLargeTextListCellIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionCreateCellIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionStatusSectionFooterIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionStatusSectionEmptyFooterIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionStatusSectionHeaderIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionGroupedSectionHeaderIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemCollectionStatusSectionEmptyHeaderIdentifier]);
  sub_1001D0614(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentLoadingProgress), *(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentLoadingProgress]);
  swift_unknownObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentTransitionVisibility]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_cellContentPool));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_thumbnailLoadingPool));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_nodeCollection));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentFocusEngineIndexPath, (uint64_t *)&unk_100642710);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemsController);
  v10 = *(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemsController];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.eventReporting[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemsController]);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_shouldShowAllFilenameExtensionPublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemsBeforeModelUpdate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_gatheringObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_itemsOriginObservation));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_activeThumbnailBatchingTokens));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_indexPathForRememberedFocusNode, (uint64_t *)&unk_100642710);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_postBatchUpdateBlocks));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_additionalHeaderContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_additionalHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_syncStateHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_typeToFocusController));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___listLayoutConfiguration, &qword_100646B38);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController__loadedCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController__footerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage____headerContainerView));
  sub_10008D9C4(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___promptView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_presentedCollaborationViewController);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_shareBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_stackViewMetricsSourceTraits));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_moreActionsAlert);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_moreActionsBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enumerationProperties));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enumerationIdentifier));
  sub_100144F34(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_sortingDescriptor), *(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_sortingDescriptor], *(_QWORD *)&self->super.eventReporting[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_sortingDescriptor]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_collectionViewLayoutTraits));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_sourceEjectableObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_lastPreviewedFPItem));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController__selectedChildNode));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_registrationForBrowserLayoutChanges));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_registrationForUIPChanges));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_registrationForInsetChanges));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_lastAppliedLayoutContext, &qword_100646B40);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_inlineRenameController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_preSnapshotConfiguration));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___notificationsController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.configuration[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___untitledFolderName]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_pendingNodeContexts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enqueuedNodesToReveal));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enqueuedNodeToSelectAndScroll));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enqueuedNodeScrollPositionInfo, &qword_100646B48);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_bbiStorage));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController____lazy_storage___viewOptionsViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_viewOptionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enqueuedCreatedFolderToBeRenamed));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_enqueuedNodesToBeMovedIntoCreatedFolder));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_newFolderReadyForRenameTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_repositionRenamingCellTimer));
  v11 = *(char **)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_activeDragStrongReferenceToSelf);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_activeDragStrongReferenceToSelf) = 0;
  if (v11)
  {
    while (1)
    {
      v14 = v11;
      if (!swift_isUniquelyReferenced())
        break;
      v12 = *(char **)&v14[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_activeDragStrongReferenceToSelf];
      v13 = v12;

      v11 = v12;
      if (!v12)
        goto LABEL_6;
    }
    v11 = v14;
  }
LABEL_6:

}

- (UIEdgeInsets)_contentOverlayInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  UIEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  -[DOCItemCollectionViewController _contentOverlayInsets](&v6, "_contentOverlayInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)selectAllItems
{
  uint64_t v2;
  _TtC5Files31DOCItemCollectionViewController *v4;

  v2 = OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) = 1;
    v4 = self;
    sub_1001834DC((char *)v4);
    *((_BYTE *)&self->super.super.super.super.super.isa + v2) = 0;

  }
}

- (void)deselectAllItems
{
  uint64_t v2;
  _TtC5Files31DOCItemCollectionViewController *v4;

  v2 = OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) = 1;
    v4 = self;
    sub_10009A978(0, (uint64_t)_swiftEmptyArrayStorage);
    *((_BYTE *)&self->super.super.super.super.super.isa + v2) = 0;

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5Files31DOCItemCollectionViewController *v6;
  _TtC5Files31DOCItemCollectionViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  DOCItemCollectionViewController.traitCollectionDidChange(_:)(v8);

}

- (void)_doc_performLiveResizeSkippedWork
{
  int v2;
  _TtC5Files31DOCItemCollectionViewController *v3;
  UITraitCollection *v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v2 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_liveResizeDidSkip_computeStackMetrics);
  v3 = self;
  v5 = v3;
  if (v2 == 1)
  {
    sub_100079D3C();
    v3 = v5;
  }
  if (*((_BYTE *)&v3->super.super.super.super.super.isa
       + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_liveResizeDidSkip_updateSnapshot) == 1)
  {
    v4 = -[DOCItemCollectionViewController traitCollection](v3, "traitCollection");
    sub_10005897C(v4, 0, 0, 1, 1);

    v3 = (_TtC5Files31DOCItemCollectionViewController *)v4;
  }

}

- (void)setView:(id)a3
{
  char *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  v4 = (char *)v6.receiver;
  v5 = a3;
  -[DOCItemCollectionViewController setView:](&v6, "setView:", v5);
  objc_msgSend(v4, "setContentScrollView:forEdge:", *(_QWORD *)&v4[OBJC_IVAR____TtC5Files31DOCItemCollectionViewController__loadedCollectionView], 15, v6.receiver, v6.super_class);

}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_msgSend((id)objc_opt_self(DOCUndoManager), "shared");
}

- (BOOL)resignFirstResponder
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = DOCItemCollectionViewController.resignFirstResponder()();

  return v3;
}

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemCollectionViewController(0);
  return -[DOCItemCollectionViewController becomeFirstResponder](&v3, "becomeFirstResponder");
}

- (void)performKeyboardFocusKeyCommand:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001882EC(v4);

}

- (void)selectAll:(id)a3
{
  sub_1001889F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))DOCItemCollectionViewController.selectAll(_:));
}

- (void)copy:(id)a3
{
  sub_1001889F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))DOCItemCollectionViewController.copy(_:));
}

- (void)paste:(id)a3
{
  sub_1001889F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))DOCItemCollectionViewController.paste(_:));
}

- (void)delete:(id)a3
{
  sub_1001889F8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))DOCItemCollectionViewController.delete(_:));
}

- (void)moveHere:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100188C58);
}

- (void)createFolder:(id)a3
{
  sub_10014CA6C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100188D38);
}

- (void)didUpdateCollectionViewIsScrollEnabledWithNotification:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10018981C(v4);

}

- (void)didUpdateCollectionViewContentOffsetWithNotification:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001899E8(v4);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.viewIsAppearing(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  DOCItemCollectionViewController.viewDidDisappear(_:)(a3);

}

- (BOOL)needsForcedUnderNavBarAppearanceOnAppear
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_needsForcedUnderNavBarAppearanceOnAppear);
}

- (void)setNeedsForcedUnderNavBarAppearanceOnAppear:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_needsForcedUnderNavBarAppearanceOnAppear) = a3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5Files31DOCItemCollectionViewController *v6;

  v6 = self;
  DOCItemCollectionViewController.setEditing(_:animated:)(a3, a4);

}

- (BOOL)forceEditingMode
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_forceEditingMode);
}

- (void)setForceEditingMode:(BOOL)a3
{
  _TtC5Files31DOCItemCollectionViewController *v4;

  v4 = self;
  sub_10018FD1C(a3);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC5Files31DOCItemCollectionViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  DOCItemCollectionViewController.willTransition(to:with:)(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC5Files31DOCItemCollectionViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  DOCItemCollectionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)menuControllerWillShow
{
  sub_100191BBC(self, (uint64_t)a2, sub_1001626AC);
}

- (void)menuControllerWillHide
{
  sub_100191BBC(self, (uint64_t)a2, sub_10000F6EC);
}

- (void)wantsToCreateNewFile
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  void *v3;
  id v4;

  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_documentManager))
  {
    v2 = self;
    DOCItemCollectionViewController.getCurrentLocation()();
    v4 = v3;
    sub_10041A310(v3);

  }
}

- (void)wantsToCreateNewFolder
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  sub_100197878();

}

- (BOOL)accessibilityIsInListMode
{
  _QWORD *v2;
  _BYTE v4[24];

  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_displayMode);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_displayMode, v4, 0, 0);
  return *v2 == 1;
}

- (BOOL)accessibilityIsRenamingInline
{
  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_endingInlineRename) & 1) != 0)
    return 0;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_inlineRenameController))
    return 1;
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_preparingForInlineRename);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  _s5Files31DOCItemCollectionViewControllerC06scrollD17WillBeginDraggingyySo08UIScrollD0CF_0();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC5Files31DOCItemCollectionViewController *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    _s5Files31DOCItemCollectionViewControllerC06scrollD18DidEndDeceleratingyySo08UIScrollD0CF_0();

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  _s5Files31DOCItemCollectionViewControllerC06scrollD18DidEndDeceleratingyySo08UIScrollD0CF_0();

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_100198E28(self, (uint64_t)a2, a3, (uint64_t)a4, sub_1001C8850);
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  sub_100198E28(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1001C8A70);
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5;
  _TtC5Files31DOCItemCollectionViewController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v5 = a3;
  v6 = self;
  _s5Files31DOCItemCollectionViewControllerC010collectionD0_030targetContentOffsetForProposedhI0So7CGPointVSo012UICollectionD0C_AGtF_0(v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1001C8C90((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_100199994(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))DOCItemCollectionViewController.collectionView(_:shouldDeselectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_100199994(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))DOCItemCollectionViewController.collectionView(_:shouldSelectItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sub_10019A06C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_1001C8FEC);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  sub_10019A06C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(char *))sub_1001C9A60);
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10019191C((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  DOCItemCollectionViewController.collectionView(_:performPrimaryActionForItemAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 canPerformAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  uint64_t v16;
  id v17;
  _TtC5Files31DOCItemCollectionViewController *v18;
  unsigned __int8 v19;
  _OWORD v21[2];

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  if (a6)
  {
    v14 = a3;
    v15 = self;
    v16 = swift_unknownObjectRetain(a6);
    _bridgeAnyObjectToAny(_:)(v21, v16);
    swift_unknownObjectRelease(a6);
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    v17 = a3;
    v18 = self;
  }
  v19 = sub_1001C9BC8((uint64_t)v13);

  sub_10000CB4C((uint64_t)v21, &qword_100642730);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v19 & 1;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Files31DOCItemCollectionViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001C9DA0(v9);

}

- (void)collectionView:(id)a3 performAction:(SEL)a4 forItemAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  uint64_t v16;
  _OWORD v17[2];

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  if (a6)
  {
    v14 = a3;
    v15 = self;
    v16 = swift_unknownObjectRetain(a6);
    _bridgeAnyObjectToAny(_:)(v17, v16);

    swift_unknownObjectRelease(a6);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_10000CB4C((uint64_t)v17, &qword_100642730);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5Files31DOCItemCollectionViewController *v14;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  swift_unknownObjectRetain(a5);
  v14 = self;
  LOBYTE(self) = _s5Files31DOCItemCollectionViewControllerC010collectionD0_22shouldSpringLoadItemAt4withSbSo012UICollectionD0C_10Foundation9IndexPathVSo32UISpringLoadedInteractionContext_ptF_0(v13, (uint64_t)v12);

  swift_unknownObjectRelease(a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_10019DF18();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Files31DOCItemCollectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  DOCItemCollectionViewController.collectionView(_:didBeginMultipleSelectionInteractionAt:)(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC5Files31DOCItemCollectionViewController *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v5 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  DOCItemCollectionViewController.indexPathForPreferredFocusedView(in:)(v7);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return isa;
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_isSelectingUsingGesture) = 0;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  _s5Files31DOCItemCollectionViewControllerC010collectionD0_22willDisplayContextMenu8animatorySo012UICollectionD0C_So09UIContextJ13ConfigurationCSo0mJ20InteractionAnimating_pSgtF_0(v8, v9);

  swift_unknownObjectRelease(a5);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_1001CA2B4(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  id v16;
  uint64_t v18;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = DOCItemCollectionViewController.collectionView(_:contextMenuConfiguration:highlightPreviewForItemAt:)(v13, (uint64_t)v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)DOCItemCollectionViewController.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)((UICollectionView)v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  Class isa;
  id v17;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v17 = -[DOCItemCollectionViewController collectionView:contextMenuConfiguration:highlightPreviewForItemAtIndexPath:](v15, "collectionView:contextMenuConfiguration:highlightPreviewForItemAtIndexPath:", v13, v14, isa);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return -[DOCItemCollectionViewController collectionView:previewForHighlightingContextMenuWithConfiguration:](self, "collectionView:previewForHighlightingContextMenuWithConfiguration:", a3, a4);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC5Files31DOCItemCollectionViewController *v13;
  id v14;

  y = a5.y;
  x = a5.x;
  v10 = type metadata accessor for IndexPath(0);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  v12 = a3;
  v13 = self;
  v14 = DOCItemCollectionViewController.collectionView(_:contextMenuConfigurationForItemsAt:point:)(v12, v11, x, y);

  swift_bridgeObjectRelease(v11);
  return v14;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC5Files31DOCItemCollectionViewController *v15;
  id v16;
  uint64_t v18;

  y = a5.y;
  x = a5.x;
  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  v16 = DOCItemCollectionViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)(v14, (uint64_t)v13, x, y);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v16;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  sub_1001A2BB0(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))DOCItemCollectionViewController.collectionView(_:willPerformPreviewActionForMenuWith:animator:));
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v5;
  id v6;

  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentClickyOrbMenu);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_currentClickyOrbMenu) = (Class)a3;
  v5 = a3;

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_1001CA608(a5);

  swift_unknownObjectRelease(a5);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = DOCItemCollectionViewController.contextMenuInteraction(_:configurationForMenuAtLocation:)(v7, x, y);

  return v9;
}

- (id)contextMenuForItemsAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC5Files31DOCItemCollectionViewController *v7;
  void *v8;
  void *v9;

  v5 = type metadata accessor for IndexPath(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_1001A31B8(v6);
  v9 = v8;

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (id)contextMenuForFolder
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  Class isa;

  v2 = self;
  isa = sub_1001A383C().super.super.isa;

  return isa;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s5Files31DOCItemCollectionViewControllerC22contextMenuInteraction_022previewForHighlightingG17WithConfigurationSo17UITargetedPreviewCSgSo09UIContextgH0C_So0pgM0CtF_0(v6);
  v10 = v9;

  return v10;
}

- (void)revealWithItems:(id)a3 selectEvenIfVisible:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC5Files31DOCItemCollectionViewController *v12;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_1005CD830, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  sub_1001A50A8(v10, v5, (uint64_t)sub_100145FB4, v11);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC5Files31DOCItemCollectionViewController *v13;
  __n128 v14;
  uint64_t v15;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1005CD6C8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1001CB5F0(v10, (char *)v13, (void (*)(id, __n128))sub_1001D25F4, v12, v13);

  v14 = swift_release(v12);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v14);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _TtC5Files31DOCItemCollectionViewController *v16;
  _QWORD v17[5];
  _QWORD *v18;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005CD5B0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void *)objc_opt_self(FPItemManager);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "defaultManager");
  v12 = (_QWORD *)swift_allocObject(&unk_1005CD5D8, 48, 7);
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_100162138;
  v12[5] = v7;
  v17[4] = sub_1001D0158;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100175118;
  v17[3] = &unk_1005CD5F0;
  v13 = _Block_copy(v17);
  v14 = v18;
  v15 = v9;
  v16 = v10;
  swift_retain();
  objc_msgSend(v11, "fetchURLForItem:completionHandler:", v15, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_release(v7);
}

- (void)getPopoverTrackerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _TtC5Files31DOCItemCollectionViewController *v16;
  _QWORD v17[5];
  _QWORD *v18;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005CD498, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void *)objc_opt_self(FPItemManager);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "defaultManager");
  v12 = (_QWORD *)swift_allocObject(&unk_1005CD4C0, 48, 7);
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_1001620C0;
  v12[5] = v7;
  v17[4] = sub_1001D00F0;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100175118;
  v17[3] = &unk_1005CD4D8;
  v13 = _Block_copy(v17);
  v14 = v18;
  v15 = v9;
  v16 = v10;
  swift_retain();
  objc_msgSend(v11, "fetchURLForItem:completionHandler:", v15, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_release(v7);
}

- (void)getViewFor:(id)a3 waitForNewThumbnail:(BOOL)a4 :(id)a5
{
  _BOOL4 v5;
  _QWORD *v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;

  v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_1001CBE48((uint64_t)v9, v5, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)getCellFor:(id)a3 :(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _TtC5Files31DOCItemCollectionViewController *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _TtC5Files31DOCItemCollectionViewController *v16;
  _QWORD v17[5];
  _QWORD *v18;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005CD240, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void *)objc_opt_self(FPItemManager);
  v9 = a3;
  v10 = self;
  v11 = objc_msgSend(v8, "defaultManager");
  v12 = (_QWORD *)swift_allocObject(&unk_1005CD268, 48, 7);
  v12[2] = v10;
  v12[3] = v9;
  v12[4] = sub_100162138;
  v12[5] = v7;
  v17[4] = sub_1001D2840;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100175118;
  v17[3] = &unk_1005CD280;
  v13 = _Block_copy(v17);
  v14 = v18;
  v15 = v9;
  v16 = v10;
  swift_retain();
  objc_msgSend(v11, "fetchURLForItem:completionHandler:", v15, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_release(v7);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s5Files31DOCItemCollectionViewControllerC25adaptivePresentationStyle3for05traitC0So07UIModalgH0VSo014UIPresentationE0C_So07UITraitC0CtF_0(v6);

  return v9;
}

- (BOOL)isInKeyWindow
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  id v3;
  void *v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v2 = self;
  v3 = -[DOCItemCollectionViewController viewIfLoaded](v2, "viewIfLoaded");
  v4 = v3;
  if (v3)
  {
    v5 = (_TtC5Files31DOCItemCollectionViewController *)objc_msgSend(v3, "window");

    if (v5)
    {
      LOBYTE(v4) = -[DOCItemCollectionViewController isKeyWindow](v5, "isKeyWindow");

      v2 = v5;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (CGRect)absoluteFrame
{
  _TtC5Files31DOCItemCollectionViewController *v2;
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
  DOCItemCollectionViewController.absoluteFrame.getter();
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

- (void)firstItemInsertionRequestsFocusExpired
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  sub_10024465C();

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  sub_10024903C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCItemCollectionViewController.pressesBegan(_:with:));
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  sub_10024903C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCItemCollectionViewController.pressesChanged(_:with:));
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_10024903C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCItemCollectionViewController.pressesEnded(_:with:));
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  sub_10024903C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))DOCItemCollectionViewController.pressesCancelled(_:with:));
}

- (BOOL)forceDisableDictation
{
  return 1;
}

- (void)performCreateFolder:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100251454();

}

- (void)performCreateFolderWithSelection:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10025158C();

}

- (void)performDeselectAll:(id)a3
{
  uint64_t v3;
  id v5;
  _TtC5Files31DOCItemCollectionViewController *v6;

  v3 = OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection;
  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) & 1) == 0)
  {
    *((_BYTE *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5Files31DOCItemCollectionViewController_performingBatchSelection) = 1;
    v5 = a3;
    v6 = self;
    sub_10009A978(0, (uint64_t)_swiftEmptyArrayStorage);
    *((_BYTE *)&self->super.super.super.super.super.isa + v3) = 0;

  }
}

- (void)performDuplicate:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100251718();

}

- (void)performDelete:(id)a3
{
  -[DOCItemCollectionViewController delete:](self, "delete:", self);
}

- (void)performDeleteNow:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100252210(&UIDocumentBrowserActionIdentifierDelete);

}

- (void)performMoveHere:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10024B9C0(v4);

}

- (void)performOpen:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002518B4();

}

- (void)performCommandReturnKey:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100251C40();

}

- (void)performConfirmPickerExportOrDrillIn:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10024BE54();

}

- (void)performRename:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10024C604((uint64_t)v4);

}

- (void)performPreview:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100251D2C();

}

- (void)performMarkAsFavorite:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100252210(&UIDocumentBrowserActionIdentifierFavorite);

}

- (void)performGoToEnclosingFolder:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100252384();

}

- (void)performRevealItem:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100252418();

}

- (void)performGetInfo:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100252210(&UIDocumentBrowserActionIdentifierInfo);

}

- (void)performDismiss:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10024D428(v4);

}

- (NSArray)keyCommands
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  _QWORD *v3;
  NSArray v4;

  v2 = self;
  v3 = DOCItemCollectionViewController.keyCommands.getter();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files31DOCItemCollectionViewController *v7;
  uint64_t v8;
  _TtC5Files31DOCItemCollectionViewController *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = DOCItemCollectionViewController.canPerformAction(_:withSender:)(a3, (uint64_t)v12);

  sub_10000CB4C((uint64_t)v12, &qword_100642730);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  DOCItemCollectionViewController.validate(_:)((UICommand)v4);

}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  _s5Files31DOCItemCollectionViewControllerC13updateOverlay8animatedySb_tF_0();

}

- (void)barButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002CBCD4(v4);

}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  DOCItemCollectionViewController.prepareForPopoverPresentation(_:)((UIPopoverPresentationController)v4);

}

- (void)actionBarButtonTriggeredWithActionBarButton:(id)a3
{
  char *v4;
  _TtC5Files31DOCItemCollectionViewController *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_1002D1708(v4);

}

- (void)performActionWithAction:(id)a3 actionContext:(id)a4
{
  id v6;
  id v7;
  _TtC5Files31DOCItemCollectionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1002D17E4(v6, v7);

}

- (void)setProtectedStateToLockedForDidEnterBackground
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  sub_1003E0294();

}

- (void)updateProtectedStateForDidEnterForeground
{
  _TtC5Files31DOCItemCollectionViewController *v2;

  v2 = self;
  sub_1003E06B0();

}

- (void)appProtectionStatusChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files31DOCItemCollectionViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1003E0F94((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (NSString)filesIntentsDebugDescription
{
  _TtC5Files31DOCItemCollectionViewController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[DOCItemCollectionViewController debugDescription](v2, "debugDescription");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (void)filesIntentsEnumerateNodes:(id)a3 :(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC5Files31DOCItemCollectionViewController *v10;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = swift_allocObject(&unk_1005F2400, 24, 7);
  *(_QWORD *)(v8 + 16) = v6;
  v9 = swift_allocObject(&unk_1005F2428, 24, 7);
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  DOCItemCollectionViewController.filesIntentsEnumerateNodes(_:_:)((void (*)(uint64_t, _QWORD))sub_1004BB1D8, v8, (void (*)(__n128))sub_100222FA8);

  swift_release(v8);
  swift_release(v9);
}

@end
