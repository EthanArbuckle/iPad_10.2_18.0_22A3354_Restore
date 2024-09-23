@implementation NSCTGlyphInfo

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  CGFontRef v8;
  const void *v9;
  unsigned int CharacterIdentifier;
  uint64_t Font;
  const __CTFont *v12;
  CFStringRef v13;
  CTFontDescriptorRef v14;

  if (objc_msgSend(a4, "isEqualToString:", -[NSCTGlyphInfo _baseString](self, "_baseString")))
  {
    v6 = -[NSCTGlyphInfo characterCollection](self, "characterCollection");
    if (v6)
    {
      v7 = v6;
      v8 = CTFontCopyGraphicsFont((CTFontRef)a3, 0);
      if (v8)
      {
        v9 = v8;
        CTGlyphInfoGetCharacterCollection((CTGlyphInfoRef)self);
        if ((v7 == 255
           || CGFontGetRegistryOrderingSupplement()
           && CFEqual(0, CFSTR("Adobe"))
           && CFEqual(0, __NSOrderingTable[v7 - 1]))
          && CGFontGetGlyphsForCIDs())
        {
          CharacterIdentifier = 0;
LABEL_22:
          CFRelease(v9);
          return CharacterIdentifier;
        }
LABEL_19:
        CharacterIdentifier = 0;
        goto LABEL_22;
      }
    }
    else
    {
      Font = _CTGlyphInfoGetFont();
      if (Font)
        v12 = (const __CTFont *)Font;
      else
        v12 = (const __CTFont *)a3;
      v13 = CTFontCopyPostScriptName(v12);
      if (v13)
      {
        v9 = v13;
        if (objc_msgSend((id)objc_msgSend(a3, "fontName"), "isEqualToString:", v13))
        {
          v14 = CTFontCopyFontDescriptor(v12);
          if (objc_msgSend((id)objc_msgSend(a3, "fontDescriptor"), "isEqual:", v14))
          {
            CharacterIdentifier = MEMORY[0x18D791490](self);
            if (!CharacterIdentifier)
              CharacterIdentifier = CTGlyphInfoGetCharacterIdentifier((CTGlyphInfoRef)self);
          }
          else
          {
            CharacterIdentifier = 0;
          }
          CFRelease(v14);
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
  }
  return 0;
}

- (unsigned)_glyph
{
  return MEMORY[0x18D791490](self, a2);
}

- (unint64_t)characterIdentifier
{
  return CTGlyphInfoGetCharacterIdentifier((CTGlyphInfoRef)self);
}

- (unint64_t)characterCollection
{
  return CTGlyphInfoGetCharacterCollection((CTGlyphInfoRef)self);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  id v6;
  NSGlyphInfo *v7;
  const __CTFont *Font;
  CTFontDescriptorRef v9;
  NSFont *v10;
  id v11;

  v5 = -[NSCTGlyphInfo characterCollection](self, "characterCollection");
  v6 = -[NSCTGlyphInfo _baseString](self, "_baseString");
  if (v5)
  {
    v7 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:collection:baseString:](NSGlyphInfo, "glyphInfoWithCharacterIdentifier:collection:baseString:", -[NSCTGlyphInfo characterIdentifier](self, "characterIdentifier"), v5, v6);
  }
  else
  {
    Font = (const __CTFont *)_CTGlyphInfoGetFont();
    v9 = CTFontCopyFontDescriptor(Font);
    v10 = +[UIFont fontWithDescriptor:size:](NSFont, "fontWithDescriptor:size:", v9, 0.0);
    CFRelease(v9);
    if (v10)
    {
      v11 = -[NSCTGlyphInfo glyphName](self, "glyphName");
      if (v11)
        v7 = +[NSGlyphInfo glyphInfoWithGlyphName:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyphName:forFont:baseString:", v11, v10, v6);
      else
        v7 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", MEMORY[0x18D791490](self), v10, v6);
    }
    else
    {
      v7 = 0;
    }
  }
  -[NSGlyphInfo encodeWithCoder:](v7, "encodeWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
