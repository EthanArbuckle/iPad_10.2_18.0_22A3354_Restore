@implementation UIFocusEnvironmentInheritedFocusMovementStyle

void ___UIFocusEnvironmentInheritedFocusMovementStyle_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v6, "_preferredFocusMovementStyle");
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a3 = 1;

}

@end
