@implementation EBFill

+ (id)edFillFromXlXf:(XlXf *)a3 edResources:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (a3)
  {
    +[EDFill fillWithResources:](EDPatternFill, "fillWithResources:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setType:", objc_msgSend(a1, "convertXlFillPatternEnumToED:", a3->var11));
    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var22, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setForeColorReference:", v8);

    +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", a3->var23, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackColorReference:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)convertXlFillPatternEnumToED:(int)a3
{
  if ((a3 - 1) >= 0x12)
    return 0;
  else
    return a3;
}

+ (id)edFillFromXlDXf:(XlDXf *)a3 edResources:(id)a4
{
  id v6;
  XlDXfPattern *var10;
  void *v8;
  unsigned __int8 var2;
  void *v10;
  void *v11;

  v6 = a4;
  var10 = a3->var10;
  if (var10)
  {
    +[EDFill fillWithResources:](EDPatternFill, "fillWithResources:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    var2 = a3->var2;
    if ((var2 & 1) == 0)
    {
      objc_msgSend(v8, "setType:", objc_msgSend(a1, "convertXlFillPatternEnumToED:", *(_DWORD *)var10));
      var2 = a3->var2;
    }
    if ((var2 & 2) == 0)
    {
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var10 + 2), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setForeColorReference:", v10);

      var2 = a3->var2;
    }
    if ((var2 & 4) == 0)
    {
      +[EBColorReference edColorReferenceFromXlColorIndex:edResources:](EBColorReference, "edColorReferenceFromXlColorIndex:edResources:", *((__int16 *)var10 + 3), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackColorReference:", v11);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)extractFromEDFill:(id)a3 foreColorReference:(id *)a4 backColorReference:(id *)a5 fillPatternEnum:(int *)a6
{
  id v10;
  char isKindOfClass;
  id v12;

  v10 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v12 = v10;
    objc_msgSend(v12, "foreColorReference");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backColorReference");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    *a6 = objc_msgSend(a1, "convertEDPatternFillEnumToXl:", objc_msgSend(v12, "type"));

  }
  return isKindOfClass & 1;
}

+ (int)convertEDPatternFillEnumToXl:(int)a3
{
  if ((a3 - 1) >= 0x12)
    return 0;
  else
    return a3;
}

@end
