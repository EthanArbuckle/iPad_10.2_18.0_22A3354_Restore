@implementation CRLImageUndownloadedAssetDrawingHelper

- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithImageRep:(id)a3 asset:(id)a4
{
  return (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *)sub_10066FD3C(a3, a4);
}

- (void)drawInConext:(CGContext *)a3 withOriginalImageRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  _TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = self;
  sub_10066FE98(v9, x, y, width, height);

}

- (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper)initWithRep:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  _TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLImageUndownloadedAssetDrawingHelper", 47, "init(rep:asset:)", 16, 0);
  __break(1u);
  return result;
}

@end
