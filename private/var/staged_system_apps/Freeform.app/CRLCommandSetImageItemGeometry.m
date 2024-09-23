@implementation CRLCommandSetImageItemGeometry

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CRLCanvasInfoGeometry)imageGeometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_imageGeometry));
}

- (CRLCanvasInfoGeometry)maskGeometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskGeometry));
}

- (CRLPathSource)maskPathSource
{
  return (CRLPathSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskPathSource));
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithId:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtC8Freeform30CRLCommandSetImageItemGeometry *v16;
  uint64_t v18;

  v10 = type metadata accessor for UUID(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (_TtC8Freeform30CRLCommandSetImageItemGeometry *)sub_1006BBEF0((uint64_t)v12, a4, a5, a6);

  return v16;
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)initWithImageItem:(id)a3 imageGeometry:(id)a4 maskGeometry:(id)a5 maskPathSource:(id)a6
{
  char *v9;
  id v10;
  id v11;
  id v12;

  v9 = (char *)a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  return (_TtC8Freeform30CRLCommandSetImageItemGeometry *)sub_1006BB898(v9, a4, a5, a6);
}

- (_TtC8Freeform30CRLCommandSetImageItemGeometry)init
{
  _TtC8Freeform30CRLCommandSetImageItemGeometry *result;

  result = (_TtC8Freeform30CRLCommandSetImageItemGeometry *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetImageItemGeometry", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_imageGeometry));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskGeometry));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLCommandSetImageItemGeometry_maskPathSource));
}

@end
