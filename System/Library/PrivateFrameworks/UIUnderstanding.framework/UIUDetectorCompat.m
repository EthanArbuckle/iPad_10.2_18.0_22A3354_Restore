@implementation UIUDetectorCompat

+ (float)staticIOUThreshold
{
  return 0.2;
}

- (UIUDetectorCompat)initWithPlatform:(int64_t)a3 elementConfidenceThresholds:(id)a4 clickabilityConfidenceThresholds:(id)a5 elementConfig:(id)a6 clickabilityConfig:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  return (UIUDetectorCompat *)UIUDetector.init(platform:elementConfidenceThresholds:clickabilityConfidenceThresholds:elementConfig:clickabilityConfig:)(a3, a4, a5, a6, a7);
}

- (UIUDetectorCompat)init
{
  UIUDetectorCompat *result;

  result = (UIUDetectorCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___UIUDetectorCompat_elementDetector);
  swift_bridgeObjectRelease();
  sub_2496FD3AC((uint64_t)self + OBJC_IVAR___UIUDetectorCompat_clickabilityDetector, &qword_25787A340);

  swift_bridgeObjectRelease();
  swift_release();
  sub_2496FD3AC((uint64_t)self + OBJC_IVAR___UIUDetectorCompat_focusElementDetector, &qword_25787A340);
}

- (id)getUIObjectsInScreen:(CGImage *)a3 addOCR:(BOOL)a4 addIconRecognition:(BOOL)a5 addClickability:(BOOL)a6 addFocusElements:(BOOL)a7 nmsThreshold:(float)a8 useAccurateOCR:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v10;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  CGImage *v21;
  UIUDetectorCompat *v22;
  void *v23;
  uint64_t v25;

  v10 = a9;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v18 = type metadata accessor for UIUDetectorResult();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a3;
  v22 = self;
  UIUDetector.getUIDetectionsInScreen(_:addOCR:addIconRecognition:addClickability:addFocusElements:nmsThreshold:useAccurateOCR:)(v21, v15, v14, v13, v12, v10, v20, a8);
  swift_bridgeObjectRetain();
  sub_2496D407C((uint64_t)v20);

  type metadata accessor for UIObject();
  v23 = (void *)sub_24972CCCC();
  swift_bridgeObjectRelease();
  return v23;
}

@end
