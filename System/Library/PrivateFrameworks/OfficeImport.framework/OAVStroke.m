@implementation OAVStroke

+ (id)readFromManager:(id)a3
{
  id v4;
  OADStroke *v5;
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

  v4 = a3;
  v5 = objc_alloc_init(OADStroke);
  objc_msgSend(a1, "targetFgColorWithManager:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setColor:](v5, "setColor:", v6);

  objc_msgSend(a1, "readFillStyleFromManager:toStroke:", v4, v5);
  objc_msgSend(a1, "readDashStyleFromManager:toStroke:", v4, v5);
  objc_msgSend(a1, "readJoinStyleFromManager:toStroke:", v4, v5);
  objc_msgSend(v4, "strokeStartArrowType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeStartArrowWidth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeStartArrowLength");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readLineEndWithType:width:length:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setTail:](v5, "setTail:", v10);

  objc_msgSend(v4, "strokeEndArrowType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeEndArrowWidth");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeEndArrowLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readLineEndWithType:width:length:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setHead:](v5, "setHead:", v14);

  objc_msgSend(v4, "strokeWidth");
  -[OADStroke setWidth:](v5, "setWidth:");
  objc_msgSend(v4, "strokeCapStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setCap:](v5, "setCap:", objc_msgSend(a1, "readCapStyle:", v15));
  objc_msgSend(v4, "strokeCompoundType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setCompoundType:](v5, "setCompoundType:", objc_msgSend(a1, "readCompoundType:", v16));

  return v5;
}

+ (id)targetFgColorWithManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "strokeFgColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "strokeFgAlpha");
  +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)readFillStyleFromManager:(id)a3 toStroke:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  OADSolidFill *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = objc_msgSend(v12, "isStroked");
  objc_msgSend(v12, "strokeFillType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("solid")))
    {
      v10 = objc_alloc_init(OADSolidFill);
      objc_msgSend(a1, "targetFgColorWithManager:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADSolidFill setColor:](v10, "setColor:", v11);

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v10 = (OADSolidFill *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setFill:", v10);

}

+ (void)readDashStyleFromManager:(id)a3 toStroke:(id)a4
{
  void *v6;
  uint64_t v7;
  OADCustomDash *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  float v15;
  NSString *v16;
  float v17;
  double v18;
  double v19;
  id v20;

  v20 = a4;
  objc_msgSend(a3, "strokeDashStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "readPresetDashStyle:", v6);
  if ((_DWORD)v7 == -1)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v8 = objc_alloc_init(OADCustomDash);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10 >> 1);
    if (v10 >= 2)
    {
      if (v10 >> 1 <= 1)
        v12 = 1;
      else
        v12 = v10 >> 1;
      v13 = 1;
      do
      {
        objc_msgSend(v9, "objectAtIndex:", v13 - 1);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = OAVReadFraction(v14);

        objc_msgSend(v9, "objectAtIndex:", v13);
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        v17 = OAVReadFraction(v16);

        *(float *)&v18 = v15;
        *(float *)&v19 = v17;
        +[OADDashStop addStopWithDash:space:toArray:](OADDashStop, "addStopWithDash:space:toArray:", v11, v18, v19);
        v13 += 2;
        --v12;
      }
      while (v12);
    }
    -[OADCustomDash setStops:](v8, "setStops:", v11);

  }
  else
  {
    v8 = objc_alloc_init(OADPresetDash);
    -[OADCustomDash setType:](v8, "setType:", v7);
  }
  objc_msgSend(v20, "setDash:", v8);

}

+ (char)readPresetDashStyle:(id)a3
{
  char v3;

  v3 = objc_msgSend((id)presetDashStyleEnumMap, "valueForString:", a3);
  if (v3 == 126)
    return -1;
  else
    return v3;
}

+ (void)readJoinStyleFromManager:(id)a3 toStroke:(id)a4
{
  id v5;
  void *v6;
  __objc2_class **v7;
  OADMiterLineJoin *v8;
  OADMiterLineJoin *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  objc_msgSend(v10, "strokeJoinStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("bevel")) & 1) != 0)
  {
    v7 = off_24F399320;
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("miter")))
    {
      v9 = objc_alloc_init(OADMiterLineJoin);
      objc_msgSend(v10, "strokeMiterLimit");
      v8 = v9;
      -[OADMiterLineJoin setLimit:](v9, "setLimit:");
      goto LABEL_9;
    }
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("round")))
    {
      v8 = 0;
      goto LABEL_9;
    }
    v7 = off_24F399358;
  }
  v8 = (OADMiterLineJoin *)objc_alloc_init(*v7);
LABEL_9:
  objc_msgSend(v5, "setJoin:", v8);

}

+ (unsigned)readLineEndType:(id)a3
{
  return objc_msgSend((id)lineEndTypeEnumMap, "valueForString:", a3);
}

+ (unsigned)readLineEndWidth:(id)a3
{
  return objc_msgSend((id)lineEndWidthEnumMap, "valueForString:", a3);
}

+ (unsigned)readLineEndLength:(id)a3
{
  return objc_msgSend((id)lineEndLengthEnumMap, "valueForString:", a3);
}

+ (unsigned)readCapStyle:(id)a3
{
  return objc_msgSend((id)capStyleEnumMap, "valueForString:", a3);
}

+ (unsigned)readCompoundType:(id)a3
{
  return objc_msgSend((id)compoundTypeEnumMap, "valueForString:", a3);
}

+ (void)initialize
{
  unsigned __int8 v2;
  TCEnumerationMap *v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  unsigned __int8 v8;
  TCEnumerationMap *v9;
  void *v10;
  unsigned __int8 v11;
  TCEnumerationMap *v12;
  void *v13;
  unsigned __int8 v14;
  TCEnumerationMap *v15;
  void *v16;
  unsigned __int8 v17;
  TCEnumerationMap *v18;
  void *v19;

  if ((id)objc_opt_class() == a1)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_17, 0, &dword_22A0CC000);
    }
    v3 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::compoundTypeEnumStructs, 5, 0);
    v4 = (void *)compoundTypeEnumMap;
    compoundTypeEnumMap = (uint64_t)v3;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_32, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::presetDashStyleEnumStructs, 11, 0);
    v7 = (void *)presetDashStyleEnumMap;
    presetDashStyleEnumMap = (uint64_t)v6;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_45, 0, &dword_22A0CC000);
    }
    v9 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::lineEndTypeEnumStructs, 6, 0);
    v10 = (void *)lineEndTypeEnumMap;
    lineEndTypeEnumMap = (uint64_t)v9;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_52, 0, &dword_22A0CC000);
    }
    v12 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::lineEndWidthEnumStructs, 3, 0);
    v13 = (void *)lineEndWidthEnumMap;
    lineEndWidthEnumMap = (uint64_t)v12;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_57, 0, &dword_22A0CC000);
    }
    v15 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::lineEndLengthEnumStructs, 3, 0);
    v16 = (void *)lineEndLengthEnumMap;
    lineEndLengthEnumMap = (uint64_t)v15;

    if ((v17 & 1) == 0)
    {
      {
        __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_64_0, 0, &dword_22A0CC000);
      }
    }
    v18 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVStroke initialize]::capStyleEnumStructs, 3, 0);
    v19 = (void *)capStyleEnumMap;
    capStyleEnumMap = (uint64_t)v18;

  }
}

+ (id)readLineEndWithType:(id)a3 width:(id)a4 length:(id)a5
{
  id v8;
  id v9;
  id v10;
  OADLineEnd *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(OADLineEnd);
  v12 = objc_msgSend(a1, "readLineEndType:", v8);
  v13 = objc_msgSend(a1, "readLineEndWidth:", v9);
  v14 = objc_msgSend(a1, "readLineEndLength:", v10);
  -[OADLineEnd setType:](v11, "setType:", v12);
  -[OADLineEnd setWidth:](v11, "setWidth:", v13);
  -[OADLineEnd setLength:](v11, "setLength:", v14);

  return v11;
}

@end
