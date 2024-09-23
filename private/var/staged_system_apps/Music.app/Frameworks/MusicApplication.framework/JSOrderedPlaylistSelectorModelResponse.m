@implementation JSOrderedPlaylistSelectorModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse *v10;
  id v11;
  _QWORD v13[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_139A460, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse_personalizationResponse];
  v13[4] = sub_5F278;
  v13[5] = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_21B54C;
  v13[3] = &block_descriptor_269;
  v9 = _Block_copy(v13);
  v10 = self;
  swift_retain();
  v11 = objc_msgSend(v8, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", a3, v9, swift_release().n128_f64[0]);
  _Block_release(v9);

  swift_release();
  return v11;
}

- (_TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSOrderedPlaylistSelectorModelResponse", 55, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse_itemsDidChangeNotificationObserver]);
  swift_release(*(_QWORD *)&self->MPModelResponse_opaque[OBJC_IVAR____TtC16MusicApplication38JSOrderedPlaylistSelectorModelResponse_personalizationResponseInvalidationObserver]);

}

@end
