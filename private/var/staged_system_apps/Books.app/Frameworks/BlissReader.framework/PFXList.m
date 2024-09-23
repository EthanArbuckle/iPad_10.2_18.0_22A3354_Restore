@implementation PFXList

- (void)mapCurrentBreakStateForOrientation:(id)a3
{
  objc_msgSend(a3, "setCurrentBreakStateSameAsParent");
}

- (int64_t)mapStartIndexWithStackEntry:(id)a3
{
  PFSPair *v5;
  id v6;
  id v7;
  id v8;
  int64_t result;

  if (!qword_543738)
  {
    objc_sync_enter(self);
    if (!qword_543738)
    {
      v5 = -[PFSPair initWithType:value:]([PFSPair alloc], "initWithType:value:", 264, CFSTR("item"));
      __dmb(0xBu);
      qword_543738 = (uint64_t)v5;
    }
    objc_sync_exit(self);
  }
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "propertySet"), "valueForProperty:", "counter-reset");
  if (objc_msgSend(v6, "count") != (char *)&dword_0 + 2)
    return 0;
  v7 = objc_msgSend(v6, "objectAtIndex:", 0);
  if (!objc_msgSend(v7, "isEqual:", qword_543738))
    return 0;
  v8 = +[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", objc_msgSend(v6, "objectAtIndex:", 1));
  result = (int64_t)objc_msgSend(v8, "length");
  if (result)
    return (int64_t)objc_msgSend(v8, "integerValue");
  return result;
}

+ (id)listTypeFromCssListStyleType:(id)a3
{
  id v4;

  v4 = (id)qword_543740;
  if (!qword_543740)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), CFSTR("decimal"));
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 9), CFSTR("upper-alpha"));
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 12), CFSTR("lower-alpha"));
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3), CFSTR("upper-roman"));
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 6), CFSTR("lower-roman"));
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0), CFSTR("decimal-leading-zero"));
    qword_543740 = (uint64_t)v4;
  }
  return objc_msgSend(v4, "objectForKey:", a3);
}

+ (id)bulletGeometryListType:(int)a3 bullet:(id)a4 entryOrientationState:(id)a5 propertySet:(id)a6
{
  double v9;
  double v10;
  id v11;
  float v12;
  double v13;
  id v14;
  void *v15;
  double v16;
  float v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  double v30;
  id v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  uint64_t v36;
  double v37;
  id v38;
  double v39;

  objc_msgSend(a5, "fontSize", *(_QWORD *)&a3, a4);
  v10 = v9;
  v11 = objc_msgSend(a5, "characterStyle");
  if (objc_msgSend(v11, "definesProperty:", 33))
  {
    objc_msgSend(v11, "floatValueForProperty:", 33);
    v13 = v12;
  }
  else
  {
    v14 = objc_msgSend(a6, "valueForProperty:", PFXPropNmApplePubBulletBaseline[0]);
    v13 = 0.0;
    if (v14)
    {
      v15 = v14;
      if (objc_msgSend(v14, "count"))
      {
        +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", objc_msgSend(v15, "objectAtIndex:", 0), 0.0);
        if (v16 != -65536.0)
          v13 = v16;
      }
    }
  }
  if ((objc_msgSend(v11, "definesProperty:", 17) & 1) != 0)
  {
    objc_msgSend(v11, "floatValueForProperty:", 17);
    v18 = v17;
    if (v10 == v18)
      v19 = 1.0;
    else
      v19 = v18 / v10;
    if (a3 != 1)
      return objc_msgSend(objc_alloc((Class)TSWPListLabelGeometry), "initWithScale:scaleWithText:baselineOffset:", 0, v19, v13);
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    v19 = 1.0;
LABEL_15:
    v20 = objc_opt_class(NSArray);
    *(_QWORD *)&v21 = TSUDynamicCast(v20, objc_msgSend(a6, "valueForProperty:", PFXPropNmApplePubBulletScale[0])).n128_u64[0];
    v23 = v22;
    v24 = 1.0;
    if (objc_msgSend(v22, "count", v21) == (char *)&dword_0 + 1)
    {
      v25 = objc_opt_class(PFSPair);
      *(_QWORD *)&v27 = TSUDynamicCast(v25, objc_msgSend(v23, "objectAtIndex:", 0)).n128_u64[0];
      if (v26)
      {
        v28 = v26;
        if (objc_msgSend(v26, "type", v27) == &stru_108.addr)
        {
          v29 = objc_opt_class(NSString);
          *(_QWORD *)&v30 = TSUDynamicCast(v29, objc_msgSend(v28, "value")).n128_u64[0];
          objc_msgSend(v31, "doubleValue", v30);
          v24 = v32;
        }
        else if (objc_msgSend(v28, "type") == &stru_108.segname[15])
        {
          v36 = objc_opt_class(NSString);
          *(_QWORD *)&v37 = TSUDynamicCast(v36, objc_msgSend(v28, "value")).n128_u64[0];
          objc_msgSend(v38, "doubleValue", v37);
          v24 = v39 / 100.0;
        }
      }
    }
    if (v24 != 0.0)
      v19 = v24;
    return objc_msgSend(objc_alloc((Class)TSWPListLabelGeometry), "initWithScale:scaleWithText:baselineOffset:", 0, v19, v13);
  }
  v33 = objc_msgSend(a6, "valueForProperty:", "font-size");
  if (v33 && (v34 = v33, objc_msgSend(v33, "count")))
  {
    +[PFSUtilities fontPointSizeFromHtmlStr:parentSize:](PFSUtilities, "fontPointSizeFromHtmlStr:parentSize:", objc_msgSend(v34, "objectAtIndex:", 0), v10);
    if (v35 == -65536.0)
      v35 = v10;
  }
  else
  {
    v35 = v10;
  }
  if (v35 == v10)
    v19 = 1.0;
  else
    v19 = v35 / v10;
  return objc_msgSend(objc_alloc((Class)TSWPListLabelGeometry), "initWithScale:scaleWithText:baselineOffset:", 0, v19, v13);
}

+ (void)mapNonListStyleWithOrientationState:(id)a3 readerState:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;

  v7 = objc_msgSend(a3, "stylesheet");
  v8 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "defaultNoneListStyle");
  objc_msgSend(a1, "textIndentWithOrientationState:", a3);
  if (v9 != 0.0)
  {
    v10 = v9;
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", objc_msgSend(v8, "valueForProperty:", 176));
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 0, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
    v11 = objc_alloc_init((Class)TSSPropertyMap);
    objc_msgSend(v11, "setObject:forProperty:", v12, 176);
    objc_msgSend(a3, "setListStyle:", objc_msgSend(v7, "variationOfStyle:propertyMap:", v8, v11));

  }
}

+ (id)newBulletListPropertyNames:(id)a3
{
  PFSPropertySet *v4;
  uint64_t i;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];

  v9[0] = PFXPropNmApplePubBulletFontFamily[0];
  v9[1] = PFXPropNmApplePubBulletColor[0];
  v9[2] = PFXPropNmApplePubBulletFontVariant[0];
  v9[3] = PFXPropNmApplePubBulletFontSize[0];
  v9[4] = PFXPropNmApplePubBulletFontWeight[0];
  v9[5] = PFXPropNmApplePubBulletFontStyle[0];
  v8[0] = "font-family";
  v8[1] = "color";
  v8[2] = "font-variant";
  v8[3] = "font-size";
  v8[4] = "font-weight";
  v8[5] = "font-style";
  v4 = objc_alloc_init(PFSPropertySet);
  for (i = 0; i != 3; ++i)
  {
    v6 = objc_msgSend(a3, "valueForProperty:", v9[i]);
    if (v6)
      -[PFSPropertySet addPropertyValue:forProperty:](v4, "addPropertyValue:forProperty:", v6, v8[i]);
  }
  return v4;
}

+ (void)mapBulletWithOrientationState:(id)a3 readerState:(id)a4
{
  id v7;
  id v8;
  unsigned __int8 v9;
  NSNull *v10;
  id v11;
  void *v12;
  id v13;
  NSNull *v14;
  NSNull *v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  char v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;

  v7 = objc_msgSend(a3, "propertySet");
  v8 = objc_msgSend(a4, "currentHtmlDocMediaState");
  v9 = objc_msgSend(v8, "orderedList");
  v10 = +[NSNull null](NSNull, "null");
  v47 = v8;
  v48 = v7;
  if ((v9 & 1) != 0)
  {
    v11 = objc_msgSend(v7, "valueForProperty:", "list-style-type");
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "count"))
      {
        v13 = objc_msgSend(v12, "objectAtIndex:", 0);
        if (objc_msgSend(v13, "type") == &stru_108)
        {
          v14 = (NSNull *)objc_msgSend(a1, "listTypeFromCssListStyleType:", objc_msgSend(v13, "value"));
          if (v14)
          {
            v15 = v14;
            v16 = a1;
            v17 = objc_msgSend(objc_msgSend(v7, "valueForProperty:", PFXPropNmApplePubListNumericFormat[0]), "lastObject");
            if (objc_msgSend(v17, "type") == &stru_108)
            {
              v18 = objc_msgSend(v17, "value");
              if (objc_msgSend(v18, "isEqual:", PFXPropValApplePubDoubleParen))
              {
                v19 = (char *)-[NSNull integerValue](v15, "integerValue") + 1;
LABEL_28:
                v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19);
                v42 = 0;
                v23 = 3;
LABEL_30:
                a1 = v16;
                goto LABEL_19;
              }
              if (objc_msgSend(v18, "isEqual:", PFXPropValApplePubRightParen))
              {
                v19 = (char *)-[NSNull integerValue](v15, "integerValue") + 2;
                goto LABEL_28;
              }
            }
            v42 = 0;
            v23 = 3;
            v10 = v15;
            goto LABEL_30;
          }
        }
      }
    }
    goto LABEL_18;
  }
  v20 = objc_msgSend(v7, "valueForProperty:", PFXPropNmApplePubCustomBullet[0]);
  if (v20 && (v21 = v20, objc_msgSend(v20, "count")))
  {
    v22 = objc_msgSend(v21, "objectAtIndex:", 0);
    if ((char *)objc_msgSend(v22, "type") - 263 <= (_BYTE *)&dword_0 + 1)
      v10 = (NSNull *)objc_msgSend(v22, "value");
    v42 = 0;
    v23 = 2;
  }
  else
  {
    v24 = objc_msgSend(v7, "valueForProperty:", "list-style-image");
    if (!v24
      || (v25 = v24, !objc_msgSend(v24, "count"))
      || (v26 = objc_msgSend(v25, "objectAtIndex:", 0), objc_msgSend(v26, "type") != (char *)&stru_108.addr + 1))
    {
LABEL_18:
      v42 = 0;
      v23 = 0;
      goto LABEL_19;
    }
    v10 = (NSNull *)objc_msgSend(a4, "imageDataForUri:", objc_msgSend(objc_msgSend(v26, "value"), "stringWithURLFromCssUriValue"));
    v42 = 1;
    v23 = 1;
  }
LABEL_19:
  v45 = objc_msgSend(a3, "stylesheet");
  v46 = a4;
  v27 = objc_msgSend(objc_msgSend(a4, "currentHtmlDocMediaState"), "defaultNoneListStyle");
  v43 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", objc_msgSend(v27, "valueForProperty:", 177));
  v44 = v27;
  v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", objc_msgSend(v27, "valueForProperty:", 176));
  v29 = objc_alloc_init((Class)NSMutableArray);
  v49 = objc_alloc_init((Class)NSMutableArray);
  v30 = a1;
  v31 = a3;
  v32 = objc_msgSend(a1, "bulletGeometryListType:bullet:entryOrientationState:propertySet:", v23, v10, a3, v48);
  v33 = +[NSMutableArray array](NSMutableArray, "array");
  v34 = 9;
  do
  {
    objc_msgSend(v49, "addObject:", v10);
    objc_msgSend(v29, "addObject:", v32);
    objc_msgSend(v33, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23));
    --v34;
  }
  while (v34);
  v35 = objc_alloc_init((Class)TSSPropertyMap);
  objc_msgSend(v35, "setObject:forProperty:", v33, 180);
  objc_msgSend(v30, "labelIndentWithState:", v46);
  v37 = v36;
  v38 = v31;
  objc_msgSend(v30, "textIndentWithOrientationState:", v31);
  v40 = v39;
  if ((v42 & 1) == 0)
  {
    v41 = objc_msgSend(v30, "newBulletListPropertyNames:", v48);
    v38 = v31;
    +[PFXFont mapFontProperties:to:stackEntry:](PFXFont, "mapFontProperties:to:stackEntry:", v41, v35, objc_msgSend(v46, "currentHtmlStackEntry"));

  }
  objc_msgSend(v43, "replaceObjectAtIndex:withObject:", objc_msgSend(v47, "listLevel"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v37));
  objc_msgSend(v28, "replaceObjectAtIndex:withObject:", objc_msgSend(v47, "listLevel"), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
  objc_msgSend(v35, "setObject:forProperty:", v43, 177);
  objc_msgSend(v35, "setObject:forProperty:", v28, 176);
  objc_msgSend(v35, "setObject:forProperty:", v29, 181);
  if ((v23 - 1) <= 2)
    objc_msgSend(v35, "setObject:forProperty:", v49, (v23 + 181));
  objc_msgSend(v38, "setListStyle:", objc_msgSend(v45, "variationOfStyle:propertyMap:", v44, v35));

}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  int64_t v8;
  id v9;

  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v7 = objc_msgSend(v5, "currentEntryMediaState");
  v8 = -[PFXList mapStartIndexWithStackEntry:](self, "mapStartIndexWithStackEntry:", v5);
  -[PFXList mapCurrentBreakStateForOrientation:](self, "mapCurrentBreakStateForOrientation:", v7);
  objc_msgSend(v6, "setListStart:", v8);
  objc_msgSend(v6, "startListOrdered:", xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"ol") != 0);
  if (objc_msgSend(v6, "hasHints"))
  {
    if ((objc_msgSend(a3, "inTable") & 1) == 0)
    {
      v9 = objc_msgSend(a3, "totalTextRead");
      if (v9 == objc_msgSend(v6, "nextHintLocation") && !objc_msgSend(v6, "nextHintShapeRef"))
      {
        objc_msgSend(objc_msgSend(a3, "hintCollectorForStorage:", objc_msgSend(v7, "storage")), "addLineBreakHintWithPresentationId:", CFSTR("p"));
        objc_msgSend(v6, "popHint");
      }
    }
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  objc_msgSend(v4, "stopList");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  objc_msgSend(v6, "setParentBreakStateSameAsCurrent");
  objc_msgSend(v6, "setListStyle:", 0);
}

+ (double)labelIndentWithState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;

  v4 = objc_msgSend(a3, "currentHtmlStackEntry");
  v5 = objc_msgSend(v4, "parentEntry");
  v6 = objc_msgSend(v4, "currentEntryMediaState");
  v7 = objc_msgSend(a3, "currentHtmlDocMediaState");
  objc_msgSend(v6, "parentFontSize");
  v9 = v8;
  objc_msgSend(v6, "blockWidth");
  v18 = -65536.0;
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", objc_msgSend(objc_msgSend(v5, "currentEntryMediaState", 0xC0F0000000000000, 0xC0F0000000000000, 0xC0F0000000000000), "propertySet"), +[PFXMargins paddingPropertyNames](PFXMargins, "paddingPropertyNames"), &v18, &v17, &v15, &v16, v9, v10);
  v11 = v18;
  if (v18 == -65536.0)
    v11 = 0.0;
  v18 = v11;
  if ((uint64_t)objc_msgSend(v7, "listLevel") <= 0)
  {
    v13 = v18;
  }
  else
  {
    objc_msgSend(v7, "listIndentForLevel:", (char *)objc_msgSend(v7, "listLevel") - 1);
    v13 = v12 + v18;
    v18 = v12 + v18;
  }
  objc_msgSend(v7, "setListIndent:forLevel:", objc_msgSend(v7, "listLevel"), v13);
  return v18;
}

+ (double)textIndentWithOrientationState:(id)a3
{
  id v4;
  id v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v14;

  v4 = objc_msgSend(a3, "propertySet");
  v5 = objc_msgSend(v4, "valueForProperty:", PFXPropNmApplePubListTextIndent[0]);
  v6 = 0.0;
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(v5, "count"))
    {
      v8 = objc_msgSend(v7, "objectAtIndex:", 0);
      v14 = 0;
      objc_msgSend(a3, "fontSize");
      +[PFSUtilities htmlValueToPointLength:parentFontSize:isPercent:](PFSUtilities, "htmlValueToPointLength:parentFontSize:isPercent:", v8, &v14);
      v10 = v9;
      if (v14)
      {
        objc_msgSend(a3, "blockWidth");
        v10 = v10 * v11;
      }
      objc_msgSend(a3, "fontSize");
      return v10 / v12;
    }
  }
  return v6;
}

+ (id)bulletColorFromPropertySet:(id)a3
{
  id v3;
  id result;

  v3 = objc_msgSend(a3, "valueForProperty:", "color");
  result = objc_msgSend(v3, "count");
  if (result)
    return +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v3, "objectAtIndex:", 0));
  return result;
}

@end
