@implementation AudioPlayer

- (void)dealloc
{
  sub_1B1BAE77C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC3VFX11AudioPlayer_player, (SEL *)&selRef_stop, 0, type metadata accessor for AudioPlayer);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC3VFX11AudioPlayer_url;
  v4 = sub_1B2228110();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (_TtC3VFX11AudioPlayer)init
{
  _TtC3VFX11AudioPlayer *result;

  result = (_TtC3VFX11AudioPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
