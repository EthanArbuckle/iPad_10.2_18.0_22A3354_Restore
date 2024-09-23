@implementation GlyphView.Coordinator

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  void (*v5)(uint64_t);
  id v6;
  _TtCV9PassKitUI9GlyphView11Coordinator *v7;
  uint64_t v8;

  v5 = *(void (**)(uint64_t))&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 96];
  v6 = a3;
  v7 = self;
  v8 = sub_19DE82CB0();
  v5(v8);

  swift_release();
}

- (_TtCV9PassKitUI9GlyphView11Coordinator)init
{
  _TtCV9PassKitUI9GlyphView11Coordinator *result;

  result = (_TtCV9PassKitUI9GlyphView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];
  uint64_t v7;

  v2 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 104];
  v6[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 88];
  v6[7] = v2;
  v7 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 120];
  v3 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 40];
  v6[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 24];
  v6[3] = v3;
  v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 72];
  v6[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 56];
  v6[5] = v4;
  v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV9PassKitUI9GlyphView11Coordinator_parent);
  v6[1] = v5;
  sub_19D41E458((uint64_t)v6);
}

@end
