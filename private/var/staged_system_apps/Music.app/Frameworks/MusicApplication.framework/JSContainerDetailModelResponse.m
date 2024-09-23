@implementation JSContainerDetailModelResponse

- (id)request
{
  id v2;
  objc_super v4;

  if (self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_useUnderlyingResponseForPlayback] == 1)
  {
    v2 = objc_msgSend(*(id *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_underlyingResponse], "request");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)swift_getObjectType();
    v2 = -[JSContainerDetailModelResponse request](&v4, "request");
  }
  return v2;
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _TtC16MusicApplication30JSContainerDetailModelResponse *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1361538, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_underlyingResponse];
  v14[4] = sub_5F278;
  v15 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_21B54C;
  v14[3] = &block_descriptor_111;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = self;
  swift_retain(v7);
  v12 = objc_msgSend(v8, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", a3, v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);

  swift_release(v7);
  return v12;
}

- (_TtC16MusicApplication30JSContainerDetailModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication30JSContainerDetailModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication30JSContainerDetailModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSContainerDetailModelResponse", 47, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_containerStoreItemMetadataDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_containerEntriesDidUpdateNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_underlyingResponseInvalidationObserver]);

}

- (id)storeItemMetadataForItemAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  _TtC16MusicApplication30JSContainerDetailModelResponse *v11;
  Class isa;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication30JSContainerDetailModelResponse_storeItemMetadataResults];
  v10 = a3;
  v11 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v13 = objc_msgSend(v9, "itemAtIndexPath:", isa);

  v14 = objc_opt_self(MPStoreItemMetadata);
  v15 = (void *)swift_dynamicCastObjCClass(v13, v14);

  if (!v15)
    swift_unknownObjectRelease(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v15;
}

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication30JSContainerDetailModelResponse *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[5];
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_4F3850((uint64_t)v10, v12);
  v16 = v15;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v14)
  {
    aBlock[4] = v14;
    v19 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_42D124;
    aBlock[3] = &block_descriptor_13_3;
    v14 = _Block_copy(aBlock);
    swift_release(v19);
  }
  return v14;
}

@end
