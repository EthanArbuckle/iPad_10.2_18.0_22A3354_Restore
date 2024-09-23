@implementation DOCCopyOperation

- (void)presendNotifications
{
  _TtC5Files16DOCCopyOperation *v2;
  objc_super v3;

  v2 = self;
  if (DOCCopyOperation.handlePresendNotifications_asDSCopy()())
  {

  }
  else
  {
    v3.receiver = v2;
    v3.super_class = (Class)type metadata accessor for DOCCopyOperation();
    -[DOCCopyOperation presendNotifications](&v3, "presendNotifications");

  }
}

- (void)actionMain
{
  _TtC5Files16DOCCopyOperation *v2;

  v2 = self;
  DOCCopyOperation.actionMain()();

}

- (NSString)actionNameForUndoing
{
  uint64_t v2;
  _TtC5Files16DOCCopyOperation *v3;
  _TtC5Files16DOCCopyOperation *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(_QWORD *)(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_sourceURLs] + 16);
  v3 = self;
  v4 = v3;
  if (v2)
    sub_10028E894((uint64_t)v3);
  else
    sub_10028E348((uint64_t)v3);
  v6 = v5;

  if (v6)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)operationForRedoing
{
  _TtC5Files16DOCCopyOperation *v2;
  char *v3;

  v2 = self;
  v3 = DOCCopyOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  _TtC5Files16DOCCopyOperation *v2;
  id v3;

  v2 = self;
  v3 = DOCCopyOperation.operationForUndoing()();

  return v3;
}

- (void)registerUndo
{
  objc_msgSend(*(id *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_undoManager], "registerUndoOperationForSender:", self);
}

- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  sub_10028EE0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(items:destinationFolder:)", 30);
}

- (_TtC5Files16DOCCopyOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  sub_10028EE0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(urls:destinationFolder:)", 29);
}

- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v5;
  _TtC5Files16DOCCopyOperation *result;

  v5 = type metadata accessor for URL(0);
  __chkstk_darwin(v5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  result = (_TtC5Files16DOCCopyOperation *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCCopyOperation", 22, "init(items:destinationURL:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC5Files16DOCCopyOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
  sub_10028EE0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(sourceURLs:destinationFolder:)", 35);
}

- (_TtC5Files16DOCCopyOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
  sub_10028EE0C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"init(sourceURLsAndNames:destinationFolder:)", 43);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_sourceURLs]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_sourceItems]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_dsTransferResults]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_dsSourceItemToURL]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_dsSourceURLToItem]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_dsItemIDToPlaceholderID]);

}

- (NSDictionary)transferResults
{
  _TtC5Files16DOCCopyOperation *v2;
  uint64_t v3;
  NSDictionary v4;

  v2 = self;
  v3 = DOCCopyOperation.transferResults.getter();

  if (v3)
  {
    sub_10004F2F0(0, (unint64_t *)&qword_1006419B0, FPItem_ptr);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSDictionary *)v4.super.isa;
}

@end
