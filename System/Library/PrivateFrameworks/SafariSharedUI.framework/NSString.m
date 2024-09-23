@implementation NSString

uint64_t __88__NSString_WBSFaviconProviderNSStringExtras__safari_urlStringVariantsForFaviconDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == objc_msgSend(v4, "length"))
  {
    v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v4);

  }
  else
  {
    v8 = objc_msgSend(v5, "length");

    if (v8 > objc_msgSend(v4, "length"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

uint64_t __101__NSString_WBSFaviconProviderNSStringExtras__safari_domainFaviconURLStringVariantsForFaviconDatabase__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByAppendingString:", CFSTR("/favicon.ico"));
}

uint64_t __95__NSString_WBSFaviconProviderNSStringExtras__safari_urlStringVariantsForIconControllerDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == objc_msgSend(v4, "length"))
  {
    v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v4);

  }
  else
  {
    v8 = objc_msgSend(v5, "length");

    if (v8 > objc_msgSend(v4, "length"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

uint64_t __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke(_QWORD *a1, uint64_t a2, _OWORD *a3)
{
  const void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFAttributedString *v8;
  const __CTLine *v9;
  const __CFArray *GlyphRuns;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 48) = *a3;
  v4 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    v6 = a1[4];
    v12 = *MEMORY[0x1E0CEA098];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (const __CFAttributedString *)objc_msgSend(v5, "initWithString:attributes:", CFSTR("…"), v7);

    v9 = CTLineCreateWithAttributedString(v8);
    GlyphRuns = CTLineGetGlyphRuns(v9);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = CFArrayGetValueAtIndex(GlyphRuns, 0);
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1[6] + 8) + 24));
    CFRelease(v9);

    v4 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  CFRetain(v4);
  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

@end
