@implementation WBListLevel

+ (void)readFrom:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5 document:(id)a6
{
  id v9;
  id v10;
  WrdParagraphProperties *var1;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  CFMutableStringRef MutableCopy;
  unsigned int i;
  unsigned int v21;
  void *v22;
  id v23;
  void *v24;

  v23 = a3;
  v9 = a4;
  v10 = a6;
  var1 = a5->var1;
  v24 = v9;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v12, "paragraphProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBParagraphProperties readFrom:wrdProperties:tracked:document:properties:](WBParagraphProperties, "readFrom:wrdProperties:tracked:document:properties:", v23, var1, 0, v10, v14);

  objc_msgSend(v24, "characterProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v23, a5->var2, 0, v10, v15);
  if (objc_msgSend(v15, "isListCharacterPictureBulletOverridden")
    && objc_msgSend(v15, "isListCharacterPictureBullet")
    && objc_msgSend(v15, "isCharPositionOfPictureBulletInBookmarkOverridden"))
  {
    objc_msgSend(v10, "imageBulletWithCharacterOffset:", objc_msgSend(v15, "charPositionOfPictureBulletInBookmark"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", v16);

  }
  objc_msgSend(v24, "setStartNumber:", a5->var3);
  objc_msgSend(v24, "setNumberFormat:", a5->var5);
  objc_msgSend(v24, "setRestartNumbering:", (*((_BYTE *)a5 + 80) & 2) == 0);
  objc_msgSend(v24, "setLegal:", *((_BYTE *)a5 + 80) & 1);
  v17 = (void *)MEMORY[0x22E2DDB58](objc_msgSend(v24, "setSuffix:", a5->var7));
  v18 = CFStringCreateWithBytes(0, (const UInt8 *)a5->var12, 2 * a5->var11, 0x100u, 0);
  MutableCopy = CFStringCreateMutableCopy(0, 0, v18);
  CFRelease(v18);
  for (i = 0; -[__CFString length](MutableCopy, "length") > (unint64_t)i; ++i)
  {
    v21 = -[__CFString characterAtIndex:](MutableCopy, "characterAtIndex:", i);
    if (v21 <= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%%%d"), v21 + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString replaceCharactersInRange:withString:](MutableCopy, "replaceCharactersInRange:withString:", i++, 1, v22);

      v10 = v13;
    }
  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v24, "setText:", MutableCopy);
  objc_msgSend(v24, "setLegacy:", (*((unsigned __int8 *)a5 + 80) >> 4) & 1);
  objc_msgSend(v24, "setLegacySpace:", a5->var9);
  objc_msgSend(v24, "setLegacyIndent:", a5->var10);
  objc_msgSend(v24, "setJustification:", a5->var6);

}

+ (void)write:(id)a3 listLevel:(id)a4 format:(WrdListLevelFormat *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 *var12;
  void *v26;
  void *v27;
  WrdParagraphProperties *var1;
  void *v29;
  void *v30;
  __int16 v31;

  v8 = a3;
  v9 = a4;
  a5->var3 = objc_msgSend(v9, "startNumber");
  a5->var5 = objc_msgSend(a1, "numberFormatEnumFor:", objc_msgSend(v9, "numberFormat"));
  if (objc_msgSend(v9, "restartNumbering"))
    v10 = 0;
  else
    v10 = 2;
  *((_BYTE *)a5 + 80) = *((_BYTE *)a5 + 80) & 0xFD | v10;
  *((_BYTE *)a5 + 80) = *((_BYTE *)a5 + 80) & 0xFE | objc_msgSend(v9, "legal");
  a5->var7 = objc_msgSend(v9, "suffix");
  v11 = (void *)MEMORY[0x22E2DDB58]();
  *(_QWORD *)a5->var8 = 0;
  a5->var8[8] = 0;
  v12 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(v9, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = 0;
  while (objc_msgSend(v14, "length") > (unint64_t)(v15 + 1))
  {
    v31 = 0;
    v17 = objc_msgSend(v14, "characterAtIndex:", v15);
    v31 = v17;
    if (v17 == 37)
    {
      v18 = objc_msgSend(v14, "characterAtIndex:", v15 + 1);
      v31 = v18 - 49;
      if ((v18 - 49) <= 8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v31, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v15, 2, v19);
        a5->var8[v16++] = v15 + 1;

      }
    }
    ++v15;
  }
  objc_msgSend(v14, "dataUsingWordEncoding:", 1);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "bytes");
  v22 = objc_msgSend(v20, "length");
  WrdListLevelFormat::setNumberTextLength(a5, (unsigned __int16)(v22 >> 1));
  if (v22 >= 2)
  {
    v23 = 0;
    v24 = v22 >> 1;
    var12 = a5->var12;
    if (v22 >> 1 <= 1)
      v24 = 1;
    do
    {
      var12[(unsigned __int16)v23] = *(_WORD *)(v21 + 2 * v23);
      ++v23;
    }
    while (v24 != v23);
  }

  objc_autoreleasePoolPop(v11);
  a5->var6 = objc_msgSend(v9, "justification");
  objc_msgSend(v9, "characterProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties prepareForWriting:properties:wrdProperties:tracked:](WBCharacterProperties, "prepareForWriting:properties:wrdProperties:tracked:", v8, v26, a5->var2, 0);

  WrdCharacterProperties::setCharacterTypeIDHint(a5->var2, 0);
  objc_msgSend(v9, "paragraphProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a5->var1;
  objc_msgSend(v9, "paragraphProperties");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "document");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBParagraphProperties write:properties:wrdProperties:tracked:document:](WBParagraphProperties, "write:properties:wrdProperties:tracked:document:", v8, v27, var1, 0, v30);

}

+ (int)numberFormatEnumFor:(int)a3
{
  int v3;

  if (a3 == 60)
    v3 = 54;
  else
    v3 = a3;
  if (v3 == 61)
    v3 = 0;
  if (v3 == 62)
    v3 = 0;
  if (v3 == 63)
    v3 = 0;
  if (v3 == 64)
    v3 = 0;
  if (v3 == 65)
    v3 = 0;
  if (v3 == 66)
    v3 = 0;
  if (v3 == 67)
    v3 = 0;
  if (v3 == 68)
    v3 = 0;
  if (v3 == 69)
    v3 = 0;
  if (v3 == 70)
    v3 = 0;
  if (v3 == 71)
    return 0;
  else
    return v3;
}

@end
