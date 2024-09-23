@implementation MusicKitEditingModelResponse

- (id)results
{
  uint64_t v2;
  _TtC16MusicApplication28MusicKitEditingModelResponse *v3;
  uint64_t v4;
  void *v5;
  id result;

  v2 = *(uint64_t *)((char *)&self->super
                  + OBJC_IVAR____TtC16MusicApplication28MusicKitEditingModelResponse_musickitEditor);
  v3 = self;
  v4 = swift_retain(v2);
  v5 = (void *)MusicLibraryPlaylistEditViewModel.tracklist.getter(v4);
  result = (id)swift_release(v2);
  if (v5)
  {

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC16MusicApplication28MusicKitEditingModelResponse)initWithRequest:(id)a3
{
  id v3;
  _TtC16MusicApplication28MusicKitEditingModelResponse *result;

  v3 = a3;
  result = (_TtC16MusicApplication28MusicKitEditingModelResponse *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MusicKitEditingModelResponse", 45, "init(request:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)((char *)&self->super
                          + OBJC_IVAR____TtC16MusicApplication28MusicKitEditingModelResponse_musickitEditor));
}

@end
