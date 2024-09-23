@implementation JSShelfModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _TtC16MusicApplication20JSShelfModelResponse *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_13774F0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_personalizationResponse];
  v14[4] = sub_5F278;
  v15 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_21B54C;
  v14[3] = &block_descriptor_10_19;
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
  _TtC16MusicApplication20JSShelfModelResponse *v9;

  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1377478, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(id))sub_50BEC;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_671940(a3, v6, v7);
  sub_5C198((uint64_t)v6, v7);

}

- (_TtC16MusicApplication20JSShelfModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication20JSShelfModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication20JSShelfModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSShelfModelResponse", 37, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_sectionsDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_personalizationResponseInvalidationObserver]);

}

- (BOOL)hasVideoArtwork
{
  _TtC16MusicApplication20JSShelfModelResponse *v2;
  char v3;
  char v4;

  v2 = self;
  sub_81AC34();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)hasVideoArtworkAt:(id)a3
{
  return sub_81AE28((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20JSShelfModelResponse_jsResults, type metadata accessor for JSShelfItem);
}

@end
