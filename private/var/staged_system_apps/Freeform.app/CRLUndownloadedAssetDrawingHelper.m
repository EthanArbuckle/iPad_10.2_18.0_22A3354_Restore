@implementation CRLUndownloadedAssetDrawingHelper

- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4
{
  return (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper *)sub_100D3ED9C(a3, a4);
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC8Freeform33CRLUndownloadedAssetDrawingHelper *v5;

  v4 = a3;
  v5 = self;
  sub_100D3F0FC(v4);

}

- (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper)init
{
  _TtC8Freeform33CRLUndownloadedAssetDrawingHelper *result;

  result = (_TtC8Freeform33CRLUndownloadedAssetDrawingHelper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLUndownloadedAssetDrawingHelper", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform33CRLUndownloadedAssetDrawingHelper_rep);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLUndownloadedAssetDrawingHelper_backgroundColor));
}

@end
