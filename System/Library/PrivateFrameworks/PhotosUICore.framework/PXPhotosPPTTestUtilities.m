@implementation PXPhotosPPTTestUtilities

+ (BOOL)requestTargetSelectorWithTestName:(id)a3 testOptions:(id)a4 application:(id)a5 gesturePerformer:(id)a6 scrollTestPerformer:(id)a7 resultHandler:(id)a8
{
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];

  v11 = _Block_copy(a8);
  v12 = sub_1A7AE3764();
  v14 = v13;
  v15 = sub_1A7AE3584();
  v18[2] = v11;
  swift_getObjCClassMetadata();
  v16 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  LOBYTE(a5) = static PhotosPPTTestUtilities.requestTargetSelector(testName:testOptions:application:gesturePerformer:scrollTestPerformer:resultHandler:)(v12, v14, v15, v16, (uint64_t)a6, (uint64_t)a7, (void (*)(void *, _QWORD, unint64_t))sub_1A6DC4F6C, (uint64_t)v18);
  _Block_release(v11);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a5 & 1;
}

- (PXPhotosPPTTestUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosPPTTestUtilities();
  return -[PXPhotosPPTTestUtilities init](&v3, sel_init);
}

@end
