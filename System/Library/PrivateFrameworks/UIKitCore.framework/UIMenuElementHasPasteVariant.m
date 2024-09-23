@implementation UIMenuElementHasPasteVariant

BOOL ___UIMenuElementHasPasteVariant_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", objc_msgSend(a2, "action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0DC5BE8];
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variantForActionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_0(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0DC5BE8], "variantForSelector:", objc_msgSend(a2, "action"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL ___UIMenuElementHasPasteVariant_block_invoke_2_0(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = (void *)MEMORY[0x1E0DC5BE8];
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variantForActionIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

@end
