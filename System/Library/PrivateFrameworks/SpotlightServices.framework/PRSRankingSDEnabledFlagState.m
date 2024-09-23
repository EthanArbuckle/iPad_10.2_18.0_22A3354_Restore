@implementation PRSRankingSDEnabledFlagState

void __PRSRankingSDEnabledFlagState_block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  if (objc_msgSend(v0, "BOOLForKey:", CFSTR("SDEnabledSendRankingFeatures")))
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 2u;
  if (objc_msgSend(v0, "BOOLForKey:", CFSTR("SDEnabledArchiveParsecResults")))
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 4u;
  if (objc_msgSend(v0, "BOOLForKey:", CFSTR("SDEnabledUnarchiveParsecResults ")))
    PRSRankingSDEnabledFlagState_sPRSRankingSDEnabledFlags |= 8u;

}

@end
