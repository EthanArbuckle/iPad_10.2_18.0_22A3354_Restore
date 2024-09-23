@implementation JSTVShowEpisodeDetailModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_136CB80, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse_personalizationResponse];
  v14[4] = sub_5F278;
  v15 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_21B54C;
  v14[3] = &block_descriptor_137;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = self;
  swift_retain(v7);
  v12 = objc_msgSend(v8, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", a3, v9, swift_release(v10).n128_f64[0]);
  _Block_release(v9);

  swift_release(v7);
  return v12;
}

- (_TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSTVShowEpisodeDetailModelResponse", 51, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse_itemDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication34JSTVShowEpisodeDetailModelResponse_personalizationResponseInvalidationObserver]);

}

@end
