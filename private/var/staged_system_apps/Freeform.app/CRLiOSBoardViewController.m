@implementation CRLiOSBoardViewController

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;
  unsigned __int8 v7[40];

  v4 = a3;
  v5 = self;
  v6 = -[CRLiOSBoardViewController traitCollection](v5, "traitCollection");
  sub_1005221A4(v6, (int)objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "documentIsSharedReadOnly"), (uint64_t)v7);
  sub_100522548(v7, 0);
  sub_1004DB520((uint64_t)v7);

}

- (void)shareFailedWithError:(id)a3 recordID:(id)a4
{
  id v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1004D89F4((uint64_t)v8, v6);

}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  void *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  id v10;

  v10 = a3;
  v6 = (_TtC8Freeform25CRLiOSBoardViewController *)a4;
  v7 = self;
  sub_100BB23B4((uint64_t)v6, v7);
  v8 = *(Class *)((char *)&v7->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interstitialUIController);
  if (v8)
  {
    v9 = v8;
    sub_100BDB078();

    v7 = v6;
    v6 = v9;
  }

}

- (id)itemTitleForCloudSharingController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_1004DAF7C();
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004D8F80(v4);

}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004DB090();

}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;
  unint64_t v16;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "share");
  if (v6)
  {
    v7 = static CKShare.SystemFieldKey.thumbnailImageData.getter();
    v9 = v8;
    v10 = sub_1004DAF40();
    CKRecordKeyValueSetting.subscript.getter(&v15, v7, v9, v10, &type metadata for Data, &protocol witness table for Data);

    swift_bridgeObjectRelease(v9);
    v11 = v16;
    if (v16 >> 60 != 15)
    {
      v12 = v15;
      isa = Data._bridgeToObjectiveC()().super.isa;
      sub_1004BE2FC(v12, v11);
      return isa;
    }
  }
  else
  {

  }
  return 0;
}

- (void)networkReachabilityDidChangeWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = self;
  v10 = a3;
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_10126B640, 40, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  v13 = sub_100521BF0((uint64_t)v7, (uint64_t)&unk_1013E1D58, (uint64_t)v12, (uint64_t)&unk_10126A620, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1013FE730);

  swift_release(v13);
}

- (void)syncControllerSavedZoneWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100526318(v4);

}

- (void)didTapUndoButtonWithSender:(id)a3
{
  sub_10053C87C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100533924);
}

- (void)didLongPressUndoButtonWithSender:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_100533D00((uint64_t)v6);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v6);
}

- (void)didPressBackOrCloseButtonWithSender:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  uint64_t v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
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
  sub_100533ED4();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (void)undoHistoryChangedWithSender:(id)a3
{
  sub_10053C87C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_10053C610);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform25CRLiOSBoardViewController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10054E054(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  __n128 v7;
  uint64_t v8;
  id v9;

  sub_1004B8930(0, (unint64_t *)&qword_1013E7C00, OS_os_log_ptr);
  v5 = a3;
  v6 = self;
  v9 = (id)static OS_os_log.default.getter();
  v8 = static os_log_type_t.default.getter(v7);
  sub_100A06EBC((uint64_t)v9, &_mh_execute_header, v8, "User cancelled inserting a file", 31, 2, (uint64_t)_swiftEmptyArrayStorage);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _TtC8Freeform25CRLiOSBoardViewController *v16;
  _QWORD v17[5];
  uint64_t v18;

  type metadata accessor for InfoKey(0);
  v8 = v7;
  v9 = sub_1004B7878(&qword_1013DEE20, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_100EF45F0);
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  v11 = swift_allocObject(&unk_10126A858, 24, 7);
  swift_unknownObjectWeakInit(v11 + 16);
  v12 = swift_allocObject(&unk_10126B500, 32, 7);
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v10;
  v17[4] = sub_10054FD44;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = *(_QWORD *)"";
  v17[2] = sub_1005D2FC0;
  v17[3] = &unk_10126B518;
  v13 = _Block_copy(v17);
  v14 = v18;
  v15 = a3;
  v16 = self;
  swift_bridgeObjectRetain(v10);
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_bridgeObjectRelease(v10);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10054010C(v6, v7);

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;
  __n128 v8;
  uint64_t v9;
  _BYTE v10[24];

  v4 = qword_1013DD6B8;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_1013DD6B8, sub_100A00A6C);
  swift_beginAccess(&static OS_os_log.crlDefault, v10, 0, 0);
  v7 = (id)static OS_os_log.crlDefault;
  v9 = static os_log_type_t.default.getter(v8);
  sub_100A06EBC((uint64_t)v7, &_mh_execute_header, v9, "Document camera cancelled", 25, 2, (uint64_t)_swiftEmptyArrayStorage);

  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10054E17C(v6, (uint64_t)v8);

}

- (void)presentGenerativePlayground:(id)a3
{
  sub_1005411A0(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3
{
  sub_1005411A0(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC8Freeform25CRLiOSBoardViewController *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC8Freeform25CRLiOSBoardViewController *v19;
  __n128 v20;
  _BYTE v21[16];
  uint64_t v22;
  void (*v23)();
  uint64_t v24;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = sub_1004B804C(&qword_1013E1910);
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = swift_allocObject(v11, v13 + *(_QWORD *)(v8 + 72), v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_100EF5E40;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v8 + 16))(v14 + v13, v10, v7);
  v15 = a3;
  v16 = self;
  v17 = sub_100C1CC20();
  v18 = swift_allocObject(&unk_10126B460, 24, 7);
  *(_QWORD *)(v18 + 16) = v16;
  v22 = v17;
  v23 = sub_10054FCA4;
  v24 = v18;
  v19 = v16;
  sub_100D550BC(v14, (void (*)(_QWORD *, Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion (__swiftcall *)(CKRecordID, Swift::String), uint64_t))sub_10054FCAC, (uint64_t)v21);

  swift_bridgeObjectRelease(v14);
  swift_release(v17);
  v20 = swift_release(v18);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v8 + 8))(v10, v7, v20);
}

- (void)generativePlaygroundHelperDidCancel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  id v10;
  _TtC8Freeform25CRLiOSBoardViewController *v11;
  id v12;

  v5 = OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper;
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper);
  if (v6)
  {
    v7 = *(void **)(v6 + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_viewController);
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
    v12 = *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  else
  {
    v10 = a3;
    v11 = self;
    v12 = 0;
  }
  *(Class *)((char *)&self->super.super.super.isa + v5) = 0;

}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100541500(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (CRLiOSDocumentModeController)documentModeController
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100C1CAE8();

  return (CRLiOSDocumentModeController *)v3;
}

- (void)setDocumentModeController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController) = (Class)a3;
  v3 = a3;

}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewController
{
  return (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController);
}

- (void)setPencilKitCanvasViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController) = (Class)a3;
  v3 = a3;

}

- (PKCanvasView)pencilKitCanvasView
{
  return (PKCanvasView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView));
}

- (void)setPencilKitCanvasView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView) = (Class)a3;
  v3 = a3;

}

- (UIFindInteraction)findReplaceInteraction
{
  return (UIFindInteraction *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_findReplaceInteraction);
}

- (void)setFindReplaceInteraction:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_findReplaceInteraction, a3);
}

- (CRLFindReplaceController)findReplaceController
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100C1D170();

  return (CRLFindReplaceController *)v3;
}

- (void)setFindReplaceController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController) = (Class)a3;
  v3 = a3;

}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100C1D228(v6, (uint64_t)v7);

  return v9;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  void *v6;
  id v7;
  id v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  id v10;
  id v11;
  id v12;

  v6 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = v6;
  sub_1006F51D0(1);

  v11 = objc_msgSend(objc_allocWithZone((Class)CRLiOSDocumentModeFindReplace), "initWithBoardViewController:andInteractiveCanvasController:", v9, *(Class *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
  v12 = sub_100C1CAE8();
  objc_msgSend(v12, "setMode:animated:", v11, 1);

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100C4A81C();

}

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                                                                           + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (BOOL)isClosing
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing);
}

- (void)setIsClosing:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing) = a3;
}

- (BOOL)isClosed
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed);
}

- (void)setIsClosed:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed) = a3;
}

- (BOOL)isClosedOrClosing
{
  if ((*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing) & 1) != 0)
    return 1;
  else
    return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed);
}

- (_TtC8Freeform25CRLiOSBoardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100C4A8EC();
}

- (void)tearDown
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C1E6AC();

}

- (void)dealloc
{
  char v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  objc_super v4;

  v2 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isTornDown);
  v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 410, "Must call tearDown() before deallocation occurs.", 48, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 410, (uint64_t)"Must call tearDown() before deallocation occurs.", 48, 2u);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSBoardViewController(0);
  -[CRLiOSBoardViewController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___editorController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_boardLibrary);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___boardEditor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_selectionModelTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertingHelper));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_insertingCancellableToken));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_traitChangeRegistration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_undoAlertController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_progressTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_progressViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_cloudQuotaMessagingObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSheetProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interstitialUIController));
  sub_1004DAD0C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSyncAwaitTask), *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSyncAwaitTask], *(_QWORD *)&self->editingCoordinator[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSyncAwaitTask]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasBackgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10054E7A8(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState), *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState], *(_QWORD *)&self->editingCoordinator[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState], *(void **)&self->boardLibrary[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___undoToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertTextBoxToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertAVMediaToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertStickyNoteToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertShapeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___togglePencilModeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertStencilToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___shareToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___boardViewControlsItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___newBoardToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneWithModeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneWithScenesNavigatorToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___viewOnlyToolbarItem));
  sub_1004CB49C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___collaborationButtonItem));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_photoPicker);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_photoPickerLoadingProgress));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_cameraPicker);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_documentScanner);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_insertURLAlert));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasScrollViewController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_bottomToolTray));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_snapshotViewWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasZoomControlViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasZoomAndScenesContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_boardControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesNavigatorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigationCrossfadeSnapshotLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesPopoverState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesPresenter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_presentedSceneAlert));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_findReplaceInteraction);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_findSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_freehandDrawingHighlightManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_keyboardTopEdgeLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_topUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_bottomUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_leadingUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_trailingUnobscuredRectLayoutGuideConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_statusHUDManager));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_tipPopoverController);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_currentlyPresentedTip, (uint64_t *)&unk_1013E1C40);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_tipPresentationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_mediaReplacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___unobscuredRectLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___keyboardFrameLayoutGuide));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_followHUD));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_followBorderHighlightView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_stateRestorationHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_viewScaleObservation));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollObserver, &qword_1013E0230);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_lastPrintContentDate, &qword_1013E04F0);
}

- (void)loadView
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C1FBD0();

}

- (void)viewDidLoad
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C208D0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C21240(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C2178C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C24C18();

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t (*v8)();
  uint64_t v9;
  _TtC8Freeform25CRLiOSBoardViewController *v10;
  id v11;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_10129C950, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1005658F4;
  }
  else
  {
    v9 = 0;
  }
  v11 = a3;
  v10 = self;
  sub_100C24EAC(v11, a4, (uint64_t)v8, v9);
  sub_1004C1024((uint64_t)v8, v9);

}

- (_TtC8Freeform16CRLiOSPencilTray)sharedPencilTray
{
  uint64_t v3;
  objc_class *v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;

  v3 = OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray);
  v5 = self;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (objc_class *)sub_100C26C7C();
    v8 = *(Class *)((char *)&self->super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.isa + v3) = v7;
    v6 = v7;

    v4 = 0;
  }
  v9 = v4;

  return (_TtC8Freeform16CRLiOSPencilTray *)v6;
}

- (void)restoreUserActivityState:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100C26F20((uint64_t)v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C2710C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C27540(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100C2785C((uint64_t)a4, width, height);

  swift_unknownObjectRelease(a4);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_100C27FA0((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)observedTraitsDidChange:(id)a3 :(id)a4
{
  id v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_100C4BDF0(v6);

}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                                                                  + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_undoManager));
}

- (void)updateAdditionalSafeArea
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C28970();

}

- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100C2917C((uint64_t)v8, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)isCanvasDotGridEnabled
{
  return sub_100C2BBBC((unsigned __int8 *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__isCanvasDotGridEnabled, sub_100C2B92C);
}

- (void)setIsCanvasDotGridEnabled:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C2B1E8(a3);

}

- (BOOL)isConnectorModeEnabled
{
  return sub_100C2BBBC((unsigned __int8 *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__isConnectorModeEnabled, sub_100C2C364);
}

- (void)setIsConnectorModeEnabled:(BOOL)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C2BC68(a3);

}

- (BOOL)documentIsSharedReadOnly
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "documentIsSharedReadOnly");
}

- (BOOL)isInFollowingMode
{
  void *v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  id v4;
  char v5;

  v2 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator);
  v3 = self;
  v4 = v2;
  v5 = sub_1006F2CE0();

  return v5 & 1;
}

- (CRLiOSDocumentMode)currentDocumentMode
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_100C1CAE8();
  v4 = objc_msgSend(v3, "mode");

  return (CRLiOSDocumentMode *)v4;
}

- (id)quickSelectHUDParentViewForCanvasViewController:(id)a3
{
  return -[CRLiOSBoardViewController view](self, "view", a3);
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_100C1CAE8();
  v4 = objc_msgSend(v3, "mode");

  LOBYTE(v3) = objc_msgSend(v4, "shouldSelectAndScrollWithApplePencil");
  return (char)v3;
}

- (id)pencilKitCanvasViewControllerForCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
}

- (void)prefersPencilOnlyDrawingDidChange
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_100C1CAE8();
  v4 = objc_msgSend(v3, "mode");

  objc_msgSend(v4, "prefersPencilOnlyDrawingDidChange");
}

- (void)dismissPresentedViewController
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;

  v2 = self;
  v3 = (_TtC8Freeform25CRLiOSBoardViewController *)-[CRLiOSBoardViewController presentedViewController](v2, "presentedViewController");
  if (v3)
  {
    v9 = v3;
    v4 = -[CRLiOSBoardViewController presentedViewController](v2, "presentedViewController");
    if (v4)
    {
      v5 = v4;
      v6 = objc_opt_self(_UIStickerPickerViewController);
      v7 = swift_dynamicCastObjCClass(v5, v6) == 0;

    }
    else
    {
      v7 = 1;
    }
    -[CRLiOSBoardViewController dismissViewControllerAnimated:completion:](v9, "dismissViewControllerAnimated:completion:", v7, 0);

    v8 = v9;
  }
  else
  {
    v8 = v2;
  }

}

- (void)beginHandwritingModeIfNeeded
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C2FAB0();

}

- (void)userDidInteractWithCanvas:(id)a3
{
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewState);
  KeyPath = swift_getKeyPath(&unk_100F2F5B8);
  v5 = swift_getKeyPath(&unk_100F2F5E0);
  v6 = 0;
  static Published.subscript.setter(&v6, v3, KeyPath, v5);
}

- (id)editorControllerForInteractiveCanvasController:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  v5 = a3;
  v6 = self;
  v7 = v4;
  sub_10058950C((uint64_t)v5, (uint64_t)v7, &_mh_execute_header, (uint64_t)"editorController(for:)", 22, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 1907);

  v8 = sub_100C1C9E0();
  return v8;
}

- (id)selectionModelTranslatorForInteractiveCanvasController:(id)a3
{
  return sub_100C2FD68((char *)self, (uint64_t)a2, a3, (uint64_t)"selectionModelTranslator(for:)", 30, 1912, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_selectionModelTranslator);
}

- (id)editingCoordinatorForInteractiveCanvasController:(id)a3
{
  return sub_100C2FD68((char *)self, (uint64_t)a2, a3, (uint64_t)"editingCoordinator(for:)", 24, 1917, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator);
}

- (void)selectionPathDidChangeWithFlags:(unint64_t)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v3;

  v3 = self;
  sub_100C4C3A0();

}

- (id)canvasViewScaleDetentsForInteractiveCanvasController:(id)a3 isFastPinch:(BOOL)a4
{
  Class isa;

  sub_100C4C6C4();
  sub_1004B8930(0, (unint64_t *)&qword_1013F07F0, NSNumber_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)rectanglesObscuringView:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  sub_100C4C800();

  sub_1004B8930(0, (unint64_t *)&qword_10140B930, NSValue_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (CGRect)safeAreaLayoutFrameForInteractiveCanvasController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  v5 = self;
  sub_100C4BBA4();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return 1;
}

- (BOOL)hasMediaReplacerForInteractiveCanvasController:(id)a3
{
  uint64_t v3;
  void *v6;
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;
  id v9;
  char v10;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_mediaReplacer);
  if (v3)
  {
    v6 = *(void **)(v3 + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_interactiveCanvasController);
    sub_1004B8930(0, &qword_1013E4890, off_101229918);
    v7 = a3;
    v8 = self;
    v9 = v6;
    v10 = static NSObject.== infix(_:_:)(v9, v7);

  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (id)mediaReplacerForInteractiveCanvasController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100C30054((uint64_t)v4);

  return v6;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100C1CAE8();
  v7 = objc_msgSend(v6, "mode");

  LOBYTE(v6) = objc_msgSend(v7, "wantsToSuppressMultiselectionWithSingleBounds");
  return (char)v6;
}

- (BOOL)wantsToShowCanvasDotGridOnInteractiveCanvasController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100C302A8((uint64_t)v4);

  return self & 1;
}

- (BOOL)wantsToShowConnectorKnobsOnInteractiveCanvasController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100C303A4((uint64_t)v4);

  return self & 1;
}

- (BOOL)zoomOnSelectionChange:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100C4CE38();

  return self & 1;
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  char v4;

  v3 = self;
  v4 = sub_100C4CF14();

  return v4 & 1;
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C4D010();

}

- (id)canUndo
{
  void *v1;
  char *v2;
  id v3;

  v1 = *(void **)&a1[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController];
  v2 = a1;
  if ((objc_msgSend(v1, "editingDisabled") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController], "allowUndoRedoOperations");

  return v3;
}

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100C30608();

  return (_TtC8Freeform25CRLSelectionPathValidator *)v3;
}

- (BOOL)isPrimarySelectionPathReceiver
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100C306E8();

  return v3 & 1;
}

- (id)selectionStateSnapshot
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  v3 = sub_100C1C9E0();
  v4 = objc_msgSend(v3, "selectionPath");

  v5 = objc_allocWithZone((Class)type metadata accessor for CRLPersistableSelectionPath(0));
  sub_1005AC98C(v4);
  v7 = v6;

  return v7;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100C30864(a3);

}

- (void)updateToolbarButtons
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  unsigned __int8 v4[40];

  v2 = self;
  v3 = -[CRLiOSBoardViewController traitCollection](v2, "traitCollection");
  sub_1005221A4(v3, (int)objc_msgSend(*(id *)((char *)&v2->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "documentIsSharedReadOnly"), (uint64_t)v4);
  sub_100522548(v4, 0);
  sub_1004DB520((uint64_t)v4);

}

- (BOOL)allowsZoomHUD
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100C32C54();

  return v3 & 1;
}

- (id)viewControllerForMiniFormatterForCanvasViewController:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  unsigned __int8 v7;

  v4 = (_TtC8Freeform25CRLiOSBoardViewController *)a3;
  v5 = self;
  v6 = (_TtC8Freeform25CRLiOSBoardViewController *)-[CRLiOSBoardViewController traitCollection](v5, "traitCollection");
  if ((objc_msgSend((id)objc_opt_self(UIDevice), "crl_phoneUI") & 1) != 0)
    goto LABEL_4;
  v7 = -[CRLiOSBoardViewController crl_isCompactWidth](v6, "crl_isCompactWidth");

  if ((v7 & 1) == 0)
  {
    v6 = v5;
    v5 = (_TtC8Freeform25CRLiOSBoardViewController *)objc_retain(*(id *)((char *)&v5->super.super.super.isa
                                                                       + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController));
LABEL_4:

    v4 = v6;
  }

  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _OWORD v18[2];
  _QWORD v19[3];
  uint64_t v20;

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v18, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v9 = self;
  }
  sub_100C32E18((uint64_t)a3, (uint64_t)v18, v19);

  sub_1004CB800((uint64_t)v18, &qword_1013E0230);
  v10 = v20;
  if (!v20)
    return 0;
  v11 = sub_1004BB5A4(v19, v20);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v19);
  return v16;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100C33290((uint64_t)a3, (uint64_t)v12);

  sub_1004CB800((uint64_t)v12, &qword_1013E0230);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;
  NSString *v7;
  SEL v8;
  objc_super v9;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "action");
  v7 = (NSString *)String._bridgeToObjectiveC()();
  v8 = NSSelectorFromString(v7);

  if ((static Selector.== infix(_:_:)(v6, v8) & 1) != 0)
    objc_msgSend(v4, "setAttributes:", 1);
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for CRLiOSBoardViewController(0);
  -[CRLiOSBoardViewController validateCommand:](&v9, "validateCommand:", v4);

}

- (void)find:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  uint64_t v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = swift_allocObject(&unk_10129C810, 24, 7);
  *(_QWORD *)(v8 + 16) = self;
  v9 = self;
  sub_100C2F748(sub_10054ECCC, v8);
  swift_release(v8);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
}

- (void)print:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100C336A4);
}

- (_TtC8Freeform25CRLiOSBoardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *result;

  v4 = a4;
  result = (_TtC8Freeform25CRLiOSBoardViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSBoardViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BOOL)isPresentingCompactScenesNavigator
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  void *v5;
  id v6;
  char v7;

  v2 = self;
  v3 = (_TtC8Freeform25CRLiOSBoardViewController *)-[CRLiOSBoardViewController presentedViewController](v2, "presentedViewController");
  if (!v3)
  {
    v4 = v2;
LABEL_7:

    return 0;
  }
  v4 = v3;
  v5 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesNavigatorViewController);
  if (!v5)
  {

    goto LABEL_7;
  }
  sub_1004B8930(0, (unint64_t *)&qword_1013E0490, NSObject_ptr);
  v6 = v5;
  v7 = static NSObject.== infix(_:_:)(v4, v6);

  return (v7 & 1) != 0;
}

- (double)displayCornerRadius
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  double result;
  void *v5;
  id v6;
  double v7;
  double v8;

  v2 = self;
  v3 = -[CRLiOSBoardViewController view](v2, "view");
  if (v3)
  {
    v5 = v3;
    v6 = objc_msgSend(v3, "traitCollection");

    objc_msgSend(v6, "displayCornerRadius");
    v8 = v7;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)rectForBorder
{
  void *v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
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
  double v15;
  CGRect result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollView);
  v3 = self;
  objc_msgSend(v2, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v2, "adjustedContentInset");

  v12 = sub_1008E3670(v5, v7, v9, v11, 0.0, 0.0);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)didStartFollowingParticipant:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C34D3C(v4);

}

- (void)didEndFollowingParticipant:(id)a3 shouldShowRefollowPlacard:(BOOL)a4
{
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100C35590(a3, a4);

}

- (void)remoteParticipantDidStartFollowingLocalParticipantWithRemoteParticipant:(id)a3
{
  sub_100C35964((char *)self, (uint64_t)a2, a3, 1);
}

- (void)remoteParticipantDidEndFollowingLocalParticipantWithRemoteParticipant:(id)a3
{
  sub_100C35964((char *)self, (uint64_t)a2, a3, 0);
}

- (void)multipleRemoteParticipantsDidStartFollowingLocalParticipantWithNumberOfParticipants:(int64_t)a3
{
  sub_100C35A74((char *)self, (uint64_t)a2, (void *)a3, 1);
}

- (void)multipleRemoteParticipantsDidEndFollowingLocalParticipantsWithNumberOfParticipants:(int64_t)a3
{
  sub_100C35A74((char *)self, (uint64_t)a2, (void *)a3, 0);
}

- (void)showFollowFailedAlertFor:(int64_t)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;

  v4 = self;
  sub_100C35B64(a3);

}

- (void)showFollowEndedAlertWithHostShortName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v7 = v6;
  v8 = self;
  sub_100C35D74(v5, v7);

  swift_bridgeObjectRelease();
}

- (void)showFollowRefusedAlert
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3603C();

}

- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_10129C1D0, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_1005658F4;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  v10 = a4;
  sub_100C4DB7C();
  v12 = v11;
  sub_1004C1024((uint64_t)v7, v8);

  return v12;
}

- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC8Freeform25CRLiOSBoardViewController *v14;
  id v15;
  void *v16;

  v8 = (uint64_t (*)())_Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v12 = v11;
  if (v8)
  {
    v13 = swift_allocObject(&unk_10129C068, 24, 7);
    *(_QWORD *)(v13 + 16) = v8;
    v8 = sub_1005658F4;
  }
  else
  {
    v13 = 0;
  }
  v14 = self;
  v15 = a4;
  v16 = sub_100C363F8(v10, v12, a4, (uint64_t)v8, v13);
  sub_1004C1024((uint64_t)v8, v13);

  swift_bridgeObjectRelease();
  return v16;
}

- (void)endModalOperationWithToken:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100C36A00((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10129BFF0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100C4DCB8((uint64_t)sub_100565828, v5);

  swift_release(v5);
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD, _QWORD, uint64_t);
  _TtC8Freeform25CRLiOSBoardViewController *v9;

  v7 = _Block_copy(a6);
  v8 = (void (*)(_QWORD *, _QWORD, _QWORD, uint64_t))v7[2];
  v9 = self;
  v8(v7, 0, 0, 1);
  _Block_release(v7);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C38CDC(1);

}

- (void)newBoard:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100C38F20);
}

- (void)closeBoardShortcut:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100C39384);
}

- (void)createSceneShortcut:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  uint64_t v6;
  double v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  if (((*(_BYTE **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorState))[OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState_captureIsAnimating] & 1) == 0)
  {
    -[CRLiOSBoardViewController endDrawingModeIfNeeded](self, "endDrawingModeIfNeeded", v7);
    sub_100C38488();
    sub_100C421F8(0);
  }

  sub_1004CB800((uint64_t)v9, &qword_1013E0230);
}

- (void)nextSceneShortcut:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100C3976C);
}

- (void)previousSceneShortcut:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100C39B9C);
}

- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3
{
  return 1;
}

- (id)editingCoordinatorForShapeLibraryViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator));
}

- (id)boardViewControllerTraitCollectionForShapeLibraryViewController:(id)a3
{
  return -[CRLiOSBoardViewController traitCollection](self, "traitCollection", a3);
}

- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3
{
  return *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm] != 0;
}

- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3
{
  uint64_t v3;
  NSString v4;

  v3 = *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm];
  if (v3)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm]);
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)shapeLibraryViewController:(id)a3 willDisappearWithSearchTerm:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  if (a4)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm);
  v8 = *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm];
  *v7 = v5;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (void)shapeLibraryViewControllerDidCancelSearch:(id)a3
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm);
  v4 = *(_QWORD *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm];
  *v3 = 0;
  v3[1] = 0;
  swift_bridgeObjectRelease(v4);
}

- (BOOL)isValidMode:(id)a3 forEditorController:(id)a4
{
  return 1;
}

- (id)modeForEditorController:(id)a3
{
  return 0;
}

- (CRLiOSDocumentMode)defaultDocumentMode
{
  return (CRLiOSDocumentMode *)objc_msgSend(objc_allocWithZone((Class)CRLiOSDocumentModeEdit), "initWithBoardViewController:", self);
}

- (id)editorControllersToObserveForMode:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;
  id v9;
  Class isa;

  v5 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100EEF400;
  v7 = a3;
  v8 = self;
  v9 = sub_100C1C9E0();
  *(_QWORD *)(v6 + 32) = v9;
  specialized Array._endMutation()(v9);

  sub_1004B8930(0, (unint64_t *)&unk_1013FFE70, off_101229890);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  BOOL v9;
  _TtC8Freeform25CRLiOSBoardViewController *v10;

  v7 = a3;
  v8 = a4;
  v10 = self;
  v9 = objc_msgSend(v7, "pencilModeType") == (id)2;
  *((_BYTE *)&v10->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isChangingDocumentModeToHandwriting) = v9;

}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100C4DED4(v7, v8);

}

- (id)interactiveCanvasControllerForPencilKitCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
}

- (unint64_t)pencilModeTypeForPencilKitCanvasViewController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = self;
  v6 = sub_100C1CAE8();
  v7 = objc_msgSend(v6, "mode");

  v8 = objc_msgSend(v7, "pencilModeType");
  return (unint64_t)v8;
}

- (id)freehandDrawingToolkitForPencilKitCanvasViewController:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "freehandDrawingToolkit");
  if (!v7)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"freehandDrawingToolkit(for:)", 28, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3404, "Toolkit should be set up by the time freehandDrawingToolkit(for pencilKitCanvasViewController:) is called.", 106, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"freehandDrawingToolkit(for:)", 28, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 3404, (uint64_t)"Toolkit should be set up by the time freehandDrawingToolkit(for pencilKitCanvasViewController:) is called.", 106, 2u);
  }

  return v7;
}

- (id)pencilKitSnapshotViewForPencilKitCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_snapshotViewWrapper));
}

- (id)pencilKitRulerHostingViewForPencilKitCanvasViewController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id result;
  id v7;

  v4 = a3;
  v5 = self;
  result = -[CRLiOSBoardViewController view](v5, "view");
  if (result)
  {
    v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)pencilKitViewWantsSuppressedFreehandContent:(BOOL)a3 forPencilKitCanvasViewController:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "setShouldSuppressFreehandContent:", a3, a4);
}

- (void)prepareForPencilKitSnapshottingForPencilKitCanvasViewController:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C4E414((uint64_t *)&selRef_prepareForPencilKitSnapshotting);

}

- (void)prepareForPencilKitBeganStroke:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C4E414((uint64_t *)&selRef_didBeginPencilKitStroke);

}

- (void)prepareForPencilKitEndingOrCancellingStroke:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100C4E414((uint64_t *)&selRef_didFinishPencilKitStroke);

}

- (void)beginDrawingModeIfNeeded
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3A58C();

}

- (void)endDrawingModeIfNeeded
{
  id v2;
  id v3;
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  _TtC8Freeform25CRLiOSBoardViewController *v7;

  v7 = self;
  v2 = sub_100C1CAE8();
  v3 = objc_msgSend(v2, "mode");

  v4 = objc_msgSend(v3, "pencilModeType");
  if (v4 == (id)1)
  {
    v5 = (_TtC8Freeform25CRLiOSBoardViewController *)sub_100C1CAE8();
    -[CRLiOSBoardViewController resetToDefaultModeAnimated:](v5, "resetToDefaultModeAnimated:", 1);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void)beginDrawingTransformModeIfNeeded
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3A768();

}

- (void)toolkitDidDrawWithPencil
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3A8B0();

}

- (void)toolkitDidDrawWithFinger
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3AA70();

}

- (void)toolkitDidDrawWithIndirectTouch
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;

  v2 = self;
  sub_100C3AC2C();

}

- (unint64_t)freehandDrawingBehaviorAtUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  unint64_t v6;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_100C3ADE8(x, y);

  return v6;
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewControllerForFreehandDrawingTools
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;

  v2 = self;
  v3 = (id)sub_100C4E558();

  return (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)v3;
}

- (BOOL)canBeginFreehandDrawingMode
{
  return 1;
}

- (BOOL)isInDrawingMode
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;
  id v5;

  v2 = self;
  v3 = sub_100C1CAE8();
  v4 = objc_msgSend(v3, "mode");

  v5 = objc_msgSend(v4, "pencilModeType");
  return v5 == (id)1;
}

- (BOOL)wantsToSuppressKnobsOnTransformReps
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = sub_100C1CAE8();
  v4 = objc_msgSend(v3, "mode");

  LOBYTE(v3) = objc_msgSend(v4, "wantsToSuppressSelectionKnobs");
  return (char)v3;
}

- (id)pencilDocumentModeFor:(unint64_t)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_100C3B16C((double *)a3);

  return v5;
}

- (void)didUpdateRectangleObscuringCanvasScrollViewForPencilTray:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_100C28970();
  swift_unknownObjectRelease(a3);

}

- (id)barButtonItemForPresentingColorPickerWithHiddenPencilTray:(id)a3
{
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_100C1CD9C();
  swift_unknownObjectRelease(a3);

  return v6;
}

- (BOOL)shouldKeepDocumentModeOnVisibilityChangeOfPencilTray:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_undoAlertController) != 0;
}

- (id)interactiveCanvasControllerForFindController:(id)a3
{
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;
  id v8;

  sub_1004B8930(0, (unint64_t *)&qword_1013E0490, NSObject_ptr);
  v5 = a3;
  v6 = self;
  v7 = sub_100C1D170();
  LOBYTE(self) = static NSObject.== infix(_:_:)(v7, v5);

  if ((self & 1) == 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"interactiveCanvasController(forFind:)", 37, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3640, "Unknown find and replace controller", 35, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"interactiveCanvasController(forFind:)", 37, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 3640, (uint64_t)"Unknown find and replace controller", 35, 2u);
  }
  v8 = objc_retainAutoreleaseReturnValue(*(id *)((char *)&v6->super.super.super.isa
                                               + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));

  return v8;
}

- (id)modelEnumeratorForSearchWithFlags:(unint64_t)a3
{
  return objc_msgSend(objc_allocWithZone((Class)CRLDocumentModelEnumerator), "initWithRootModelObject:flags:filter:", *(_QWORD *)(*(_QWORD *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)+ OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)+ OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer), a3, 0);
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  return 0;
}

- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "setSelectionPath:withSelectionFlags:", a3, a4);
}

- (_NSRange)visibleRootIndexRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)rootIndexOfStartOfCurrentSelection
{
  return 0;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  return 1;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  void (**v6)(void *, _TtC8Freeform25CRLiOSBoardViewController *);
  _TtC8Freeform25CRLiOSBoardViewController *v7;

  v6 = (void (**)(void *, _TtC8Freeform25CRLiOSBoardViewController *))_Block_copy(a4);
  v7 = self;
  sub_100589558(a3, 0, &_mh_execute_header, (uint64_t)"withRootSearchTarget(at:execute:)", 33, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 3669);
  v6[2](v6, v7);
  _Block_release(v6);

}

- (void)setPrimarySearchReference:(id)a3 forFindReplaceController:(id)a4
{
  id v7;
  _TtC8Freeform25CRLiOSBoardViewController *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_100C4E66C((uint64_t)a3, (SEL *)&selRef_setPrimaryFindResultSearchReference_);
  swift_unknownObjectRelease(a3);

}

- (void)setSearchReferencesToHighlight:(id)a3 forFindReplaceController:(id)a4
{
  id v7;
  id v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100C4E66C((uint64_t)a3, (SEL *)&selRef_setSearchReferencesToHighlight_);

}

- (NSArray)childSearchTargets
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  Class isa;

  v2 = self;
  sub_100C3C9E8();

  sub_1004B804C(&qword_10140B7E8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;

  v8 = a3;
  swift_unknownObjectRetain(a5);
  v9 = self;
  sub_100C4E700(v8, a4);

  swift_unknownObjectRelease(a5);
}

- (BOOL)accessibilityPerformEscape
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100C3CEB0();

  return v3 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtC8Freeform25CRLiOSBoardViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_100C3D430();

  return v3 & 1;
}

- (id)test_pencilKitCanvasViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
}

- (UIWindow)keyboardObserversWindow
{
  void *v2;
  _TtC8Freeform25CRLiOSBoardViewController *v3;
  _TtC8Freeform25CRLiOSBoardViewController *v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  v3 = self;
  v4 = (_TtC8Freeform25CRLiOSBoardViewController *)objc_msgSend(v2, "canvasView");
  if (v4)
  {
    v5 = v4;
    v6 = -[CRLiOSBoardViewController window](v4, "window");

    v3 = v5;
  }
  else
  {
    v6 = 0;
  }

  return (UIWindow *)v6;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  uint64_t v10;
  Class isa;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100C235E8(0);
  if ((sub_100C1D040() & 1) == 0)
  {
    v10 = objc_opt_self(CRLiOSKeyboardMonitor);
    isa = Notification._bridgeToObjectiveC()().super.isa;
    LOBYTE(v10) = objc_msgSend((id)v10, "isKeyboardFrameChanging:", isa);

    if ((v10 & 1) != 0)
      objc_msgSend(*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController), "scrollCurrentSelectionToVisibleWithOptions:", 1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100C235E8(0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)keyboardWillChangeFrame:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100C402A0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)insertStickerFromItemProvider:(NSItemProvider *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSItemProvider *v15;
  _TtC8Freeform25CRLiOSBoardViewController *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10129BD98, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10129BDC0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10140B7A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10129BDE8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10140B7B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405D50, (uint64_t)v14);
  swift_release(v17);
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform25CRLiOSBoardViewController *v9;
  _QWORD v10[4];

  v7 = type metadata accessor for CRLChangeRecord();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10, a4);
  swift_unknownObjectRelease(a4);
  sub_100C45B3C(v8, (uint64_t)v10);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (double)contentsScaleForCanvasBackgroundLayer:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;
  double v8;
  double v9;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "canvas");
  objc_msgSend(v7, "contentsScale");
  v9 = v8;

  return v9;
}

- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  v5 = self;
  v6 = sub_100C46560((uint64_t)v4);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform25CRLiOSBoardViewController *v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "layerHost");
  if (v7
    && (v8 = v7,
        v9 = objc_msgSend(v7, "canvasLayer"),
        swift_unknownObjectRelease(v8),
        v9))
  {
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

  }
  else
  {

    v11 = 0.0;
    v13 = 0.0;
  }
  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3
{
  id v4;
  _TtC8Freeform25CRLiOSBoardViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  v5 = self;
  sub_100C4EB70();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

@end
