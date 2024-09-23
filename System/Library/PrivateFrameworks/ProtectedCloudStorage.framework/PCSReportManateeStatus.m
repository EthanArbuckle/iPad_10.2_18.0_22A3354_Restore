@implementation PCSReportManateeStatus

uint64_t __PCSReportManateeStatus_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 12;
  return result;
}

uint64_t __PCSReportManateeStatus_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end
