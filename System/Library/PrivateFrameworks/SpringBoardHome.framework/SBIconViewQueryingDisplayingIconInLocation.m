@implementation SBIconViewQueryingDisplayingIconInLocation

uint64_t __SBIconViewQueryingDisplayingIconInLocation_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDisplayingIcon:inLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __SBIconViewQueryingDisplayingIconInLocation_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isDisplayingIcon:inLocation:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

@end
