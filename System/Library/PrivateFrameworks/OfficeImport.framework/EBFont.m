@implementation EBFont

+ (id)edFontFromXlFont:(XlFont *)a3 edResources:(id)a4
{
  id v6;
  EDFont *v7;
  XlString *var2;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v6 = a4;
  if (a3)
  {
    v7 = -[EDFont initWithResources:]([EDFont alloc], "initWithResources:", v6);
    var2 = a3->var2;
    if (var2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)var2 + 8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDFont setName:](v7, "setName:", v9);

    }
    -[EDFont setHeight:](v7, "setHeight:", (double)a3->var3);
    -[EDFont setWeight:](v7, "setWeight:", a3->var5);
    -[EDFont setCharSet:](v7, "setCharSet:", a3->var15);
    -[EDFont setFamily:](v7, "setFamily:", a3->var14);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var4, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDFont setColorReference:](v7, "setColorReference:", v10);

    v11 = a3->var7 || a3->var5 > 400;
    -[EDFont setBold:](v7, "setBold:", v11);
    -[EDFont setItalic:](v7, "setItalic:", a3->var8);
    -[EDFont setStrike:](v7, "setStrike:", a3->var10);
    -[EDFont setShadow:](v7, "setShadow:", a3->var12);
    -[EDFont setOutline:](v7, "setOutline:", a3->var11);
    -[EDFont setScript:](v7, "setScript:", objc_msgSend(a1, "convertXlScriptEnumToED:", a3->var6));
    -[EDFont setUnderline:](v7, "setUnderline:", objc_msgSend(a1, "convertXlUnderlineEnumToED:", a3->var13));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)convertXlScriptEnumToED:(int)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (int)convertXlUnderlineEnumToED:(int)a3
{
  int v3;
  int v4;

  if (a3 == 33)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 34)
    v4 = 4;
  else
    v4 = v3;
  if (a3 >= 3)
    return v4;
  else
    return a3;
}

+ (id)edFontFromXlDXfFont:(XlDXfFont *)a3 edResources:(id)a4
{
  id v6;
  EDFont *v7;
  uint64_t var9;
  void *v9;
  _BOOL8 v10;

  v6 = a4;
  if (a3)
  {
    v7 = -[EDFont initWithResources:]([EDFont alloc], "initWithResources:", v6);
    var9 = a3->var9;
    if ((_DWORD)var9 != -1)
    {
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", var9, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDFont setColorReference:](v7, "setColorReference:", v9);

    }
    if (!a3->var14)
    {
      v10 = (a3->var3 & 1) != 0 || a3->var4 == 700;
      -[EDFont setBold:](v7, "setBold:", v10);
      -[EDFont setWeight:](v7, "setWeight:", a3->var4);
      -[EDFont setItalic:](v7, "setItalic:", (a3->var3 >> 1) & 1);
    }
    if ((a3->var11 & 0x80) == 0)
      -[EDFont setStrike:](v7, "setStrike:", (a3->var3 >> 7) & 1);
    if (!a3->var13)
      -[EDFont setUnderline:](v7, "setUnderline:", objc_msgSend(a1, "convertXlUnderlineEnumToED:", a3->var6));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)convertEDScriptEnumToXl:(int)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

+ (int)convertEDUnderlineEnumToXl:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return dword_22A4C1C80[a3 - 1];
}

@end
