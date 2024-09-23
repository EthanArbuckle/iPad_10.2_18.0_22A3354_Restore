@implementation PKApplyFormatToString

void __PKApplyFormatToString_block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  int v10;
  void *v11;
  id v12;

  v12 = a2;
  v10 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12);
  v11 = v12;
  if (v10)
  {
    if (a3 < objc_msgSend(*(id *)(a1 + 40), "length") || a3 >= *(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 40), "insertString:atIndex:", v12, a3);
    else
      *a7 = 1;
    v11 = v12;
  }

}

@end
