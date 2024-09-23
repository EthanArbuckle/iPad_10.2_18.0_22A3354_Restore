@implementation DOCDocumentSharingController

- (void)presentationControllerWillDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController *v10;
  _QWORD *v11;
  uint64_t KeyPath;
  _QWORD v13[2];

  v5 = objc_opt_self(UIPopoverPresentationController);
  v6 = swift_dynamicCastObjCClass(a3, v5);
  if (v6)
  {
    v7 = v6;
    sub_10006922C(&qword_100646110);
    v8 = qword_100640D40;
    v9 = a3;
    v10 = self;
    if (v8 != -1)
      swift_once(&qword_100640D40, sub_10011EE48);
    v11 = (_QWORD *)static DOCAssociatedObjectStorage.attachedTo(_:storageKey:)(v7);
    KeyPath = swift_getKeyPath(&unk_1004DACD0);
    v13[0] = 0;
    v13[1] = 0;
    (*(void (**)(_QWORD *, uint64_t))((swift_isaMask & *v11) + 0x80))(v13, KeyPath);

  }
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  _TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController *v13;
  objc_super v15;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = (objc_class *)type metadata accessor for DOCDocumentSharingController();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[DOCDocumentSharingController initWithFileURL:](&v15, "initWithFileURL:", v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithFileURL:(id)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSURL *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  _TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController *v15;
  objc_super v17;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for DOCDocumentSharingController();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = -[DOCDocumentSharingController initWithFileURL:error:](&v17, "initWithFileURL:error:", v13, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCDocumentSharingController();
  v11 = -[DOCDocumentSharingController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC5FilesP33_9E9EA9120FD3595FAD4BD2167103835628DOCDocumentSharingController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCDocumentSharingController();
  return -[DOCDocumentSharingController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
