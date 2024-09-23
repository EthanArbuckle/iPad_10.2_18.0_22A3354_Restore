@implementation SBIconViewQueryingDisplayingIconView

uint64_t __SBIconViewQueryingDisplayingIconView_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isDisplayingIconView:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __SBIconViewQueryingDisplayingIconView_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDisplayingIconView:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
