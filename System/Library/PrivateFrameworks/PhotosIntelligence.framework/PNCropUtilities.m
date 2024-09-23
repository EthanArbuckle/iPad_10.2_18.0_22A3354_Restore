@implementation PNCropUtilities

+ (id)stringForCropVariantType:(int64_t)a3
{
  void *v3;

  static CropUtilities.stringForCropVariantType(_:)(a3);
  v3 = (void *)sub_243F84E08();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)cropVariantsForAsset:(id)a3 targetSize:(CGSize)a4 faces:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  swift_getObjCClassMetadata();
  v9 = a3;
  v10 = a5;
  static CropUtilities.cropVariants(forAsset:targetSize:faces:)(v9, a5, width, height);

  sub_243C67FD8(0, &qword_2543D2950);
  v11 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v11;
}

+ (id)cropVariantsForAsset:(id)a3 faces:(id)a4
{
  id v6;
  id v7;
  void *v8;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  static CropUtilities.cropVariants(forAsset:faces:)(v6, a4);

  sub_243C67FD8(0, &qword_2543D2950);
  v8 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)cropVariantsFromSignalsWithCropTypes:(double)a3 aspectRatio:(double)a4 sourcePixelWidth:(double)a5 sourcePixelHeight:(uint64_t)a6 acceptableCropRect:(uint64_t)a7 preferredCropRect:(uint64_t)a8 faceAreaRect:(uint64_t)a9 objectSaliencyRects:(uint64_t)a10 gazeAreaRect:(uint64_t)a11 isDenormalized:(uint64_t)a12
{
  uint64_t v29;
  unint64_t v30;
  uint64_t ObjCClassMetadata;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v29 = sub_243F85120();
  sub_243C67FD8(0, &qword_2543D2960);
  v30 = sub_243F85120();
  ObjCClassMetadata = swift_getObjCClassMetadata();
  static CropUtilities.cropVariantsFromSignals(requestedCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:)(v29, a9, a10, v30, a12, a1, a2, a3, a4, a5, a17, a18, a19, ObjCClassMetadata, v32, v33, a20, a21, a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_243C67FD8(0, &qword_2543D2950);
  v34 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return v34;
}

- (PNCropUtilities)init
{
  return (PNCropUtilities *)CropUtilities.init()();
}

@end
