@implementation PFXCharacterStyle

+ (BOOL)map:(id *)a3 stackEntry:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  id v16;
  id v18;

  *a3 = 0;
  v7 = objc_msgSend(objc_msgSend(a4, "htmlReaderState"), "currentHtmlDocMediaState");
  v8 = objc_msgSend(a4, "styleSelector");
  v9 = objc_msgSend(v7, "displayValueForStyleSelector:", v8);
  if (v9)
  {
    if (objc_msgSend(v9, "BOOLValue"))
    {
      *a3 = objc_msgSend(v7, "characterStyleForStyleSelector:", v8);
      objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "setWhitespace:", objc_msgSend(v7, "whitespaceValueForStyleSelector:", v8));
      objc_msgSend(a1, "mapHrefForStackEntry:", a4);
      LOBYTE(a1) = 1;
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }
  else
  {
    v10 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
    v11 = objc_alloc_init((Class)TSSPropertyMap);
    a1 = objc_msgSend(a1, "mapCharacterPropertiesFrom:to:", a4, v11);
    if ((_DWORD)a1)
    {
      *a3 = v10;
      if (objc_msgSend(v11, "count"))
      {
        v12 = objc_msgSend(a4, "htmlReaderState");
        v18 = objc_msgSend(v7, "stylesheet");
        v13 = qword_5416A8++;
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HTML Imported Character Style %ld"), v13);
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("html-imported-character-style-%ld"), v13);
        v16 = objc_msgSend(objc_alloc((Class)TSWPCharacterStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(v12, "tspContext"), v14, v11, 0);
        objc_msgSend(v18, "addStyle:withIdentifier:", v16, v15);
        *a3 = v16;

      }
      objc_msgSend(v7, "setWhitespaceValue:forStyleSelector:", objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "whitespace"), v8);
      objc_msgSend(v7, "setCharacterStyle:forStyleSelector:", *a3, v8);
    }
    objc_msgSend(v7, "setDisplayValue:forStyleSelector:", a1, v8);

  }
  return (char)a1;
}

+ (BOOL)mapCharacterPropertiesFrom:(id)a3 to:(id)a4
{
  PFSPropertySet *v7;
  int v8;
  id v9;
  id v10;
  id v11;

  v7 = (PFSPropertySet *)objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet");
  v8 = PFXHtmlStyleDisplayValue(v7);
  if (v8)
  {
    v9 = objc_alloc_init((Class)TSSPropertyMap);
    v10 = objc_msgSend(v9, "copy");
    objc_msgSend(a1, "mapElementPropertiesTo:stackEntry:", v9, a3);
    objc_msgSend(a1, "mapProperties:to:stackEntry:", v7, a4, a3);
    if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
    {
      objc_msgSend(a4, "addValuesFromPropertyMap:", v9);
      v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle");
      if (v11)
        objc_msgSend(a4, "addValuesFromPropertyMap:", objc_msgSend(v11, "propertyMap"));
      objc_msgSend(a4, "addValuesFromPropertyMap:", v10);
    }

  }
  return v8;
}

+ (void)mapTextShadowShorthand:(id)a3 to:(id)a4 parentFontSize:(double)a5
{
  char *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  id v23;

  if (!a3)
    return;
  v8 = (char *)objc_msgSend(a3, "count");
  if (!v8)
    return;
  v9 = v8;
  v10 = 0;
  v11 = 0;
  v12 = 0.0;
  v13 = 0.0;
  do
  {
    +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", objc_msgSend(a3, "objectAtIndex:", v10), a5);
    v15 = v14;
    if (v14 != -65536.0)
    {
      if (v11)
      {
        if (v11 == 1)
        {
          v12 = v14;
        }
        else if (v11 == 2)
        {
          v11 = 3;
          goto LABEL_15;
        }
      }
      else
      {
        v13 = v14;
      }
      ++v11;
    }
    ++v10;
  }
  while (v9 != v10);
  v15 = 0.0;
  if (v11 <= 1)
    return;
LABEL_15:
  v16 = sqrt(v12 * v12 + v13 * v13);
  v17 = 0.0;
  if (v12 != 0.0 || v13 != 0.0)
  {
    if (v12 < 0.0 || v13 < 0.0)
    {
      if (v12 < 0.0 || v13 >= 0.0)
        goto LABEL_24;
      v20 = asin(v12 / v16);
      v19 = 180.0;
      v18 = v20 * 180.0 / 3.14159265;
    }
    else
    {
      v18 = asin(v12 / v16) * -180.0 / 3.14159265;
      v19 = 360.0;
    }
    v17 = v18 + v19;
  }
LABEL_24:
  if (v12 >= 0.0 || v13 < 0.0)
  {
    if (v12 < 0.0 && v13 < 0.0)
      v17 = asin(-v12 / v16) * 180.0 / -3.14159265 + 180.0;
  }
  else
  {
    v17 = asin(-v12 / v16) * 180.0 / 3.14159265;
  }
  v21 = 360.0 - round(v17);
  if (v11 <= 2 || v15 < 0.0)
    v15 = 0.0;
  v23 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", a3);
  if (!v23)
    v23 = +[TSUColor blackColor](TSUColor, "blackColor");
  objc_msgSend(a4, "setObject:forProperty:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(v23, "CGColor"), 1, v21, v16, v15, 1.0), 40);
}

+ (BOOL)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  char v14;
  char v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  double v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  unsigned __int8 v46;
  double v47;
  id v48;
  id v49;
  id v50;
  double v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  double v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v72;

  v9 = objc_msgSend(a5, "htmlReaderState");
  +[PFXFont mapFontProperties:to:stackEntry:](PFXFont, "mapFontProperties:to:stackEntry:", a3, a4, a5);
  v11 = v10;
  v12 = objc_msgSend(a3, "valueForProperty:", "text-decoration");
  v13 = v12;
  if (!v12)
    goto LABEL_17;
  if (!objc_msgSend(v12, "count") || !objc_msgSend(v13, "count"))
  {
    LODWORD(v13) = 0;
    goto LABEL_17;
  }
  v72 = v9;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  do
  {
    v17 = objc_msgSend(objc_msgSend(v13, "objectAtIndex:", v16), "value");
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("line-through")))
    {
      v14 = 1;
      v18 = a4;
      v19 = 1;
      v20 = 26;
    }
    else
    {
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("underline")))
      {
        v15 = 1;
        v18 = a4;
        v19 = 1;
      }
      else
      {
        if (!objc_msgSend(v17, "isEqualToString:", CFSTR("none")))
          goto LABEL_13;
        objc_msgSend(a4, "setIntValue:forProperty:", 0, 26);
        v18 = a4;
        v19 = 0;
      }
      v20 = 22;
    }
    objc_msgSend(v18, "setIntValue:forProperty:", v19, v20);
LABEL_13:
    ++v16;
  }
  while (v16 < (unint64_t)objc_msgSend(v13, "count"));
  LODWORD(v13) = v14 & 1;
  if ((v15 & 1) != 0)
  {
    v27 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubUnderline[0]);
    v9 = v72;
    if (v27)
    {
      v28 = objc_msgSend(v27, "lastObject");
      if (objc_msgSend(v28, "type") == &stru_108)
      {
        v29 = objc_msgSend(v28, "value");
        if ((objc_msgSend(CFSTR("double"), "isEqualToString:", v29) & 1) != 0)
        {
          v30 = 2;
        }
        else if (objc_msgSend(CFSTR("triple"), "isEqualToString:", v29))
        {
          v30 = 2;
        }
        else
        {
          v30 = 1;
        }
      }
      else
      {
        v30 = 1;
      }
      objc_msgSend(a4, "setIntValue:forProperty:", v30, 22);
    }
  }
  else
  {
    v9 = v72;
  }
LABEL_17:
  v21 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubUnderlineColor[0]);
  if (v21)
  {
    v22 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v21);
    if (v22)
      objc_msgSend(a4, "setObject:forProperty:", v22, 24);
  }
  if ((_DWORD)v13)
  {
    v23 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubStrikethru[0]);
    if (v23)
    {
      v24 = objc_msgSend(v23, "lastObject");
      if (objc_msgSend(v24, "type") == &stru_108)
      {
        v25 = objc_msgSend(v24, "value");
        if ((objc_msgSend(CFSTR("double"), "isEqualToString:", v25) & 1) != 0)
        {
          v26 = 2;
        }
        else if (objc_msgSend(CFSTR("triple"), "isEqualToString:", v25))
        {
          v26 = 2;
        }
        else
        {
          v26 = 1;
        }
      }
      else
      {
        v26 = 1;
      }
      objc_msgSend(a4, "setIntValue:forProperty:", v26, 26);
    }
  }
  v31 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubStrikethruWidth[0]);
  if (v31)
  {
    +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", v31, v9);
    *(float *)&v32 = v32;
    objc_msgSend(a4, "setFloatValue:forProperty:", 27, v32);
  }
  v33 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubStrikethruColor[0]);
  if (v33)
  {
    v34 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v33);
    if (v34)
      objc_msgSend(a4, "setObject:forProperty:", v34, 28);
  }
  v35 = objc_msgSend(a3, "valueForProperty:", "letter-spacing");
  if (v35)
  {
    v36 = v35;
    if (objc_msgSend(v35, "count"))
    {
      v37 = objc_msgSend(v36, "lastObject");
      if (+[PFSUtilities tokenRepresentsLength:](PFSUtilities, "tokenRepresentsLength:", v37))
      {
        +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", v37, v11);
        if (v38 != -65536.0)
          goto LABEL_43;
      }
      else
      {
        v46 = objc_msgSend(objc_msgSend(v37, "value"), "isEqualToString:", CFSTR("normal"));
        v38 = 0.0;
        if ((v46 & 1) != 0)
        {
LABEL_43:
          v39 = v38 / v11;
          *(float *)&v39 = v39;
          objc_msgSend(a4, "setFloatValue:forProperty:", 35, v39);
        }
      }
    }
  }
  v40 = objc_msgSend(a3, "valueForProperty:", "vertical-align");
  if (v40)
  {
    v41 = v40;
    if (objc_msgSend(v40, "count"))
    {
      v42 = objc_msgSend(v41, "lastObject");
      v43 = objc_msgSend(v42, "value");
      if (objc_msgSend(v43, "isEqualToString:", CFSTR("sub")))
      {
        v44 = a4;
        v45 = 2;
        goto LABEL_52;
      }
      if (!objc_msgSend(v43, "isEqualToString:", CFSTR("super")))
      {
        if (objc_msgSend(v43, "isEqualToString:", CFSTR("top"))
          || objc_msgSend(v43, "isEqualToString:", CFSTR("middle"))
          || objc_msgSend(v43, "isEqualToString:", CFSTR("bottom"))
          || objc_msgSend(v43, "isEqualToString:", CFSTR("baseline"))
          || objc_msgSend(v43, "isEqualToString:", CFSTR("text-bottom"))
          || objc_msgSend(v43, "isEqualToString:", CFSTR("text-top")))
        {
          LODWORD(v47) = 0;
        }
        else
        {
          if (!+[PFSUtilities tokenRepresentsLength:](PFSUtilities, "tokenRepresentsLength:", v42))
            goto LABEL_61;
          +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", v42, v11);
          if (v47 == -65536.0)
            goto LABEL_61;
          *(float *)&v47 = v47;
        }
        objc_msgSend(a4, "setFloatValue:forProperty:", 33, v47);
        goto LABEL_61;
      }
      v44 = a4;
      v45 = 1;
LABEL_52:
      objc_msgSend(v44, "setIntValue:forProperty:", v45, 36);
    }
  }
LABEL_61:
  v48 = objc_msgSend(a3, "valueForProperty:", "text-shadow");
  if (v48)
  {
    v49 = v48;
    if (objc_msgSend(v48, "count"))
      objc_msgSend(a1, "mapTextShadowShorthand:to:parentFontSize:", v49, a4, v11);
  }
  v50 = objc_msgSend(a3, "valueForProperty:", "visibility");
  if (v50)
  {
    if (!strcmp((const char *)objc_msgSend(objc_msgSend(objc_msgSend(v50, "lastObject"), "value"), "UTF8String"), "hidden"))v51 = 0.0;
    else
      v51 = 1.0;
    v52 = objc_msgSend(a4, "objectForProperty:", 18);
    if (!v52)
      v52 = +[TSUColor blackColor](TSUColor, "blackColor");
    objc_msgSend(a4, "setObject:forProperty:", objc_msgSend(v52, "colorWithAlphaComponent:", v51), 18);
  }
  v53 = objc_msgSend(a3, "valueForProperty:", "text-transform");
  if (v53)
  {
    v54 = objc_msgSend(v53, "lastObject");
    if (objc_msgSend(v54, "type") == &stru_108)
    {
      v55 = objc_msgSend(v54, "value");
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("capitalize")) & 1) != 0)
      {
        v56 = 3;
        goto LABEL_79;
      }
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("small-caps")) & 1) != 0)
      {
        v56 = 2;
        goto LABEL_79;
      }
      if ((objc_msgSend(v55, "isEqualToString:", CFSTR("lowercase")) & 1) != 0)
      {
LABEL_78:
        v56 = 0;
        goto LABEL_79;
      }
      if (objc_msgSend(v55, "isEqualToString:", CFSTR("none")))
      {
        if (objc_msgSend(a4, "intValueForProperty:", 21) == 1)
          goto LABEL_78;
      }
      else if (objc_msgSend(v55, "isEqualToString:", CFSTR("uppercase")))
      {
        v56 = 1;
LABEL_79:
        objc_msgSend(a4, "setIntValue:forProperty:", v56, 21);
      }
    }
  }
  v57 = objc_msgSend(a3, "valueForProperty:", "background");
  if (v57)
  {
    v58 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v57);
    if (v58)
      objc_msgSend(a4, "setObject:forProperty:", v58, 37);
  }
  v59 = objc_msgSend(a3, "valueForProperty:", "font-variant");
  if (v59)
  {
    v60 = objc_msgSend(v59, "lastObject");
    if (objc_msgSend(v60, "type") == &stru_108)
    {
      v61 = objc_msgSend(v60, "value");
      if ((objc_msgSend(v61, "isEqualToString:", CFSTR("capitalize")) & 1) != 0)
      {
        v62 = 3;
        goto LABEL_96;
      }
      if ((objc_msgSend(v61, "isEqualToString:", CFSTR("small-caps")) & 1) != 0)
      {
        v62 = 2;
        goto LABEL_96;
      }
      if ((objc_msgSend(v61, "isEqualToString:", CFSTR("uppercase")) & 1) != 0)
      {
        v62 = 1;
        goto LABEL_96;
      }
      if (objc_msgSend(v61, "isEqualToString:", CFSTR("lowercase")))
      {
        v62 = 0;
LABEL_96:
        objc_msgSend(a4, "setIntValue:forProperty:", v62, 21);
      }
    }
  }
  v63 = objc_msgSend(a3, "valueForProperty:", "-webkit-text-fill-color");
  if (v63
    && objc_msgSend(objc_msgSend(objc_msgSend(v63, "lastObject"), "value"), "isEqualToString:", CFSTR("transparent")))
  {
    v64 = objc_msgSend(a3, "valueForProperty:", "-webkit-text-stroke");
    if (v64)
    {
      +[PFSUtilities htmlValueToPointLength:parentFontSize:](PFSUtilities, "htmlValueToPointLength:parentFontSize:", objc_msgSend(v64, "lastObject"), v11);
      if (v65 == -65536.0)
        v65 = 1.0;
      *(float *)&v65 = v65;
      objc_msgSend(a4, "setFloatValue:forProperty:", 31, v65);
    }
    v66 = objc_msgSend(a3, "valueForProperty:", "-webkit-text-stroke-color");
    if (v66)
    {
      v67 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v66, "lastObject"));
      if (v67)
        objc_msgSend(a4, "setObject:forProperty:", v67, 32);
    }
  }
  v68 = objc_msgSend(a5, "valueForAttribute:", "lang");
  if (v68)
  {
    v69 = +[PFSConstants languageForString:](PFSConstants, "languageForString:", v68);
    if (v69)
      objc_msgSend(a4, "setObject:forProperty:", v69, 39);
  }
  v70 = objc_msgSend(a5, "valueForAttribute:", "role");
  if (v70)
    objc_msgSend(a4, "setObject:forProperty:", v70, 47);
  return 1;
}

+ (void)mapHrefForStackEntry:(id)a3
{
  id v4;
  id v5;
  NSURL *v6;

  v4 = objc_msgSend(a3, "valueForAttribute:", "href");
  if (v4)
  {
    v5 = v4;
    v6 = +[NSURL URLWithString:](NSURL, "URLWithString:", v4);
    if (!-[NSURL scheme](v6, "scheme"))
      v6 = +[NSURL URLWithString:](NSURL, "URLWithString:", objc_msgSend(objc_msgSend(a3, "readerState"), "documentRelativeEntryForRelativeUri:", v5));
    objc_msgSend(a3, "setHref:", v6);
  }
}

+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4
{
  const xmlChar *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v7 = (const xmlChar *)objc_msgSend(a4, "xmlElementName");
  objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "parentFontSize");
  v9 = v8;
  if (xmlStrEqual(v7, (const xmlChar *)"abbr") || xmlStrEqual(v7, (const xmlChar *)"address"))
    goto LABEL_3;
  if (xmlStrEqual(v7, (const xmlChar *)"a"))
  {
    objc_msgSend(a1, "mapHrefForStackEntry:", a4);
    return;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"acronym"))
    goto LABEL_3;
  if (xmlStrEqual(v7, (const xmlChar *)"b"))
  {
LABEL_9:
    v10 = a3;
    v11 = 19;
    goto LABEL_4;
  }
  if (xmlStrEqual(v7, (const xmlChar *)"big"))
    goto LABEL_11;
  if (xmlStrEqual(v7, (const xmlChar *)"cite"))
    goto LABEL_3;
  if (xmlStrEqual(v7, (const xmlChar *)"code"))
  {
LABEL_15:
    objc_msgSend(a3, "setObject:forProperty:", CFSTR("Courier"), 16);
    LODWORD(v12) = 13.0;
    goto LABEL_12;
  }
  if (!xmlStrEqual(v7, (const xmlChar *)"dfn"))
  {
    if (xmlStrEqual(v7, (const xmlChar *)"em"))
      goto LABEL_3;
    if (xmlStrEqual(v7, (const xmlChar *)"font"))
    {
      +[PFXFont mapFontTagTo:stackEntry:](PFXFont, "mapFontTagTo:stackEntry:", a3, a4);
      return;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"i"))
      goto LABEL_3;
    if (xmlStrEqual(v7, (const xmlChar *)"kbd") || xmlStrEqual(v7, (const xmlChar *)"samp"))
      goto LABEL_15;
    if (xmlStrEqual(v7, (const xmlChar *)"small"))
    {
LABEL_11:
      v12 = v9 * 1.20000005;
      *(float *)&v12 = v9 * 1.20000005;
LABEL_12:
      objc_msgSend(a3, "setFloatValue:forProperty:", 17, v12);
      return;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"s")
      || xmlStrEqual(v7, (const xmlChar *)"strike")
      || xmlStrEqual(v7, (const xmlChar *)"del"))
    {
      v13 = a3;
      v14 = 1;
      v15 = 26;
LABEL_28:
      objc_msgSend(v13, "setIntValue:forProperty:", v14, v15);
      return;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"sub"))
    {
      v13 = a3;
      v14 = 2;
LABEL_33:
      v15 = 36;
      goto LABEL_28;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"sup"))
    {
      v13 = a3;
      v14 = 1;
      goto LABEL_33;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"strong"))
      goto LABEL_9;
    if (xmlStrEqual(v7, (const xmlChar *)"tt"))
      goto LABEL_15;
    if (xmlStrEqual(v7, (const xmlChar *)"u") || xmlStrEqual(v7, (const xmlChar *)"ins"))
    {
      v13 = a3;
      v14 = 1;
      v15 = 22;
      goto LABEL_28;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"var"))
    {
LABEL_3:
      v10 = a3;
      v11 = 20;
LABEL_4:
      objc_msgSend(v10, "setBoolValue:forProperty:", 1, v11);
    }
  }
}

@end
