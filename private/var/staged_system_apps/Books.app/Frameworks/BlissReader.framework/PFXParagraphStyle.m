@implementation PFXParagraphStyle

+ (BOOL)map:(id *)a3 stackEntry:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  *a3 = 0;
  v7 = objc_msgSend(objc_msgSend(a4, "htmlReaderState"), "currentHtmlDocMediaState");
  v8 = objc_msgSend(a4, "styleSelector");
  v9 = objc_msgSend(v7, "displayValueForStyleSelector:", v8);
  if (v9)
  {
    if (objc_msgSend(v9, "BOOLValue"))
    {
      *a3 = objc_msgSend(v7, "paragraphStyleForStyleSelector:", v8);
      objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "setWhitespace:", objc_msgSend(v7, "whitespaceValueForStyleSelector:", v8));
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    v11 = objc_alloc_init((Class)TSSPropertyMap);
    v10 = objc_msgSend(a1, "mapParagraphPropertiesFrom:to:", a4, v11);
    if ((_DWORD)v10)
    {
      v12 = objc_msgSend(v7, "defaultParagraphStyle");
      if (objc_msgSend(v11, "count"))
        v12 = objc_msgSend(objc_msgSend(v7, "stylesheet"), "variationOfStyle:propertyMap:", v12, v11);
      objc_msgSend(v7, "setWhitespaceValue:forStyleSelector:", objc_msgSend(objc_msgSend(a4, "currentEntryMediaState"), "whitespace"), v8);
      objc_msgSend(v7, "setParagraphStyle:forStyleSelector:", v12, v8);
      *a3 = v12;
    }
    objc_msgSend(v7, "setDisplayValue:forStyleSelector:", v10, v8);

  }
  return (char)v10;
}

+ (BOOL)mapParagraphPropertiesFrom:(id)a3 to:(id)a4
{
  PFSPropertySet *v7;
  int v8;
  id v9;
  id v10;

  v7 = (PFSPropertySet *)objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet");
  v8 = PFXHtmlStyleDisplayValue(v7);
  if (v8)
  {
    v9 = objc_alloc_init((Class)TSSPropertyMap);
    v10 = objc_msgSend(v9, "copy");
    objc_msgSend(a1, "mapElementPropertiesTo:stackEntry:", v9, a3);
    objc_msgSend(a1, "mapProperties:to:stackEntry:", v7, v10, a3);
    +[PFXCharacterStyle mapCharacterPropertiesFrom:to:](PFXCharacterStyle, "mapCharacterPropertiesFrom:to:", a3, v10);
    if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
    {
      objc_msgSend(a4, "addValuesFromPropertyMap:", v9);
      objc_msgSend(a4, "addValuesFromPropertyMap:", v10);
    }

  }
  return v8;
}

+ (void)populateDefaultParagraphProperties:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1E0204;
  v3[3] = &unk_427480;
  v3[4] = a3;
  objc_msgSend(+[TSWPParagraphStyle paragraphProperties](TSWPParagraphStyle, "paragraphProperties"), "enumeratePropertiesUsingBlock:", v3);
}

+ (void)mapLineSpacing:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8;
  id v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  id v17;
  id v18;
  section_64 *v19;
  id v20;
  void *v21;
  id v22;

  v8 = objc_msgSend(a3, "valueForProperty:", "line-height");
  if (v8)
  {
    v9 = objc_msgSend(v8, "objectAtIndex:", 0);
    v10 = (char *)objc_msgSend(v9, "type");
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    v12 = v11;
    +[PFSUtilities htmlValueToLineHeight:parentFontSize:](PFSUtilities, "htmlValueToLineHeight:parentFontSize:", v9);
    if (v13 >= 0.0)
    {
      v14 = v13;
      if ((unint64_t)(v10 - 278) > 0x12 || ((1 << (v10 - 22)) & 0x60003) == 0)
      {
        v17 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubLineSpacingMode[0]);
        if (v17
          && (v18 = objc_msgSend(v17, "objectAtIndex:", 0),
              v19 = (section_64 *)objc_msgSend(v18, "type"),
              v20 = objc_msgSend(objc_msgSend(v18, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), v19 == &stru_108))
        {
          v21 = v20;
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("min")) & 1) != 0)
          {
            v16 = 1;
          }
          else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("max")) & 1) != 0)
          {
            v16 = 3;
          }
          else
          {
            v16 = 2;
            if ((objc_msgSend(v21, "isEqualToString:", CFSTR("exact")) & 1) == 0)
            {
              if (objc_msgSend(v21, "isEqualToString:", CFSTR("between")))
                v16 = 4;
              else
                v16 = 2;
            }
          }
        }
        else
        {
          v16 = 2;
        }
      }
      else
      {
        v16 = 0;
        v14 = v13 / v12;
      }
      v22 = objc_msgSend(objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", v16, v14);
      objc_msgSend(a4, "setObject:forProperty:", v22, 85);

    }
  }
}

+ (void)mapPageBreakBefore:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v6;

  v6 = +[PFSUtilities identValueOrNilFromPair:](PFSUtilities, "identValueOrNilFromPair:", objc_msgSend(objc_msgSend(a3, "valueForProperty:", "page-break-before", a4, a5), "objectAtIndex:", 0));
  if (v6)
  {
    if (objc_msgSend(CFSTR("always"), "isEqualToString:", v6))
      objc_msgSend(a4, "setBoolValue:forProperty:", 1, 91);
  }
}

+ (void)mapFillColor:(id)a3 to:(id)a4
{
  id v6;
  id v7;

  v6 = objc_msgSend(a3, "valueForProperty:", "background-color");
  if (v6 || (v6 = objc_msgSend(a3, "valueForProperty:", "background")) != 0)
  {
    v7 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v6);
    if (v7)
      objc_msgSend(a4, "setObject:forProperty:", v7, 98);
  }
}

+ (void)mapBorders:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = 0;
  v7 = +[PFXBorderStyle mapStroke:paragraphBorderType:stackEntry:](PFXBorderStyle, "mapStroke:paragraphBorderType:stackEntry:", a3, &v26);
  if (v26)
  {
    v8 = v7;
    v9 = objc_msgSend(a5, "currentEntryMediaState");
    v10 = 0.0;
    v11 = v9;
    switch(v26)
    {
      case 1:
        objc_msgSend(v9, "paddingBefore");
        goto LABEL_6;
      case 2:
        objc_msgSend(v9, "paddingAfter");
LABEL_6:
        v13 = v12;
        break;
      case 3:
        objc_msgSend(v9, "paddingBefore");
        v15 = v14;
        objc_msgSend(v11, "paddingAfter");
        v13 = (v15 + v16) * 0.5;
        break;
      case 4:
        objc_msgSend(v9, "leftPadding");
        v18 = v17;
        objc_msgSend(v11, "rightPadding");
        v10 = (v18 + v19) * 0.5;
        objc_msgSend(v11, "paddingBefore");
        v21 = v20;
        objc_msgSend(v11, "paddingAfter");
        v13 = (v21 + v22) * 0.5;
        break;
      default:
        v13 = 0.0;
        break;
    }
    objc_msgSend(a4, "setObject:forProperty:", objc_msgSend(objc_alloc((Class)TSWPRuleOffset), "initWithDX:dY:", -v10, v13), 105);
    LODWORD(v23) = 1.0;
    objc_msgSend(a4, "setFloatValue:forProperty:", 104, v23);
    objc_msgSend(a4, "setIntValue:forProperty:", v26, 102);
    if (v8)
    {
      v24 = a4;
      v25 = v8;
    }
    else
    {
      v25 = +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
      v24 = a4;
    }
    objc_msgSend(v24, "setObject:forProperty:", v25, 103);
  }
}

+ (void)mapAlignString:(id)a3 to:(id)a4
{
  uint64_t v6;

  if ((objc_msgSend(CFSTR("left"), "isEqualToString:") & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(CFSTR("center"), "isEqualToString:", a3) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(CFSTR("right"), "isEqualToString:", a3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (!objc_msgSend(CFSTR("justify"), "isEqualToString:", a3))
      return;
    v6 = 3;
  }
  objc_msgSend(a4, "setIntValue:forProperty:", v6, 86);
}

+ (void)mapAlignment:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  section_64 *v8;
  id v9;

  v6 = objc_msgSend(a3, "valueForProperty:", "text-align");
  if (v6)
  {
    v7 = objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (section_64 *)objc_msgSend(v7, "type");
    v9 = objc_msgSend(objc_msgSend(v7, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    if (v8 == &stru_108)
      objc_msgSend(a1, "mapAlignString:to:", v9, a4);
  }
}

+ (void)mapHyphenateString:(id)a3 to:(id)a4
{
  uint64_t v6;

  if ((objc_msgSend(CFSTR("none"), "isEqualToString:") & 1) != 0)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(CFSTR("auto"), "isEqualToString:", a3) & 1) == 0)
  {
    if (!objc_msgSend(CFSTR("manual"), "isEqualToString:", a3))
      return;
    goto LABEL_5;
  }
  v6 = 1;
LABEL_6:
  objc_msgSend(a4, "setIntValue:forProperty:", v6, 93);
}

+ (void)mapHyphenate:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  section_64 *v8;
  id v9;

  v6 = objc_msgSend(a3, "valueForProperty:", "hyphens");
  if (v6)
  {
    v7 = objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (section_64 *)objc_msgSend(v7, "type");
    v9 = objc_msgSend(objc_msgSend(v7, "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    if (v8 == &stru_108)
      objc_msgSend(a1, "mapHyphenateString:to:", v9, a4);
  }
}

+ (void)mapTextIndent:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v8 = objc_msgSend(a5, "htmlReaderState");
  objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
  v10 = v9;
  objc_msgSend(v8, "pageContentWidth");
  v12 = v11;
  v13 = objc_msgSend(a3, "valueForProperty:", "text-indent");
  if (v13)
  {
    +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", objc_msgSend(v13, "objectAtIndex:", 0), v10, v12);
    v15 = v14;
  }
  else
  {
    v15 = -65536.0;
  }
  if (objc_msgSend(a4, "containsProperty:", 81))
  {
    objc_msgSend(a4, "floatValueForProperty:", 81);
    v17 = v16;
  }
  else
  {
    v17 = -65536.0;
  }
  if (v15 != -65536.0 || v17 != -65536.0)
  {
    v18 = 0.0;
    if (v17 == -65536.0)
      v17 = 0.0;
    v19 = -0.0;
    if (v15 != -65536.0)
      v19 = v15;
    v20 = v19 + v17;
    if (v20 >= 0.0)
    {
      v18 = v20;
    }
    else
    {
      v21 = v17 - v20;
      *(float *)&v21 = v21;
      objc_msgSend(a4, "setFloatValue:forProperty:", 81, v21);
    }
    *(float *)&v17 = v18;
    objc_msgSend(a4, "setFloatValue:forProperty:", 80, v17);
  }
}

+ (void)mapTabInterval:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7 = objc_msgSend(a3, "valueForProperty:", "tab-interval");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(a5, "htmlReaderState");
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    v11 = v10;
    objc_msgSend(v9, "pageContentWidth");
    +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", objc_msgSend(v8, "objectAtIndex:", 0), v11, v12);
    *(float *)&v13 = v13;
    objc_msgSend(a4, "setFloatValue:forProperty:", 83, v13);
  }
}

+ (void)mapTabStops:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PFSPair *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  section_64 *v23;
  id v24;
  double v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v8 = objc_msgSend(a3, "valueForProperty:", "tab-stops");
  if (v8)
  {
    v9 = v8;
    v29 = objc_alloc_init((Class)TSWPTabs);
    v10 = objc_msgSend(a5, "htmlReaderState");
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    v12 = v11;
    objc_msgSend(v10, "pageContentWidth");
    v14 = v13;
    v27 = a4;
    if (objc_msgSend(v9, "count") == (char *)&dword_0 + 1)
    {
      if (!qword_5436C0)
      {
        objc_sync_enter(a1);
        if (!qword_5436C0)
        {
          v15 = -[PFSPair initWithType:value:]([PFSPair alloc], "initWithType:value:", 264, CFSTR("none"));
          __dmb(0xBu);
          qword_5436C0 = (uint64_t)v15;
        }
        objc_sync_exit(a1);
      }
      v16 = objc_msgSend(v9, "lastObject", a4);
      if (objc_msgSend(v16, "isEqual:", qword_5436C0))
        v9 = 0;
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16, v27);
    if (v17)
    {
      v18 = 0;
      v19 = 0;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v23 = (section_64 *)objc_msgSend(v22, "type");
          if (v23 == &stru_108)
          {
            v24 = objc_msgSend(v22, "value");
            if ((objc_msgSend(v24, "isEqualToString:", CFSTR("left")) & 1) != 0)
            {
              v18 = 0;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("center")) & 1) != 0)
            {
              v18 = 1;
            }
            else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("right")) & 1) != 0)
            {
              v18 = 2;
            }
            else if (objc_msgSend(v24, "isEqualToString:", CFSTR("decimal")))
            {
              v18 = 3;
            }
            else
            {
              v18 = v18;
            }
          }
          else if (v23 == (section_64 *)((char *)&stru_B8.reserved3 + 3))
          {
            v19 = objc_msgSend(v22, "value");
          }
          else
          {
            +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", v22, v12, v14);
            if (v25 != -65536.0)
            {
              v26 = objc_msgSend(objc_alloc((Class)TSWPTab), "initWithPosition:alignment:leader:", v18, v19, v25);
              objc_msgSend(v29, "insertTab:", v26);

            }
          }
        }
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }
    objc_msgSend(v28, "setObject:forProperty:", v29, 84);

  }
}

+ (void)mapDropCap:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  id v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  TSWPDropCapSpacing *v19;

  v8 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubDropCap[0]);
  if (objc_msgSend(v8, "count") == (char *)&dword_0 + 3)
  {
    v9 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v10 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
    if (v9 >= 1)
    {
      v11 = v10;
      v12 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
      v13 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubDropCapBackground[0]);
      if (objc_msgSend(v13, "count") == (char *)&dword_0 + 1)
      {
        v14 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v13);
        if (v14)
          objc_msgSend(v12, "setObject:forProperty:", v14, 38);
      }
      v15 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubDropCapColor);
      if (objc_msgSend(v15, "count") == (char *)&dword_0 + 1)
      {
        v16 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", v15);
        if (v16)
          objc_msgSend(v12, "setObject:forProperty:", v16, 18);
      }
      +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(v8, "subarrayWithRange:", 2, 1), objc_msgSend(a5, "htmlReaderState"));
      v18 = v17;
      v19 = +[TSWPDropCapSpacing dropCapSpacingWithLineCount:elevatedLineCount:](TSWPDropCapSpacing, "dropCapSpacingWithLineCount:elevatedLineCount:", v11, 0);
      -[TSWPDropCapSpacing setPadding:](v19, "setPadding:", v18);
      objc_msgSend(a4, "setObject:forProperty:", +[TSWPDropCap dropCapWithCharCount:characterStyleOverridePropertyMap:spacing:](TSWPDropCap, "dropCapWithCharCount:characterStyleOverridePropertyMap:spacing:", v9, v12, v19), 109);
    }
  }
}

+ (void)mapProperties:(id)a3 to:(id)a4 stackEntry:(id)a5
{
  objc_msgSend(a1, "mapLineSpacing:to:stackEntry:");
  objc_msgSend(a1, "mapFillColor:to:", a3, a4);
  objc_msgSend(a1, "mapAlignment:to:", a3, a4);
  +[PFXMargins mapMarginsForEntry:to:inList:](PFXMargins, "mapMarginsForEntry:to:inList:", a5, a4, xmlStrEqual((const xmlChar *)"li", (const xmlChar *)objc_msgSend(a5, "xmlElementName")) != 0);
  objc_msgSend(a1, "mapBorders:to:stackEntry:", a3, a4, a5);
  objc_msgSend(a1, "mapTextIndent:to:stackEntry:", a3, a4, a5);
  objc_msgSend(a1, "mapTabInterval:to:stackEntry:", a3, a4, a5);
  objc_msgSend(a1, "mapTabStops:to:stackEntry:", a3, a4, a5);
  objc_msgSend(a1, "mapPageBreakBefore:to:stackEntry:", a3, a4, a5);
  objc_msgSend(a1, "mapHyphenate:to:", a3, a4);
  objc_msgSend(a1, "mapDropCap:to:stackEntry:", a3, a4, a5);
}

+ (void)mapElementPropertiesTo:(id)a3 stackEntry:(id)a4
{
  const xmlChar *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v7 = (const xmlChar *)objc_msgSend(a4, "xmlElementName");
  if (!xmlStrEqual(v7, (const xmlChar *)"blockquote"))
  {
    if (xmlStrEqual(v7, (const xmlChar *)"center"))
      goto LABEL_5;
    if (xmlStrEqual(v7, (const xmlChar *)"div")
      || xmlStrEqual(v7, (const xmlChar *)"dt")
      || xmlStrEqual(v7, (const xmlChar *)"dd"))
    {
      goto LABEL_16;
    }
    if (xmlStrEqual(v7, (const xmlChar *)"h1"))
    {
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      v18 = 8589936700.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h2"))
    {
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      LODWORD(v18) = 24.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h3"))
    {
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      LODWORD(v18) = 18.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h4"))
    {
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      LODWORD(v18) = 16.0;
    }
    else if (xmlStrEqual(v7, (const xmlChar *)"h5"))
    {
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      LODWORD(v18) = 12.0;
    }
    else
    {
      if (!xmlStrEqual(v7, (const xmlChar *)"h6"))
      {
        if (!xmlStrEqual(v7, (const xmlChar *)"li"))
        {
          if (!xmlStrEqual(v7, (const xmlChar *)"p") && !xmlStrEqual(v7, (const xmlChar *)"body"))
          {
            if (xmlStrEqual(v7, (const xmlChar *)"pre"))
            {
              objc_msgSend(a3, "setObject:forProperty:", CFSTR("Courier"), 16);
              LODWORD(v9) = 13.0;
              v10 = a3;
              v11 = 17;
              goto LABEL_3;
            }
            if (!xmlStrEqual(v7, (const xmlChar *)"th"))
              goto LABEL_6;
            objc_msgSend(a3, "setBoolValue:forProperty:", 1, 19);
LABEL_5:
            objc_msgSend(a3, "setIntValue:forProperty:", 2, 86);
            goto LABEL_6;
          }
          objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
          LODWORD(v20) = 16.0;
          objc_msgSend(a3, "setFloatValue:forProperty:", 87, v20);
          LODWORD(v9) = 16.0;
LABEL_17:
          v10 = a3;
          v11 = 88;
          goto LABEL_3;
        }
        objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
LABEL_16:
        LODWORD(v17) = 0;
        objc_msgSend(a3, "setFloatValue:forProperty:", 87, v17);
        LODWORD(v9) = 0;
        goto LABEL_17;
      }
      objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
      LODWORD(v18) = 10.0;
    }
    objc_msgSend(a3, "setFloatValue:forProperty:", 17, v18);
    objc_msgSend(a3, "setBoolValue:forProperty:", 1, 19);
    LODWORD(v19) = 20.0;
    objc_msgSend(a3, "setFloatValue:forProperty:", 87, v19);
    LODWORD(v9) = 20.0;
    goto LABEL_17;
  }
  objc_msgSend(a3, "setObject:forProperty:", CFSTR("Times-Roman"), 16);
  HIDWORD(v8) = 1076887552;
  *(float *)&v8 = 16.0;
  objc_msgSend(a3, "setFloatValue:forProperty:", 17, v8);
  v9 = 8589936700.0;
  v10 = a3;
  v11 = 81;
LABEL_3:
  objc_msgSend(v10, "setFloatValue:forProperty:", v11, v9);
LABEL_6:
  v12 = objc_msgSend(a4, "parentEntry");
  if (v12 && xmlStrEqual((const xmlChar *)objc_msgSend(v12, "xmlElementName"), (const xmlChar *)"table"))
  {
    LODWORD(v13) = 0;
    objc_msgSend(a3, "setFloatValue:forProperty:", 81, v13);
    LODWORD(v14) = 0;
    objc_msgSend(a3, "setFloatValue:forProperty:", 80, v14);
  }
  v15 = objc_msgSend(a4, "valueForAttribute:", "align");
  if (v15)
  {
    v16 = v15;
    if (+[PFXUtilities elementHasTextAlign:](PFXUtilities, "elementHasTextAlign:", objc_msgSend(a4, "xmlElementName")))
    {
      objc_msgSend(a1, "mapAlignString:to:", v16, a3);
    }
  }
}

@end
