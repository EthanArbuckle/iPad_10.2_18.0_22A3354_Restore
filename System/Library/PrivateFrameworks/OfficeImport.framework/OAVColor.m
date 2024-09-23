@implementation OAVColor

+ (id)readColorFromAttribute:(id)a3 alpha:(float)a4 manager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  OADValueColorTransform *v13;
  double v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(a1, "readRGBColorFromAttribute:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[OAXColor readPresetColorFromAttribute:](OAXColor, "readPresetColorFromAttribute:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(a1, "readPropertyColorFromAttribute:manager:", v11, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[OAXColor readSystemColorFromAttribute:](OAXColor, "readSystemColorFromAttribute:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    if (a4 != 1.0)
    {
      v13 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", 6);
      *(float *)&v14 = a4;
      -[OADValueColorTransform setValue:](v13, "setValue:", v14);
      objc_msgSend(v12, "addTransform:", v13);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)readRGBColorFromAttribute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  OADRgbColor *v6;
  OADRgbColor *v7;
  double v8;
  double v9;
  double v10;
  int v12;
  int v13;
  int v14;

  v3 = a3;
  if (objc_msgSend(v3, "characterAtIndex:", 0) == 35)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v12 = 0;
    v13 = 0;
    if (objc_msgSend(v5, "length") == 4
      && sscanf((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "#%01x%01x%01x", &v14, &v13, &v12) == 3)
    {
      v14 *= 17;
      v12 *= 17;
      v13 *= 17;
    }
    else if (objc_msgSend(v5, "length") != 7
           || sscanf((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), "#%02x%02x%02x", &v14, &v13, &v12) != 3)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v7 = [OADRgbColor alloc];
    *(float *)&v8 = (float)v14;
    *(float *)&v9 = (float)v13;
    *(float *)&v10 = (float)v12;
    v6 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v7, "initWithRedByte:greenByte:blueByte:", v8, v9, v10);
LABEL_10:

    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

+ (id)readPropertyColorFromAttribute:(id)a3 manager:(id)a4
{
  void *v6;
  uint64_t v7;
  OADAdjustedColor *v8;
  char v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned int i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v22 = a3;
  v23 = a4;
  objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "readColorProperty:");
  if ((_DWORD)v7 == -130883970)
  {
    v8 = 0;
  }
  else
  {
    v20 = a1;
    objc_msgSend(a1, "readColorProperty:manager:", v7, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v24 = 0;
    v10 = 0;
    v11 = 0;
    for (i = 1; objc_msgSend(v6, "count", v19) > (unint64_t)i; ++i)
    {
      objc_msgSend(v6, "objectAtIndex:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("invert")) & 1) != 0)
      {
        v9 = 1;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("invert128")) & 1) != 0)
      {
        BYTE4(v24) = 1;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("gray")) & 1) != 0)
      {
        LOBYTE(v24) = 1;
      }
      else
      {
        v14 = objc_msgSend(v13, "length");
        v15 = objc_msgSend(v13, "rangeOfString:", CFSTR("("));
        if (v15 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v13, "characterAtIndex:", v14 - 1) != 41)
        {

          break;
        }
        objc_msgSend(v13, "substringToIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v20, "readColorAdjustmentType:", v16);
        objc_msgSend(v13, "substringWithRange:", v15 + 1, v14 - v15 - 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "intValue");

      }
    }
    v8 = -[OADAdjustedColor initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:]([OADAdjustedColor alloc], "initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:", v19, v11, v10, v9 & 1, BYTE4(v24) & 1, v24 & 1);

  }
  return v8;
}

+ (int)readColorProperty:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
  if (!+[OAVColor readColorProperty:]::colorPropertyEnumMap)
  {
    if ((v5 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_16, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVColor readColorProperty:]::colorPropertyEnumStructs, 7, 1);
    v7 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
    +[OAVColor readColorProperty:]::colorPropertyEnumMap = (uint64_t)v6;

    v4 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
  }
  v8 = objc_msgSend(v4, "valueForString:", v3);

  return v8;
}

+ (int)readColorAdjustmentType:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  TCEnumerationMap *v6;
  void *v7;
  int v8;

  v3 = a3;
  v4 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
  if (!+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap)
  {
    if ((v5 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_25, 0, &dword_22A0CC000);
    }
    v6 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumStructs, 6, 1);
    v7 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
    +[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap = (uint64_t)v6;

    v4 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
  }
  v8 = objc_msgSend(v4, "valueForString:", v3);

  return v8;
}

+ (id)readColorProperty:(int)a3 manager:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v8 = v6;
  v9 = 0;
  switch(a3)
  {
    case 240:
      goto LABEL_3;
    case 241:
      if ((objc_msgSend(v6, "isStroked") & 1) == 0)
        goto LABEL_3;
      goto LABEL_8;
    case 242:
      goto LABEL_8;
    case 243:
      objc_msgSend(v6, "shadowColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 245:
      objc_msgSend(v6, "fillBgColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 246:
      objc_msgSend(v6, "strokeBgColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 247:
      if (objc_msgSend(v6, "isFilled"))
      {
LABEL_3:
        objc_msgSend(v8, "fillFgColor");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_8:
        objc_msgSend(v8, "strokeFgColor");
        v10 = objc_claimAutoreleasedReturnValue();
      }
LABEL_9:
      v9 = (void *)v10;
      break;
    default:
      break;
  }
  LODWORD(v7) = 1.0;
  objc_msgSend(a1, "readColorFromAttribute:alpha:manager:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
