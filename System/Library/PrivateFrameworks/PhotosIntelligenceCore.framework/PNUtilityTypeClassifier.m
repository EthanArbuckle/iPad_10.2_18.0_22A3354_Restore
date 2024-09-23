@implementation PNUtilityTypeClassifier

+ (unint64_t)latestVersion
{
  return 9;
}

+ (BOOL)screenshotInferredInAsset:(id)a3 usingSceneModel:(id)a4
{
  id v6;
  char v7;

  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  v6 = a4;
  v7 = static PNUtilityTypeClassifier.screenshotInferred(in:usingSceneModel:)((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7 & 1;
}

+ (unint64_t)utilityTypesDetectedInAsset:(id)a3 usingSceneModel:(id)a4
{
  id v6;
  unint64_t v7;

  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  v6 = a4;
  v7 = static PNUtilityTypeClassifier.utilityTypesDetected(in:usingSceneModel:)(a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (PNUtilityTypeClassifier)init
{
  return (PNUtilityTypeClassifier *)PNUtilityTypeClassifier.init()();
}

@end
