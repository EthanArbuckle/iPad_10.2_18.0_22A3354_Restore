@implementation PFSUtilities

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4
{
  double result;
  char v5;

  v5 = 0;
  objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:percentageBasis:usePercentageBasis:isPercent:", a3, 1, &v5, a4, a4);
  return result;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5
{
  double result;
  char v6;

  v6 = 0;
  objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:percentageBasis:usePercentageBasis:isPercent:", a3, 1, &v6, a4, a5);
  return result;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 isPercent:(BOOL *)a5
{
  double result;

  objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:percentageBasis:usePercentageBasis:isPercent:", a3, 0, a5, a4, 0.0);
  return result;
}

+ (BOOL)tokenRepresentsLength:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "type");
  return ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFBLL) == 0x118
      || ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFELL) == 278
      || ((unint64_t)v3 & 0xFFFFFFFFFFFFFFFDLL) == 281
      || v3 == &stru_108.segname[2]
      || v3 == &stru_108.segname[5]
      || (char *)v3 - 295 < (_BYTE *)&dword_0 + 2;
}

+ (double)htmlValueToLineHeight:(id)a3 parentFontSize:(double)a4
{
  double v7;
  double v8;
  double result;
  uint64_t v10;

  if (objc_msgSend(a3, "type") == &stru_108.addr)
  {
    objc_msgSend(a1, "floatFromString:usingDefault:restOfString:", objc_msgSend(a3, "value"), &v10, -65536.0);
    v8 = 1.0;
    if (v7 != -65536.0)
      v8 = a4;
    return v7 * v8;
  }
  else
  {
    objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:", a3, a4);
  }
  return result;
}

+ (double)htmlValueToBorderWidth:(id)a3 parentFontSize:(double)a4
{
  section_64 *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  double result;
  unsigned __int8 v12;
  unsigned __int8 v13;

  v7 = (section_64 *)objc_msgSend(a3, "type");
  v8 = objc_msgSend(objc_msgSend(a3, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  if (v7 != &stru_108
    || (v9 = v8, v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("thin")),
                 result = 1.0,
                 (v10 & 1) == 0)
    && (v12 = objc_msgSend(v9, "isEqualToString:", CFSTR("medium"), 1.0), result = 3.0, (v12 & 1) == 0)
    && (v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("thick"), 3.0), result = 5.0, (v13 & 1) == 0))
  {
    objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:", a3, a4);
  }
  return result;
}

+ (double)fontWeightFromHtmlStr:(id)a3 parentWeight:(double)a4
{
  uint64_t *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double result;
  double v14;

  v7 = (uint64_t *)objc_msgSend(a3, "type");
  v8 = objc_msgSend(a3, "value");
  v9 = v8;
  if (v7 != (uint64_t *)&stru_108)
  {
    if (v7 == &stru_108.addr)
    {
      objc_msgSend(a1, "floatFromString:usingDefault:restOfString:", v8, 0, -65536.0);
      v11 = v10;
      goto LABEL_4;
    }
    return 100.0;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("normal")) & 1) != 0)
    return 400.0;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("bold")) & 1) != 0)
    return 700.0;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("lighter")))
  {
    v14 = -100.0;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("bolder")))
      return 100.0;
    if (a4 == 400.0)
      return 600.0;
    v14 = 100.0;
  }
  v11 = a4 + v14;
LABEL_4:
  result = 100.0;
  if (v11 >= 100.0)
  {
    result = v11;
    if (v11 > 900.0)
      return 900.0;
  }
  return result;
}

+ (double)fontPointSizeFromHtmlStr:(id)a3 parentSize:(double)a4
{
  double result;

  if (objc_msgSend(a3, "type") == &stru_108)
  {
    +[PFSFontSizeNameMap fontSizeForName:parentSize:](PFSFontSizeNameMap, "fontSizeForName:parentSize:", objc_msgSend(a3, "value"), a4);
  }
  else if (objc_msgSend(a1, "tokenRepresentsLength:", a3))
  {
    objc_msgSend(a1, "htmlValueToPointLength:parentFontSize:", a3, a4);
  }
  else
  {
    return -65536.0;
  }
  return result;
}

+ (id)identValueOrNilFromPair:(id)a3
{
  if (objc_msgSend(a3, "type") == &stru_108)
    return objc_msgSend(a3, "value");
  else
    return 0;
}

+ (id)prioritizedPropertyValueLookup:(id)a3 usingNames:(id)a4
{
  id result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  result = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(a4);
      result = objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
      if (result)
        break;
      if (v7 == (id)++v9)
      {
        result = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v7 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

+ (double)floatFromString:(id)a3 usingDefault:(double)a4 restOfString:(_NSRange *)a5
{
  id v8;
  id v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _NSRange *v15;
  uint64_t v16;

  v8 = objc_msgSend(a3, "length");
  if (!v8)
  {
    v10 = 0;
    if (!a5)
      return a4;
    goto LABEL_18;
  }
  v9 = v8;
  v15 = a5;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v16 = 1;
  do
  {
    v13 = objc_msgSend(a3, "characterAtIndex:", v10, v15);
    if (v13 < (unsigned __int16)PFXCh0 || v13 > (unsigned __int16)PFXCh9)
    {
      if (v10 || v13 != (unsigned __int16)PFXChDash)
      {
        if (v13 != (unsigned __int16)PFXChPeriod || v11)
          goto LABEL_14;
        v11 = 1;
      }
      else
      {
        v16 = -1;
      }
    }
    else
    {
      v12 = 10 * v12 + v13 - (unsigned __int16)PFXCh0;
      v11 *= 10;
    }
    ++v10;
  }
  while (v9 != (id)v10);
  v10 = (NSUInteger)v9;
LABEL_14:
  if (v10)
  {
    a4 = (double)(v16 * v12);
    if (v11)
      a4 = a4 / (double)v11;
  }
  a5 = v15;
  if (v15)
  {
LABEL_18:
    a5->location = v10;
    a5->length = (NSUInteger)objc_msgSend(a3, "length") - v10;
  }
  return a4;
}

+ (double)htmlValueToPointLength:(id)a3 parentFontSize:(double)a4 percentageBasis:(double)a5 usePercentageBasis:(BOOL)a6 isPercent:(BOOL *)a7
{
  _BOOL4 v8;
  id v13;
  double v14;
  double v15;
  double v17;
  double v18;
  uint64_t v19;

  v8 = a6;
  if (!objc_msgSend(a1, "tokenRepresentsLength:"))
    return -65536.0;
  v13 = objc_msgSend(a3, "type");
  v14 = -65536.0;
  objc_msgSend(a1, "floatFromString:usingDefault:restOfString:", objc_msgSend(a3, "value"), &v19, -65536.0);
  if (v15 != -65536.0)
  {
    v14 = v15;
    switch((unint64_t)v13)
    {
      case 0x116uLL:
        return v15 * a4;
      case 0x117uLL:
        v15 = v15 * a4;
        v17 = 0.5;
        return v15 * v17;
      case 0x118uLL:
      case 0x11CuLL:
      case 0x128uLL:
        return v14;
      case 0x119uLL:
        v15 = v15 * 72.0;
        v18 = 2.53999996;
        goto LABEL_16;
      case 0x11AuLL:
        v15 = v15 * 72.0;
        v18 = 25.3999996;
        goto LABEL_16;
      case 0x11BuLL:
        v17 = 72.0;
        return v15 * v17;
      case 0x11DuLL:
        v18 = 12.0;
        goto LABEL_16;
      case 0x127uLL:
        if (v8)
        {
          v15 = v15 * a5;
          v18 = 100.0;
        }
        else
        {
          v18 = 100.0;
          *a7 = 1;
        }
LABEL_16:
        v14 = v15 / v18;
        break;
      default:
        return -65536.0;
    }
  }
  return v14;
}

@end
