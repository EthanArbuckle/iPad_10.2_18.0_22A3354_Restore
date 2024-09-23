@implementation SwiftUIDragItem

- (_TtC8BookCore15SwiftUIDragItem)initWithCoder:(id)a3
{
  return (_TtC8BookCore15SwiftUIDragItem *)SwiftUIDragItem.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8BookCore15SwiftUIDragItem *v5;
  NSString v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v7);

}

- (_TtC8BookCore15SwiftUIDragItem)init
{
  _TtC8BookCore15SwiftUIDragItem *result;

  result = (_TtC8BookCore15SwiftUIDragItem *)_swift_stdlib_reportUnimplementedInitializer("BookCore.SwiftUIDragItem", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->assetID[OBJC_IVAR____TtC8BookCore15SwiftUIDragItem_assetID]);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8BookCore15SwiftUIDragItem *v10;
  void *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  v11 = (void *)sub_194F68(v7, v9, (uint64_t)v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
  return v11;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v15 = v14;

  swift_getObjCClassMetadata(a1);
  v16 = static SwiftUIDragItem.object(withItemProviderData:typeIdentifier:)(v10, v12, v13, v15);
  swift_bridgeObjectRelease(v15);
  sub_17933C(v10, v12);
  return v16;
}

@end
