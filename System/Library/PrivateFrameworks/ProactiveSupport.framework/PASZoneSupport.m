@implementation PASZoneSupport

void __50___PASZoneSupport_deepCopyObject_toZone_strategy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a3;
  objc_msgSend(v5, "deepCopyObject:toZone:strategy:", a2, v6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "deepCopyObject:toZone:strategy:", v7, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_pas_setObject:forNonCopiedKey:", v8, v9);
}

@end
