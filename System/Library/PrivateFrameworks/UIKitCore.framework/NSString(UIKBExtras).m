@implementation NSString(UIKBExtras)

- (double)_optimizedSizeWithFont:()UIKBExtras
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  CFIndex v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  const UniChar *v13;
  id v14;
  void *v15;
  const __CFAttributedString *v16;
  const __CTLine *v17;
  const __CTLine *v18;
  double TypographicBounds;
  double AdvancesForGlyphs;
  double v21;
  double v22;
  uint64_t v24;
  CGFloat descent;
  CGFloat ascent;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(a1, "length"))
  {
    v7 = *MEMORY[0x1E0C9D820];
    goto LABEL_15;
  }
  if (!objc_msgSend(a1, "_isOnlyIdeographs"))
  {
LABEL_14:
    objc_msgSend(a1, "_legacy_sizeWithFont:", v4);
    v7 = v22;
    goto LABEL_15;
  }
  v5 = objc_msgSend(a1, "_graphemeCount");
  if (v5 == 1)
  {
    objc_msgSend(v4, "pointSize");
    v7 = ceil(v6 * 1.05);
    goto LABEL_15;
  }
  v8 = v5;
  if (v5 > 0x14)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    v27 = *(_QWORD *)off_1E1678D90;
    v28[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const __CFAttributedString *)objc_msgSend(v14, "initWithString:attributes:", a1, v15);

    v17 = CTLineCreateWithAttributedString(v16);
    if (v17)
    {
      v18 = v17;
      descent = 0.0;
      ascent = 0.0;
      TypographicBounds = CTLineGetTypographicBounds(v17, &ascent, &descent, 0);
      CFRelease(v18);
      v7 = ceil(TypographicBounds);

      goto LABEL_15;
    }

    goto LABEL_14;
  }
  v9 = 2 * v5;
  MEMORY[0x1E0C80A78](v5);
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v11);
  v12 = objc_retainAutorelease(a1);
  v13 = (const UniChar *)objc_msgSend(v12, "_fastCharacterContents");
  if (v13)
  {
    CTFontGetGlyphsForCharacters((CTFontRef)v4, v13, (CGGlyph *)((char *)&v24 - v10), v8);
  }
  else
  {
    objc_msgSend(v12, "getCharacters:range:", (char *)&v24 - v10, 0, v8, MEMORY[0x1E0C80A78](0).n128_f64[0]);
    CTFontGetGlyphsForCharacters((CTFontRef)v4, (const UniChar *)((char *)&v24 - v10), (CGGlyph *)((char *)&v24 - v10), v8);
  }
  AdvancesForGlyphs = CTFontGetAdvancesForGlyphs((CTFontRef)v4, kCTFontOrientationHorizontal, (const CGGlyph *)((char *)&v24 - v10), (CGSize *)&v24 - v8, v8);
  v21 = CTFontGetAscent((CTFontRef)v4);
  v7 = ceil(AdvancesForGlyphs);
  ceil(v21 + CTFontGetDescent((CTFontRef)v4));
LABEL_15:

  return v7;
}

@end
