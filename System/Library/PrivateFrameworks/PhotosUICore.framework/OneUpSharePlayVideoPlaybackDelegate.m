@implementation OneUpSharePlayVideoPlaybackDelegate

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  void *v6;
  id v7;
  id v8;
  _TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate *v9;
  id result;
  id v11;
  void *v12;

  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate_displayAsset);
  v7 = a3;
  v8 = a4;
  v9 = self;
  result = objc_msgSend(v6, sel_uuid);
  if (result)
  {
    v11 = result;
    sub_1A7AE3764();

    v12 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate)init
{
  _TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate *result;

  result = (_TtC12PhotosUICore35OneUpSharePlayVideoPlaybackDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
