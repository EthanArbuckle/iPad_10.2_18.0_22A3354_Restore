@implementation TUIPointQueue

void __50___TUIPointQueue_effectiveStartIndexBasedOnLength__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "length");
  v10 = v9;
  objc_msgSend(v8, "length");
  v12 = v11;

  if (v10 - v12 > 200.0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

@end
