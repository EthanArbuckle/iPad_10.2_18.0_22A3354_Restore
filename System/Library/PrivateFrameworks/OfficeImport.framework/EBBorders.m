@implementation EBBorders

+ (id)edBordersFromXlXf:(XlXf *)a3 edResources:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;

  v6 = a4;
  if (a3)
  {
    v7 = objc_msgSend(a1, "convertXlBorderEnumToED:", a3->var12);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var17, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v7, v8, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "convertXlBorderEnumToED:", a3->var13);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var18, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v9, v10, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "convertXlBorderEnumToED:", a3->var15);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var20, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v11, v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(a1, "convertXlBorderEnumToED:", a3->var14);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var19, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v14, v15, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1, "convertXlBorderEnumToED:", a3->var16);
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var21, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDBorder borderWithType:colorReference:diagonalType:resources:](EDBorder, "borderWithType:colorReference:diagonalType:resources:", v17, v18, objc_msgSend(a1, "convertXlDiagStyleEnumToED:", a3->var10), v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBorders bordersWithLeft:right:top:bottom:diagonal:resources:](EDBorders, "bordersWithLeft:right:top:bottom:diagonal:resources:", v23, v22, v13, v16, v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (int)convertXlBorderEnumToED:(int)a3
{
  if ((a3 - 1) > 0xC)
    return 0;
  else
    return dword_22A4C1B60[a3 - 1];
}

+ (int)convertXlDiagStyleEnumToED:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (id)edBordersFromXlDXf:(XlDXf *)a3 edResources:(id)a4
{
  id v6;
  XlDXfBorders *var9;
  EDBorders *v8;
  unsigned __int8 var1;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a4;
  var9 = a3->var9;
  if (var9)
  {
    v8 = objc_alloc_init(EDBorders);
    var1 = a3->var1;
    if ((var1 & 4) == 0)
    {
      v10 = objc_msgSend(a1, "convertXlBorderEnumToED:", *(_DWORD *)var9);
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var9 + 8), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v10, v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDBorders setLeftBorder:](v8, "setLeftBorder:", v12);

      var1 = a3->var1;
    }
    if ((var1 & 8) == 0)
    {
      v13 = objc_msgSend(a1, "convertXlBorderEnumToED:", *((unsigned int *)var9 + 1));
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var9 + 9), v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v13, v14, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDBorders setRightBorder:](v8, "setRightBorder:", v15);

      var1 = a3->var1;
    }
    if ((var1 & 0x10) == 0)
    {
      v16 = objc_msgSend(a1, "convertXlBorderEnumToED:", *((unsigned int *)var9 + 2));
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var9 + 11), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v16, v17, v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDBorders setTopBorder:](v8, "setTopBorder:", v18);

      var1 = a3->var1;
    }
    if ((var1 & 0x20) == 0)
    {
      v19 = objc_msgSend(a1, "convertXlBorderEnumToED:", *((unsigned int *)var9 + 3));
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var9 + 10), v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDBorder borderWithType:colorReference:resources:](EDBorder, "borderWithType:colorReference:resources:", v19, v20, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDBorders setBottomBorder:](v8, "setBottomBorder:", v21);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)convertEDBorderEnumToXl:(int)a3
{
  if ((a3 - 1) > 0xC)
    return 0;
  else
    return dword_22A4C1B94[a3 - 1];
}

+ (int)convertEDDiagonalEnumToXl:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

@end
