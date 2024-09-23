@implementation UIMenuPreparationContext

uint64_t __70___UIMenuPreparationContext_contextWithPreparer_firstResponderTarget___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "preferredElementSize");
  if (v3 == -1)
    v3 = ~(objc_msgSend(v2, "options") >> 6) & 2;

  return v3;
}

uint64_t __70___UIMenuPreparationContext_contextWithPreparer_firstResponderTarget___block_invoke_2()
{
  return 1;
}

@end
