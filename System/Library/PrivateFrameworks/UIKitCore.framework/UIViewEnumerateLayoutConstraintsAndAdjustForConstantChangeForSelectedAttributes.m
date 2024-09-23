@implementation UIViewEnumerateLayoutConstraintsAndAdjustForConstantChangeForSelectedAttributes

uint64_t ___UIViewEnumerateLayoutConstraintsAndAdjustForConstantChangeForSelectedAttributes_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;

  if (a3 == 11)
  {
    v5 = objc_msgSend(a2, "viewForLastBaselineLayout");
  }
  else
  {
    if (a3 != 12)
      goto LABEL_6;
    v5 = objc_msgSend(a2, "viewForFirstBaselineLayout");
  }
  a2 = (void *)v5;
LABEL_6:
  if (a2 == *(void **)(a1 + 32))
    return (*(uint64_t (**)(uint64_t))(a1 + 40))(a3);
  else
    return 0;
}

uint64_t ___UIViewEnumerateLayoutConstraintsAndAdjustForConstantChangeForSelectedAttributes_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_containerGeometryDidChange");
}

@end
