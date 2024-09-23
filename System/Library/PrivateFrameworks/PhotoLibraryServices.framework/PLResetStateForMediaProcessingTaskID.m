@implementation PLResetStateForMediaProcessingTaskID

uint64_t __PLResetStateForMediaProcessingTaskID_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
}

uint64_t __PLResetStateForMediaProcessingTaskID_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setTotalUnitCount:", objc_msgSend(a2, "count"));
}

void __PLResetStateForMediaProcessingTaskID_block_invoke_3(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "becomeCurrentWithPendingUnitCount:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "isCancelled"))
  {
    *a4 = 1;
  }
  else
  {
    PLResetMediaProcessingStateOnAsset(a1[5], v6, a1[6]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "resignCurrent");
  }

}

@end
