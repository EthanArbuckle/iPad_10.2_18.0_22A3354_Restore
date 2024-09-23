@implementation UIFont(Bridge)

- (uint64_t)ts_tightenedLineSpacingForString:()Bridge minimumLineSpacingMultiple:
{
  objc_msgSend(a1, "ts_boundingBoxForString:");
  objc_msgSend(a1, "lineHeight");
  return objc_msgSend(a1, "lineHeight");
}

- (double)ts_boundingBoxForString:()Bridge
{
  id v4;
  CFIndex v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = (2 * v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_msgSend(v4, "getCharacters:range:", (char *)v11 - v7, 0, v5);

  MEMORY[0x1E0C80A78](v8, v9);
  if (!CTFontGetGlyphsForCharacters(a1, (const UniChar *)((char *)v11 - v7), (CGGlyph *)((char *)v11 - v7), v5))
    return *MEMORY[0x1E0C9D648];
  *(_QWORD *)&result = (unint64_t)CTFontGetBoundingRectsForGlyphs(a1, kCTFontOrientationDefault, (const CGGlyph *)((char *)v11 - v7), 0, v5);
  return result;
}

+ (id)ts_preferredFontForTextStyle:()Bridge
{
  void *v3;
  _QWORD *v4;
  void *v5;

  switch(a3)
  {
    case 0:
      v4 = (_QWORD *)MEMORY[0x1E0DC4AF0];
      goto LABEL_5;
    case 1:
      v4 = (_QWORD *)MEMORY[0x1E0DC4AF8];
      goto LABEL_5;
    case 2:
      v4 = (_QWORD *)MEMORY[0x1E0DC4B00];
LABEL_5:
      objc_msgSend(a1, "preferredFontForTextStyle:", *v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B60], 64, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (uint64_t)ts_tightenedLineSpacingForString:()Bridge
{
  return objc_msgSend(a1, "ts_tightenedLineSpacingForString:minimumLineSpacingMultiple:", 0.7);
}

@end
