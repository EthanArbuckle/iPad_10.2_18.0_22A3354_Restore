@implementation PBSlideMaster

+ (id)createMasterStyleMap:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const void *v10;
  EshRecord *v11;
  EshRecord *v12;
  uint64_t Instance;
  uint64_t v14;
  OADTextListStyle *v15;
  void *v16;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = objc_msgSend(v5, "indexOfFirstChildOfType:afterIndex:", 4003, -1);
  while (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "childAt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (const void *)objc_msgSend(v8, "eshObject");
      if (!v10
      {

        +[TCMessageException exceptionWithMessage:](TCMessageException, "exceptionWithMessage:", TCUnknownProblemMessage);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v18);
      }
      v12 = v11;
      Instance = EshRecord::getInstance(v11);
      if (Instance > 8)
        Instance = 0xFFFFFFFFLL;
      else
        *(_QWORD *)objc_msgSend(v6, "currentSourceMasterStyleInfoOfType:", Instance) = v12;
      if (PptTextHeaderAtom::isDerivedType(Instance))
      {
        v14 = *(_QWORD *)objc_msgSend(v6, "currentSourceMasterStyleInfoOfType:", PptTextHeaderAtom::getBaseType(Instance));
        TCVerifyInputMeetsCondition(v14 != 0);
      }
      else
      {
        v14 = 0;
      }
      if ((_DWORD)Instance != -1)
      {
        v15 = objc_alloc_init(OADTextListStyle);
        +[PBMasterStyle readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:](PBMasterStyle, "readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:", *(_QWORD *)objc_msgSend(v6, "currentSourceMasterStyleInfoOfType:", Instance), v14, *(_QWORD *)(objc_msgSend(v6, "currentSourceMasterStyleInfoOfType:", Instance) + 8), v15, v6);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", Instance);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v15, v16);

      }
    }
    v7 = objc_msgSend(v5, "indexOfFirstChildOfType:afterIndex:", 4003, v7);

  }
  return v19;
}

+ (void)padMissingLevels:(id)a3
{
  void *v3;
  unsigned int i;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  unint64_t v13;
  void *v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v5 + 1)
  {
    v5 = i;
    if (objc_msgSend(v3, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v3, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "longValue") - 1;
    if (v8 > 7)
      v9 = 0;
    else
      v9 = qword_22A4D3CA0[v8];
    objc_msgSend(v7, "propertiesForListLevel:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftMargin");
    v12 = v11;
    v13 = v9 | 1;
    do
    {
      objc_msgSend(v7, "propertiesForListLevel:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "overrideWithProperties:", v10);
      if (v13 >= 5)
      {
        HIDWORD(v15) = 1078067200;
        v12 = v12 + 36.0;
        *(float *)&v15 = v12;
        objc_msgSend(v14, "setLeftMargin:", v15);
      }

      ++v13;
    }
    while (v13 != 9);

  }
}

+ (void)setFont:(id)a3 fromCharacterProperties:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "hasLatinFont")
    && (objc_msgSend(v5, "latinFont"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    objc_msgSend(v5, "latinFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLatinFont:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PBSlideMaster setFont:fromCharacterProperties:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBSlideMaster.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 244, 0, "The latin typeface is undefined in a master character style");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  if (objc_msgSend(v5, "hasEastAsianFont"))
  {
    objc_msgSend(v5, "eastAsianFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v5, "eastAsianFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEastAsianFont:", v13);

    }
  }
  if (objc_msgSend(v5, "hasBidiFont"))
  {
    objc_msgSend(v5, "bidiFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      objc_msgSend(v5, "bidiFont");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setComplexScriptFont:", v16);

    }
  }

}

+ (void)readMasterDrawables:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  objc_msgSend(a1, "readDrawingGroup:slide:state:", a4, a3, a5);
}

+ (void)flattenPlaceholderTextStylesIntoLayout:(id)a3 layoutType:(int)a4 masterStyleMap:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v6 = *(_QWORD *)&a4;
  v17 = a3;
  v8 = a5;
  objc_msgSend(a1, "textBodyForPlaceholderType:slideLayout:", 0, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "textTypeFor:placeholderType:", v6, 0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "flattenTextStyle:intoTextBox:", v12, v9);

  objc_msgSend(a1, "textBodyForPlaceholderType:slideLayout:", 1, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "textTypeFor:placeholderType:", v6, 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "flattenTextStyle:intoTextBox:", v16, v13);

}

+ (id)textBodyForPlaceholderType:(int)a3 slideLayout:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = v5;
  if ((_DWORD)v4 != -1
    && ((objc_msgSend(v5, "placeholderWithType:placeholderTypeIndex:overrideIndex:", v4, 0, 1),
         (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
     || (objc_msgSend(v6, "placeholderWithType:placeholderTypeIndex:useBaseTypeMatch:overrideIndex:", v4, 0, 1, 1),
         (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    objc_msgSend(v7, "textBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)textTypeFor:(int)a3 placeholderType:(int)a4
{
  int v4;
  int v5;
  int v6;

  if ((a3 & 0xFFFFFFFD) != 0)
    v4 = 1;
  else
    v4 = 5;
  if ((a3 & 0xFFFFFFFD) != 0)
    v5 = 0;
  else
    v5 = 6;
  if (a4)
    v6 = -1;
  else
    v6 = v5;
  if (a4 == 1)
    return v4;
  else
    return v6;
}

+ (void)flattenTextStyle:(id)a3 intoTextBox:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "overrideTextListStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideWithTextStyle:", v6);

}

+ (void)readSlideMasterName:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  void *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a4, "childOfType:instance:", 4026, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (char *)objc_msgSend(v6, "eshObject");
    if (v8)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v8 + 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v9);

  }
}

+ (void)flattenBaseMasterStyleType:(int)a3 masterStyleMap:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  OADTextListStyle *v8;
  uint64_t i;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(OADTextListStyle);
  for (i = 0; i != 9; ++i)
  {
    for (j = i; j != 9; ++j)
    {
      -[OADTextListStyle propertiesForListLevel:](v8, "propertiesForListLevel:", j);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "propertiesForListLevel:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "overrideWithProperties:", v12);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v8, v13);

}

+ (void)flattenMasterStyleType:(int)a3 baseType:(int)a4 masterStyleMap:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  OADTextListStyle *v12;
  void *v13;
  id v14;

  v14 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(OADTextListStyle);
    -[OADTextListStyle overrideWithTextStyle:](v12, "overrideWithTextStyle:", v11);
    -[OADTextListStyle overrideWithTextStyle:](v12, "overrideWithTextStyle:", v9);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v12, v13);

  }
}

+ (void)setCannedOtherTextListStyle:(id)a3
{
  void *v3;
  OADSolidFill *v4;
  uint64_t i;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(OADSolidFill);
  -[OADSolidFill setColor:](v4, "setColor:", v3);
  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(v10, "propertiesForListLevel:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLevel:", i);
    v7 = (double)i * 36.0;
    *(float *)&v7 = v7;
    objc_msgSend(v6, "setLeftMargin:", v7);
    LODWORD(v8) = 1108344832;
    objc_msgSend(v6, "setDefaultTab:", v8);
    objc_msgSend(v6, "setIsRightToLeft:", 0);
    objc_msgSend(v6, "setIsLatinLineBreak:", 0);
    objc_msgSend(v6, "setAlign:", 0);
    LODWORD(v9) = 18.0;
    objc_msgSend(v6, "setSize:", v9);
    objc_msgSend(v6, "setLatinFont:", CFSTR("+mn-lt"));
    objc_msgSend(v6, "setEastAsianFont:", CFSTR("+mn-ea"));
    objc_msgSend(v6, "setBidiFont:", CFSTR("+mn-cs"));
    objc_msgSend(v6, "setFill:", v4);

  }
}

+ (void)readSlideMasterTextStyles:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  +[PBProgTag readBulletStylesFromMainMaster:state:](PBProgTag, "readBulletStylesFromMainMaster:state:", v8, v9);
  v10 = (void *)objc_msgSend(a1, "createMasterStyleMap:state:", v8, v9);
  objc_msgSend(a1, "padMissingLevels:", v10);
  objc_msgSend(v9, "setMasterStyles:slideMaster:", v10, v11);

}

+ (void)readSlideMasterColorScheme:(id)a3 slideHolder:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v14, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "baseStyles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "colorMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readColorScheme:colorScheme:colorMap:state:", v8, v12, v13, v9);

}

+ (void)setSlideMasterTextStyles:(id)a3 state:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(a4, "masterStyles:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontScheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setTitleTextStyle:", v11);
  objc_msgSend(v9, "majorFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertiesForListLevel:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFont:fromCharacterProperties:", v12, v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setBodyTextStyle:", v15);
  objc_msgSend(v9, "minorFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertiesForListLevel:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFont:fromCharacterProperties:", v16, v17);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setOtherTextStyle:", v19);
  objc_msgSend(v9, "minorFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "propertiesForListLevel:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFont:fromCharacterProperties:", v20, v21);

}

@end
