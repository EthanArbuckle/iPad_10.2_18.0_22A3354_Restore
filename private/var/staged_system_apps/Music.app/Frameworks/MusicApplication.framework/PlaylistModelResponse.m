@implementation PlaylistModelResponse

- (id)results
{
  return objc_msgSend(*(id *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication21PlaylistModelResponse_underlyingModelResponse], "results");
}

- (void)setResults:(id)a3
{
  objc_msgSend(*(id *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication21PlaylistModelResponse_underlyingModelResponse], "setResults:", a3);
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication21PlaylistModelResponse *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_134CDA8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1D6A9C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1D62F0(a3, (uint64_t)v6, v7);
  sub_5C198((uint64_t)v6, v7);

}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC16MusicApplication21PlaylistModelResponse *v8;
  id v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_134CD80, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = sub_1D6718(a3, (uint64_t (*)())sub_5F278, v7);

  swift_release(v7);
  return v9;
}

- (_TtC16MusicApplication21PlaylistModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication21PlaylistModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication21PlaylistModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PlaylistModelResponse", 38, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication21PlaylistModelResponse_underlyingResponseInvalidationObserver]);
}

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _TtC16MusicApplication21PlaylistModelResponse *v15;
  Class isa;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[5];
  uint64_t v23;
  __objc2_prot *v24;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = *(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication21PlaylistModelResponse_underlyingModelResponse];
  v24 = &OBJC_PROTOCOL____TtP16MusicApplication40ContainerDetailAlbumNavigationHandleable_;
  v12 = (void *)swift_dynamicCastObjCProtocolConditional(v11, 1, &v24);
  v13 = a3;
  if (v12)
  {
    v14 = a4;
    v15 = self;
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v17 = objc_msgSend(v12, "navigationHandlerForItemAt:sourceViewController:", isa, v14);

    if (v17)
    {
      v18 = swift_allocObject(&unk_136B7D8, 24, 7);
      *(_QWORD *)(v18 + 16) = v17;

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      aBlock[4] = sub_112F24;
      v23 = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_42D124;
      aBlock[3] = &block_descriptor_130;
      v19 = _Block_copy(aBlock);
      swift_release(v23);
      return v19;
    }

  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 0;
}

@end
