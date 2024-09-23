@implementation SBIconViewQueryingHandleMethodRecursion

void __SBIconViewQueryingHandleMethodRecursion_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  int v8;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    if (!v8)
      return;
    goto LABEL_5;
  }
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  if ((v7 & 1) != 0)
LABEL_5:
    *a4 = 1;
}

@end
