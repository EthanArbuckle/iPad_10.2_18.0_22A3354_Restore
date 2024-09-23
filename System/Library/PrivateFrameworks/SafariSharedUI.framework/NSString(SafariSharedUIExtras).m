@implementation NSString(SafariSharedUIExtras)

- (id)safari_stringWithFont:()SafariSharedUIExtras forWidth:lineBreakMode:
{
  id v4;
  id v5;
  void *v6;
  const __CFAttributedString *v7;
  CTLineRef v8;
  id v9;
  const void *TruncatedLineWithTokenHandler;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __n128 (*v25)(__n128 *, __n128 *);
  uint64_t (*v26)();
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v30 = *MEMORY[0x1E0CEA098];
  v31[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const __CFAttributedString *)objc_msgSend(v5, "initWithString:attributes:", a1, v6);

  v8 = CTLineCreateWithAttributedString(v7);
  v22 = 0;
  v23 = &v22;
  v24 = 0x4012000000;
  v25 = __Block_byref_object_copy__28;
  v26 = __Block_byref_object_dispose__28;
  v28 = 0;
  v29 = 0;
  v27 = &unk_1A850FFD1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v9 = v4;
  TruncatedLineWithTokenHandler = (const void *)CTLineCreateTruncatedLineWithTokenHandler();
  v11 = (const void *)v19[3];
  if (v11)
    CFRelease(v11);
  CFRelease(v8);
  if (TruncatedLineWithTokenHandler)
    CFRelease(TruncatedLineWithTokenHandler);
  if (v23[7])
  {
    objc_msgSend(a1, "substringToIndex:", v23[6], v16, 3221225472, __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke, &unk_1E5447F50, v9, &v22, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "appendString:", CFSTR("…"));
    objc_msgSend(a1, "substringFromIndex:", v23[7] + v23[6]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v14);

  }
  else
  {
    v13 = (void *)objc_msgSend(a1, "copy", v16, 3221225472, __79__NSString_SafariSharedUIExtras__safari_stringWithFont_forWidth_lineBreakMode___block_invoke, &unk_1E5447F50, v9, &v22, &v18);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (id)_leadingGlyphInCTRunSafariIsRightToLeft:()SafariSharedUIExtras
{
  const __CTLine *v5;
  void *v6;
  void *v7;
  void *v8;
  CFRange StringRange;

  v5 = (const __CTLine *)CTLineCreateWithString();
  CTLineGetGlyphRuns(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v5);
  if (objc_msgSend(v6, "count"))
  {
    if (a3)
      objc_msgSend(v6, "lastObject");
    else
      objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    StringRange = CTRunGetStringRange((CTRunRef)v8);
    objc_msgSend(a1, "substringWithRange:", StringRange.location, StringRange.length);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_hasLeadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_leadingGlyphInCTRunSafariIsRightToLeft:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_isSingleEmoji");

  return v2;
}

- (id)safari_leadingEmojiSafariIsRightToLeft:()SafariSharedUIExtras
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "_leadingGlyphInCTRunSafariIsRightToLeft:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "_isSingleEmoji"))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

@end
