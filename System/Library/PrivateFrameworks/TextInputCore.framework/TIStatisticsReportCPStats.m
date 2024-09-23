@implementation TIStatisticsReportCPStats

uint64_t __TIStatisticsReportCPStats_block_invoke(uint64_t a1)
{
  uint64_t result;

  TIStatisticsReportCPStats_usageCountDefaults = objc_msgSend(*(id *)(a1 + 32), "integerForKey:", CFSTR("kbUserDidPath"));
  result = objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E0DBE950]);
  TIStatisticsReportCPStats_didDiscover = result;
  if (TIStatisticsReportCPStats_usageCountDefaults == 0x7FFFFFFFFFFFFFFFLL)
    TIStatisticsReportCPStats_usageCountDefaults = 3;
  return result;
}

@end
