@implementation PXObservable

void __77__PXObservable_PXStory__pxStory_enumerateStatesByWatchingChanges_usingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && (a1[8] & a3) != 0)
  {
    v6 = v5;
    (*(void (**)(void))(a1[5] + 16))();
    v5 = v6;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "cancel");
      v5 = v6;
    }
  }

}

uint64_t __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "cancel");
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end
