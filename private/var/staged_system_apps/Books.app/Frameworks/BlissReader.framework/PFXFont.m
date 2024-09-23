@implementation PFXFont

+ (double)mapFontProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;
  double v20;

  objc_msgSend(objc_msgSend(objc_msgSend(a5, "parentHtmlStackEntry"), "currentEntryMediaState"), "fontSize");
  v20 = v9;
  v19 = 0;
  objc_msgSend(a1, "mapFontSize:to:parentFontSize:index:", objc_msgSend(a3, "valueForProperty:", "font-size"), a4, &v20, &v19);
  objc_msgSend(a1, "mapFontShorthand:to:parentFontSize:stackEntry:", objc_msgSend(a3, "valueForProperty:", "font"), a4, &v20, a5);
  v10 = objc_msgSend(a3, "valueForProperty:", "color");
  if (v10)
  {
    v11 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v10, "lastObject"));
    if (v11)
      objc_msgSend(a4, "setObject:forProperty:", v11, 18);
  }
  v12 = objc_msgSend(a3, "valueForProperty:", "font-family");
  if (objc_msgSend(v12, "count", 0))
  {
    v13 = 0;
    while (1)
    {
      v14 = objc_msgSend(v12, "objectAtIndex:", v13);
      if ((char *)objc_msgSend(v14, "type") - 263 <= (_BYTE *)&dword_0 + 1)
      {
        if (objc_msgSend(objc_msgSend(a5, "htmlReaderState"), "postScriptNameForFamilyName:", objc_msgSend(v14, "value")))
        {
          break;
        }
      }
      if (++v13 >= (unint64_t)objc_msgSend(v12, "count"))
        goto LABEL_11;
    }
    v19 = v13;
  }
LABEL_11:
  objc_msgSend(a1, "mapFontName:to:index:stackEntry:", v12, a4, &v19, a5);
  v15 = objc_msgSend(a3, "valueForProperty:", "font-style");
  v19 = 0;
  objc_msgSend(a1, "mapFontStyle:to:index:", v15, a4, &v19);
  v16 = objc_msgSend(a3, "valueForProperty:", "font-variant");
  v19 = 0;
  objc_msgSend(a1, "mapFontVariant:to:index:", v16, a4, &v19);
  v17 = objc_msgSend(a3, "valueForProperty:", "font-weight");
  v19 = 0;
  objc_msgSend(a1, "mapFontWeight:to:index:", v17, a4, &v19);
  return v20;
}

+ (void)mapFontTagTo:(id)a3 stackEntry:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  id v24;
  id v25;

  v6 = objc_msgSend(a4, "valueForAttribute:", "face");
  if (v6)
  {
    v7 = objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
    if (objc_msgSend(v7, "count"))
    {
      v8 = objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 0), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v9 = objc_msgSend(objc_msgSend(a4, "htmlReaderState"), "postScriptNameForFamilyName:", v8);
      if (v9)
      {
        v10 = v9;
        v11 = a3;
      }
      else
      {
        v11 = a3;
        v10 = v8;
      }
      objc_msgSend(v11, "setObject:forProperty:", v10, 16);
    }
  }
  v12 = objc_msgSend(a4, "valueForAttribute:", "size");
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "length"))
    {
      v14 = objc_msgSend(v13, "characterAtIndex:", 0);
      if (v14 == (unsigned __int16)PFXChPlus)
      {
        v15 = 0;
        v16 = 1;
      }
      else
      {
        v15 = objc_msgSend(v13, "characterAtIndex:", 0) == (unsigned __int16)PFXChDash;
        v16 = v15;
      }
      v17 = objc_msgSend(objc_msgSend(v13, "substringFromIndex:", v16), "integerValue");
      v18 = (uint64_t)v17 + 3;
      v19 = 3 - (_QWORD)v17;
      if (!v15)
        v19 = (uint64_t)v17;
      if (v14 != (unsigned __int16)PFXChPlus)
        v18 = v19;
      v20 = 7;
      if (v18 < 7)
        v20 = v18;
      v21 = v20 - 1;
      if (v18 <= 0)
        v22 = 0;
      else
        v22 = v21;
      v23 = dbl_3157F8[v22];
      *(float *)&v23 = v23;
      objc_msgSend(a3, "setFloatValue:forProperty:", 17, v23);
    }
  }
  v24 = objc_msgSend(a4, "valueForAttribute:", "color");
  if (v24)
  {
    v25 = +[PFXStyleUtilities htmlStringToColor:](PFXStyleUtilities, "htmlStringToColor:", v24);
    if (v25)
      objc_msgSend(a3, "setObject:forProperty:", v25, 18);
  }
}

+ (void)mapFontName:(id)a3 to:(id)a4 index:(unint64_t *)a5 stackEntry:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id *v14;
  id v15;

  if (qword_543698 == -1)
  {
    if (!a3)
      return;
  }
  else
  {
    dispatch_once(&qword_543698, &stru_42C128);
    if (!a3)
      return;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > *a5)
  {
    v10 = objc_msgSend(a3, "objectAtIndex:");
    if ((char *)objc_msgSend(v10, "type") - 263 <= (_BYTE *)&dword_0 + 1)
    {
      v11 = objc_msgSend(v10, "value");
      v12 = (void *)qword_543690;
      objc_sync_enter((id)qword_543690);
      v13 = objc_msgSend((id)qword_543690, "objectForKey:", v11);
      if (v13)
      {
LABEL_18:
        objc_msgSend(a4, "setObject:forProperty:", v13, 16);
        objc_sync_exit(v12);
        ++*a5;
        return;
      }
      v13 = objc_msgSend(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" ITC"), &stru_43D7D8), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" TT"), &stru_43D7D8);
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("cursive")))
      {
        v14 = (id *)&PFXStrAppleChancery;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("fantasy")))
      {
        v14 = (id *)&PFXStrPapyrus;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("monospace")))
      {
        v14 = (id *)&PFXStrCourier;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("sans-serif")))
      {
        v14 = (id *)&PFXStrHelvetica;
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("serif")))
        {
          v15 = objc_msgSend(objc_msgSend(a6, "htmlReaderState"), "postScriptNameForFamilyName:", v13);
          if (v15)
            v13 = v15;
          goto LABEL_17;
        }
        v14 = (id *)&PFXStrTimes;
      }
      v13 = *v14;
LABEL_17:
      objc_msgSend((id)qword_543690, "setObject:forKey:", v13, v11);
      goto LABEL_18;
    }
  }
}

+ (void)mapFontStyle:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;

  if (a3)
  {
    if ((unint64_t)objc_msgSend(a3, "count") > *a5)
    {
      v8 = objc_msgSend(a3, "objectAtIndex:");
      if (objc_msgSend(v8, "type") == &stru_108)
      {
        v9 = objc_msgSend(v8, "value");
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("italic")) & 1) != 0
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("oblique")) & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("normal")) & 1) == 0)
          {
            if ((objc_msgSend(v9, "isEqualToString:", CFSTR("inherit")) & 1) == 0)
              return;
            goto LABEL_8;
          }
          v10 = 0;
        }
        objc_msgSend(a4, "setBoolValue:forProperty:", v10, 20);
LABEL_8:
        ++*a5;
      }
    }
  }
}

+ (void)mapFontVariant:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  id v8;
  id v9;
  uint64_t v10;

  if (a3)
  {
    if ((unint64_t)objc_msgSend(a3, "count") > *a5)
    {
      v8 = objc_msgSend(a3, "objectAtIndex:");
      if (objc_msgSend(v8, "type") == &stru_108)
      {
        v9 = objc_msgSend(v8, "value");
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("small-caps")) & 1) != 0)
        {
          v10 = 2;
        }
        else
        {
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("normal")) & 1) == 0)
          {
            if ((objc_msgSend(v9, "isEqualToString:", CFSTR("inherit")) & 1) == 0)
              return;
            goto LABEL_9;
          }
          v10 = 0;
        }
        objc_msgSend(a4, "setIntValue:forProperty:", v10, 21);
LABEL_9:
        ++*a5;
      }
    }
  }
}

+ (void)mapFontWeight:(id)a3 to:(id)a4 index:(unint64_t *)a5
{
  double v8;

  if (a3)
  {
    if ((unint64_t)objc_msgSend(a3, "count") > *a5)
    {
      +[PFSUtilities fontWeightFromHtmlStr:parentWeight:](PFSUtilities, "fontWeightFromHtmlStr:parentWeight:", objc_msgSend(a3, "objectAtIndex:"), 400.0);
      if (v8 > 500.0 || v8 > 0.0)
      {
        objc_msgSend(a4, "setBoolValue:forProperty:", v8 > 500.0, 19);
        ++*a5;
      }
    }
  }
}

+ (void)mapFontSize:(id)a3 to:(id)a4 parentFontSize:(double *)a5 index:(unint64_t *)a6
{
  double v10;
  double v11;
  double v12;

  if (a3 && (unint64_t)objc_msgSend(a3, "count") > *a6)
  {
    +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", objc_msgSend(a3, "objectAtIndex:"), *a5);
    if (v10 != -65536.0)
    {
      v11 = round(v10 * 1000.0);
      v12 = v11 / 1000.0;
      *(float *)&v11 = v11 / 1000.0;
      objc_msgSend(a4, "setFloatValue:forProperty:", 17, v11);
      ++*a6;
      *a5 = v12;
    }
  }
}

+ (void)mapFontShorthand:(id)a3 to:(id)a4 parentFontSize:(double *)a5 stackEntry:(id)a6
{
  id v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  if (a3)
  {
    v11 = objc_msgSend(a3, "count");
    if (v11)
    {
      objc_msgSend(a4, "setBoolValue:forProperty:", 0, 20);
      objc_msgSend(a4, "setIntValue:forProperty:", 0, 21);
      objc_msgSend(a4, "setBoolValue:forProperty:", 0, 19);
      LODWORD(v12) = 16.0;
      objc_msgSend(a4, "setFloatValue:forProperty:", 17, v12);
      objc_msgSend(a4, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      v13 = 0;
      while (1)
      {
        v16 = v13;
        objc_msgSend(a1, "mapFontSize:to:parentFontSize:index:", a3, a4, a5, &v16, v15);
        v14 = v16;
        if (v16 != v13)
          break;
        objc_msgSend(a1, "mapFontStyle:to:index:", a3, a4, &v16);
        v14 = v16;
        if (v16 == v13)
        {
          objc_msgSend(a1, "mapFontVariant:to:index:", a3, a4, &v16);
          v14 = v16;
          if (v16 == v13)
          {
            objc_msgSend(a1, "mapFontWeight:to:index:", a3, a4, &v16);
            v14 = v16;
            if (v16 == v13)
            {
              v14 = v13 + 1;
              v16 = v13 + 1;
            }
          }
        }
        v15 = v14;
        v13 = v14;
        if (v14 >= (unint64_t)v11)
          goto LABEL_15;
      }
      v15 = v16;
      if (v16 < (unint64_t)v11
        && objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v16, v15), "type") == &stru_20.segname[7])
      {
        v14 += 2;
        v15 = v14;
      }
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
LABEL_15:
    if (v14 < (unint64_t)v11)
      objc_msgSend(a1, "mapFontName:to:index:stackEntry:", a3, a4, &v15, a6);
  }
}

@end
