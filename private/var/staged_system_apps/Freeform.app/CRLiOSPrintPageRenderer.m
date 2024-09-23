@implementation CRLiOSPrintPageRenderer

- (int64_t)numberOfPages
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v11;
  _TtC8Freeform23CRLiOSPrintPageRenderer *v12;
  _BYTE v13[24];
  _OWORD v14[8];

  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter, v13, 0, 0);
  v4 = v3[5];
  v14[4] = v3[4];
  v14[5] = v4;
  v5 = v3[7];
  v14[6] = v3[6];
  v14[7] = v5;
  v6 = v3[1];
  v14[0] = *v3;
  v14[1] = v6;
  v7 = v3[3];
  v14[2] = v3[2];
  v14[3] = v7;
  if (BYTE1(v7) != 1)
    return 1;
  v8 = *((_QWORD *)&v14[0] + 1);
  if (!*((_QWORD *)&v14[0] + 1))
    return 1;
  if (!(*((_QWORD *)&v14[0] + 1) >> 62))
    return *(_QWORD *)((*((_QWORD *)&v14[0] + 1) & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v14[0] >= 0)
    v11 = *((_QWORD *)&v14[0] + 1) & 0xFFFFFFFFFFFFFF8;
  else
    v11 = *((_QWORD *)&v14[0] + 1);
  v12 = self;
  sub_1006D3DDC(v14);
  swift_bridgeObjectRetain(v8);
  v9 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease();
  sub_1006D3E20((uint64_t)v14);

  return v9;
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8Freeform23CRLiOSPrintPageRenderer *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self;
  sub_1008ADB60(a3, x, y, width, height);

}

- (_TtC8Freeform23CRLiOSPrintPageRenderer)init
{
  _TtC8Freeform23CRLiOSPrintPageRenderer *result;

  result = (_TtC8Freeform23CRLiOSPrintPageRenderer *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPrintPageRenderer", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  v3 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 72];
  v7[4] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 56];
  v7[5] = v3;
  v4 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 104];
  v7[6] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 88];
  v7[7] = v4;
  v5 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter);
  v7[1] = v5;
  v6 = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 40];
  v7[2] = *(_OWORD *)&self->exporter[OBJC_IVAR____TtC8Freeform23CRLiOSPrintPageRenderer_exporter + 24];
  v7[3] = v6;
  sub_1006D3E20((uint64_t)v7);

}

@end
