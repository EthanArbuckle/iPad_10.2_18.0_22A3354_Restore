@implementation UISApplicationSupportDisplayEdgeInfo(SpringBoardPreAzul)

+ (id)sb_legacy_roundCornerPadDisplayEdgeInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_roundCornerPadDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_legacy_roundCornerPadDisplayEdgeInfo_onceToken != -1)
    dispatch_once(&sb_legacy_roundCornerPadDisplayEdgeInfo_onceToken, block);
  return (id)sb_legacy_roundCornerPadDisplayEdgeInfo_sRoundCornerPadDisplayEdgeInfo;
}

+ (id)sb_legacy_homeButtonDeviceDisplayEdgeInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__UISApplicationSupportDisplayEdgeInfo_SpringBoardPreAzul__sb_legacy_homeButtonDeviceDisplayEdgeInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_legacy_homeButtonDeviceDisplayEdgeInfo_onceToken != -1)
    dispatch_once(&sb_legacy_homeButtonDeviceDisplayEdgeInfo_onceToken, block);
  return (id)sb_legacy_homeButtonDeviceDisplayEdgeInfo_sHomeButtonDeviceDisplayEdgeInfo;
}

@end
