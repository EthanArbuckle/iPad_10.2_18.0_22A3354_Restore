@implementation UIStatusBarAddDefaultAnimationReposition

void ___UIStatusBarAddDefaultAnimationReposition_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addSubAnimation:forDisplayItemWithIdentifier:", *(_QWORD *)(a1 + 56), v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

@end
