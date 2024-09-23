@implementation WFAddWatchWorkflowTypeToFetchedRecordIfNeeded

uint64_t __WFAddWatchWorkflowTypeToFetchedRecordIfNeeded_block_invoke(uint64_t result)
{
  _BYTE *v1;

  v1 = *(_BYTE **)(result + 40);
  if (v1)
    *v1 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
