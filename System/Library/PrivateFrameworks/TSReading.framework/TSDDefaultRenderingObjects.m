@implementation TSDDefaultRenderingObjects

+ (id)defaultColorFillsForTheme:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  if (a3)
  {
    v3 = (void *)objc_msgSend(a3, "presetsOfKind:", String);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v3, "count"))
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        if ((unint64_t)objc_msgSend(v4, "count") >= 7)
        {
          v6 = 6;
          do
            objc_msgSend(v5, "addObject:", +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend(v4, "objectAtIndex:", v6++)));
          while (v6 < objc_msgSend(v4, "count"));
        }
        if (v5)
          return v5;
      }
    }
  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDDefaultRenderingObjects defaultColorFillsForTheme:]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 57, CFSTR("Couldn't find color fills in theme; falling back on hardcoded grayscale swatches."));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.176470588, 0.235294118, 0.333333333, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.231372549, 0.349019608, 0.525490196, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:",
                 0.603921569,
                 0.71372549,
                 0.784313725,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.529, 0.359, 0.051, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.875, 0.502, 0.058, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.98, 0.801, 0.519,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.361, 0.101, 0.079, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.714, 0.171, 0.122, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.727, 0.441, 0.391,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.174, 0.257, 0.074, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.364, 0.467, 0.086, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.548, 0.696, 0.4,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.659, 0.195, 0.035, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.838, 0.256, 0.033, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 1.0, 0.685, 0.502,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.349019608, 0.180392157, 0.0980392157, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.447058824, 0.28627451, 0.203921569, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.780392157, 0.603921569, 0.509803922,
                 1.0),
               0);
}

+ (id)defaultGradientFillsForTheme:(id)a3
{
  void *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = (void *)objc_msgSend(a3, "presetsOfKind:", String);
  if (objc_msgSend(v3, "count"))
    return v3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDDefaultRenderingObjects defaultGradientFillsForTheme:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 94, CFSTR("Couldn't find gradients in theme; falling back on hardcoded gradient swatches."));
  v7 = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.580392157, 0.0549019608, 0.0980392157, 1.0);
  v8 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v7, objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.305882353, 0.0274509804, 0.0509803922, 1.0));
  v9 = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.133333333, 0.592156863, 0.062745098, 1.0);
  v10 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v9, objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0862745098, 0.329411765, 0.0470588235, 1.0));
  v11 = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0941176471, 0.368627451, 0.803921569, 1.0);
  v12 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v11, objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0509803922, 0.180392157, 0.450980392, 1.0));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v8, v10, v12, 0);
}

+ (id)defaultImageFillsForTheme:(id)a3
{
  return (id)objc_msgSend(a3, "presetsOfKind:", String);
}

+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "p_transposedArrayOfColorFills:", objc_msgSend(a1, "defaultColorFillsForTheme:")), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "defaultGrayscaleFillsWithNoFillButton:forTheme:", 0, a3));
}

+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3 withNoFillButton:(BOOL)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "p_transposedArrayOfColorFills:", objc_msgSend(a1, "defaultColorFillsForTheme:")), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "defaultGrayscaleFillsWithNoFillButton:forTheme:", a4, a3));
}

+ (id)defaultBasicStrokes
{
  uint64_t v2;
  TSDMutableStroke *v3;
  TSDMutableStroke *v4;
  TSDMutableStroke *v5;
  TSDMutableStroke *v6;
  TSDMutableStroke *v7;

  v2 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 5.0);
  -[TSDMutableStroke setPattern:](v3, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  v4 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 5.0);
  -[TSDMutableStroke setPattern:](v4, "setPattern:", +[TSDStrokePattern shortDashPattern](TSDStrokePattern, "shortDashPattern"));
  v5 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 5.0);
  -[TSDMutableStroke setPattern:](v5, "setPattern:", +[TSDStrokePattern mediumDashPattern](TSDStrokePattern, "mediumDashPattern"));
  v6 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 5.0);
  -[TSDMutableStroke setPattern:](v6, "setPattern:", +[TSDStrokePattern longDashPattern](TSDStrokePattern, "longDashPattern"));
  v7 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 5.0);
  -[TSDMutableStroke setCap:](v7, "setCap:", 1);
  -[TSDMutableStroke setJoin:](v7, "setJoin:", 1);
  -[TSDMutableStroke setPattern:](v7, "setPattern:", +[TSDStrokePattern roundDashPattern](TSDStrokePattern, "roundDashPattern"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v4, v5, v6, v7, 0);
}

+ (id)defaultStrokes
{
  id v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  v2 = +[TSDDefaultRenderingObjects defaultBasicStrokes](TSDDefaultRenderingObjects, "defaultBasicStrokes");
  v3 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v5[0] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Chalk2"), v3, 10.0);
  v5[1] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Feathered Brush"), v3, 10.0);
  v5[2] = +[TSDStroke strokeWithColor:width:](TSDCalligraphyStroke, "strokeWithColor:width:", v3, 5.0);
  v5[3] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Dry Brush"), v3, 10.0);
  v5[4] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Pen"), v3, 10.0);
  return (id)objc_msgSend(v2, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 5));
}

+ (id)defaultPresetStrokesForShapes
{
  uint64_t v2;
  TSDMutableStroke *v3;
  TSDMutableStroke *v4;
  TSDMutableStroke *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 1.0);
  -[TSDMutableStroke setPattern:](v3, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  v4 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 2.0);
  -[TSDMutableStroke setPattern:](v4, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  v5 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 4.0);
  -[TSDMutableStroke setPattern:](v5, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v5;
  v7[3] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Dry Brush"), v2, 6.0);
  v7[4] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Chalk2"), v2, 6.0);
  v7[5] = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Pen"), v2, 6.0);
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6);
}

+ (id)defaultPresetImageStrokesForTheme:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDMutableStroke *v7;
  TSDMutableStroke *v8;
  TSDMutableStroke *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  TSDFrame *v19;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v7 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v6, 1.0);
  -[TSDMutableStroke setPattern:](v7, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  objc_msgSend(v5, "addObject:", v7);
  v8 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v6, 2.0);
  -[TSDMutableStroke setPattern:](v8, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  objc_msgSend(v5, "addObject:", v8);
  v9 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v6, 4.0);
  -[TSDMutableStroke setPattern:](v9, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  objc_msgSend(v5, "addObject:", v9);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a3)
  {
    v11 = (void *)objc_msgSend(a3, "presetsOfKind:", String);
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "count"))
      {
        if (objc_msgSend(v12, "count"))
        {
          v13 = 0;
          do
          {
            if ((unint64_t)objc_msgSend(v10, "count") > 2)
              break;
            v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v13), "boxedValueForProperty:", 517);
            if (objc_msgSend(v14, "isFrame"))
            {
              objc_opt_class();
              v15 = (void *)TSUDynamicCast();
              if ((objc_msgSend(v10, "containsObject:", objc_msgSend(v15, "frameName")) & 1) == 0)
              {
                objc_msgSend(v5, "addObject:", v14);
                objc_msgSend(v10, "addObject:", objc_msgSend(v15, "frameName"));
              }
            }
            ++v13;
          }
          while (v13 < objc_msgSend(v12, "count"));
        }
      }
    }
  }
  if ((unint64_t)objc_msgSend(v10, "count") <= 2)
  {
    v16 = (void *)objc_msgSend(a1, "p_frameInspectorDictionary");
    if (v16)
    {
      v17 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("Display Order"));
      if ((unint64_t)objc_msgSend(v10, "count") <= 2)
      {
        v18 = 0;
        do
        {
          if (v18 >= objc_msgSend(v17, "count"))
            break;
          v19 = -[TSDFrame initWithFrameSpec:]([TSDFrame alloc], "initWithFrameSpec:", +[TSDFrameSpec frameSpecWithName:](TSDFrameSpec, "frameSpecWithName:", objc_msgSend(v17, "objectAtIndexedSubscript:", v18)));
          if ((objc_msgSend(v10, "containsObject:", -[TSDFrame frameName](v19, "frameName")) & 1) == 0)
          {
            objc_msgSend(v5, "addObject:", v19);
            objc_msgSend(v10, "addObject:", -[TSDFrame frameName](v19, "frameName"));
          }

          ++v18;
        }
        while ((unint64_t)objc_msgSend(v10, "count") < 3);
      }
    }
  }
  return v5;
}

+ (id)defaultLines
{
  uint64_t v2;
  TSDMutableStroke *v3;
  id v4;
  TSDBrushStroke *v5;
  id v6;
  TSDMutableStroke *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(MEMORY[0x24BEB3C40], "blackColor");
  v3 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 2.0);
  -[TSDMutableStroke setPattern:](v3, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
  v4 = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v3, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none](TSDLineEnd, "none"));
  v5 = +[TSDSmartStroke strokeWithName:color:width:](TSDBrushStroke, "strokeWithName:color:width:", CFSTR("Chalk2"), v2, 6.0);
  v6 = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v5, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none](TSDLineEnd, "none"));
  v7 = +[TSDStroke strokeWithColor:width:](TSDMutableStroke, "strokeWithColor:width:", v2, 3.0);
  -[TSDMutableStroke setPattern:](v7, "setPattern:", +[TSDStrokePattern mediumDashPattern](TSDStrokePattern, "mediumDashPattern"));
  v9[0] = v4;
  v9[1] = v6;
  v9[2] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v7, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none](TSDLineEnd, "none"));
  v9[3] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v3, +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"), +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"));
  v9[4] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v5, +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"), +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  v9[5] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v7, +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle"), +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 6);
}

+ (id)defaultEndpoints
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x24BDAC8D0];
  v3[1] = +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow", +[TSDLineEnd none](TSDLineEnd, "none"));
  v3[2] = +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle");
  v3[3] = +[TSDLineEnd filledDiamond](TSDLineEnd, "filledDiamond");
  v3[4] = +[TSDLineEnd openArrow](TSDLineEnd, "openArrow");
  v3[5] = +[TSDLineEnd filledArrow](TSDLineEnd, "filledArrow");
  v3[6] = +[TSDLineEnd filledSquare](TSDLineEnd, "filledSquare");
  v3[7] = +[TSDLineEnd openSquare](TSDLineEnd, "openSquare");
  v3[8] = +[TSDLineEnd openCircle](TSDLineEnd, "openCircle");
  v3[9] = +[TSDLineEnd invertedArrow](TSDLineEnd, "invertedArrow");
  v3[10] = +[TSDLineEnd line](TSDLineEnd, "line");
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 11);
}

+ (id)defaultFrames
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TSDFrame *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_msgSend(a1, "p_frameInspectorDictionary");
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("Display Order"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = -[TSDFrame initWithFrameSpec:]([TSDFrame alloc], "initWithFrameSpec:", +[TSDFrameSpec frameSpecWithName:](TSDFrameSpec, "frameSpecWithName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)));
          objc_msgSend(v3, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
}

+ (id)defaultShadowsForTheme:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v9;
  TSDShadowSwatch *v10;
  TSDShadowSwatch *v11;
  TSDShadowSwatch *v12;
  TSDShadowSwatch *v13;
  TSDShadowSwatch *v14;
  TSDShadowSwatch *v15;
  uint64_t v16;
  TSDShadowSwatch *v17;
  TSDShadowSwatch *v18;

  if (a3)
  {
    v3 = (void *)objc_msgSend(a3, "presetsOfKind:", String);
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(v3, "count"))
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        if (objc_msgSend(v4, "count"))
        {
          v6 = 0;
          do
          {
            v7 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v6);
            if (objc_msgSend(v7, "isEnabled"))
            {
              if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
                objc_msgSend(v5, "addObject:", -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", v7));
            }
            ++v6;
          }
          while (v6 < objc_msgSend(v4, "count"));
        }
        if (v5)
          return v5;
      }
    }
  }
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.0, 1.0), "CGColor");
  v10 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", v9, 1, 312.0, 0.0, 5.0, 0.5));
  v11 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", v9, 1, 312.0, 3.0, 5.0, 0.5));
  v12 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", v9, 1, 312.0, 6.0, 8.0, 0.5));
  v13 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", v9, 1, 312.0, 6.0, 8.0, 0.5));
  v14 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow curvedShadowWithOffset:angle:radius:curve:opacity:color:enabled:](TSDShadow, "curvedShadowWithOffset:angle:radius:curve:opacity:color:enabled:", v9, 1, 0.66577, 90.0, 15.0, -0.123095, 1.0));
  v15 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow curvedShadowWithOffset:angle:radius:curve:opacity:color:enabled:](TSDShadow, "curvedShadowWithOffset:angle:radius:curve:opacity:color:enabled:", v9, 1, 1.0, 90.0, 10.0, 0.164879, 0.75));
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor");
  v17 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow contactShadowWithAngle:offset:radius:height:opacity:color:enabled:](TSDShadow, "contactShadowWithAngle:offset:radius:height:opacity:color:enabled:", v16, 1, 0.0, 0.0, 28.0, 0.17365, 0.75));
  v18 = -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", +[TSDShadow contactShadowWithAngle:offset:radius:height:opacity:color:enabled:](TSDShadow, "contactShadowWithAngle:offset:radius:height:opacity:color:enabled:", v16, 1, 0.0, 9.41875, 30.0, 0.25, 0.75));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v10, v11, v12, v13, v14, v15, v17, v18, 0);
}

+ (id)defaultGrayscaleTextColorsForTheme:(id)a3
{
  return (id)objc_msgSend(a1, "defaultGrayscaleFillsWithNoFillButton:forTheme:", 0, a3);
}

+ (id)defaultGrayscaleFillsWithNoFillButton:(BOOL)a3 forTheme:(id)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (!a4)
    goto LABEL_9;
  v5 = (void *)objc_msgSend(a4, "presetsOfKind:", String);
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_9;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  for (i = 0; i != 6; ++i)
  {
    v9 = (void *)objc_msgSend(v6, "objectAtIndex:", i);
    objc_msgSend(v9, "alphaComponent");
    if (v10 != 0.0)
      objc_msgSend(v7, "addObject:", +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", v9));
  }
  if (!v7)
  {
LABEL_9:
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDDefaultRenderingObjects defaultGrayscaleFillsWithNoFillButton:forTheme:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 378, CFSTR("Couldn't find grayscale fills in theme; falling back on hardcoded grayscale swatches."));
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", +[TSDColorFill whiteColor](TSDColorFill, "whiteColor"), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.8, 1.0), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.4, 1.0), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.2, 1.0), +[TSDColorFill blackColor](TSDColorFill, "blackColor"), 0);
  }
  if (v4)
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"));
  return v7;
}

+ (double)defaultAssetScaleForFrame:(id)a3
{
  void *v3;
  float v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "p_frameInspectorDictionary"), "objectForKey:", CFSTR("Asset Scales")), "objectForKey:", objc_msgSend(a3, "frameName"));
  if (!v3)
    return 1.0;
  objc_msgSend(v3, "floatValue");
  return v4;
}

+ (id)p_frameInspectorDictionary
{
  if (p_frameInspectorDictionary_sOnce != -1)
    dispatch_once(&p_frameInspectorDictionary_sOnce, &__block_literal_global_51);
  return (id)p_frameInspectorDictionary_sFrameInspectorDictionary;
}

id __56__TSDDefaultRenderingObjects_p_frameInspectorDictionary__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", objc_msgSend((id)TSDBundle(), "pathForResource:ofType:inDirectory:", CFSTR("FrameInspectorLayoutInfo"), CFSTR("plist"), CFSTR("Frames")), 2, 0);
  if (result)
  {
    result = (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", result, 0, 0, 0);
    p_frameInspectorDictionary_sFrameInspectorDictionary = (uint64_t)result;
  }
  return result;
}

+ (id)p_transposedArrayOfColorFills:(id)a3
{
  unint64_t v4;
  id v5;
  unint64_t i;

  v4 = objc_msgSend(a3, "count");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
      objc_msgSend(v5, "addObject:", objc_msgSend(a3, "objectAtIndex:", i / (v4 >> 2) + 4 * (i % (v4 >> 2))));
  }
  return v5;
}

@end
