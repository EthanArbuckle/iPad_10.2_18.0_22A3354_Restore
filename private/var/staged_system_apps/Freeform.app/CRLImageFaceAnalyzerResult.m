@implementation CRLImageFaceAnalyzerResult

- (CGRect)interestingFacesRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect);
  v3 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect];
  v4 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect
                                            + 8];
  v5 = *(double *)&self->interestingFacesRect[OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_interestingFacesRect
                                            + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)initWithFaceRectValues:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC8Freeform26CRLImageFaceAnalyzerResult *result;

  if (a3)
  {
    v4 = sub_1004B8930(0, (unint64_t *)&qword_10140B930, NSValue_ptr);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  }
  else
  {
    v5 = 0;
  }
  CRLImageFaceAnalyzerResult.init(faceRectValues:)(v5);
  return result;
}

- (CGPoint)maskCenterForFacesWithImageSize:(CGSize)a3 maskSize:(CGSize)a4 defaultCenter:(CGPoint)a5
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  _TtC8Freeform26CRLImageFaceAnalyzerResult *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v9 = self;
  CRLImageFaceAnalyzerResult.maskCenterForFaces(imageSize:maskSize:defaultCenter:)(v8, v7, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (_TtC8Freeform26CRLImageFaceAnalyzerResult)init
{
  _TtC8Freeform26CRLImageFaceAnalyzerResult *result;

  result = (_TtC8Freeform26CRLImageFaceAnalyzerResult *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLImageFaceAnalyzerResult", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform26CRLImageFaceAnalyzerResult_faceRectCombinations));
}

@end
