@implementation _UIFieldEditorLayoutManager

- (void)useFontForExtraBulletRendering:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fontForExtraBulletRendering, a3);
    v5 = v6;
  }

}

- (void)resetFontForExtraBulletRendering
{
  UIFont *fontForExtraBulletRendering;

  fontForExtraBulletRendering = self->_fontForExtraBulletRendering;
  self->_fontForExtraBulletRendering = 0;

}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)c
{
  id v15;
  UIFont *v16;
  unint64_t v17;
  const unsigned __int16 *v18;
  __objc2_class **v19;
  const unsigned __int16 *v20;
  int64_t v21;
  objc_class *v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  id v26;
  const unsigned __int16 *v27;
  const unsigned __int16 *v28;
  objc_super v29;
  __int128 __pattern4;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _OWORD __b[12];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = a6;
  v15 = a8;
  v16 = self->_fontForExtraBulletRendering;
  if (a5 >= 1)
  {
    v17 = 0;
    v35 = 0;
    v18 = &a3[a5];
    memset(__b, 0, sizeof(__b));
    v19 = &classRef_UITextFormattingViewControllerFormattingStyle;
    v20 = a3;
    v28 = v18;
    do
    {
      if (a3 == v18 && v20 < a3 || v16 && a3 < v18 && !*a3)
      {
        if (v20 < a3)
        {
          v21 = (char *)a3 - (char *)v20;
          v22 = (objc_class *)v19[257];
          v33.receiver = self;
          v33.super_class = v22;
          v23 = *(_OWORD *)&a7->c;
          __pattern4 = *(_OWORD *)&a7->a;
          v31 = v23;
          v32 = *(_OWORD *)&a7->tx;
          -[_UIFieldEditorLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v33, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, c);
          v19 = &classRef_UITextFormattingViewControllerFormattingStyle;
          v18 = v28;
          a4 = (const CGPoint *)((char *)a4 + 8 * v21);
        }
        ++v17;
        v20 = ++a3;
      }
      else
      {
        if (v17)
        {
          v27 = v20;
          if (!LOWORD(__b[0]))
          {
            LOWORD(__pattern4) = -[UIFont _bulletGlyph](v16, "_bulletGlyph");
            WORD1(__pattern4) = __pattern4;
            memset_pattern4(__b, &__pattern4, 0xC8uLL);
          }
          CGContextSaveGState(c);
          -[UIFont setInContext:](v16, "setInContext:", c);
          do
          {
            if (v17 >= 0x64)
              v24 = 100;
            else
              v24 = v17;
            v29.receiver = self;
            v29.super_class = (Class)_UIFieldEditorLayoutManager;
            v25 = *(_OWORD *)&a7->c;
            __pattern4 = *(_OWORD *)&a7->a;
            v31 = v25;
            v32 = *(_OWORD *)&a7->tx;
            -[_UIFieldEditorLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v29, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, __b, a4, v24, v16, &__pattern4, v15, c);
            a4 += v24;
            v17 -= v24;
          }
          while (v17);
          CGContextRestoreGState(c);
          v19 = &classRef_UITextFormattingViewControllerFormattingStyle;
          v18 = v28;
          v20 = v27;
        }
        v17 = 0;
        ++a3;
      }
    }
    while (a3 <= v18);
  }

}

- (int64_t)_generateBulletGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7 unobscuredRange:(_NSRange)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  void *v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  NSUInteger v20;
  uint64_t v21;
  __int16 *v22;
  uint64_t *v23;
  const unsigned __int16 *v24;
  const unint64_t *v25;
  uint64_t i;
  __int16 v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  void *v33;
  NSUInteger v34;
  _UIFieldEditorLayoutManager *v35;
  id v36;
  id v37;
  _BYTE v38[800];
  _BYTE v39[200];
  uint64_t v40;

  length = a7.length;
  location = a7.location;
  v40 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  if (a8.location == *a5 && a8.length == a5[length - 1] - *a5 + 1)
  {
    v31 = 0;
  }
  else
  {
    v35 = self;
    -[_UIFieldEditorLayoutManager textStorage](self, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678F78, *a5, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v36 = v14;
    v37 = 0;
    v33 = (void *)v17;
    v18 = objc_msgSend(v14, "_bulletGlyphWithOriginalFont:fontForBulletRendering:", v17, &v37);
    v19 = v37;
    v34 = length;
    v20 = location + length;
    while (location < v20)
    {
      if (v20 - location >= 0x64)
        v21 = 100;
      else
        v21 = v20 - location;
      __memcpy_chk();
      if (v21)
      {
        v22 = (__int16 *)v39;
        v23 = (uint64_t *)v38;
        v24 = a3;
        v25 = a5;
        for (i = v21; i; --i)
        {
          v28 = *v24++;
          v27 = v28;
          v29 = *v23;
          if ((*v23 & 1) == 0)
          {
            if ((v29 & 8) != 0)
            {
              v27 = 0;
              v30 = 1;
            }
            else
            {
              if (*v25 >= a8.location && *v25 - a8.location < a8.length)
                goto LABEL_19;
              v27 = v18;
              if (!v19)
                goto LABEL_19;
              v27 = -1;
              v30 = 2;
            }
            *v23 = v30 | v29;
          }
LABEL_19:
          *v22++ = v27;
          ++v25;
          ++v23;
        }
      }
      -[_UIFieldEditorLayoutManager setGlyphs:properties:characterIndexes:font:forGlyphRange:](v35, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v39, v38, a5, v36, location, v21);
      a3 += v21;
      a4 += v21;
      location += v21;
      a5 += v21;
    }
    -[_UIFieldEditorLayoutManager useFontForExtraBulletRendering:](v35, "useFontForExtraBulletRendering:", v19);

    v31 = v34;
    v14 = v36;
  }

  return v31;
}

- (CGRect)_boundingBoxForBulletAtCharIndex:(int64_t)a3 inUnobscuredRange:(_NSRange)a4
{
  CGSize v4;
  UIFont *fontForExtraBulletRendering;
  UIFont *v6;
  double v7;
  double v8;
  double width;
  double height;
  CGGlyph glyphs;
  __int128 v12;
  CGSize v13;
  CGRect result;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = v4;
  if (a3 < a4.location || a3 - a4.location >= a4.length)
  {
    fontForExtraBulletRendering = self->_fontForExtraBulletRendering;
    if (fontForExtraBulletRendering)
    {
      v6 = fontForExtraBulletRendering;
      glyphs = -[UIFont _bulletGlyph](v6, "_bulletGlyph");
      CTFontGetAdvancesForGlyphs((CTFontRef)v6, kCTFontOrientationDefault, &glyphs, &v13, 1);

    }
  }
  v8 = *((double *)&v12 + 1);
  v7 = *(double *)&v12;
  height = v13.height;
  width = v13.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)_completeBulletRenderingForTextContainer:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE v18[800];
  _BYTE v19[800];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_fontForExtraBulletRendering)
  {
    v4 = -[_UIFieldEditorLayoutManager glyphRangeForTextContainer:](self, "glyphRangeForTextContainer:", a3);
    v16 = v4 + v5;
    if (v4 < v4 + v5)
    {
      v6 = v4;
      if (v5 >= 0x64)
        v7 = 100;
      else
        v7 = v5;
      do
      {
        -[_UIFieldEditorLayoutManager getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:](self, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v6, v7, 0, v19, v18, 0, v16);
        v17 = v7;
        if (v7)
        {
          v8 = v18;
          v9 = v19;
          v10 = v6;
          do
          {
            v11 = *v9;
            v9 += 8;
            if ((v11 & 2) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIFieldEditorLayoutManager textStorage](self, "textStorage");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "string");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", *v8));

              if ((v15 & 1) == 0)
                -[_UIFieldEditorLayoutManager setNotShownAttribute:forGlyphAtIndex:](self, "setNotShownAttribute:forGlyphAtIndex:", 0, v10);
            }
            ++v10;
            ++v8;
            --v7;
          }
          while (v7);
        }
        v6 += v17;
        if (v16 - v6 >= 0x64)
          v7 = 100;
        else
          v7 = v16 - v6;
      }
      while (v16 > v6);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontForExtraBulletRendering, 0);
}

@end
