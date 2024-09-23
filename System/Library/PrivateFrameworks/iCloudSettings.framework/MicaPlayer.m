@implementation MicaPlayer

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  _TtC14iCloudSettings10MicaPlayer *v5;
  void *v6;
  objc_super v7;

  v3 = OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_playbackTimer;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_playbackTimer);
  v5 = self;
  if (v4)
  {
    objc_msgSend(v4, sel_invalidate);
    v6 = *(Class *)((char *)&self->super.isa + v3);
    *(Class *)((char *)&self->super.isa + v3) = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MicaPlayer();
  -[MicaPlayer dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_url;
  v4 = sub_24B5E2FF4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_24B5AC058((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_delegate);
  swift_bridgeObjectRelease();

}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC14iCloudSettings10MicaPlayer *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v15;

  v4 = sub_24B5E2FF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_24B5BB338();
  v10 = v9;
  v11 = sub_24B5AB8B8(*(uint64_t *)((char *)&v8->super.isa + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_publishedObjects));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, (uint64_t)v8 + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_url, v4);
  v12 = objc_allocWithZone((Class)type metadata accessor for MicaPlayer());
  v13 = sub_24B5AB1D8((uint64_t)v7, v10, v11);

  return v13;
}

- (_TtC14iCloudSettings10MicaPlayer)init
{
  _TtC14iCloudSettings10MicaPlayer *result;

  result = (_TtC14iCloudSettings10MicaPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
