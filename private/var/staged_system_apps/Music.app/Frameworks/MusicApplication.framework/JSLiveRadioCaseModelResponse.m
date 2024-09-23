@implementation JSLiveRadioCaseModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _TtC16MusicApplication28JSLiveRadioCaseModelResponse *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_136CEA8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication28JSLiveRadioCaseModelResponse_personalizationResponse];
  v14[4] = sub_5F278;
  v15 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_21B54C;
  v14[3] = &block_descriptor_10_15;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = self;
  swift_retain(v7);
  v12 = objc_msgSend(v8, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", a3, v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);

  swift_release(v7);
  return v12;
}

- (void)getChangeDetailsFromPreviousResponse:(id)a3 completion:(id)a4
{
  void (*v6)(id);
  uint64_t v7;
  id v8;
  _TtC16MusicApplication28JSLiveRadioCaseModelResponse *v9;

  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_136CE30, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(id))sub_1D6A9C;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_511084(a3, v6);
  sub_5C198((uint64_t)v6, v7);

}

- (_TtC16MusicApplication28JSLiveRadioCaseModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication28JSLiveRadioCaseModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication28JSLiveRadioCaseModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSLiveRadioCaseModelResponse", 45, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication28JSLiveRadioCaseModelResponse_itemsDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication28JSLiveRadioCaseModelResponse_personalizationResponseInvalidationObserver]);

}

- (BOOL)hasVideoArtwork
{
  _TtC16MusicApplication28JSLiveRadioCaseModelResponse *v2;
  char v3;
  char v4;

  v2 = self;
  sub_81A710();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16MusicApplication28JSLiveRadioCaseModelResponse *v10;
  char v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a3;
  v10 = self;
  v11 = sub_81A8FC();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11 & 1;
}

@end
