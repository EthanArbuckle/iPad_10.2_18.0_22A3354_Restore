@implementation SBFGetCurrentMagnifyMode

void __SBFGetCurrentMagnifyMode_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "size");
  if (v8 == *(double *)(a1 + 40) && v7 == *(double *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
