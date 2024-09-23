@implementation NSIndexPath

void __65__NSIndexPath_TVMLKitAdditions__flattenedIndexForItemInSections___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "section") == a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v8, "numberOfItems");
  }

}

@end
