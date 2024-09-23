@implementation CRLFeatureFlagGroup

+ (BOOL)isAaBrandingEnabled
{
  return sub_1009EE7BC((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLAppleAccountFeatureFlags, (uint64_t (*)(void))sub_1006CD0F8);
}

+ (BOOL)isAdoptTipsNextEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 0);
}

+ (BOOL)isAllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKitEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 23);
}

+ (BOOL)isChangeShapeEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 4);
}

+ (BOOL)isDrawingDataDetectorsEnabled
{
  return sub_1009EE710((uint64_t)a1, (uint64_t)a2, 1, 6);
}

+ (BOOL)isEasierConnectionLinesEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 7);
}

+ (BOOL)isFileImportExportEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 8);
}

+ (BOOL)isFollowEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 11);
}

+ (BOOL)isGenerativePlaygroundEnabled
{
  return sub_1009EE920() & 1;
}

+ (BOOL)isHandwritingIntelligenceEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 13);
}

+ (BOOL)isMagicListsEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 15);
}

+ (BOOL)isMathPaperEnabled
{
  return sub_1009EE9BC() & 1;
}

+ (BOOL)isMathPaperFeatureEnabled
{
  return sub_1009EE710((uint64_t)a1, (uint64_t)a2, 0, 14);
}

+ (BOOL)isPKDrawingExportEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 9);
}

+ (BOOL)isRedesignedTextCursorEnabled
{
  return sub_1009EE7BC((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLUIKitFeatureFlags, (uint64_t (*)(void))sub_1005E9710);
}

+ (BOOL)isScenesEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 16);
}

+ (BOOL)isSendACopyEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 17);
}

+ (BOOL)isSnapToGridEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 18);
}

+ (BOOL)isStencilsEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 19);
}

+ (BOOL)isThreeDimensionalObjectsEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 20);
}

+ (BOOL)isToolPickerItemAPIEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 21);
}

+ (BOOL)isUseSandboxEnvironmentEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 24);
}

+ (BOOL)isVerticalTextBoxAlignmentEnabled
{
  return sub_1009EE840((uint64_t)a1, (uint64_t)a2, 22);
}

- (_TtC8Freeform19CRLFeatureFlagGroup)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLFeatureFlagGroup();
  return -[CRLFeatureFlagGroup init](&v3, "init");
}

@end
