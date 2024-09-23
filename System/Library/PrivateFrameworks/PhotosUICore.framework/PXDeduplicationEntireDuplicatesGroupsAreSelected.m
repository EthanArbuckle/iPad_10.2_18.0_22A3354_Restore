@implementation PXDeduplicationEntireDuplicatesGroupsAreSelected

void __PXDeduplicationEntireDuplicatesGroupsAreSelected_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = *(void **)(a1 + 32);
  v9 = a4;
  objc_msgSend(v8, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfItemsInSection:", a3);

  v12 = objc_msgSend(v9, "count");
  if (v11 != v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a5 = 1;
  }
}

@end
