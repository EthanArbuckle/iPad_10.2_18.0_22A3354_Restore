@implementation IOReportCopyChannelsInCategories

uint64_t __IOReportCopyChannelsInCategories_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  int ChannelType;
  __int16 v4;
  unint64_t v6;

  v6 = 0;
  ChannelType = getChannelType(a2, &v6);
  v4 = WORD1(v6);
  if (ChannelType)
    v4 = -1;
  return 16 * ((unsigned __int16)(v4 & *(_WORD *)(a1 + 32)) == 0);
}

@end
