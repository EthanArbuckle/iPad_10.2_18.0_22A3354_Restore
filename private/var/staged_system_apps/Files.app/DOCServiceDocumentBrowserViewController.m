@implementation DOCServiceDocumentBrowserViewController

- (_TtC5Files39DOCServiceDocumentBrowserViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC5Files39DOCServiceDocumentBrowserViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_remoteAdditionalLeadingNavigationBarButtonItems) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_remoteAdditionalTrailingNavigationBarButtonItems) = 0;
  v4 = OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_updateBarButtonTrackingViews_lastSentFramesByUUID;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1003F2170((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC5Files39DOCServiceDocumentBrowserViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCServiceDocumentBrowserViewController.swift", 51, 2, 99, 0);
  __break(1u);
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  v6 = a3;
  v7 = v8.receiver;
  -[DOCServiceDocumentBrowserViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", v6, v4);
  objc_msgSend(v6, "makeKeyWindow", v8.receiver, v8.super_class);

}

- (void)viewDidLoad
{
  _TtC5Files39DOCServiceDocumentBrowserViewController *v2;

  v2 = self;
  sub_1003A3088();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  v4 = v8.receiver;
  -[DOCTabbedBrowserViewController viewDidAppear:](&v8, "viewDidAppear:", v3);
  v5 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "window");

    objc_msgSend(v7, "makeKeyWindow");
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC5Files39DOCServiceDocumentBrowserViewController *v4;

  v4 = self;
  sub_1003A32DC(a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didPerformActionOn:(id)a3 overflowAction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1003A35A8(v6, v4);

}

- (void)didPerformActionOn:(id)a3
{
  id v4;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003A35A8(v4, 0);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  swift_unknownObjectRetain(a3);
  v4 = v5.receiver;
  -[DOCServiceDocumentBrowserViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  objc_msgSend(a3, "preferredContentSize", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setPreferredContentSize:");
  swift_unknownObjectRelease(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DOCServiceDocumentBrowserViewController();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[DOCTabbedBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_1005E57F8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_1003B1E70;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100018CC0;
  v12[3] = &unk_1005E5810;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)_setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  sub_1003A4BE0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005E5758, (uint64_t)sub_1003B1E68, (uint64_t)&unk_1005E5770);
}

- (void)_setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  sub_1003A4BE0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005E56B8, (uint64_t)sub_1003B1E54, (uint64_t)&unk_1005E56D0);
}

- (void)_revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005E55F0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = swift_allocObject(&unk_1005E5618, 56, 7);
  *(_QWORD *)(v10 + 16) = self;
  *(_QWORD *)(v10 + 24) = a3;
  *(_BYTE *)(v10 + 32) = a4;
  *(_QWORD *)(v10 + 40) = sub_1003B1E9C;
  *(_QWORD *)(v10 + 48) = v9;
  v16[4] = sub_1003B1D4C;
  v17 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10004A82C;
  v16[3] = &unk_1005E5630;
  v11 = _Block_copy(v16);
  v12 = v17;
  v13 = a3;
  v14 = self;
  v15 = v13;
  swift_retain();
  swift_release(v12);
  DOCRunInMainThread(v11);
  _Block_release(v11);

  swift_release(v9);
}

- (void)_revealSymbolicLocation:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v11;
  _QWORD v12[5];
  _QWORD *v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E53C0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_1005E53E8, 48, 7);
  v8[2] = a3;
  v8[3] = sub_1003B1E9C;
  v8[4] = v7;
  v8[5] = self;
  v12[4] = sub_1003B1C04;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10004A82C;
  v12[3] = &unk_1005E5400;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = self;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (void)_initiateDocumentCreationWithIntent:(id)a3
{
  id v4;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1003AF8AC();

}

- (void)_renameDocumentAtURL:(id)a3 newName:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v13;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  _Block_copy(v8);
  v12 = a3;
  v13 = self;
  sub_1003AFE30(v12, v9, v11, v13, (void (**)(const void *, _QWORD, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)_dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v11;
  _QWORD v12[5];
  uint64_t v13;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E5168, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_1005E5190, 48, 7);
  *(_QWORD *)(v8 + 16) = self;
  *(_BYTE *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = sub_1000E62C0;
  *(_QWORD *)(v8 + 40) = v7;
  v12[4] = sub_1003B19D4;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10004A82C;
  v12[3] = &unk_1005E51A8;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = self;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (void)_setCustomActions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v10;
  _QWORD v11[5];
  uint64_t v12;

  v5 = sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = swift_allocObject(&unk_1005E50C8, 32, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_QWORD *)(v7 + 24) = v6;
  v11[4] = sub_1003B1968;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004A82C;
  v11[3] = &unk_1005E50E0;
  v8 = _Block_copy(v11);
  v9 = v12;
  v10 = self;
  swift_bridgeObjectRetain(v6);
  swift_release(v9);
  DOCRunInMainThread(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v6);
}

- (void)_setSceneIdentifier:(id)a3
{
  sub_1003A9A90(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005E5078, (uint64_t)sub_1003B1958, (uint64_t)&unk_1005E5090);
}

- (void)_establishFirstResponderAndPerformKeyCommand:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;

  v5 = swift_allocObject(&unk_1005E5028, 32, 7);
  *(_QWORD *)(v5 + 16) = self;
  *(_QWORD *)(v5 + 24) = a3;
  v11[4] = sub_1003B1944;
  v12 = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004A82C;
  v11[3] = &unk_1005E5040;
  v6 = _Block_copy(v11);
  v7 = v12;
  v8 = a3;
  v9 = self;
  v10 = v8;
  swift_release(v7);
  DOCRunInMainThread(v6);
  _Block_release(v6);

}

- (void)_importDocumentAtURLWrapper:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v14;
  id v15;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v16;
  _QWORD v17[5];
  _QWORD *v18;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1005E4EC0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (_QWORD *)swift_allocObject(&unk_1005E4EE8, 56, 7);
  v10[2] = a3;
  v10[3] = self;
  v10[4] = a4;
  v10[5] = sub_1003B1E9C;
  v10[6] = v9;
  v17[4] = sub_1003B1858;
  v18 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10004A82C;
  v17[3] = &unk_1005E4F00;
  v11 = _Block_copy(v17);
  v12 = v18;
  v13 = a3;
  v14 = self;
  v15 = v13;
  v16 = v14;
  swift_retain();
  swift_release(v12);
  DOCRunInMainThread(v11);
  _Block_release(v11);

  swift_release(v9);
}

- (void)_importDocumentAtURLWrapper:(id)a3 nextToDocumentAtURLWrapper:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  id v16;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v17;
  id v18;
  id v19;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v20;
  _QWORD v21[5];
  _QWORD *v22;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_1005E4D80, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  v12 = (_QWORD *)swift_allocObject(&unk_1005E4DA8, 64, 7);
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = self;
  v12[5] = a5;
  v12[6] = sub_1003B1714;
  v12[7] = v11;
  v21[4] = sub_1003B1768;
  v22 = v12;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 1107296256;
  v21[2] = sub_10004A82C;
  v21[3] = &unk_1005E4DC0;
  v13 = _Block_copy(v21);
  v14 = v22;
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = v15;
  v19 = v16;
  v20 = v17;
  swift_retain();
  swift_release(v14);
  DOCRunInMainThread(v13);
  _Block_release(v13);

  swift_release(v11);
}

- (void)_setAllowsDocumentCreation:(BOOL)a3
{
  sub_1003A99C4(self, (uint64_t)a2, a3, (uint64_t)&unk_1005E4D30, (uint64_t)sub_1003B1700, (uint64_t)&unk_1005E4D48);
}

- (void)_setAllowsPickingMultipleItems:(BOOL)a3
{
  sub_1003A99C4(self, (uint64_t)a2, a3, (uint64_t)&unk_1005E4CE0, (uint64_t)sub_1003B16EC, (uint64_t)&unk_1005E4CF8);
}

- (void)_setCreateButtonTitle:(id)a3
{
  sub_1003A9A90(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1005E4C90, (uint64_t)sub_1003B1680, (uint64_t)&unk_1005E4CA8);
}

- (void)_setDefaultDocumentAspectRatio:(double)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v8;
  _QWORD v9[5];
  uint64_t v10;

  v5 = swift_allocObject(&unk_1005E4C40, 32, 7);
  *(_QWORD *)(v5 + 16) = self;
  *(double *)(v5 + 24) = a3;
  v9[4] = sub_1003B1660;
  v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10004A82C;
  v9[3] = &unk_1005E4C58;
  v6 = _Block_copy(v9);
  v7 = v10;
  v8 = self;
  swift_release(v7);
  DOCRunInMainThread(v6);
  _Block_release(v6);

}

- (void)_clearCurrentOpenInteraction
{
  _TtC5Files39DOCServiceDocumentBrowserViewController *v2;

  v2 = self;
  sub_1003A9C2C();

}

- (void)getTransitionControllerForURL:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v12;
  id v13;
  _QWORD v14[5];
  _QWORD *v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E4BA0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_1005E4BC8, 48, 7);
  v8[2] = self;
  v8[3] = sub_100387E9C;
  v8[4] = v7;
  v8[5] = a3;
  v14[4] = sub_1003B1630;
  v15 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10004A82C;
  v14[3] = &unk_1005E4BE0;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = a3;
  v12 = self;
  v13 = v11;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (void)getTransitionControllerForItem:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v12;
  id v13;
  _QWORD v14[5];
  _QWORD *v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E4B00, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_1005E4B28, 48, 7);
  v8[2] = self;
  v8[3] = sub_100387E9C;
  v8[4] = v7;
  v8[5] = a3;
  v14[4] = sub_1003B1620;
  v15 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10004A82C;
  v14[3] = &unk_1005E4B40;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = a3;
  v12 = self;
  v13 = v11;
  swift_retain();
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);

  swift_release(v7);
}

- (void)_getAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E4AD8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1003AA2E0(v8, (uint64_t)sub_100241430, v7);

  swift_release(v7);
}

- (BOOL)documentBrowser:(id)a3 shouldShowActivityViewControllerForDocumentURLs:(id)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityProxy:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v21;

  v15 = type metadata accessor for URL(0);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a7, &type metadata for String);
  v18 = swift_allocObject(&unk_1005E4920, 24, 7);
  swift_unknownObjectWeakInit(v18 + 16);
  v19 = swift_allocObject(&unk_1005E4AB0, 56, 7);
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = a5;
  *(_BYTE *)(v19 + 32) = a6;
  *(_QWORD *)(v19 + 40) = v17;
  *(_QWORD *)(v19 + 48) = a8;
  swift_unknownObjectRetain_n(a5, 2);
  swift_unknownObjectRetain_n(a8, 2);
  v20 = a3;
  v21 = self;
  swift_retain();
  swift_bridgeObjectRetain(v17);
  sub_1003ABC88(v16, 0, (uint64_t)sub_1003B15E8, v19);

  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a8);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_release(v18);
  swift_release(v19);
  return 0;
}

- (void)documentManagerWasCancelled:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_hostProxy), "_documentPickerWasCancelled", a3);
}

- (void)documentBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1003B0FA0(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v13;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1005E49E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_hostProxy);
  v9 = swift_allocObject(&unk_1005E4A10, 32, 7);
  *(_QWORD *)(v9 + 16) = sub_1003B1588;
  *(_QWORD *)(v9 + 24) = v7;
  v14[4] = sub_1003B1590;
  v15 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_1003AB774;
  v14[3] = &unk_1005E4A28;
  v10 = _Block_copy(v14);
  v11 = v15;
  v12 = a3;
  v13 = self;
  swift_retain();
  objc_msgSend(v8, "_didRequestDocumentCreationWithHandler:", v10, swift_release(v11).n128_f64[0]);
  _Block_release(v10);

  swift_release(v7);
}

- (void)documentBrowser:(id)a3 didImportDocumentAtURL:(id)a4 toDestinationURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v19 - v14;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_1003B122C((uint64_t)v15, (uint64_t)v12);

  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v9);
  v18(v15, v9);
}

- (void)documentBrowser:(id)a3 failedToImportDocumentAtURL:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v15;
  id v16;
  NSURL *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = *(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_hostProxy);
  v14 = a3;
  v15 = self;
  v16 = a5;
  URL._bridgeToObjectiveC()(v17);
  v19 = v18;
  if (v16)
    v20 = (void *)_convertErrorToNSError(_:)(v16);
  else
    v20 = 0;
  objc_msgSend(v13, "_failedToImportDocumentAtURL:error:", v19, v20);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (id)initForOpeningFilesWithContentTypes:(id)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceDocumentBrowserViewController", 45, "init(forOpeningFilesWithContentTypes:)", 38, 0);
  __break(1u);
  return result;
}

- (id)initForOpeningContentTypes:(id)a3
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceDocumentBrowserViewController", 45, "init(forOpening:)", 17, 0);
  __break(1u);
  return result;
}

- (_TtC5Files39DOCServiceDocumentBrowserViewController)initWithConfiguration:(id)a3
{
  id v3;
  _TtC5Files39DOCServiceDocumentBrowserViewController *result;

  v3 = a3;
  result = (_TtC5Files39DOCServiceDocumentBrowserViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCServiceDocumentBrowserViewController", 45, "init(configuration:)", 20, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_hostProxy));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_remoteAdditionalLeadingNavigationBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_remoteAdditionalTrailingNavigationBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files39DOCServiceDocumentBrowserViewController_updateBarButtonTrackingViews_lastSentFramesByUUID));
}

- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5
{
  void *v7;
  void *v8;
  id v9;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v10;
  _QWORD v11[6];

  if (a4)
  {
    v7 = (void *)objc_opt_self(DOCUISession);
    v11[4] = sub_1003ACC64;
    v11[5] = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_10004A82C;
    v11[3] = &unk_1005E46B8;
    v8 = _Block_copy(v11);
    v9 = a3;
    v10 = self;
    objc_msgSend(v7, "performAfterCATransactionCommits:", v8);
    _Block_release(v8);

  }
}

- (BOOL)establishFirstResponder
{
  _TtC5Files39DOCServiceDocumentBrowserViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1003ACD6C();

  return v3 & 1;
}

- (void)_applyBrowserStateChange:(id)a3 force:(BOOL)a4
{
  id v6;
  _TtC5Files39DOCServiceDocumentBrowserViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1003AD038(v6, a4);

}

@end
