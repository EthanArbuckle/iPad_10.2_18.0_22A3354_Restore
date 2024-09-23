@implementation NSString(NSStringDrawing)

- (double)sizeWithAttributes:()NSStringDrawing
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v5 = CTFontSwapDefaultLineHeightAdjustment();
  v6 = MEMORY[0x18D790ECC](v5, 0.0);
  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, a3, 0, *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8));
  v8 = v7;
  v9 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v9, v6);
  return v8;
}

+ (int64_t)typesetterBehavior
{
  NSStringDrawingTextStorageSettings *v0;

  if (+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings")
    && (v0 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0)) != 0)
  {
    return *((unsigned __int8 *)&v0->_settings._flags + 1);
  }
  else
  {
    return +[NSTypesetter defaultStringDrawingTypesetterBehavior](NSTypesetter, "defaultStringDrawingTypesetterBehavior");
  }
}

- (void)drawAtPoint:()NSStringDrawing withAttributes:
{
  uint64_t v9;
  uint64_t v10;

  v9 = CTFontSwapDefaultLineHeightAdjustment();
  MEMORY[0x18D790ECC](v9, 0.0);
  if (!a5)
    a5 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
  _NSStringDrawingCore(a1, a5, 1, 0, a2, a3, 0.0, 0.0, 0.0, v10, 0);
  CTFontSwapDefaultLineHeightAdjustment();
  JUMPOUT(0x18D790ECCLL);
}

- (void)drawInRect:()NSStringDrawing withAttributes:
{
  if (a4 > 0.0 && a5 > 0.0)
  {
    if (!a7)
      a7 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
    _NSStringDrawingCore(a1, a7, 1, 0, a2, a3, a4, a5, 0.0, a9, 0);
  }
}

+ (NSStringDrawingTextStorageSettings)usesFontLeading
{
  NSStringDrawingTextStorageSettings *result;

  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
  if ((_DWORD)result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result)
      return (NSStringDrawingTextStorageSettings *)(*(_WORD *)&result->_settings._flags & 1);
  }
  return result;
}

+ (void)setUsesFontLeading:()NSStringDrawing
{
  NSStringDrawingTextStorageSettings *v3;

  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 1u;
  }
}

+ (BOOL)usesScreenFonts
{
  NSStringDrawingTextStorageSettings *v0;

  if (+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings")
    && (v0 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0)) != 0)
  {
    return (*(_WORD *)&v0->_settings._flags >> 1) & 1;
  }
  else
  {
    return +[NSLayoutManager _usesScreenFonts](NSLayoutManager, "_usesScreenFonts");
  }
}

+ (NSStringDrawingTextStorageSettings)setUsesScreenFonts:()NSStringDrawing
{
  NSStringDrawingTextStorageSettings *result;
  __int16 v5;

  result = (NSStringDrawingTextStorageSettings *)+[NSLayoutManager _usesScreenFonts](NSLayoutManager, "_usesScreenFonts");
  if ((_DWORD)result != a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    if (a3)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&result->_settings._flags = *(_WORD *)&result->_settings._flags & 0xFFFD | v5;
  }
  return result;
}

+ (void)setShowsInvisibleCharacters:()NSStringDrawing
{
  NSStringDrawingTextStorageSettings *v3;

  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 4u;
  }
}

+ (NSStringDrawingTextStorageSettings)showsInvisibleCharacters
{
  NSStringDrawingTextStorageSettings *result;

  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
  if ((_DWORD)result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result)
      return (NSStringDrawingTextStorageSettings *)((*(_WORD *)&result->_settings._flags >> 2) & 1);
  }
  return result;
}

+ (void)setShowsControlCharacters:()NSStringDrawing
{
  NSStringDrawingTextStorageSettings *v3;

  if (a3)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    v3 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *(_WORD *)&v3->_settings._flags |= 8u;
  }
}

+ (NSStringDrawingTextStorageSettings)showsControlCharacters
{
  NSStringDrawingTextStorageSettings *result;

  result = (NSStringDrawingTextStorageSettings *)+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
  if ((_DWORD)result)
  {
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (result)
      return (NSStringDrawingTextStorageSettings *)((*(_WORD *)&result->_settings._flags >> 3) & 1);
  }
  return result;
}

+ (void)setHyphenationFactor:()NSStringDrawing
{
  if (a1 != 0.0)
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1)->_settings._hyphenationFactor = a1;
  }
}

+ (float)hyphenationFactor
{
  float v0;
  NSStringDrawingTextStorageSettings *v1;

  v0 = 0.0;
  if (+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings"))
  {
    v1 = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0);
    if (v1)
      return v1->_settings._hyphenationFactor;
  }
  return v0;
}

+ (NSStringDrawingTextStorageSettings)setTypesetterBehavior:()NSStringDrawing
{
  uint64_t v3;
  NSStringDrawingTextStorageSettings *result;

  if (a3 >= 6)
    v3 = 6;
  else
    v3 = a3;
  if (+[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings")
    && +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings")
    && +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 0)|| (result = +[NSTypesetter defaultStringDrawingTypesetterBehavior](NSTypesetter, "defaultStringDrawingTypesetterBehavior"), (NSStringDrawingTextStorageSettings *)v3 != result))
  {
    +[NSStringDrawingTextStorage _setHasCustomSettings:](NSStringDrawingTextStorage, "_setHasCustomSettings:", 1);
    +[NSStringDrawingTextStorage _hasCustomSettings](NSStringDrawingTextStorage, "_hasCustomSettings");
    result = +[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1);
    *((_BYTE *)&result->_settings._flags + 1) = v3;
  }
  return result;
}

+ (uint64_t)defaultLineHeightForFont:()NSStringDrawing
{
  return objc_msgSend((id)objc_msgSend(+[NSStringDrawingTextStorage stringDrawingTextStorage](NSStringDrawingTextStorage, "stringDrawingTextStorage"), "layoutManager"), "defaultLineHeightForFont:", a3);
}

+ (uint64_t)defaultBaselineOffsetForFont:()NSStringDrawing
{
  return objc_msgSend((id)objc_msgSend(+[NSStringDrawingTextStorage stringDrawingTextStorage](NSStringDrawingTextStorage, "stringDrawingTextStorage"), "layoutManager"), "defaultBaselineOffsetForFont:", a3);
}

@end
