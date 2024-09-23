@implementation IOReportCopyChannelsOfFormat

uint64_t __IOReportCopyChannelsOfFormat_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  int ChannelType;
  unsigned __int8 v4;
  unint64_t v6;

  v6 = 0;
  ChannelType = getChannelType(a2, &v6);
  v4 = v6;
  if (ChannelType)
    v4 = 0;
  return 16 * (*(unsigned __int8 *)(a1 + 32) != v4);
}

@end
