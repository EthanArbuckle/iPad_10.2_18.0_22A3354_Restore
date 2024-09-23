@implementation UIFont(SecureTextEntry)

- (__CFString)_ui_bulletStringWithFont:()SecureTextEntry
{
  _BOOL4 GlyphsForCharacters;
  int v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  const __CTFont *v11;
  __CFString *v12;
  __CFString *v13;
  CGGlyph glyphs;
  unsigned __int16 v16;

  GlyphsForCharacters = CTFontGetGlyphsForCharacters(a1, kBullets, &glyphs, 2);
  if (glyphs)
    v6 = 1;
  else
    v6 = GlyphsForCharacters;
  v7 = v16;
  if (v16)
    v8 = CFSTR("⦁");
  else
    v8 = 0;
  if (v6)
    v8 = CFSTR("");
  v9 = v8;
  if (a3)
  {
    if (v7)
      v10 = 1;
    else
      v10 = v6;
    if ((v10 & 1) != 0)
    {
      v11 = objc_retainAutorelease(a1);
    }
    else
    {
      -[__CTFont pointSize](a1, "pointSize");
      objc_msgSend(off_1E167A828, "systemFontOfSize:");
      v11 = (const __CTFont *)(id)objc_claimAutoreleasedReturnValue();
    }
    *a3 = v11;
  }
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("⦁");
  v13 = v12;

  return v13;
}

- (uint64_t)_bulletGlyph
{
  return objc_msgSend(a1, "_bulletGlyphWithOriginalFont:fontForBulletRendering:", 0, 0);
}

- (uint64_t)_bulletGlyphWithOriginalFont:()SecureTextEntry fontForBulletRendering:
{
  const __CTFont *v6;
  _BOOL4 GlyphsForCharacters;
  int v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  BOOL v12;
  BOOL v13;
  char v14;
  id v15;
  id v16;
  const __CTFont *v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  CGGlyph glyphs;
  unsigned __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GlyphsForCharacters = CTFontGetGlyphsForCharacters(a1, kBullets, &glyphs, 5);
  if (glyphs)
    v8 = 1;
  else
    v8 = GlyphsForCharacters;
  v9 = v23;
  v10 = CFSTR("⦁");
  if (!v23)
    v10 = 0;
  if (v8)
    v10 = CFSTR("");
  v11 = v10;
  if (v6 && (!v8 ? (v12 = v9 == 0) : (v12 = 0), v12))
  {
    if ((-[__CTFont isEqual:](a1, "isEqual:", v6) & 1) == 0 && (-[__CTFont isEqual:](a1, "isEqual:", v6) & 1) == 0)
    {
      v13 = CTFontGetGlyphsForCharacters(v6, kBullets, &glyphs, 5);
      if (glyphs)
        v14 = 1;
      else
        v14 = v13;
      if ((v14 & 1) != 0 || v23)
      {
        v17 = v6;
      }
      else
      {
        v21 = 0;
        v15 = (id)-[__CTFont _ui_bulletStringWithFont:](a1, "_ui_bulletStringWithFont:", &v21);
        v16 = v21;
        if (v16 && (-[__CTFont isEqual:](a1, "isEqual:", v16) & 1) == 0)
          v17 = (const __CTFont *)v16;
        else
          v17 = 0;

      }
      goto LABEL_26;
    }
  }
  else
  {

  }
  v17 = 0;
LABEL_26:
  if (a4)
    *a4 = objc_retainAutorelease(v17);
  if (v17)
  {
    v18 = glyphs;
  }
  else
  {
    v20 = 0;
    while (1)
    {
      v18 = *(CGGlyph *)((char *)&glyphs + v20);
      if (*(CGGlyph *)((char *)&glyphs + v20))
        break;
      v20 += 2;
      if (v20 == 10)
      {
        v18 = glyphs;
        if (!glyphs)
          v18 = 3;
        break;
      }
    }
  }

  return v18;
}

@end
