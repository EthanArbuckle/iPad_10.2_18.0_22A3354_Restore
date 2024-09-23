@implementation CNContact

void __68__CNContact_PKAdditions__pkContactWithNameComponents_labeledValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v9 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkAddLabeledValues:withProperty:", v8, v7, v9, v10);

}

uint64_t __42__CNContact_PKAdditions__isSubsetOfMeCard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 32));
}

BOOL __42__CNContact_PKAdditions__sanitizedContact__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

@end
