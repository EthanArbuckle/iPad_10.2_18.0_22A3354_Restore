@implementation DOCMoveOperation

- (_TtC5Files16DOCMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL(0);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  return (_TtC5Files16DOCMoveOperation *)sub_10015C21C(v7, a4);
}

- (void)presendNotifications
{
  id v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCMoveOperation();
  v2 = v5.receiver;
  -[DOCMoveOperation presendNotifications](&v5, "presendNotifications");
  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = objc_msgSend(v3, "defaultCenter", v5.receiver, v5.super_class);
  if (qword_100640D90 != -1)
    swift_once(&qword_100640D90, sub_1000B1354);
  objc_msgSend(v4, "postNotificationName:object:", qword_1006726A0, v2);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v7;
  _TtC5Files16DOCMoveOperation *v8;
  uint64_t v9;
  id v10;
  _TtC5Files16DOCMoveOperation *v11;
  _OWORD v12[2];

  if (a3)
  {
    v7 = a4;
    v8 = self;
    v9 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v12, v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v10 = a4;
    v11 = self;
  }
  sub_10015C5C0((uint64_t)v12, a4);

  sub_10007EB54((uint64_t)v12);
}

- (NSString)actionNameForUndoing
{
  _TtC5Files16DOCMoveOperation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10015C9FC((uint64_t)v2);
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

- (id)operationForRedoing
{
  void *v2;
  uint64_t v4;
  void *v5;
  _TtC5Files16DOCMoveOperation *v6;
  id v7;
  char *v8;

  v2 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_undoManager];
  if (v2)
  {
    v4 = *(_QWORD *)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_sourceItems];
    v5 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_destinationFolderItem];
    objc_allocWithZone((Class)type metadata accessor for DOCMoveOperation());
    v6 = self;
    v7 = v2;
    swift_bridgeObjectRetain(v4);
    v8 = sub_10015C348(v4, v5, v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)operationForUndoing
{
  _TtC5Files16DOCMoveOperation *v2;
  char *v3;

  v2 = self;
  v3 = sub_10015CDD4();

  return v3;
}

- (void)registerUndo
{
  void *v3;

  v3 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_undoManager];
  if (v3)
    objc_msgSend(v3, "registerUndoOperationForSender:", self);
}

- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  sub_10015CFCC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(items:destinationFolder:)", 30);
}

- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v5;
  _TtC5Files16DOCMoveOperation *result;

  v5 = type metadata accessor for URL(0);
  __chkstk_darwin(v5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  result = (_TtC5Files16DOCMoveOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCMoveOperation", 22, "init(items:destinationURL:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC5Files16DOCMoveOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
  sub_10015CFCC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(sourceURLs:destinationFolder:)", 35);
}

- (_TtC5Files16DOCMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
  sub_10015CFCC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(sourceURLsAndNames:destinationFolder:)", 43);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_sourceURLs]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_sourceItems]);

}

@end
