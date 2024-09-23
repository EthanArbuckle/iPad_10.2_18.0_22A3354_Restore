@implementation PFXStyleUtilities

+ (void)initialize
{
  if (objc_opt_class(PFXStyleUtilities))
    whitespaceCharacterSet = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
}

+ (id)colorInArray:(id)a3
{
  id result;
  uint64_t v6;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    v6 = 0;
    while (1)
    {
      result = objc_msgSend(a1, "htmlPairToColor:", objc_msgSend(a3, "objectAtIndex:", v6));
      if (result)
        break;
      if (++v6 >= (unint64_t)objc_msgSend(a3, "count"))
        return 0;
    }
  }
  return result;
}

+ (double)colorComponentFromPair:(id)a3
{
  uint64_t *v4;
  double result;
  double v6;
  double v7;

  v4 = (uint64_t *)objc_msgSend(a3, "type");
  if (v4 == (uint64_t *)&stru_108.segname[15])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    v7 = 100.0;
  }
  else
  {
    result = 0.0;
    if (v4 != &stru_108.addr)
      return result;
    v6 = (double)(uint64_t)objc_msgSend(objc_msgSend(a3, "value", 0.0), "integerValue");
    v7 = 255.0;
  }
  return v6 / v7;
}

+ (id)htmlPairToColor:(id)a3
{
  section_64 *v5;
  id v6;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v5 = (section_64 *)objc_msgSend(a3, "type");
  if (v5 == &stru_108)
  {
    v8 = objc_msgSend(a3, "value");
    v9 = +[PFXColorPaletteEntry entryForColor:](PFXColorPaletteEntry, "entryForColor:", objc_msgSend(v8, "stringByTrimmingCharactersInSet:", whitespaceCharacterSet));
    if (!v9)
      return 0;
    v10 = v9;
    objc_msgSend(v9, "red");
    v12 = v11;
    objc_msgSend(v10, "green");
    v14 = v13;
    objc_msgSend(v10, "blue");
    v16 = v15;
    v17 = 1.0;
    v18 = v12;
    v19 = v14;
  }
  else
  {
    if (v5 != (section_64 *)((char *)&stru_108.addr + 2))
    {
      if (v5 == (section_64 *)&stru_108.sectname[1])
      {
        v6 = objc_msgSend(a3, "value");
        return objc_msgSend(a1, "htmlStringToColor:", objc_msgSend(v6, "stringByTrimmingCharactersInSet:", whitespaceCharacterSet));
      }
      return 0;
    }
    v20 = objc_msgSend(a3, "value");
    v21 = 1.0;
    v22 = 0.0;
    if (objc_msgSend(v20, "count") == (char *)&dword_0 + 2
      && ((v23 = objc_msgSend(v20, "objectAtIndex:", 0),
           (objc_msgSend(v23, "isEqualToString:", CFSTR("rgb(")) & 1) != 0)
       || objc_msgSend(v23, "isEqualToString:", CFSTR("rgba("))))
    {
      v24 = objc_msgSend(v20, "objectAtIndex:", 1);
      v25 = 0.0;
      v26 = 0.0;
      if ((unint64_t)objc_msgSend(v24, "count") >= 5)
      {
        objc_msgSend(a1, "colorComponentFromPair:", objc_msgSend(v24, "objectAtIndex:", 0));
        v22 = v27;
        objc_msgSend(a1, "colorComponentFromPair:", objc_msgSend(v24, "objectAtIndex:", 2));
        v25 = v28;
        objc_msgSend(a1, "colorComponentFromPair:", objc_msgSend(v24, "objectAtIndex:", 4));
        v26 = v29;
      }
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("rgba(")))
      {
        if ((unint64_t)objc_msgSend(v24, "count") >= 7)
        {
          objc_msgSend(objc_msgSend(objc_msgSend(v24, "objectAtIndex:", 6), "value"), "doubleValue");
          v21 = v30;
        }
      }
    }
    else
    {
      v25 = 0.0;
      v26 = 0.0;
    }
    v18 = v22;
    v19 = v25;
    v16 = v26;
    v17 = v21;
  }
  return +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v18, v19, v16, v17);
}

+ (id)colorCache
{
  id result;

  result = (id)qword_5436D0;
  if (!qword_5436D0)
  {
    qword_5436D0 = (uint64_t)objc_alloc_init((Class)NSCache);
    objc_msgSend((id)qword_5436D0, "setCountLimit:", 10);
    return (id)qword_5436D0;
  }
  return result;
}

+ (id)htmlStringToColor:(id)a3
{
  id v5;
  TSUColor *v6;
  TSUColor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  double v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  int v22;
  int v23;
  id v24;
  uint64_t v25;
  int v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  int v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v34;
  unsigned __int8 *v35;
  id v36;
  double v37;
  double v38;
  double v39;

  v5 = +[PFXStyleUtilities colorCache](PFXStyleUtilities, "colorCache");
  v6 = (TSUColor *)objc_msgSend(v5, "objectForKey:", a3);
  if (!v6)
  {
    if (objc_msgSend(a3, "length"))
    {
      v7 = +[PFXColorPaletteEntry entryForColor:](PFXColorPaletteEntry, "entryForColor:", a3);
      v6 = v7;
      if (v7)
      {
        -[TSUColor red](v7, "red");
        v9 = v8;
        -[TSUColor green](v6, "green");
        v11 = v10;
        -[TSUColor blue](v6, "blue");
        v6 = +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v9, v11, v12, 1.0);
      }
      if (objc_msgSend(a3, "hasPrefix:", CFSTR("rgba(")))
      {
        v13 = objc_msgSend(a3, "substringWithRange:", 5, (char *)objc_msgSend(a3, "length") - 6);
        v14 = objc_msgSend(objc_msgSend(v13, "stringByTrimmingCharactersInSet:", whitespaceCharacterSet), "componentsSeparatedByString:", CFSTR(","));
        v15 = 0;
        v37 = 0.0;
        v38 = 0.0;
        v39 = 0.0;
        do
        {
          v16 = objc_msgSend(v14, "objectAtIndex:", v15, *(_QWORD *)&v37, *(_QWORD *)&v38, *(_QWORD *)&v39);
          if (objc_msgSend(v16, "hasSuffix:", CFSTR("%")))
          {
            objc_msgSend(v16, "doubleValue");
            v18 = v17 / 100.0;
          }
          else
          {
            v18 = (double)(uint64_t)objc_msgSend(v16, "integerValue") / 255.0;
          }
          *(&v37 + v15++) = v18;
        }
        while (v15 != 3);
        objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 3), "doubleValue");
        v6 = +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", v37, v38, v39, v19);
      }
      if (v6)
        goto LABEL_40;
      v20 = (unsigned __int8 *)objc_msgSend(a3, "UTF8String");
      if (PFXChHash == *v20)
        v21 = v20 + 1;
      else
        v21 = v20;
      v22 = xmlStrlen(v21);
      if (*v21)
      {
        v23 = v22;
        v24 = objc_msgSend(a1, "xmlChar2HexDigit:");
        if (v23 == 3)
          v25 = 17 * (_QWORD)v24;
        else
          v25 = 16 * (_QWORD)v24;
        v26 = v21[1];
        if (v21[1])
          v27 = v23 == 3;
        else
          v27 = 1;
        if (!v27)
        {
          v25 += (uint64_t)objc_msgSend(a1, "xmlChar2HexDigit:");
          v26 = v21[2];
          ++v21;
        }
        if (v26)
        {
          v28 = objc_msgSend(a1, "xmlChar2HexDigit:");
          if (v23 == 3)
            v29 = 17 * (_QWORD)v28;
          else
            v29 = 16 * (_QWORD)v28;
          v30 = v21[2];
          if (v21[2])
            v31 = v23 == 3;
          else
            v31 = 1;
          if (v31)
          {
            v34 = 2;
          }
          else
          {
            v29 += (uint64_t)objc_msgSend(a1, "xmlChar2HexDigit:");
            v30 = v21[3];
            v34 = 3;
          }
          if (v30)
          {
            v35 = &v21[v34];
            v36 = objc_msgSend(a1, "xmlChar2HexDigit:");
            if (v23 == 3)
              v32 = 17 * (_QWORD)v36;
            else
              v32 = 16 * (_QWORD)v36;
            if (v35[1] && v23 != 3)
              v32 += (uint64_t)objc_msgSend(a1, "xmlChar2HexDigit:");
            goto LABEL_39;
          }
LABEL_38:
          v32 = 0;
LABEL_39:
          v6 = +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", (double)v25 / 255.0, (double)v29 / 255.0, (double)v32 / 255.0, 1.0);
LABEL_40:
          objc_msgSend(v5, "setObject:forKey:", v6, a3);
          return v6;
        }
      }
      else
      {
        v25 = 0;
      }
      v29 = 0;
      goto LABEL_38;
    }
    return 0;
  }
  return v6;
}

+ (int64_t)xmlChar2HexDigit:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = (unsigned __int16)PFXCha;
  if (a3 >= (unsigned __int16)PFXCha && (unsigned __int16)PFXChf >= a3)
    return a3 - v3 + 10;
  v3 = (unsigned __int16)PFXChA;
  if (a3 >= (unsigned __int16)PFXChA && (unsigned __int16)PFXChF >= a3)
    return a3 - v3 + 10;
  if (a3 < (unsigned __int16)PFXCh0)
    return 0;
  if ((unsigned __int16)PFXCh9 >= a3)
    return a3 - (unint64_t)(unsigned __int16)PFXCh0;
  return 0;
}

+ (double)pointLengthInPair:(id)a3 readerState:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;

  switch((unint64_t)objc_msgSend(a3, "type"))
  {
    case 0x119uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      v6 = v7 * 132.0;
      v8 = 2.54;
      goto LABEL_8;
    case 0x11AuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      v6 = v9 * 132.0;
      v8 = 25.4;
      goto LABEL_8;
    case 0x11BuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      v11 = v10 * 132.0;
      return v11 * 0.545454545;
    case 0x11CuLL:
    case 0x128uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      goto LABEL_7;
    case 0x11DuLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      v6 = v12 * 12.0;
LABEL_7:
      v8 = 0.545454545;
LABEL_8:
      v11 = v6 / v8;
      break;
    case 0x127uLL:
      objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
      v18 = v17;
      objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentHtmlStackEntry"), "currentEntryMediaState"), "blockWidth");
      v11 = v18 / 100.0 * v19;
      break;
    default:
      v14 = objc_opt_class(NSString);
      *(_QWORD *)&v15 = TSUDynamicCast(v14, objc_msgSend(a3, "value")).n128_u64[0];
      objc_msgSend(v16, "doubleValue", v15);
      break;
  }
  return v11 * 0.545454545;
}

+ (double)pointLengthInArray:(id)a3 readerState:(id)a4
{
  double result;

  objc_msgSend(a1, "pointLengthInPair:readerState:", objc_msgSend(a3, "lastObject"), a4);
  return result;
}

+ (double)pointLengthInString:(id)a3 readerState:(id)a4
{
  double result;

  objc_msgSend(a3, "doubleValue");
  return result;
}

+ (double)angleInDegreesInPair:(id)a3 readerState:(id)a4
{
  char *v5;
  double result;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (char *)objc_msgSend(a3, "type");
  if (v5 == &stru_108.segname[8])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    v8 = v7 * 90.0;
    v9 = 100.0;
    return v8 / v9;
  }
  if (v5 == &stru_108.segname[7])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    v8 = v10 * 180.0;
    v9 = 3.14159265;
    return v8 / v9;
  }
  result = 0.0;
  if (v5 == &stru_108.segname[6])
    objc_msgSend(objc_msgSend(a3, "value", 0.0), "doubleValue");
  return result;
}

+ (double)percentageWidthInPair:(id)a3 readerState:(id)a4
{
  double v7;
  id v9;
  double v10;
  double v11;
  double v12;

  if (objc_msgSend(a3, "type") == &stru_108.segname[15])
  {
    objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
    return v7 / 100.0;
  }
  else
  {
    v9 = objc_msgSend(a4, "currentHtmlStackEntry");
    objc_msgSend(a1, "pointLengthInPair:readerState:", a3, a4);
    v11 = v10 / 0.545454545;
    objc_msgSend(objc_msgSend(v9, "currentEntryMediaState"), "blockWidth");
    return v11 / v12;
  }
}

+ (double)percentageWidthInArray:(id)a3 readerState:(id)a4
{
  double result;

  objc_msgSend(a1, "percentageWidthInPair:readerState:", objc_msgSend(a3, "lastObject"), a4);
  return result;
}

+ (double)percentageStringToFraction:(id)a3
{
  double v4;

  if (!objc_msgSend(a3, "hasSuffix:", CFSTR("%")))
    return NAN;
  objc_msgSend(a3, "doubleValue");
  return v4 / 100.0;
}

+ (double)percentageInPair:(id)a3
{
  double v4;

  if (objc_msgSend(a3, "type") != &stru_108.segname[15])
    return NAN;
  objc_msgSend(objc_msgSend(a3, "value"), "doubleValue");
  return v4 / 100.0;
}

+ (id)stringInPair:(id)a3 expectedType:(int64_t)a4
{
  uint64_t v5;
  id result;

  if (a4 && objc_msgSend(a3, "type") != (id)a4)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Malformed pair"));
    return 0;
  }
  else
  {
    v5 = objc_opt_class(NSString);
    TSUDynamicCast(v5, objc_msgSend(a3, "value"));
  }
  return result;
}

+ (id)stringInPair:(id)a3
{
  return objc_msgSend(a1, "stringInPair:expectedType:", a3, 263);
}

+ (id)numberStringInPair:(id)a3
{
  return objc_msgSend(a1, "stringInPair:expectedType:", a3, 296);
}

+ (BOOL)BOOLValueInPair:(id)a3
{
  id v4;
  uint64_t *v5;
  const __CFString *v7;

  v4 = objc_msgSend(a1, "stringInPair:expectedType:", a3, 0);
  v5 = (uint64_t *)objc_msgSend(a3, "type");
  if (v5 == &stru_108.addr)
  {
    v7 = CFSTR("1");
    return objc_msgSend(v4, "isEqualToString:", v7);
  }
  if (v5 == (uint64_t *)&stru_108)
  {
    v4 = objc_msgSend(v4, "lowercaseString");
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("t")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("true")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("y")) & 1) != 0)
    {
      return 1;
    }
    v7 = CFSTR("yes");
    return objc_msgSend(v4, "isEqualToString:", v7);
  }
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Not a BOOL pair"));
  return 0;
}

+ (id)uriValueInPair:(id)a3
{
  return objc_msgSend(objc_msgSend(a1, "stringInPair:expectedType:", a3, 297), "stringWithURLFromCssUriValue");
}

+ (id)identValueInPair:(id)a3
{
  return objc_msgSend(a1, "stringInPair:expectedType:", a3, 264);
}

+ (int64_t)integerValueInPair:(id)a3
{
  return (int64_t)objc_msgSend(objc_msgSend(a1, "stringInPair:expectedType:", a3, 296), "integerValue");
}

@end
