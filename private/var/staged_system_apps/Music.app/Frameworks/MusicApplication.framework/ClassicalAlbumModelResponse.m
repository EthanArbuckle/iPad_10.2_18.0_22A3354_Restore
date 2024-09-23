@implementation ClassicalAlbumModelResponse

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC16MusicApplication27ClassicalAlbumModelResponse *v8;
  id v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_13690D0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = sub_4BCEC8(a3, (uint64_t (*)())sub_5F278, v7);

  swift_release(v7);
  return v9;
}

- (_TtC16MusicApplication27ClassicalAlbumModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication27ClassicalAlbumModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication27ClassicalAlbumModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ClassicalAlbumModelResponse", 44, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
