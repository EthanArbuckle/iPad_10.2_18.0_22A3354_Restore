@implementation NSString(TUI_NSStringExtras)

- (double)tui_languageAwareOutsetsForFont:()TUI_NSStringExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v8;

  v4 = a3;
  v8 = *MEMORY[0x1E0DC49E8];
  objc_msgSend((id)objc_opt_class(), "tui_excessiveLineHeightCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    CTFontGetLanguageAwareOutsets();

  return *(double *)&v8;
}

- (double)tui_optimizedSizeWithFont:()TUI_NSStringExtras
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;
  CGGlyph *v11;
  uint64_t v12;
  uint64_t v13;
  const UniChar *v14;
  id v15;
  const UniChar *v16;
  const __CTFont *v17;
  double AdvancesForGlyphs;
  double v19;
  id v20;
  void *v21;
  const __CFAttributedString *v22;
  const __CTLine *v23;
  const __CTLine *v24;
  double TypographicBounds;
  double v26;
  uint64_t v28;
  CGFloat descent;
  CGFloat ascent;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "length"))
  {
    v7 = *MEMORY[0x1E0C9D820];
    goto LABEL_19;
  }
  if (!objc_msgSend(a1, "_isOnlyIdeographs"))
  {
LABEL_18:
    objc_msgSend(a1, "_legacy_sizeWithFont:", v4);
    v7 = v26;
    goto LABEL_19;
  }
  v5 = objc_msgSend(a1, "_graphemeCount");
  if (v5 == 1)
  {
    objc_msgSend(v4, "pointSize");
    v7 = ceil(v6 * 1.05);
    goto LABEL_19;
  }
  v8 = v5;
  if (v5 > 0x14)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3498]);
    v31 = *MEMORY[0x1E0DC32A0];
    v32[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (const __CFAttributedString *)objc_msgSend(v20, "initWithString:attributes:", a1, v21);

    v23 = CTLineCreateWithAttributedString(v22);
    if (v23)
    {
      v24 = v23;
      descent = 0.0;
      ascent = 0.0;
      TypographicBounds = CTLineGetTypographicBounds(v23, &ascent, &descent, 0);
      CFRelease(v24);
      v7 = ceil(TypographicBounds);

      goto LABEL_19;
    }

    goto LABEL_18;
  }
  v9 = MEMORY[0x1E0C80A78](v5);
  v11 = (CGGlyph *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x1E0C80A78](v9);
  MEMORY[0x1E0C80A78](v12);
  v14 = (const UniChar *)((char *)&v28 - v13);
  v15 = objc_retainAutorelease(a1);
  v16 = (const UniChar *)objc_msgSend(v15, "_fastCharacterContents");
  if (!v16)
  {
    objc_msgSend(v15, "getCharacters:range:", v14, 0, v8);
    v16 = v14;
  }
  if (tui_optimizedSizeWithFont__onceToken != -1)
    dispatch_once(&tui_optimizedSizeWithFont__onceToken, &__block_literal_global_1);
  objc_msgSend((id)tui_optimizedSizeWithFont__cache, "objectForKey:", v4);
  v17 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v17 = (const __CTFont *)CTFontCreateForCharactersWithLanguage();
    if (v17)
      objc_msgSend((id)tui_optimizedSizeWithFont__cache, "setObject:forKey:", v17, v4);
  }
  CTFontGetGlyphsForCharacters(v17, v16, v11, v8);
  AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(v17, kCTFontOrientationHorizontal, v11, (CGSize *)&v28 - v8, v8);
  v19 = CTFontGetAscent(v17);
  v7 = ceil(AdvancesForGlyphs);
  ceil(v19 + CTFontGetDescent(v17));

LABEL_19:
  return v7;
}

- (id)tui_centerTruncatedStringWithAttributes:()TUI_NSStringExtras fittingWidth:
{
  id v6;
  double v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  unint64_t v13;
  void *v14;
  double v15;

  v6 = a4;
  if (a2 >= 0.00000011920929
    && (unint64_t)objc_msgSend(a1, "length") >= 3
    && (objc_msgSend(a1, "sizeWithAttributes:", v6), v7 >= a2))
  {
    v10 = -1;
    v11 = 2;
    for (i = 2; ; ++i)
    {
      v13 = (unint64_t)objc_msgSend(a1, "length") >> 1;
      objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v10 + v13, v11, CFSTR("…"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sizeWithAttributes:", v6);
      if (v15 < a2 || i >= v13)
        break;

      v11 += 2;
      --v10;
    }
    v8 = v14;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

+ (id)tui_excessiveLineHeightCharacterSet
{
  if (tui_excessiveLineHeightCharacterSet_onceToken != -1)
    dispatch_once(&tui_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_3591);
  return (id)tui_excessiveLineHeightCharacterSet___tui_excessiveLineCharacterSet;
}

@end
