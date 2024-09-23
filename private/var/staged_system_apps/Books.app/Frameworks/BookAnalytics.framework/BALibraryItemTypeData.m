@implementation BALibraryItemTypeData

- (BALibraryItemTypeData)initWithContentPrivateID:(id)a3 contentUserID:(id)a4 contentType:(int64_t)a5 contentID:(id)a6 isSample:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  id v23;
  objc_super v25;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v14 = v13;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, v16);
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentPrivateID);
  *v19 = v12;
  v19[1] = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentUserID);
  *v20 = v15;
  v20[1] = v17;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BALibraryItemTypeData_contentType) = (Class)a5;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR___BALibraryItemTypeData_contentID);
  *v21 = v18;
  v21[1] = v22;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BALibraryItemTypeData_isSample) = (Class)a7;
  v25.receiver = self;
  v25.super_class = (Class)type metadata accessor for BridgedLibraryItemTypeData();
  v23 = a7;
  return -[BALibraryItemTypeData init](&v25, "init");
}

- (BALibraryItemTypeData)init
{
  BALibraryItemTypeData *result;

  result = (BALibraryItemTypeData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedLibraryItemTypeData", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentPrivateID[OBJC_IVAR___BALibraryItemTypeData_contentPrivateID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentPrivateID[OBJC_IVAR___BALibraryItemTypeData_contentUserID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentPrivateID[OBJC_IVAR___BALibraryItemTypeData_contentID]);

}

@end
