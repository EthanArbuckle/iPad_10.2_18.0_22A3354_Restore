@implementation UIFocusItemInfo

void __54___UIFocusItemInfo_isFocusMovementFlippedHorizontally__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "_isFocusDirectionFlippedHorizontally"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }

}

@end
