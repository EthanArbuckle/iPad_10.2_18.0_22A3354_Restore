@implementation LoadImageSequence

void __LoadImageSequence_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if (*(_BYTE *)(a1 + 72))
    {
      v6 = v3;
      objc_msgSend(v3, "resizableImageWithCapInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_setAlwaysStretches:", *(unsigned __int8 *)(a1 + 73));
      v4 = v5;
    }
    v7 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

  }
}

@end
