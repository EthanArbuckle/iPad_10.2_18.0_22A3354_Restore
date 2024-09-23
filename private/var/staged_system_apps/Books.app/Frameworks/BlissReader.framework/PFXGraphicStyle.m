@implementation PFXGraphicStyle

+ (id)frameSpecWithUri:(id)a3 contentState:(id)a4
{
  id v5;
  id v6;
  PFXFrameSpec *v7;
  id v8;
  void *v9;

  v5 = +[PFXCommon absolutePathWithUrl:relativeToFile:](PFXCommon, "absolutePathWithUrl:relativeToFile:", objc_msgSend(a3, "stringByRemovingPercentEncoding"), objc_msgSend(a4, "entryURI"));
  v6 = objc_msgSend(v5, "lastPathComponent");
  v7 = (PFXFrameSpec *)objc_msgSend(a4, "frameSpecForName:", v6);
  if (v7)
    return v7;
  v8 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v5));
  if (v8)
  {
    v9 = v8;
    v7 = -[PFXFrameSpec initWithBundle:basePath:readerState:isVolatile:]([PFXFrameSpec alloc], "initWithBundle:basePath:readerState:isVolatile:", v8, v5, a4, 1);

    if (v7)
    {
      objc_msgSend(a4, "cacheFrameSpec:", v7);

      return v7;
    }
  }
  return +[TSDFrameSpec frameSpecWithName:](TSDFrameSpec, "frameSpecWithName:", v6);
}

+ (id)mapStrokeFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v7;
  id v8;
  double v9;
  id result;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  TSDStrokePattern *v27;
  id v28;
  void *v29;
  id v30;
  void *i;
  double v32;
  double v33[6];

  v7 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubStroke[0]);
  if (objc_msgSend(v7, "count") == (char *)&dword_0 + 3
    && objc_msgSend(+[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v7, "objectAtIndex:", 0)), "isEqualToString:", CFSTR("frame")))
  {
    v8 = +[PFXStyleUtilities stringInPair:](PFXStyleUtilities, "stringInPair:", objc_msgSend(v7, "objectAtIndex:", 1));
    objc_msgSend(+[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", objc_msgSend(v7, "objectAtIndex:", 2)), "doubleValue");
    return objc_msgSend(objc_alloc((Class)TSDFrame), "initWithFrameSpec:assetScale:", objc_msgSend(a1, "frameSpecWithUri:contentState:", v8, a4), v9);
  }
  v11 = objc_msgSend(a3, "valueForProperty:", "stroke");
  if (objc_msgSend(v11, "count") != (char *)&dword_0 + 1)
    return +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
  v12 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v11, "objectAtIndex:", 0));
  if (!v12)
    return +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
  v13 = objc_msgSend(a3, "valueForProperty:", "stroke-width");
  if (v13)
  {
    +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", v13, a4);
    v15 = v14;
  }
  else
  {
    v15 = 1.0;
  }
  if (objc_msgSend(v7, "count") != (char *)&dword_0 + 2
    || !objc_msgSend(+[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v7, "objectAtIndex:", 0)), "isEqualToString:", CFSTR("smart")))
  {
    v18 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "valueForProperty:", "stroke-linecap"), "lastObject"), "value");
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("round")) & 1) != 0)
    {
      v19 = 1;
    }
    else if (objc_msgSend(v18, "isEqualToString:", CFSTR("square")))
    {
      v19 = 2;
    }
    else
    {
      v19 = 0;
    }
    v20 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "valueForProperty:", "stroke-linejoin"), "lastObject"), "value");
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("round")) & 1) != 0)
    {
      v21 = 1;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("bevel")))
    {
      v21 = 2;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "valueForProperty:", "stroke-miterlimit"), "lastObject"), "value"), "doubleValue");
    v23 = v22;
    v24 = objc_msgSend(a3, "valueForProperty:", "stroke-dashoffset");
    if (v24)
    {
      +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", v24, a4);
      v26 = v25 / v15;
    }
    else
    {
      v26 = 0.0;
    }
    v27 = (TSDStrokePattern *)+[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
    v28 = objc_msgSend(a3, "valueForProperty:", "stroke-dasharray");
    v29 = v28;
    if (!v28)
      return objc_msgSend(objc_alloc((Class)TSDStroke), "initWithColor:width:cap:join:pattern:miterLimit:", v12, v19, v21, v27, v15, v23);
    if ((unint64_t)objc_msgSend(v28, "count") <= 6)
    {
      v30 = objc_msgSend(v29, "count");
      if (!v30)
      {
LABEL_35:
        v27 = +[TSDStrokePattern strokePatternWithPattern:count:phase:](TSDStrokePattern, "strokePatternWithPattern:count:phase:", v33, v30, v26);
        return objc_msgSend(objc_alloc((Class)TSDStroke), "initWithColor:width:cap:join:pattern:miterLimit:", v12, v19, v21, v27, v15, v23);
      }
    }
    else
    {
      v30 = &dword_4 + 2;
    }
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      objc_msgSend(objc_msgSend(objc_msgSend(v29, "objectAtIndex:", i), "value"), "doubleValue");
      v33[(_QWORD)i] = v32 / v15;
    }
    goto LABEL_35;
  }
  v16 = +[PFXStyleUtilities stringInPair:](PFXStyleUtilities, "stringInPair:", objc_msgSend(v7, "objectAtIndex:", 1));
  v17 = +[TSDSmartStroke classForName:](TSDSmartStroke, "classForName:", v16);
  if (objc_msgSend(v17, "isEqual:", objc_opt_class(TSDStroke)))
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unsupported smart stroke"));
  result = objc_msgSend(v17, "strokeWithName:color:width:", v16, v12, v15);
  if (!result)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Unable to load smart stroke"));
    return 0;
  }
  return result;
}

+ (id)mapCssStroke:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = objc_msgSend(a4, "valueForProperty:", a3);
  if (!objc_msgSend(v6, "count"))
    return +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
  if (objc_msgSend(v6, "count") == (char *)&dword_0 + 1)
  {
    v7 = objc_msgSend(v6, "objectAtIndex:", 0);
    if (objc_msgSend(v7, "type") == &stru_108)
      objc_msgSend(objc_msgSend(v7, "value"), "isEqual:", CFSTR("none"));
    return +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
  }
  if (objc_msgSend(v6, "count") != (char *)&dword_0 + 3)
    return +[TSDStroke emptyStroke](TSDStroke, "emptyStroke");
  +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v6, "objectAtIndex:", 0), a5);
  v9 = v8;
  v10 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v6, "objectAtIndex:", 2));
  v11 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 1), "value");
  v12 = +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("solid")))
  {
    v13 = +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
LABEL_13:
    v12 = v13;
    return +[TSDStroke strokeWithColor:width:cap:join:pattern:](TSDStroke, "strokeWithColor:width:cap:join:pattern:", v10, 0, 0, v12, v9);
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("dotted")))
  {
    v13 = +[TSDStrokePattern roundDashPattern](TSDStrokePattern, "roundDashPattern");
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("dashed")))
  {
    v13 = +[TSDStrokePattern mediumDashPattern](TSDStrokePattern, "mediumDashPattern");
    goto LABEL_13;
  }
  return +[TSDStroke strokeWithColor:width:cap:join:pattern:](TSDStroke, "strokeWithColor:width:cap:join:pattern:", v10, 0, 0, v12, v9);
}

+ (id)mapShadowFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v9;
  long double v10;
  double v11;
  long double v12;
  double v13;
  double v14;
  id v15;
  long double v16;

  v5 = objc_msgSend(a3, "valueForProperty:", "box-shadow");
  if (!v5)
    return +[TSDShadow defaultDisabledShadow](TSDShadow, "defaultDisabledShadow");
  v6 = v5;
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 1)
  {
    v7 = objc_msgSend(v6, "objectAtIndex:", 0);
    if (objc_msgSend(v7, "type") == &stru_108
      && objc_msgSend(objc_msgSend(v7, "value"), "isEqual:", CFSTR("none")))
    {
      return +[TSDShadow defaultDisabledShadow](TSDShadow, "defaultDisabledShadow");
    }
  }
  else if (objc_msgSend(v6, "count") == &dword_4)
  {
    +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(v6, "subarrayWithRange:", 0, 1), a4);
    v10 = v9;
    +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(v6, "subarrayWithRange:", 1, 1), a4);
    v12 = v11;
    +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(v6, "subarrayWithRange:", 2, 1), a4);
    v14 = v13;
    v15 = +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", objc_msgSend(v6, "subarrayWithRange:", 3, 1));
    v16 = atan2(v12, v10) * 180.0 / 3.14159265;
    return +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(v15, "CGColor"), 1, (double)v16, (double)hypot(v10, v12), v14, 1.0);
  }
  return 0;
}

+ (id)mapFillFromStyleProperties:(id)a3 contentState:(id)a4
{
  unsigned int v6;
  char **v7;
  id v8;
  id v9;
  section_64 *v10;
  id v11;
  id result;
  id v13;

  v6 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "asset"), "isEpub");
  v7 = PFXPropNmBackground;
  if (!v6)
    v7 = PFXPropNmFill;
  v8 = objc_msgSend(a3, "valueForProperty:", *v7);
  if (objc_msgSend(v8, "count") != (char *)&dword_0 + 1)
  {
    if (objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "asset"), "isEpub"))
      v8 = objc_msgSend(a3, "valueForProperty:", "-ibooks-popover-background");
  }
  if (objc_msgSend(v8, "count") != (char *)&dword_0 + 1)
    return 0;
  v9 = objc_msgSend(v8, "objectAtIndex:", 0);
  v10 = (section_64 *)objc_msgSend(v9, "type");
  v11 = objc_msgSend(v9, "value");
  if ((uint64_t)v10 <= 296)
  {
    if (v10 == &stru_108)
    {
      if (objc_msgSend(v11, "isEqual:", CFSTR("none")))
        return +[NSNull null](NSNull, "null");
    }
    else if (v10 != (section_64 *)&stru_108.sectname[1])
    {
      return 0;
    }
LABEL_16:
    v13 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", v9);
    if (v13)
      return +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", v13);
    return 0;
  }
  if (v10 == (section_64 *)((char *)&stru_108.addr + 1))
  {
    result = objc_msgSend(objc_msgSend(a4, "svgDefinitionCache"), "objectForKey:", objc_msgSend(v11, "substringWithRange:", 5, (char *)objc_msgSend(v11, "length") - 6));
    if (result)
      return result;
    return 0;
  }
  if (v10 == (section_64 *)((char *)&stru_108.addr + 2))
    goto LABEL_16;
  return 0;
}

+ (id)readGradientStopsFromArray:(id)a3 startIndex:(unint64_t)a4 contentState:(id)a5
{
  unint64_t v7;
  NSMutableArray *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  double v14;
  id v15;

  v7 = (unint64_t)objc_msgSend(a3, "count") - a4;
  v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v7 >> 1);
  if (v7 >= 2)
  {
    v9 = a4 + 1;
    if (v7 >> 1 <= 1)
      v10 = 1;
    else
      v10 = v7 >> 1;
    do
    {
      v11 = objc_msgSend(a3, "objectAtIndex:", v9);
      if (objc_msgSend(v11, "type") == (char *)&stru_108.addr + 2)
      {
        v12 = objc_msgSend(v11, "value");
        if (objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "isEqual:", CFSTR("color-stop(")))
        {
          v13 = objc_msgSend(v12, "objectAtIndex:", 1);
          objc_msgSend(objc_msgSend(objc_msgSend(v13, "objectAtIndex:", 0), "value"), "doubleValue");
          v15 = objc_msgSend(objc_alloc((Class)TSDGradientStop), "initWithColor:fraction:", +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", objc_msgSend(v13, "objectAtIndex:", 2)), v14);
          -[NSMutableArray addObject:](v8, "addObject:", v15);

        }
      }
      v9 += 2;
      --v10;
    }
    while (v10);
  }
  return v8;
}

+ (id)newImageFillWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 contentState:(id)a6
{
  id v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;

  v8 = objc_msgSend(objc_alloc((Class)TSDMutableImageFill), "initWithImageData:technique:tintColor:size:originalImageData:", a3, *(_QWORD *)&a4, a5, 0, CGSizeZero.width, CGSizeZero.height);
  objc_msgSend(a6, "applePubVersion");
  if (v9 >= 1.00999999 && objc_msgSend(a3, "typeConformsToImage"))
  {
    v10 = objc_msgSend(objc_alloc((Class)TSDBitmapImageProvider), "initWithImageData:", a3);
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "imageDPI");
      if ((unint64_t)v12 >= 0x49)
      {
        v13 = 72.0 / (double)(unint64_t)v12;
        objc_msgSend(v11, "naturalSize");
        objc_msgSend(v8, "setFillSize:", ceil(v13 * v14), ceil(v13 * v15));
      }
    }

  }
  return v8;
}

+ (id)mapCssBackgroundFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  PFSPair *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __double2 v48;

  v7 = objc_msgSend(a3, "valueForProperty:", "background-color");
  v8 = objc_msgSend(a3, "valueForProperty:", "background-image");
  v9 = objc_msgSend(a3, "valueForProperty:", "background-size");
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0 && objc_msgSend(v7, "count") == (char *)&dword_0 + 1)
  {
    v11 = objc_msgSend(v7, "objectAtIndex:", 0);
    v12 = objc_opt_class(PFSPair);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", v11);
      if (v13)
        return +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", v13);
      if (objc_msgSend(v11, "type") == &stru_108
        && objc_msgSend(objc_msgSend(v11, "value"), "isEqual:", CFSTR("none")))
      {
        return +[NSNull null](NSNull, "null");
      }
    }
  }
  v14 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) == 0 || objc_msgSend(v8, "count") != (char *)&dword_0 + 1)
    return +[NSNull null](NSNull, "null");
  v15 = objc_msgSend(v8, "objectAtIndex:", 0);
  v16 = (char *)objc_msgSend(v15, "type");
  v17 = objc_msgSend(v15, "value");
  v18 = v17;
  if (v16 == (_BYTE *)&stru_108.addr + 1)
  {
    v30 = objc_msgSend(a4, "imageDataForUri:", objc_msgSend(v17, "stringWithURLFromCssUriValue"));
    if (objc_msgSend(v9, "count") == (char *)&dword_0 + 2)
    {
      if (!qword_5436A0)
      {
        objc_sync_enter(a1);
        if (!qword_5436A0)
        {
          v31 = -[PFSPair initWithType:value:]([PFSPair alloc], "initWithType:value:", 295, CFSTR("100"));
          __dmb(0xBu);
          qword_5436A0 = (uint64_t)v31;
        }
        objc_sync_exit(a1);
      }
      v32 = objc_msgSend(v9, "objectAtIndex:", 0);
      if (objc_msgSend(v32, "isEqual:", qword_5436A0))
      {
        v33 = objc_msgSend(v9, "objectAtIndex:", 1);
        if (objc_msgSend(v33, "isEqual:", qword_5436A0))
          v34 = 1;
        else
          v34 = 2;
        return objc_msgSend(a1, "newImageFillWithImageData:technique:tintColor:contentState:", v30, v34, 0, a4);
      }
    }
    else if (objc_msgSend(v9, "count") == (char *)&dword_0 + 1)
    {
      v35 = objc_msgSend(v9, "objectAtIndex:", 0);
      if (objc_msgSend(v35, "type") == &stru_108)
      {
        v36 = objc_msgSend(v35, "value");
        if ((objc_msgSend(v36, "isEqual:", CFSTR("cover")) & 1) != 0)
        {
          v34 = 3;
        }
        else if ((objc_msgSend(v36, "isEqual:", CFSTR("contain")) & 1) != 0)
        {
          v34 = 4;
        }
        else if (objc_msgSend(v36, "isEqual:", CFSTR("auto")))
        {
          v34 = 0;
        }
        else
        {
          v34 = 2;
        }
        return objc_msgSend(a1, "newImageFillWithImageData:technique:tintColor:contentState:", v30, v34, 0, a4);
      }
    }
    v34 = 2;
    return objc_msgSend(a1, "newImageFillWithImageData:technique:tintColor:contentState:", v30, v34, 0, a4);
  }
  if (v16 == (_BYTE *)&stru_108.addr + 2)
  {
    if (objc_msgSend(objc_msgSend(v17, "objectAtIndex:", 0), "isEqualToString:", CFSTR("-webkit-gradient(")))
    {
      v19 = objc_msgSend(v18, "objectAtIndex:", 1);
      if (objc_msgSend(v19, "count"))
      {
        v20 = objc_msgSend(v19, "objectAtIndex:", 0);
        v21 = objc_opt_class(PFSPair);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
        {
          if (objc_msgSend(objc_msgSend(v20, "value"), "isEqual:", CFSTR("linear")))
          {
            v22 = +[TSDMutableAngleGradient linearGradientWithGradientStops:](TSDMutableAngleGradient, "linearGradientWithGradientStops:", objc_msgSend(a1, "readGradientStopsFromArray:startIndex:contentState:", v19, 7, a4));
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 2));
            v24 = v23;
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 3));
            v26 = v25;
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 5));
            v28 = v27;
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 6));
            objc_msgSend(v22, "setGradientAngle:", (double)-atan2(v29 - v26, v28 - v24));
            return v22;
          }
          if (objc_msgSend(objc_msgSend(v20, "value"), "isEqual:", CFSTR("radial")))
          {
            v22 = +[TSDMutableTransformGradient radialGradientWithGradientStops:](TSDMutableTransformGradient, "radialGradientWithGradientStops:", objc_msgSend(a1, "readGradientStopsFromArray:startIndex:contentState:", v19, 11, a4));
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 2));
            v38 = v37;
            +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", objc_msgSend(v19, "objectAtIndex:", 3));
            v40 = v39;
            +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v19, "objectAtIndex:", 10), a4);
            v42 = v41;
            +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v9, "objectAtIndex:", 0), a4);
            v44 = v43;
            +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", objc_msgSend(v9, "objectAtIndex:", 1), a4);
            v46 = v45;
            objc_msgSend(v22, "setBaseNaturalSize:", v44, v45);
            v47 = atan(v46 / v44);
            objc_msgSend(v22, "setStartPoint:", v38 * v44, v40 * v46);
            v48 = __sincos_stret(v47);
            objc_msgSend(v22, "setEndPoint:", v42 * v48.__cosval + v38 * v44, v42 * v48.__sinval + v40 * v46);
            return v22;
          }
        }
      }
    }
  }
  return +[NSNull null](NSNull, "null");
}

+ (id)mapMarkerProperty:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = objc_msgSend(a4, "valueForProperty:", a3);
  if (objc_msgSend(v6, "count") != (char *)&dword_0 + 1)
    return 0;
  v7 = objc_msgSend(v6, "objectAtIndex:", 0);
  if (objc_msgSend(v7, "type") != (char *)&stru_108.addr + 1)
    return 0;
  v8 = objc_msgSend(v7, "value");
  return objc_msgSend(objc_msgSend(a5, "svgDefinitionCache"), "objectForKey:", objc_msgSend(v8, "substringWithRange:", 5, (char *)objc_msgSend(v8, "length") - 6));
}

+ (id)mapReflectionFromStyleProperties:(id)a3
{
  id v3;
  id v4;
  double v5;

  v3 = objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubReflectionOpacity[0]);
  if (v3
    && (v4 = objc_msgSend(v3, "objectAtIndex:", 0), objc_msgSend(v4, "type") == &stru_108.addr)
    && (objc_msgSend(objc_msgSend(v4, "value"), "doubleValue"), v5 > 0.0))
  {
    return objc_msgSend(objc_alloc((Class)TSDReflection), "initWithOpacity:", v5);
  }
  else
  {
    return 0;
  }
}

+ (id)mapOpacityFromStyleProperties:(id)a3
{
  id v3;
  id v4;

  v3 = objc_msgSend(a3, "valueForProperty:", "opacity");
  if (v3 && (v4 = objc_msgSend(v3, "objectAtIndex:", 0), objc_msgSend(v4, "type") == &stru_108.addr))
    return objc_msgSend(v4, "value");
  else
    return 0;
}

@end
