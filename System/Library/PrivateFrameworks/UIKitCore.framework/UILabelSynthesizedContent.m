@implementation UILabelSynthesizedContent

uint64_t __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1678D98, a3, a4);
  return result;
}

uint64_t __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(_QWORD *)off_1E1679048, a3, a4);
  return result;
}

void __84___UILabelSynthesizedContent__disablingHyphenationIfURLsDetectedInAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7;
  id v8;

  if (a2)
  {
    v8 = (id)objc_msgSend(a2, "mutableCopy");
    LODWORD(v7) = 0;
    objc_msgSend(v8, "setHyphenationFactor:", v7);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v8, a3, a4);

  }
}

void __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;

  if (!a2)
    a2 = (void *)a1[4];
  v6 = a2;
  v3 = objc_msgSend(v6, "baseWritingDirection");
  if (v3)
    v4 = 8296;
  else
    v4 = 8294;
  if (v3 == 1)
    v4 = 8295;
  v5 = *(_QWORD *)(a1[5] + 8);
  if (v4 != *(unsigned __int16 *)(v5 + 24))
  {
    *(_WORD *)(v5 + 24) = v4;
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

void __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a2;
  if (!v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "paragraphStyle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;
  v8 = objc_msgSend(v7, "baseWritingDirection");
  if (v8)
    v9 = 8296;
  else
    v9 = 8294;
  if (v8 == 1)
    v9 = 8295;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v9 != *(unsigned __int16 *)(v10 + 24))
  {
    *(_WORD *)(v10 + 24) = v9;
    v11 = *(_QWORD *)(a1 + 64) + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_WORD *)v11 = v9;
    *(_DWORD *)(v11 + 2) = 0;
    *(_WORD *)(v11 + 6) = 0;
    *(_QWORD *)(v11 + 8) = a3;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  v12 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v12, "setBaseWritingDirection:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(_QWORD *)off_1E1678F98, v12, a3, a4);

}

@end
