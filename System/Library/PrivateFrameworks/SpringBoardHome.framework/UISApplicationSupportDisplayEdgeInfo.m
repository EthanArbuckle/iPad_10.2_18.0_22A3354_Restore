@implementation UISApplicationSupportDisplayEdgeInfo

void __84__UISApplicationSupportDisplayEdgeInfo_SBHScreenTypes__sb_thisDeviceDisplayEdgeInfo__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sbh_displayEdgeInfoForScreenType:", SBHScreenTypeForCurrentDevice());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo;
  sb_thisDeviceDisplayEdgeInfo_sNewThisDeviceDisplayEdgeInfo = v1;

}

@end
