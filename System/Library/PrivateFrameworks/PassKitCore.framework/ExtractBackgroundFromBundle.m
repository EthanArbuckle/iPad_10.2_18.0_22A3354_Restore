@implementation ExtractBackgroundFromBundle

BOOL ___ExtractBackgroundFromBundle_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  const __CFURL *v5;
  const __CFURL *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:", v3, CFSTR("pdf"));
    v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGPDFDocumentCreateWithURL(v5);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
       || (+[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 72)), v7 = objc_claimAutoreleasedReturnValue(), v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), v9 = *(void **)(v8 + 40), *(_QWORD *)(v8 + 40) = v7, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))|| *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;

    v4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  }

  return v4;
}

@end
