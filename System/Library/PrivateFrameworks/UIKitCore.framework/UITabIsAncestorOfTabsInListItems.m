@implementation UITabIsAncestorOfTabsInListItems

uint64_t ___UITabIsAncestorOfTabsInListItems_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "tabForSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_isAncestorOfTab:", v3);

  return v4;
}

@end
