@implementation PLSearchIndexEnumeratePlacesFromBigToSmall

void __PLSearchIndexEnumeratePlacesFromBigToSmall_block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "length")
    && (a3 <= 0xC && ((1 << a3) & 0x1420) != 0 || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

@end
