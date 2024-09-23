@implementation UIEventDeferringProcessIsPineBoard

void ___UIEventDeferringProcessIsPineBoard_block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  _UIMainBundleIdentifier();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));
  byte_1ECD7F781 = v2;

}

@end
