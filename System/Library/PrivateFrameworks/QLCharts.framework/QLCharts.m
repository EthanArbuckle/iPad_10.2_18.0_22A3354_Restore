_QWORD *_OILabelRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  ++*a2;
  return result;
}

void _OILabelRelease(uint64_t a1, _QWORD *a2)
{
  OILabelRelease(a2);
}

double *OILabelCreate(const void *a1, double a2, double a3, double a4, double a5)
{
  const __CFAllocator *Default;
  double *v11;

  if (!a1)
    return 0;
  Default = CFAllocatorGetDefault();
  v11 = (double *)CFAllocatorAllocate(Default, 96, 0);
  *(_QWORD *)v11 = 1;
  *((_QWORD *)v11 + 1) = CFRetain(a1);
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  v11[6] = 10.0;
  v11[7] = 0.0;
  v11[8] = 0.0;
  v11[9] = 1.0;
  *((_QWORD *)v11 + 10) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((_BYTE *)v11 + 88) = 0;
  return v11;
}

_QWORD *OILabelRetain(_QWORD *result)
{
  ++*result;
  return result;
}

void OILabelRelease(_QWORD *a1)
{
  const void *v3;
  CGColor *v4;
  CGColor *v5;
  CGColor *v6;
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[1];
      if (v3)
        CFRelease(v3);
      v4 = (CGColor *)a1[7];
      if (v4)
        CGColorRelease(v4);
      v5 = (CGColor *)a1[8];
      if (v5)
        CGColorRelease(v5);
      v6 = (CGColor *)a1[10];
      if (v6)
        CGColorRelease(v6);
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

double *OILabelCreateFromDictionary(const __CFDictionary *a1)
{
  const void *Value;
  const __CFDictionary *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  const __CFNumber *v9;
  CGColor *v10;
  const __CFNumber *v11;
  CGColor *v12;
  CGColor *v13;
  uint64_t v15;
  uint64_t valuePtr;
  __int128 v17;
  __int128 v18;

  if (!a1)
    return 0;
  Value = CFDictionaryGetValue(a1, CFSTR("kOIChartLabelKey"));
  v17 = 0u;
  v18 = 0u;
  v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("kOIChartTitleAreaKey"));
  if (v3)
  {
    OIRectMakeWithDictionaryRepresentation(v3, (uint64_t)&v17);
    v5 = *((double *)&v17 + 1);
    v4 = *(double *)&v17;
    v7 = *((double *)&v18 + 1);
    v6 = *(double *)&v18;
  }
  else
  {
    v7 = 0.0;
    v6 = 0.0;
    v5 = 0.0;
    v4 = 0.0;
  }
  v8 = OILabelCreate(Value, v4, v5, v6, v7);
  if (v8)
  {
    valuePtr = 0;
    v9 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartHasShadowKey"));
    if (v9)
    {
      CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
      *((_BYTE *)v8 + 88) = valuePtr != 0;
    }
    v10 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartStrokeColorKey"));
    if (v10)
      OILabelSetStrokeColor((uint64_t)v8, v10);
    v15 = 0;
    v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartStrokeWidthKey"));
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberCGFloatType, &v15);
      *((_QWORD *)v8 + 9) = v15;
    }
    v12 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartFillColorKey"));
    if (v12)
      OILabelSetFillColor((uint64_t)v8, v12);
    v13 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartTextColorKey"));
    if (v13)
      OILabelSetTextColor((uint64_t)v8, v13);
  }
  return v8;
}

uint64_t OILabelSetHasShadow(uint64_t result, char a2)
{
  *(_BYTE *)(result + 88) = a2;
  return result;
}

CGColor *OILabelSetStrokeColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 64);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 64) = result;
  }
  return result;
}

uint64_t OILabelSetStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 72) = a2;
  return result;
}

CGColor *OILabelSetFillColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 56);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 56) = result;
  }
  return result;
}

CGColor *OILabelSetTextColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 80);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 80) = result;
  }
  return result;
}

CFTypeRef OILabelSetString(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 8);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 8) = result;
  }
  return result;
}

uint64_t OILabelGetString(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

double *OILabelSetFrame(double *result, double a2, double a3, double a4, double a5)
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

double OILabelGetFrame(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t OILabelSetFontSize(uint64_t result, double a2)
{
  *(double *)(result + 48) = a2;
  return result;
}

double OILabelGetFontSize(uint64_t a1)
{
  return *(double *)(a1 + 48);
}

uint64_t OILabelGetFillColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t OILabelGetStrokeColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

double OILabelGetStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

uint64_t OILabelGetTextColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t OILabelHasShadow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 88);
}

uint64_t OILabelSetAlignment(uint64_t result, int a2)
{
  *(_DWORD *)(result + 92) = a2;
  return result;
}

uint64_t OILabelGetAlignment(uint64_t a1)
{
  return *(unsigned int *)(a1 + 92);
}

void OIChartSetupRendererMapping(uint64_t a1)
{
  const __CFAllocator *String;
  const CFDictionaryKeyCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;

  String = (const __CFAllocator *)OILabelGetString(a1);
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  Mutable = CFDictionaryCreateMutable(String, 0, MEMORY[0x24BDBD6A0], &DummyValueCallbacks);
  v5 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  v6 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  v7 = CFDictionaryCreateMutable(String, 0, v3, &DummyValueCallbacks);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartColumnType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartColumnType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartColumnType"), OIRenderColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartStackedColumnType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartStackedColumnType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartStackedColumnType"), OIRenderStackedColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartStackedColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartPercentStackedColumnType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartPercentStackedColumnType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartPercentStackedColumnType"), OIRenderPercentStackedColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartPercentStackedColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartBarType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartBarType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartBarType"), OIRenderBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartBarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartStackedBarType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartStackedBarType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartStackedBarType"), OIRenderStackedBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartStackedBarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartPercentStackedBarType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartPercentStackedBarType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartPercentStackedBarType"), OIRenderPercentStackedBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartStackedBarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartLineType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartLineType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartLineType"), OIRenderLinesInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartLineType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartStackedLineType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartStackedLineType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartStackedLineType"), OIRenderStackedLinesInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartStackedLineType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartPercentStackedLineType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartPercentStackedLineType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartPercentStackedLineType"), OIRenderPercentStackedLinesInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartPercentStackedLineType"), OIRenderLegendInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartPieType"), OIRenderPieInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartPieType"), OIRenderLegendInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DPieType"), OIRender3DPieInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DPieType"), OIRenderLegendInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartDoughnutType"), OIRenderDoughnutInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartDoughnutType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartXYType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartXYType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartXYType"), OIRenderXYInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartXYType"), OIRenderXYLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartRadarType"), OIRenderRadarAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartRadarType"), OIRenderRadarAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartRadarType"), OIRenderRadarInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartRadarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartBubbleType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartBubbleType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartBubbleType"), OIRenderBubblesInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChartBubbleType"), OIRenderBubbleLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChartStockType"), OIRenderOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChartStockType"), OIRenderOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChartStockType"), OIRenderStocksInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DColumnType"), OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DColumnType"), OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DColumnType"), OIRender3DColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DLayeredColumnType"), OIRender3DLayeredOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DLayeredColumnType"), OIRender3DLayeredOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DLayeredColumnType"), OIRender3DLayeredColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DLayeredColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DStackedColumnType"), OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DStackedColumnType"), OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DStackedColumnType"), OIRender3DStackedColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DStackedColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DPercentStackedColumnType"), OIRender3DOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DPercentStackedColumnType"), OIRender3DOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DPercentStackedColumnType"), OIRender3DPercentStackedColumnsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DPercentStackedColumnType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DBarType"), OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DBarType"), OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DBarType"), OIRender3DBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DBarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DStackedBarType"), OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DStackedBarType"), OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DStackedBarType"), OIRender3DStackedBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DStackedBarType"), OIRenderLegendInChart);
  CFDictionarySetValue(Mutable, CFSTR("kOIChart3DPercentStackedBarType"), OIRender3DFlippedOrthoAxisBackgroundInChart);
  CFDictionarySetValue(v5, CFSTR("kOIChart3DPercentStackedBarType"), OIRender3DFlippedOrthoAxisForegroundInChart);
  CFDictionarySetValue(v6, CFSTR("kOIChart3DPercentStackedBarType"), OIRender3DPercentStackedBarsInChart);
  CFDictionarySetValue(v7, CFSTR("kOIChart3DPercentStackedBarType"), OIRenderLegendInChart);
  OIChartSetBackgroundAxisRendererMapping(a1, Mutable);
  OIChartSetForegroundAxisRendererMapping(a1, v5);
  OIChartSetChartRendererMapping(a1, v6);
  OIChartSetLegendRendererMapping(a1, v7);
  CFRelease(Mutable);
  CFRelease(v5);
  CFRelease(v6);
  CFRelease(v7);
}

void _OIRenderLinesInChart(uint64_t a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  CGContext *Type;
  double PlotArea;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int v12;
  CFIndex v13;
  const void *ValueAtIndex;
  uint64_t TextColor;
  const __CFArray *Values;
  uint64_t Labels;
  uint64_t String;
  uint64_t v19;
  int v20;
  double Scale;
  double v22;
  double v23;
  double v24;
  const CGPath *Mutable;
  const CGPath *v26;
  double MarkerWidth;
  CFIndex v28;
  CFIndex v29;
  CFIndex v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  const __CFNumber *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t PlotFillColor;
  CFIndex v47;
  CGPath *MutableCopy;
  double BaseValueAtIndex;
  double v50;
  double v51;
  double v52;
  double v53;
  CGColor *MarkerColor;
  CGContextRef c;
  const __CFArray *v56;
  CFIndex Count;
  CGColor *StrokeColor;
  CFIndex v59;
  double v60;
  _QWORD *v61;
  double v62;
  _BYTE *v63;
  double v64;
  double v65;
  double valuePtr[2];
  CGSize v67;
  CGRect v68;
  CGRect v69;

  if (theArray)
  {
    v2 = theArray;
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v12 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v65 = v7;
      v68.origin.x = PlotArea;
      v68.origin.y = v7;
      v68.size.width = v9;
      v68.size.height = v11;
      CGContextClipToRect(Type, v68);
      if (v12)
      {
        v67.width = 2.0;
        v67.height = -2.0;
        CGContextSetShadow(Type, v67, 3.0);
      }
      v61 = OILabelCollectionCreate();
      v63 = OIErrorBarRendererCreate(1);
      if (Count >= 1)
      {
        v13 = 0;
        c = Type;
        v56 = v2;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, v13);
          TextColor = OILabelGetTextColor((uint64_t)ValueAtIndex);
          StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          String = OILabelGetString((uint64_t)ValueAtIndex);
          v19 = OIAxisGetType((uint64_t)ValueAtIndex);
          v20 = OIAxisAreLabelsCentered(String);
          Scale = OIAxisGetScale(String);
          v64 = OIAxisGetScale(v19);
          v22 = Scale * 0.5;
          v23 = floor(Scale * 0.5);
          v24 = v20 ? v23 : 0.0;
          Mutable = CGPathCreateMutable();
          v59 = v13;
          if (Labels)
          {
            v26 = CGPathCreateMutable();
            MarkerWidth = OISeriesGetMarkerWidth((uint64_t)ValueAtIndex);
          }
          else
          {
            v26 = 0;
            MarkerWidth = 0.0;
          }
          v28 = CFArrayGetCount(Values);
          if (v28 >= 1)
            break;
          v47 = -1;
LABEL_29:
          OISeriesSetupStrokeAndFillForContext((uint64_t)ValueAtIndex, Type);
          if (TextColor)
          {
            MutableCopy = CGPathCreateMutableCopy(Mutable);
            BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)ValueAtIndex, v47);
            v50 = PlotArea + OIAxisConvertValueToLocal(String, BaseValueAtIndex);
            v51 = OIAxisConvertValueToLocal(v19, 0.0);
            CGPathAddLineToPoint(MutableCopy, 0, floor(v24 + v50) + 0.5, floor(v65 + v51) + 0.5);
            v52 = PlotArea + OIAxisConvertValueToLocal(String, 0.0);
            v53 = OIAxisConvertValueToLocal(v19, 0.0);
            CGPathAddLineToPoint(MutableCopy, 0, floor(v24 + v52) + 0.5, floor(v65 + v53) + 0.5);
            CGContextAddPath(Type, MutableCopy);
            CGContextFillPath(Type);
            CGPathRelease(MutableCopy);
          }
          if (StrokeColor)
          {
            CGContextAddPath(Type, Mutable);
            CGContextSetStrokeColorWithColor(Type, StrokeColor);
            CGContextStrokePath(Type);
          }
          v2 = v56;
          if (Labels)
          {
            MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
            CGContextSetFillColorWithColor(Type, MarkerColor);
            CGContextAddPath(Type, v26);
            CGContextFillPath(Type);
          }
          if (v26)
            CGPathRelease(v26);
          if (Mutable)
            CGPathRelease(Mutable);
          v13 = v59 + 1;
          if (v59 + 1 == Count)
            goto LABEL_40;
        }
        v29 = v28;
        v30 = 0;
        v31 = MarkerWidth * 0.5;
        v32 = ceil(MarkerWidth);
        v33 = Scale / 3.0;
        v60 = v22 * 0.5;
        v62 = Scale / 3.0 * 0.5;
        v34 = ceil(v22);
        v35 = ceil(v33);
        while (1)
        {
          v36 = OISeriesGetBaseValueAtIndex((uint64_t)ValueAtIndex, v30);
          valuePtr[0] = 0.0;
          v37 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v30);
          CFNumberGetValue(v37, kCFNumberCGFloatType, valuePtr);
          v38 = PlotArea + OIAxisConvertValueToLocal(String, v36);
          v39 = v65 + OIAxisConvertValueToLocal(v19, valuePtr[0]);
          v40 = v24 + v38;
          v41 = floor(v40) + 0.5;
          v42 = floor(v39) + 0.5;
          if (!v30)
            break;
          CGPathAddLineToPoint(Mutable, 0, v41, v42);
          if (Labels)
            goto LABEL_17;
LABEL_18:
          if (OISeriesGetShowValues((uint64_t)ValueAtIndex))
          {
            v43 = v39;
            v44 = v40;
            if (TextColor)
            {
              v45 = v65 + OIAxisConvertValueToLocal(v19, 0.0);
              v44 = v40 - v60;
              v43 = (v39 + v45) * 0.5;
            }
            OILabelCollectionAddNumber((uint64_t)v61, 0, valuePtr[0], floor(v44) + 0.5, floor(v43 - v62) + 0.5, v34, v35);
          }
          PlotFillColor = OIChartGetPlotFillColor((uint64_t)ValueAtIndex);
          if (PlotFillColor)
            OIErrorBarRendererAddPoint((uint64_t)v63, PlotFillColor, v40, v39, valuePtr[0], v64);
          if (v29 == ++v30)
          {
            v47 = v30 - 1;
            Type = c;
            goto LABEL_29;
          }
        }
        CGPathMoveToPoint(Mutable, 0, v41, v42);
        if (!Labels)
          goto LABEL_18;
LABEL_17:
        v69.origin.x = floor(v40 - v31) + 0.5;
        v69.origin.y = floor(v39 - v31) + 0.5;
        v69.size.width = v32;
        v69.size.height = v32;
        CGPathAddRect(v26, 0, v69);
        goto LABEL_18;
      }
LABEL_40:
      OIErrorBarRendererRenderInContext((uint64_t)v63, Type);
      OIErrorBarRendererRelease(v63);
      OILabelCollectionRenderInContext((uint64_t)v61, Type);
      OILabelCollectionRelease(v61);
      CGContextRestoreGState(Type);
    }
  }
}

void OIRenderStackedLinesInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedLinesInChart(a1, a2, 0);
}

void _OIRenderStackedLinesInChart(uint64_t a1, CFArrayRef theArray, uint64_t a3)
{
  CFIndex Count;
  size_t v6;
  CGContext *Type;
  double PlotArea;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  _QWORD *v15;
  CFIndex v16;
  uint64_t v17;
  const void *ValueAtIndex;
  uint64_t Labels;
  const __CFArray *Values;
  CFIndex v21;
  CGMutablePathRef Mutable;
  CFIndex v23;
  double v24;
  CFIndex v25;
  const void *v26;
  const __CFArray *v27;
  const __CFNumber *v28;
  CFIndex v29;
  double v30;
  const void *v31;
  uint64_t TextColor;
  const __CFArray *v33;
  uint64_t String;
  uint64_t v35;
  int v36;
  double Scale;
  double v38;
  double v39;
  double v40;
  double v41;
  const __CFNumber *v42;
  double v43;
  double v44;
  double v45;
  CGPath *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MarkerWidth;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t PlotFillColor;
  CFIndex v57;
  const void *v58;
  const __CFArray *v59;
  uint64_t v60;
  uint64_t StrokeColor;
  uint64_t v62;
  uint64_t v63;
  int v64;
  double v65;
  double v66;
  double v67;
  CFIndex v68;
  CGPath *MutableCopy;
  CFIndex v70;
  double v71;
  double v72;
  double v73;
  double v74;
  const CGPath *v75;
  const CGPath *v76;
  CGColor *MarkerColor;
  const CGPath *v78;
  uint64_t v79;
  int v80;
  CGContext *c;
  uint64_t v82;
  CFIndex idx;
  _BYTE *v84;
  _QWORD *v85;
  double v86;
  double v87;
  _QWORD *v88;
  double v90;
  double v91;
  _QWORD *v92;
  double valuePtr[2];
  CGSize v94;
  CGRect v95;
  CGRect v96;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    idx = Count - 1;
    if (Count >= 1)
    {
      v6 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v80 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v87 = PlotArea;
      v95.origin.x = PlotArea;
      v91 = v10;
      v95.origin.y = v10;
      v95.size.width = v12;
      v95.size.height = v14;
      CGContextClipToRect(Type, v95);
      CGContextBeginPath(Type);
      v85 = OILabelCollectionCreate();
      v84 = OIErrorBarRendererCreate(1);
      v15 = malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
      v92 = malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
      v16 = 0;
      v17 = 0;
      do
      {
        v15[v16] = CGPathCreateMutable();
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v16);
        Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
        Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        v21 = CFArrayGetCount(Values);
        if (v21 > v17)
          v17 = v21;
        if (Labels)
          Mutable = CGPathCreateMutable();
        else
          Mutable = 0;
        v92[v16++] = Mutable;
      }
      while (v6 != v16);
      c = Type;
      v82 = v17;
      v88 = v15;
      if (v17 >= 1)
      {
        v23 = 0;
        do
        {
          v24 = 1.0;
          if (a3 == 1)
          {
            v25 = 0;
            v24 = 0.0;
            do
            {
              v26 = CFArrayGetValueAtIndex(theArray, v25);
              v27 = (const __CFArray *)OISeriesGetValues((uint64_t)v26);
              if (CFArrayGetCount(v27) > v23)
              {
                valuePtr[0] = 0.0;
                v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v27, v23);
                CFNumberGetValue(v28, kCFNumberCGFloatType, valuePtr);
                v24 = v24 + fabs(valuePtr[0]);
              }
              ++v25;
            }
            while (v6 != v25);
          }
          v29 = 0;
          v86 = v24;
          v30 = 0.0;
          do
          {
            v31 = CFArrayGetValueAtIndex(theArray, v29);
            TextColor = OILabelGetTextColor((uint64_t)v31);
            v33 = (const __CFArray *)OISeriesGetValues((uint64_t)v31);
            String = OILabelGetString((uint64_t)v31);
            v35 = OIAxisGetType((uint64_t)v31);
            v36 = OIAxisAreLabelsCentered(String);
            Scale = OIAxisGetScale(String);
            v38 = OIAxisGetScale(v35);
            if (CFArrayGetCount(v33) > v23)
            {
              v39 = Scale * 0.5;
              v40 = floor(Scale * 0.5);
              if (v36)
                v41 = v40;
              else
                v41 = 0.0;
              valuePtr[0] = 0.0;
              v42 = (const __CFNumber *)CFArrayGetValueAtIndex(v33, v23);
              CFNumberGetValue(v42, kCFNumberCGFloatType, valuePtr);
              v43 = valuePtr[0] / v24;
              v90 = OIAxisConvertValueToLocal(v35, v30);
              v30 = v30 + v43;
              v44 = v87 + OIAxisConvertValueToLocal(String, (double)v23);
              v45 = OIAxisConvertValueToLocal(v35, v30);
              v46 = (CGPath *)v88[v29];
              v47 = v91 + v45;
              v48 = v41 + v44;
              v49 = floor(v48) + 0.5;
              v50 = floor(v47) + 0.5;
              if (v23)
                CGPathAddLineToPoint(v46, 0, v49, v50);
              else
                CGPathMoveToPoint(v46, 0, v49, v50);
              if (v92[v29])
              {
                MarkerWidth = OISeriesGetMarkerWidth((uint64_t)v31);
                if (OIAxisGetLabels((uint64_t)v31) == 1)
                {
                  v96.origin.x = floor(v48 - MarkerWidth * 0.5) + 0.5;
                  v96.origin.y = floor(v47 - MarkerWidth * 0.5) + 0.5;
                  v96.size.width = ceil(MarkerWidth);
                  v96.size.height = v96.size.width;
                  CGPathAddRect((CGMutablePathRef)v92[v29], 0, v96);
                }
              }
              if (OISeriesGetShowValues((uint64_t)v31))
              {
                v52 = Scale / 3.0;
                if (TextColor)
                {
                  v53 = 0.5;
                  v54 = v48 - v39 * 0.5;
                  v55 = (v91 + v90 + v47) * 0.5 - v52 * 0.5;
                }
                else
                {
                  if (a3 == 1 && idx == v29)
                    v55 = v47 - v52;
                  else
                    v55 = v47 + v52 * -0.5;
                  v54 = v48;
                  v53 = 0.5;
                }
                OILabelCollectionAddNumber((uint64_t)v85, 0, valuePtr[0], floor(v54) + v53, floor(v55) + v53, ceil(v39), ceil(v52));
              }
              if (!a3)
              {
                PlotFillColor = OIChartGetPlotFillColor((uint64_t)v31);
                if (PlotFillColor)
                  OIErrorBarRendererAddPoint((uint64_t)v84, PlotFillColor, v48, v47, v43, v38);
              }
              v24 = v86;
            }
            ++v29;
          }
          while (v6 != v29);
          ++v23;
        }
        while (v23 != v82);
      }
      if (v80)
      {
        v94.width = 2.0;
        v94.height = -2.0;
        CGContextSetShadow(c, v94, 3.0);
      }
      v57 = idx;
      do
      {
        v58 = CFArrayGetValueAtIndex(theArray, v57);
        v59 = (const __CFArray *)OISeriesGetValues((uint64_t)v58);
        v60 = OILabelGetTextColor((uint64_t)v58);
        StrokeColor = OILabelGetStrokeColor((uint64_t)v58);
        v62 = OILabelGetString((uint64_t)v58);
        v63 = OIAxisGetType((uint64_t)v58);
        v64 = OIAxisAreLabelsCentered(v62);
        v65 = OIAxisGetScale(v62);
        OISeriesSetupStrokeAndFillForContext((uint64_t)v58, c);
        if (v60)
        {
          v66 = floor(v65 * 0.5);
          if (v64)
            v67 = v66;
          else
            v67 = 0.0;
          v68 = v57;
          MutableCopy = CGPathCreateMutableCopy((CGPathRef)v88[v57]);
          v70 = CFArrayGetCount(v59);
          v71 = v87 + OIAxisConvertValueToLocal(v62, (double)(v70 - 1));
          v72 = OIAxisConvertValueToLocal(v63, 0.0);
          CGPathAddLineToPoint(MutableCopy, 0, floor(v67 + v71) + 0.5, floor(v91 + v72) + 0.5);
          v73 = v87 + OIAxisConvertValueToLocal(v62, 0.0);
          v74 = OIAxisConvertValueToLocal(v63, 0.0);
          CGPathAddLineToPoint(MutableCopy, 0, floor(v67 + v73) + 0.5, floor(v91 + v74) + 0.5);
          CGContextAddPath(c, MutableCopy);
          CGContextFillPath(c);
          v75 = MutableCopy;
          v57 = v68;
          CGPathRelease(v75);
        }
        if (StrokeColor)
        {
          CGContextAddPath(c, (CGPathRef)v88[v57]);
          CGContextStrokePath(c);
        }
        v76 = (const CGPath *)v88[v57];
        if (v76)
          CGPathRelease(v76);
        if (v92[v57])
        {
          MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)v58);
          CGContextSetFillColorWithColor(c, MarkerColor);
          CGContextAddPath(c, (CGPathRef)v92[v57]);
          CGContextFillPath(c);
          v78 = (const CGPath *)v92[v57];
          if (v78)
            CGPathRelease(v78);
        }
        v79 = v57-- + 1;
      }
      while (v79 > 1);
      OIErrorBarRendererRenderInContext((uint64_t)v84, c);
      OIErrorBarRendererRelease(v84);
      OILabelCollectionRenderInContext((uint64_t)v85, c);
      OILabelCollectionRelease(v85);
      free(v88);
      free(v92);
      CGContextRestoreGState(c);
    }
  }
}

void OIRenderPercentStackedLinesInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedLinesInChart(a1, a2, 1);
}

void OIRenderOrthoAxisBackgroundInChart(uint64_t a1)
{
  CGContext *Type;
  int v3;
  const void *Axis;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  CGSize v8;

  Type = (CGContext *)OIAxisGetType(a1);
  v3 = OIAxisAreLabelsCentered(a1);
  CGContextSaveGState(Type);
  _OIChartOrthoBackgroundBackground(a1);
  CGContextBeginPath(Type);
  if (v3)
  {
    v8.width = 0.0;
    v8.height = 0.0;
    CGContextSetShadow(Type, v8, 0.0);
  }
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  if (Axis)
  {
    v5 = (uint64_t)Axis;
    if (OIAxisGetDrawMajorGridlines((uint64_t)Axis))
      _OIAxisRenderVerticallUnitLines(a1, v5, 0.0, 0.0);
  }
  v6 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  if (v6)
  {
    v7 = (uint64_t)v6;
    if (OIAxisGetDrawMajorGridlines((uint64_t)v6))
      _OIAxisRenderHorizontalUnitLines(a1, v7, 0.0, 0.0);
  }
  CGContextRestoreGState(Type);
}

void _OIChartOrthoBackgroundBackground(uint64_t a1)
{
  CGContext *Type;
  double PlotArea;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGColor *PlotFillColor;
  CGColor *StrokeColor;
  double PlotStrokeWidth;
  CGRect v13;
  CGRect v14;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  PlotFillColor = (CGColor *)OIChartGetPlotFillColor(a1);
  StrokeColor = (CGColor *)OIAxisGetStrokeColor(a1);
  PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  if (PlotFillColor)
  {
    CGContextSetFillColorWithColor(Type, PlotFillColor);
    v13.origin.x = floor(PlotArea) + 0.5;
    v13.origin.y = floor(v5) + 0.5;
    v13.size.width = ceil(v7);
    v13.size.height = ceil(v9);
    CGContextFillRect(Type, v13);
  }
  if (StrokeColor)
  {
    if (PlotStrokeWidth > 0.0)
    {
      CGContextSetLineWidth(Type, PlotStrokeWidth);
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      v14.origin.x = floor(PlotArea) + 0.5;
      v14.origin.y = floor(v5) + 0.5;
      v14.size.width = ceil(v7);
      v14.size.height = ceil(v9);
      CGContextStrokeRect(Type, v14);
    }
  }
}

void _OIAxisRenderVerticallUnitLines(uint64_t a1, uint64_t a2, double a3, double a4)
{
  CGContext *Type;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGColor *StrokeColor;
  CGColor *v15;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  double StrokeWidth;
  double MinValue;
  double FontSize;
  double Unit;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double PlotArea;
  CGSize v36;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (OIAxisAreLabelsCentered(a1))
  {
    v36.width = 0.0;
    v36.height = 0.0;
    CGContextSetShadow(Type, v36, 0.0);
  }
  StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
  {
    v15 = StrokeColor;
    Alpha = CGColorGetAlpha(StrokeColor);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v15, Alpha * 0.25);
    CGContextSetStrokeColorWithColor(Type, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 0.5);
  }
  StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  MinValue = OIAxisGetMinValue(a2);
  FontSize = OILabelGetFontSize(a2);
  Unit = OIAxisGetUnit(a2);
  v22 = MinValue / Unit;
  v23 = FontSize / Unit + 1.0;
  v24 = (double)(uint64_t)v22;
  if (v23 > v24)
  {
    v25 = v13;
    v26 = PlotArea + v11;
    v27 = a4 == 0.0 && a3 == 0.0;
    v28 = floor(v9) + 0.5;
    v33 = floor(a4 + v9) + 0.5;
    v29 = floor(v9 + v25) + 0.5;
    v30 = (uint64_t)v22 + 1;
    do
    {
      v31 = PlotArea + OIAxisConvertValueToLocal(a2, Unit * v24);
      if (v31 > v26)
        break;
      v32 = floor(v31) + 0.5;
      CGContextMoveToPoint(Type, v32, v28);
      if (!v27)
      {
        v32 = floor(a3 + v31) + 0.5;
        CGContextAddLineToPoint(Type, v32, v33);
      }
      CGContextAddLineToPoint(Type, v32, v29);
      v24 = (double)v30++;
    }
    while (v23 > v24);
  }
  CGContextStrokePath(Type);
}

void _OIAxisRenderHorizontalUnitLines(uint64_t a1, uint64_t a2, double a3, double a4)
{
  CGContext *Type;
  double PlotArea;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGColor *StrokeColor;
  CGColor *v15;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;
  double StrokeWidth;
  double MinValue;
  double FontSize;
  double Unit;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double x;
  double v35;
  CGSize v36;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v35 = v9;
  v11 = v10;
  v13 = v12;
  if (OIAxisAreLabelsCentered(a1))
  {
    v36.width = 0.0;
    v36.height = 0.0;
    CGContextSetShadow(Type, v36, 0.0);
  }
  StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
  {
    v15 = StrokeColor;
    Alpha = CGColorGetAlpha(StrokeColor);
    CopyWithAlpha = CGColorCreateCopyWithAlpha(v15, Alpha * 0.25);
    CGContextSetStrokeColorWithColor(Type, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 0.5);
  }
  StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  MinValue = OIAxisGetMinValue(a2);
  FontSize = OILabelGetFontSize(a2);
  Unit = OIAxisGetUnit(a2);
  v22 = MinValue / Unit;
  v23 = FontSize / Unit + 1.0;
  v24 = (double)(uint64_t)v22;
  if (v23 > v24)
  {
    v25 = v11;
    v26 = v35 + v13;
    v27 = a4 == 0.0 && a3 == 0.0;
    v28 = floor(PlotArea) + 0.5;
    x = floor(a3 + PlotArea) + 0.5;
    v29 = floor(PlotArea + v25) + 0.5;
    v30 = (uint64_t)v22 + 1;
    do
    {
      v31 = v35 + OIAxisConvertValueToLocal(a2, Unit * v24);
      if (v31 > v26)
        break;
      v32 = floor(v31) + 0.5;
      CGContextMoveToPoint(Type, v28, v32);
      if (!v27)
      {
        v32 = floor(a4 + v31) + 0.5;
        CGContextAddLineToPoint(Type, x, v32);
      }
      CGContextAddLineToPoint(Type, v29, v32);
      v24 = (double)v30++;
    }
    while (v23 > v24);
  }
  CGContextStrokePath(Type);
}

void OIRenderOrthoAxisForegroundInChart(uint64_t a1)
{
  CGContext *Type;
  _QWORD *Axis;
  _QWORD *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  const void *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  const void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  const void *v26;

  Type = (CGContext *)OIAxisGetType(a1);
  CGContextSaveGState(Type);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  if (Axis)
  {
    v4 = Axis;
    if (OIAxisGetType((uint64_t)Axis))
    {
      v5 = OIAxisGetType((uint64_t)v4);
      v6 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
      if (v5 == 2)
        _OIAxisRenderHorizontalDates(a1, v4, (uint64_t)v6, 0, 0.0);
      else
        _OIAxisRenderHorizontalUnits(a1, (uint64_t)v4, 0.0, v7, 0);
    }
    else
    {
      v8 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
      _OIAxisRenderHorizontalLabels(a1, v4, (uint64_t)v8, 0, 0.0);
    }
  }
  v9 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
  if (v9)
  {
    v10 = v9;
    if (OIAxisGetType((uint64_t)v9))
    {
      v11 = OIAxisGetType((uint64_t)v10);
      v12 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
      if (v11 == 2)
        _OIAxisRenderHorizontalDates(a1, v10, (uint64_t)v12, 1, 0.0);
      else
        _OIAxisRenderHorizontalUnits(a1, (uint64_t)v10, 0.0, v13, 1);
    }
    else
    {
      v14 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
      _OIAxisRenderHorizontalLabels(a1, v10, (uint64_t)v14, 1, 0.0);
    }
  }
  v15 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  if (v15)
  {
    v16 = v15;
    if (OIAxisGetType((uint64_t)v15))
    {
      v17 = OIAxisGetType((uint64_t)v16);
      v18 = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
      if (v17 == 2)
        _OIAxisRenderVerticalDates(a1, v16, (uint64_t)v18, 0, 0.0, 0.0);
      else
        _OIAxisRenderVerticalUnits(a1, (uint64_t)v16, 0.0, 0.0, v19, 0);
    }
    else
    {
      v20 = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
      _OIAxisRenderVerticalLabels(a1, (uint64_t)v16, (uint64_t)v20, 0, 0.0, 0.0);
    }
  }
  v21 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
  if (v21)
  {
    v22 = v21;
    if (OIAxisGetType((uint64_t)v21))
    {
      v23 = OIAxisGetType((uint64_t)v22);
      v24 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
      if (v23 == 2)
        _OIAxisRenderVerticalDates(a1, v22, (uint64_t)v24, 1, 0.0, 0.0);
      else
        _OIAxisRenderVerticalUnits(a1, (uint64_t)v22, 0.0, 0.0, v25, 1);
    }
    else
    {
      v26 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
      _OIAxisRenderVerticalLabels(a1, (uint64_t)v22, (uint64_t)v26, 1, 0.0, 0.0);
    }
  }
  CGContextRestoreGState(Type);
}

void _OIAxisRenderHorizontalLabels(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, double a5)
{
  CGContext *Type;
  double PlotArea;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  CGColor *StrokeColor;
  double StrokeWidth;
  double v20;
  int v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  uint64_t Labels;
  const __CFArray *v36;
  double v37;
  double v38;
  CFIndex Count;
  __CFArray *v40;
  double Scale;
  void *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  CTFontRef v46;
  uint64_t v47;
  CFIndex v48;
  CFIndex v49;
  CFIndex v50;
  const __CFString *v51;
  double v52;
  double v53;
  const __CFString *ValueAtIndex;
  const __CFString *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _QWORD v60[6];
  _QWORD v61[8];
  double v62[2];
  CGSize v63;

  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    PlotArea = OIChartGetPlotArea(a1);
    v13 = v12;
    v59 = v14;
    v16 = v15;
    if (OIAxisAreLabelsCentered(a1))
    {
      v63.width = 0.0;
      v63.height = 0.0;
      CGContextSetShadow(Type, v63, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      v58 = v13 + OIAxisConvertValueToLocal(a3, 0.0);
      v17 = 1;
    }
    else
    {
      v17 = 0;
      v58 = v13;
    }
    StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor)
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    else
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    v20 = floor(v16 / 100.0);
    v57 = v16;
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0)
      v20 = v20 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    v21 = OIAxisAreLabelsCentered((uint64_t)a2);
    v22 = (uint64_t)OIAxisGetValueCount(a2) - (v21 ^ 1u);
    v23 = (double)v22;
    if (v22 >= 1)
    {
      v24 = v13 + v57;
      if (!a4)
        v24 = v58;
      v25 = floor(v24) + 0.5;
      v26 = floor(v24 - v20) + 0.5;
      v27 = 0.0;
      v28 = 1;
      do
      {
        v29 = floor(PlotArea + v27 * (v59 / v23)) + 0.5;
        CGContextMoveToPoint(Type, v29, v25);
        CGContextAddLineToPoint(Type, v29, v26);
        v27 = (double)v28++;
      }
      while (v27 < v23);
    }
    v30 = 0.5;
    v31 = floor(PlotArea) + 0.5;
    v32 = floor(PlotArea + v59 - a5) + 0.5;
    if (v17)
      v33 = v58;
    else
      v33 = v13;
    v34 = floor(v33) + 0.5;
    CGContextMoveToPoint(Type, v31, v34);
    CGContextAddLineToPoint(Type, v32, v34);
    CGContextStrokePath(Type);
    Labels = OIAxisGetLabels((uint64_t)a2);
    if (Labels)
    {
      v36 = (const __CFArray *)Labels;
      if (!OIAxisAreLabelsCentered((uint64_t)a2))
        v30 = 0.0;
      OIChartGetSize(a1);
      v38 = fmin(v37 * 0.08, 10.0);
      v62[0] = 0.0;
      Count = CFArrayGetCount(v36);
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = ___OIAxisRenderHorizontalLabels_block_invoke;
      v61[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
      v61[4] = Count;
      *(double *)&v61[5] = (double)v22;
      v61[6] = a2;
      v61[7] = v36;
      v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v61, 0, v38, (uint64_t)Type, v62);
      Scale = OIAxisGetScale((uint64_t)a2);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62[0] <= Scale)
      {
        v45 = a4;
        v44 = 1;
      }
      else
      {
        v43 = v38 * Scale / v62[0];
        if (v43 >= 8.0)
        {
          v44 = 1;
        }
        else
        {
          v44 = (uint64_t)(1.5 / (Scale / v62[0]));
          v43 = 8.0;
        }
        v45 = a4;
        v46 = OICreateDefaultFontWithSize(v43);
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v46, *MEMORY[0x24BDC4C28]);

      }
      v47 = (uint64_t)a2;
      objc_msgSend(v42, "setObject:forKeyedSubscript:", OIAxisGetTextColor((uint64_t)a2), *MEMORY[0x24BDC4EE0]);
      v48 = CFArrayGetCount(v36);
      if (v48 >= 1 && v22 >= 1)
      {
        v49 = v48;
        v50 = 0;
        v51 = (const __CFString *)*MEMORY[0x24BDBD430];
        if (v45)
          v52 = v13 + v57;
        else
          v52 = v33;
        v53 = 0.0;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v40, v50);
          if (ValueAtIndex != v51)
          {
            v55 = ValueAtIndex;
            v56 = OIAxisConvertValueToLocal(v47, v30 + v53);
            v60[0] = MEMORY[0x24BDAC760];
            v60[1] = 3221225472;
            v60[2] = ___OIAxisRenderHorizontalLabels_block_invoke_2;
            v60[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            *(double *)&v60[4] = PlotArea + v56;
            *(double *)&v60[5] = v52;
            OIDrawStringWithAttributes(v55, v42, Type, v60);
          }
          v50 += v44;
          if (v50 >= v49)
            break;
          v53 = (double)v50;
        }
        while ((double)v50 < v23);
      }
      CFRelease(v40);

    }
  }
}

void _OIAxisRenderHorizontalDates(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, double a5)
{
  CGContext *Type;
  double PlotArea;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  CGColor *StrokeColor;
  double StrokeWidth;
  double v21;
  int v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  __CFArray *v40;
  double Scale;
  uint64_t v42;
  void *v43;
  CTFontRef v44;
  CFIndex Count;
  CFIndex v46;
  CFIndex v47;
  const __CFString *v48;
  double v49;
  double v50;
  const __CFString *ValueAtIndex;
  double v52;
  double v53;
  double v54;
  _QWORD v55[6];
  _QWORD v56[7];
  double v57[2];
  CGSize v58;

  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    PlotArea = OIChartGetPlotArea(a1);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    if (OIAxisAreLabelsCentered(a1))
    {
      v58.width = 0.0;
      v58.height = 0.0;
      CGContextSetShadow(Type, v58, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      v54 = v13 + OIAxisConvertValueToLocal(a3, 0.0);
      v18 = 1;
    }
    else
    {
      v18 = 0;
      v54 = v13;
    }
    StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor)
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    else
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    v21 = floor(v17 / 100.0);
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0)
      v21 = v21 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    v22 = OIAxisAreLabelsCentered((uint64_t)a2);
    v23 = (uint64_t)OIAxisGetValueCount(a2) - (v22 ^ 1u);
    v24 = (double)v23;
    v52 = v13;
    v53 = v13 + v17;
    if (v23 >= 1)
    {
      v25 = v13 + v17;
      if (!a4)
        v25 = v54;
      v26 = floor(v25) + 0.5;
      v27 = floor(v25 - v21) + 0.5;
      v28 = 0.0;
      v29 = 1;
      do
      {
        v30 = floor(PlotArea + v28 * (v15 / v24)) + 0.5;
        CGContextMoveToPoint(Type, v30, v26);
        CGContextAddLineToPoint(Type, v30, v27);
        v28 = (double)v29++;
      }
      while (v28 < v24);
    }
    v31 = floor(PlotArea) + 0.5;
    v32 = v15;
    v33 = floor(PlotArea + v15 - a5) + 0.5;
    if (v18)
      v34 = v54;
    else
      v34 = v52;
    v35 = floor(v34) + 0.5;
    CGContextMoveToPoint(Type, v31, v35);
    CGContextAddLineToPoint(Type, v33, v35);
    CGContextStrokePath(Type);
    if (OIAxisAreLabelsCentered((uint64_t)a2))
      v36 = 0.5;
    else
      v36 = 0.0;
    OIChartGetSize(a1);
    v38 = fmin(v37 * 0.08, 10.0);
    v57[0] = 0.0;
    v39 = MEMORY[0x24BDAC760];
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = ___OIAxisRenderHorizontalDates_block_invoke;
    v56[3] = &__block_descriptor_56_e25_____CFString__24__0q8_B16l;
    *(double *)&v56[4] = v24;
    v56[5] = a2;
    v56[6] = a1;
    v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v56, 0, v38, (uint64_t)Type, v57);
    Scale = OIAxisGetScale((uint64_t)a2);
    if (v57[0] <= Scale || (v38 = v38 * Scale / v57[0], v38 >= 8.0))
    {
      v42 = 1;
    }
    else
    {
      v42 = (uint64_t)(1.5 / (Scale / v57[0]));
      v38 = 8.0;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = OICreateDefaultFontWithSize(v38);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, *MEMORY[0x24BDC4C28]);

    objc_msgSend(v43, "setObject:forKeyedSubscript:", OIAxisGetTextColor((uint64_t)a2), *MEMORY[0x24BDC4EE0]);
    Count = CFArrayGetCount(v40);
    if (Count >= 1)
    {
      v46 = Count;
      v47 = 0;
      v48 = (const __CFString *)*MEMORY[0x24BDBD430];
      v49 = v32 / (double)Count;
      if (a4)
        v50 = v53;
      else
        v50 = v34;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v40, v47);
        if (ValueAtIndex != v48)
        {
          v55[0] = v39;
          v55[1] = 3221225472;
          v55[2] = ___OIAxisRenderHorizontalDates_block_invoke_2;
          v55[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v55[4] = PlotArea + v49 * (v36 + (double)v47);
          *(double *)&v55[5] = v50;
          OIDrawStringWithAttributes(ValueAtIndex, v43, Type, v55);
        }
        v47 += v42;
      }
      while (v47 < v46);
    }
    CFRelease(v40);

  }
}

void _OIAxisRenderHorizontalUnits(uint64_t a1, uint64_t a2, double a3, uint64_t a4, uint64_t a5)
{
  CGContext *Type;
  double PlotArea;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double MinValue;
  double FontSize;
  double v17;
  CGColor *StrokeColor;
  double StrokeWidth;
  BOOL v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  __CFArray *v44;
  double v45;
  CTFontRef v46;
  uint64_t v47;
  double v48;
  double v49;
  const __CFString *v50;
  uint64_t v51;
  double v52;
  double v53;
  const __CFString *ValueAtIndex;
  double v55;
  uint64_t v56;
  double v57;
  double v59;
  double v60;
  double Unit;
  _QWORD v63[8];
  _QWORD v64[8];
  double v65[2];
  CGSize v66;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v59 = v9;
  v11 = v10;
  v13 = v12;
  v14 = OIAxisAreLabelsCentered(a1);
  MinValue = OIAxisGetMinValue(a2);
  FontSize = OILabelGetFontSize(a2);
  Unit = OIAxisGetUnit(a2);
  if (MinValue == 0.0)
  {
    v17 = floor(v11 / 120.0);
    if (v17 < 3.0)
      v17 = 3.0;
  }
  else
  {
    v17 = 0.0;
  }
  v57 = v17;
  if (v14)
  {
    v66.width = 0.0;
    v66.height = 0.0;
    CGContextSetShadow(Type, v66, 0.0);
  }
  StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
  else
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  v20 = OIAxisGetStrokeWidth(a2) <= 1.0;
  v60 = floor(v13 / 150.0);
  v21 = v60;
  if (!v20)
    v21 = v60 + floor(OIAxisGetStrokeWidth(a2));
  v22 = (uint64_t)(MinValue / Unit);
  v55 = FontSize;
  v23 = FontSize / Unit + 1.0;
  v24 = (double)v22;
  v25 = PlotArea + v11;
  v26 = PlotArea;
  if (v23 > (double)v22)
  {
    if (a5)
      v27 = v59 + v13;
    else
      v27 = v59;
    v28 = floor(v27) + 0.5;
    v29 = floor(v59 + v13 + v21);
    v30 = floor(v59 - v21);
    if (a5)
      v30 = v29;
    v31 = v30 + 0.5;
    v32 = v22 + 1;
    v33 = (double)v22;
    do
    {
      v34 = floor(PlotArea + OIAxisConvertValueToLocal(a2, Unit * v33));
      if (v34 > v25)
        break;
      v35 = v34 + 0.5;
      CGContextMoveToPoint(Type, v34 + 0.5, v28);
      v36 = v35;
      PlotArea = v26;
      CGContextAddLineToPoint(Type, v36, v31);
      v33 = (double)v32++;
    }
    while (v23 > v33);
  }
  v37 = floor(PlotArea) + 0.5;
  v38 = PlotArea;
  v39 = floor(v59) + 0.5;
  CGContextMoveToPoint(Type, v37, v39);
  CGContextAddLineToPoint(Type, floor(v25 - a3) + 0.5, v39);
  CGContextStrokePath(Type);
  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    v40 = Unit * OIAxisGetScale(a2);
    if (v40 >= 20.0)
      v41 = 10.0;
    else
      v41 = v40 * 0.5;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", *(_QWORD *)&v55);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", OIAxisGetTextColor(a2), *MEMORY[0x24BDC4EE0]);
    v65[0] = 0.0;
    v43 = MEMORY[0x24BDAC760];
    v64[0] = MEMORY[0x24BDAC760];
    v64[1] = 3221225472;
    v64[2] = ___OIAxisRenderHorizontalUnits_block_invoke;
    v64[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
    v64[4] = v56;
    *(double *)&v64[5] = Unit;
    v64[6] = a2;
    v64[7] = a1;
    v44 = _OIAxisRenderBuildStringArrayAndComputeWidth(v64, v22, v41, (uint64_t)Type, v65);
    v45 = v38 - v57 + -10.0;
    if (v65[0] > v45)
      v41 = v41 * (v45 / v65[0]);
    v46 = OICreateDefaultFontWithSize(v41);
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v46, *MEMORY[0x24BDC4C28]);

    if (v23 > v24)
    {
      v47 = 0;
      v48 = -0.0;
      if (a5)
        v48 = v13;
      v49 = v59 + v48;
      v50 = (const __CFString *)*MEMORY[0x24BDBD430];
      v51 = v22 + 1;
      do
      {
        if ((OIAxisIsLogarithmic(a2) & (Unit * v24 <= 0.0)) != 0)
          v52 = 1.0;
        else
          v52 = Unit * v24;
        v53 = v26 + OIAxisConvertValueToLocal(a2, v52);
        if (floor(v53) > v25)
          break;
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v44, v47);
        if (ValueAtIndex != v50)
        {
          v63[0] = v43;
          v63[1] = 3221225472;
          v63[2] = ___OIAxisRenderHorizontalUnits_block_invoke_2;
          v63[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v63[4] = v53;
          *(double *)&v63[5] = v49;
          v63[6] = a5;
          *(double *)&v63[7] = v60;
          OIDrawStringWithAttributes(ValueAtIndex, v42, Type, v63);
        }
        v24 = (double)(v51 + v47++);
      }
      while (v23 > v24);
    }
    CFRelease(v44);

  }
}

void _OIAxisRenderVerticalLabels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  CGContext *Type;
  double PlotArea;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGColor *StrokeColor;
  double StrokeWidth;
  double v20;
  int v21;
  double FontSize;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  uint64_t Labels;
  const __CFArray *v36;
  double v37;
  CFIndex Count;
  double v39;
  __CFArray *v40;
  void *v41;
  CTFontRef v42;
  double v43;
  double v44;
  CFIndex v45;
  CFIndex v46;
  CFIndex v47;
  const __CFString *v48;
  double v49;
  const __CFString *ValueAtIndex;
  const __CFString *v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  _QWORD v57[11];
  char v58;
  _QWORD v59[8];
  double v60[2];
  CGSize v61;

  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    PlotArea = OIChartGetPlotArea(a1);
    v14 = v13;
    v56 = v15;
    v17 = v16;
    if (OIAxisAreLabelsCentered(a1))
    {
      v61.width = 0.0;
      v61.height = 0.0;
      CGContextSetShadow(Type, v61, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      v54 = PlotArea + OIAxisConvertValueToLocal(a3, 0.0);
      v55 = 1;
    }
    else
    {
      v55 = 0;
      v54 = PlotArea;
    }
    StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
    v53 = a6;
    if (StrokeColor)
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    else
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    StrokeWidth = OIAxisGetStrokeWidth(a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    v20 = floor(v17 / 100.0);
    if (OIAxisGetStrokeWidth(a2) > 1.0)
      v20 = v20 + floor(OIAxisGetStrokeWidth(a2));
    v21 = OIAxisAreLabelsCentered(a2);
    FontSize = OILabelGetFontSize(a2);
    if (v21)
      v23 = FontSize + 1.0;
    else
      v23 = FontSize;
    if (v23 > 0.0)
    {
      v24 = 3.0;
      if (v20 >= 3.0)
        v24 = v20;
      v25 = PlotArea + v56;
      if (!a4)
        v25 = v54;
      v26 = floor(v25) + 0.5;
      v27 = floor(v25 - v24) + 0.5;
      v28 = 0.0;
      v29 = 1;
      do
      {
        v30 = floor(v14 + OIAxisConvertValueToLocal(a2, v28)) + 0.5;
        CGContextMoveToPoint(Type, v26, v30);
        CGContextAddLineToPoint(Type, v27, v30);
        v28 = (double)v29++;
      }
      while (v23 > v28);
    }
    v31 = floor(v14) + 0.5;
    v32 = floor(v14 + v17 - v53) + 0.5;
    if (v55)
      v33 = v54;
    else
      v33 = PlotArea;
    v34 = floor(v33) + 0.5;
    CGContextMoveToPoint(Type, v34, v31);
    CGContextAddLineToPoint(Type, v34, v32);
    CGContextStrokePath(Type);
    Labels = OIAxisGetLabels(a2);
    if (Labels)
    {
      v36 = (const __CFArray *)Labels;
      if (OIAxisAreLabelsCentered(a2))
        v37 = 0.5;
      else
        v37 = 0.0;
      v60[0] = 0.0;
      Count = CFArrayGetCount(v36);
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = 3221225472;
      v59[2] = ___OIAxisRenderVerticalLabels_block_invoke;
      v59[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
      v59[4] = Count;
      *(double *)&v59[5] = v23;
      v59[6] = a2;
      v59[7] = v36;
      v39 = 10.0;
      v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v59, 0, 10.0, (uint64_t)Type, v60);
      if (v60[0] > PlotArea + -5.0)
        v39 = (PlotArea + -5.0) * 10.0 / v60[0];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v60[0], *(_QWORD *)&v53);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = OICreateDefaultFontWithSize(v39);
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, *MEMORY[0x24BDC4C28]);

      objc_msgSend(v41, "setObject:forKeyedSubscript:", OIAxisGetTextColor(a2), *MEMORY[0x24BDC4EE0]);
      v43 = floor(v56 / 100.0);
      if (v43 >= 3.0)
        v44 = v43;
      else
        v44 = 3.0;
      v45 = CFArrayGetCount(v40);
      if (v45 >= 1)
      {
        v46 = v45;
        v47 = 0;
        v48 = (const __CFString *)*MEMORY[0x24BDBD430];
        if (a4)
          v49 = PlotArea + v56;
        else
          v49 = v33;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v40, v47);
          if (ValueAtIndex != v48)
          {
            v51 = ValueAtIndex;
            v52 = OIAxisConvertValueToLocal(a2, v37 + (double)v47);
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = ___OIAxisRenderVerticalLabels_block_invoke_2;
            v57[3] = &__block_descriptor_89_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            *(double *)&v57[4] = v49;
            *(double *)&v57[5] = v14 + v52;
            v58 = v55;
            *(double *)&v57[6] = PlotArea;
            *(double *)&v57[7] = v14;
            *(double *)&v57[8] = v56;
            *(double *)&v57[9] = v17;
            *(double *)&v57[10] = v44;
            OIDrawStringWithAttributes(v51, v41, Type, v57);
          }
          ++v47;
        }
        while (v46 != v47);
      }
      CFRelease(v40);

    }
  }
}

void _OIAxisRenderVerticalDates(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  CGContext *Type;
  double PlotArea;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  CGColor *StrokeColor;
  double StrokeWidth;
  double v22;
  int v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  uint64_t v38;
  double v39;
  __CFArray *v40;
  void *v41;
  CTFontRef v42;
  double v43;
  CFIndex Count;
  CFIndex v45;
  CFIndex v46;
  double v47;
  double v48;
  const __CFString *ValueAtIndex;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _QWORD v56[11];
  char v57;
  _QWORD v58[7];
  double v59;
  CGSize v60;

  if ((OIAxisIsHidden((uint64_t)a2) & 1) == 0)
  {
    Type = (CGContext *)OIAxisGetType(a1);
    PlotArea = OIChartGetPlotArea(a1);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (OIAxisAreLabelsCentered(a1))
    {
      v60.width = 0.0;
      v60.height = 0.0;
      CGContextSetShadow(Type, v60, 0.0);
    }
    if (a3 && OIAxisGetMinValue(a3) < 0.0 && OILabelGetFontSize(a3) > 0.0)
    {
      v54 = PlotArea + OIAxisConvertValueToLocal(a3, 0.0);
      v19 = 1;
    }
    else
    {
      v19 = 0;
      v54 = PlotArea;
    }
    StrokeColor = (CGColor *)OIAxisGetStrokeColor((uint64_t)a2);
    if (StrokeColor)
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
    else
      CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
    StrokeWidth = OIAxisGetStrokeWidth((uint64_t)a2);
    CGContextSetLineWidth(Type, StrokeWidth);
    v22 = floor(v18 / 100.0);
    v51 = a6;
    if (OIAxisGetStrokeWidth((uint64_t)a2) > 1.0)
      v22 = v22 + floor(OIAxisGetStrokeWidth((uint64_t)a2));
    v23 = OIAxisAreLabelsCentered((uint64_t)a2);
    v24 = (uint64_t)OIAxisGetValueCount(a2) - (v23 ^ 1u);
    v25 = (double)v24;
    v53 = v16;
    if (v24 >= 1)
    {
      v26 = PlotArea + v16;
      v27 = 3.0;
      if (v22 >= 3.0)
        v27 = v22;
      if (!a4)
        v26 = v54;
      v28 = floor(v26) + 0.5;
      v29 = floor(v26 - v27) + 0.5;
      v30 = 0.0;
      v31 = 1;
      do
      {
        v32 = floor(v14 + v30 * (v18 / v25)) + 0.5;
        CGContextMoveToPoint(Type, v28, v32);
        CGContextAddLineToPoint(Type, v29, v32);
        v30 = (double)v31++;
      }
      while (v30 < v25);
    }
    v33 = floor(v14) + 0.5;
    v34 = floor(v14 + v18 - v51) + 0.5;
    v35 = v54;
    if (!v19)
      v35 = PlotArea;
    v52 = v35;
    v36 = floor(v35) + 0.5;
    CGContextMoveToPoint(Type, v36, v33);
    CGContextAddLineToPoint(Type, v36, v34);
    CGContextStrokePath(Type);
    if (OIAxisAreLabelsCentered((uint64_t)a2))
      v37 = 0.5;
    else
      v37 = 0.0;
    v59 = 0.0;
    v38 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = ___OIAxisRenderVerticalDates_block_invoke;
    v58[3] = &__block_descriptor_56_e25_____CFString__24__0q8_B16l;
    *(double *)&v58[4] = v25;
    v58[5] = a2;
    v58[6] = a1;
    v39 = 10.0;
    v40 = _OIAxisRenderBuildStringArrayAndComputeWidth(v58, 0, 10.0, (uint64_t)Type, &v59);
    if (v59 > PlotArea + -5.0)
      v39 = (PlotArea + -5.0) * 10.0 / v59;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v59, *(_QWORD *)&v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = OICreateDefaultFontWithSize(v39);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, *MEMORY[0x24BDC4C28]);

    objc_msgSend(v41, "setObject:forKeyedSubscript:", OIAxisGetTextColor((uint64_t)a2), *MEMORY[0x24BDC4EE0]);
    v43 = floor(v16 / 100.0);
    if (v43 < 3.0)
      v43 = 3.0;
    v55 = v43;
    Count = CFArrayGetCount(v40);
    if (Count >= 1)
    {
      v45 = Count;
      v46 = 0;
      v47 = v18 / (double)Count;
      if (a4)
        v48 = PlotArea + v16;
      else
        v48 = v52;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v40, v46);
        v56[0] = v38;
        v56[1] = 3221225472;
        v56[2] = ___OIAxisRenderVerticalDates_block_invoke_2;
        v56[3] = &__block_descriptor_89_e29__CGPoint_dd_24__0_CGSize_dd_8l;
        *(double *)&v56[4] = v48;
        *(double *)&v56[5] = v50 + v47 * (v37 + (double)v46);
        v57 = v19;
        *(double *)&v56[6] = PlotArea;
        *(double *)&v56[7] = v50;
        *(double *)&v56[8] = v53;
        *(double *)&v56[9] = v18;
        *(double *)&v56[10] = v55;
        OIDrawStringWithAttributes(ValueAtIndex, v41, Type, v56);
        ++v46;
      }
      while (v45 != v46);
    }
    CFRelease(v40);

  }
}

void _OIAxisRenderVerticalUnits(uint64_t a1, uint64_t a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  CGContext *Type;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double MinValue;
  double FontSize;
  CGColor *StrokeColor;
  double StrokeWidth;
  double v20;
  BOOL v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  void *v41;
  double v42;
  uint64_t v43;
  __CFArray *v44;
  double v45;
  CTFontRef v46;
  uint64_t v47;
  double v48;
  double v49;
  const __CFString *v50;
  uint64_t v51;
  double v52;
  double v53;
  const __CFString *ValueAtIndex;
  double v55;
  double v56;
  double PlotArea;
  double Unit;
  _QWORD v61[8];
  _QWORD v62[8];
  double v63[2];
  CGSize v64;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = OIAxisAreLabelsCentered(a1);
  MinValue = OIAxisGetMinValue(a2);
  FontSize = OILabelGetFontSize(a2);
  Unit = OIAxisGetUnit(a2);
  if (v15)
  {
    v64.width = 0.0;
    v64.height = 0.0;
    CGContextSetShadow(Type, v64, 0.0);
  }
  StrokeColor = (CGColor *)OIAxisGetStrokeColor(a2);
  if (StrokeColor)
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
  else
    CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  StrokeWidth = OIAxisGetStrokeWidth(a2);
  CGContextSetLineWidth(Type, StrokeWidth);
  v20 = floor(v12 / 150.0);
  v21 = OIAxisGetStrokeWidth(a2) <= 1.0;
  v22 = v20;
  if (!v21)
    v22 = v20 + floor(OIAxisGetStrokeWidth(a2));
  v55 = v20;
  v56 = FontSize;
  v23 = (uint64_t)(MinValue / Unit);
  v24 = FontSize / Unit + 1.0;
  v25 = (double)v23;
  v26 = v10;
  if (v24 <= (double)v23)
  {
    v27 = v10 + v14;
  }
  else
  {
    if (v22 < 3.0)
      v22 = 3.0;
    v27 = v10 + v14;
    if (a6)
      v28 = PlotArea + v12;
    else
      v28 = PlotArea;
    v29 = floor(v28) + 0.5;
    v30 = floor(PlotArea + v12 + v22);
    v31 = floor(PlotArea - v22);
    if (a6)
      v31 = v30;
    v32 = v31 + 0.5;
    v33 = v23 + 1;
    v34 = (double)v23;
    do
    {
      v35 = floor(v10 + OIAxisConvertValueToLocal(a2, Unit * v34));
      if (v35 > v27)
        break;
      v36 = v35 + 0.5;
      CGContextMoveToPoint(Type, v29, v35 + 0.5);
      v37 = v36;
      v10 = v26;
      CGContextAddLineToPoint(Type, v32, v37);
      v34 = (double)v33++;
    }
    while (v24 > v34);
  }
  v38 = v10;
  v39 = floor(PlotArea) + 0.5;
  CGContextMoveToPoint(Type, v39, floor(v38) + 0.5);
  CGContextAddLineToPoint(Type, v39, floor(v27 - a4) + 0.5);
  CGContextStrokePath(Type);
  if ((OIAxisIsHidden(a2) & 1) == 0)
  {
    v40 = fmin(Unit * OIAxisGetScale(a2), 10.0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", OIAxisGetTextColor(a2), *MEMORY[0x24BDC4EE0]);
    if (v55 >= 3.0)
      v42 = v55;
    else
      v42 = 3.0;
    v63[0] = 0.0;
    v43 = MEMORY[0x24BDAC760];
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = ___OIAxisRenderVerticalUnits_block_invoke;
    v62[3] = &__block_descriptor_64_e25_____CFString__24__0q8_B16l;
    *(double *)&v62[4] = v56;
    *(double *)&v62[5] = Unit;
    v62[6] = a2;
    v62[7] = a1;
    v44 = _OIAxisRenderBuildStringArrayAndComputeWidth(v62, v23, v40, (uint64_t)Type, v63);
    v45 = PlotArea - v42 + -10.0;
    if (v63[0] > v45)
      v40 = v40 * (v45 / v63[0]);
    v46 = OICreateDefaultFontWithSize(v40);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, *MEMORY[0x24BDC4C28]);

    if (v24 > v25)
    {
      v47 = 0;
      v48 = -0.0;
      if (a6)
        v48 = v12;
      v49 = PlotArea + v48;
      v50 = (const __CFString *)*MEMORY[0x24BDBD430];
      v51 = v23 + 1;
      do
      {
        if ((OIAxisIsLogarithmic(a2) & (Unit * v25 <= 0.0)) != 0)
          v52 = 1.0;
        else
          v52 = Unit * v25;
        v53 = v26 + OIAxisConvertValueToLocal(a2, v52);
        if (floor(v53) > v27)
          break;
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v44, v47);
        if (ValueAtIndex != v50)
        {
          v61[0] = v43;
          v61[1] = 3221225472;
          v61[2] = ___OIAxisRenderVerticalUnits_block_invoke_2;
          v61[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
          *(double *)&v61[4] = v49;
          *(double *)&v61[5] = v53;
          v61[6] = a6;
          *(double *)&v61[7] = v42;
          OIDrawStringWithAttributes(ValueAtIndex, v41, Type, v61);
        }
        v25 = (double)(v51 + v47++);
      }
      while (v24 > v25);
    }
    CFRelease(v44);

  }
}

void _OIRender3DOrthoAxisBackgroundInChart(uint64_t a1, double a2, double a3)
{
  CGContext *Type;
  CGColor *GenericRGB;
  CGColor *v8;
  double PlotArea;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const void *Axis;
  const void *v17;
  double v18;
  CGColor *v19;
  CGPath *Mutable;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPath *v26;
  double v27;
  CGPath *v28;
  double v29;
  CGFloat v30;
  double v31;
  double PlotStrokeWidth;
  double v33;

  Type = (CGContext *)OIAxisGetType(a1);
  GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
  v8 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
  PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  v17 = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v18 = v13 - a2;
  OIAxisUpdateScaleForLength((uint64_t)v17, v13 - a2);
  v29 = v15 - a3;
  OIAxisUpdateScaleForLength((uint64_t)Axis, v15 - a3);
  v19 = OICreateDimmedColorFromColor(GenericRGB, 0.5);
  Mutable = CGPathCreateMutable();
  v21 = floor(v11) + 0.5;
  v31 = floor(PlotArea) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v31, v21);
  v22 = floor(a2 + PlotArea) + 0.5;
  v33 = a3;
  v23 = floor(a3 + v11) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v22, v23);
  v24 = PlotArea + v18;
  v25 = floor(a2 + v24) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v25, v23);
  v30 = v21;
  CGPathAddLineToPoint(Mutable, 0, floor(v24) + 0.5, v21);
  CGPathCloseSubpath(Mutable);
  if (v19)
  {
    CGContextSetFillColorWithColor(Type, v19);
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  CGColorRelease(v19);
  v26 = CGPathCreateMutable();
  CGPathMoveToPoint(v26, 0, v22, v23);
  v27 = floor(v33 + v11 + v29) + 0.5;
  CGPathAddLineToPoint(v26, 0, v22, v27);
  CGPathAddLineToPoint(v26, 0, v25, v27);
  CGPathAddLineToPoint(v26, 0, v25, v23);
  CGPathCloseSubpath(v26);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v26);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, v26);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v26);
  v28 = CGPathCreateMutable();
  CGPathMoveToPoint(v28, 0, v31, v30);
  CGPathAddLineToPoint(v28, 0, v31, floor(v11 + v29) + 0.5);
  CGPathAddLineToPoint(v28, 0, v22, v27);
  CGPathAddLineToPoint(v28, 0, v22, v23);
  CGPathCloseSubpath(v28);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v28);
    CGContextFillPath(Type);
  }
  if (v8)
  {
    CGContextSetStrokeColorWithColor(Type, v8);
    CGContextAddPath(Type, v28);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v28);
  if (v17 && OIAxisGetDrawMajorGridlines((uint64_t)v17))
    _OIAxisRenderVerticallUnitLines(a1, (uint64_t)v17, a2, v33);
  if (Axis && OIAxisGetDrawMajorGridlines((uint64_t)Axis))
    _OIAxisRenderHorizontalUnitLines(a1, (uint64_t)Axis, a2, v33);
  CGColorRelease(GenericRGB);
  CGColorRelease(v8);
}

void OIRender3DOrthoAxisBackgroundInChart(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  const void *Axis;
  double v7;
  double v8;
  double v9;

  OIChartGetPlotArea(a1);
  v3 = v2;
  v5 = v4;
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v7 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v8 = OIChartGetRotation(a1) / 45.0 * (v3 / v7);
  v9 = OIChartGetElevation(a1) / 90.0 * (v5 / v7);
  _OIRender3DOrthoAxisBackgroundInChart(a1, v8, v9);
}

void OIRender3DLayeredOrthoAxisBackgroundInChart(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  const void *Axis;
  const __CFArray *SeriesCount;
  double FontSize;
  double v9;
  double v10;

  OIChartGetPlotArea(a1);
  v3 = v2;
  v5 = v4;
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  SeriesCount = OIChartGetSeriesCount(a1);
  FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  v9 = OIChartGetRotation(a1) / 45.0 * (v3 * (double)(uint64_t)SeriesCount / FontSize);
  v10 = v5 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);
  _OIRender3DOrthoAxisBackgroundInChart(a1, v9, v10);
}

void _OIRender3DOrthoAxisForegroundInChart(uint64_t a1, double a2, double a3)
{
  CGContext *Type;
  _QWORD *Axis;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  Type = (CGContext *)OIAxisGetType(a1);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v8 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  CGContextSaveGState(Type);
  if (!Axis)
  {
LABEL_7:
    if (!v8)
      goto LABEL_15;
    goto LABEL_8;
  }
  if (!OIAxisGetType((uint64_t)Axis))
  {
    _OIAxisRenderHorizontalLabels(a1, Axis, (uint64_t)v8, 0, a2);
    goto LABEL_7;
  }
  if (OIAxisGetType((uint64_t)Axis) == 2)
  {
    _OIAxisRenderHorizontalDates(a1, Axis, (uint64_t)v8, 0, a2);
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    _OIAxisRenderHorizontalUnits(a1, (uint64_t)Axis, a2, v9, 0);
    if (!v8)
      goto LABEL_15;
  }
LABEL_8:
  if (OIAxisGetType((uint64_t)v8))
  {
    if (OIAxisGetType((uint64_t)v8) == 2)
      _OIAxisRenderVerticalDates(a1, v8, (uint64_t)Axis, 0, a2, a3);
    else
      _OIAxisRenderVerticalUnits(a1, (uint64_t)v8, a2, a3, v10, 0);
  }
  else
  {
    _OIAxisRenderVerticalLabels(a1, (uint64_t)v8, (uint64_t)Axis, 0, a2, a3);
  }
LABEL_15:
  CGContextRestoreGState(Type);
}

void OIRender3DOrthoAxisForegroundInChart(uint64_t a1)
{
  const void *Axis;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIChartGetPlotArea(a1);
  v4 = v3;
  v6 = v5;
  v7 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v8 = OIChartGetRotation(a1) / 45.0 * (v4 / v7);
  v9 = OIChartGetElevation(a1) / 90.0 * (v6 / v7);
  _OIRender3DOrthoAxisForegroundInChart(a1, v8, v9);
}

void OIRender3DLayeredOrthoAxisForegroundInChart(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  const void *Axis;
  const __CFArray *SeriesCount;
  double FontSize;
  double v9;
  double v10;

  OIChartGetPlotArea(a1);
  v3 = v2;
  v5 = v4;
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  SeriesCount = OIChartGetSeriesCount(a1);
  FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  v9 = OIChartGetRotation(a1) / 45.0 * (v3 * (double)(uint64_t)SeriesCount / FontSize);
  v10 = v5 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);
  _OIRender3DOrthoAxisForegroundInChart(a1, v9, v10);
}

void OIRender3DFlippedOrthoAxisBackgroundInChart(uint64_t a1)
{
  CGContext *Type;
  double PlotArea;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGColor *GenericRGB;
  CGColor *v11;
  const void *Axis;
  const void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPath *Mutable;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPath *v24;
  double v25;
  CGColor *v26;
  CGPath *v27;
  double v28;
  double v29;
  double PlotStrokeWidth;
  double v31;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
  v11 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
  PlotStrokeWidth = OIChartGetPlotStrokeWidth(a1);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v13 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  v14 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)v13));
  v15 = OIChartGetRotation(a1) / 45.0 * (v7 / v14);
  v16 = OIChartGetElevation(a1) / 90.0 * (v9 / v14);
  v17 = v7 - v15;
  OIAxisUpdateScaleForLength((uint64_t)Axis, v17);
  v28 = v9 - v16;
  OIAxisUpdateScaleForLength((uint64_t)v13, v9 - v16);
  Mutable = CGPathCreateMutable();
  v19 = floor(v5) + 0.5;
  v29 = floor(PlotArea) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v29, v19);
  v20 = floor(PlotArea + v15) + 0.5;
  v31 = v16;
  v21 = floor(v5 + v16) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v20, v21);
  v22 = PlotArea + v17;
  v23 = floor(v15 + v22) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v23, v21);
  CGPathAddLineToPoint(Mutable, 0, floor(v22) + 0.5, v19);
  CGPathCloseSubpath(Mutable);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  v24 = CGPathCreateMutable();
  CGPathMoveToPoint(v24, 0, v20, v21);
  v25 = floor(v31 + v5 + v28) + 0.5;
  CGPathAddLineToPoint(v24, 0, v20, v25);
  CGPathAddLineToPoint(v24, 0, v23, v25);
  CGPathAddLineToPoint(v24, 0, v23, v21);
  CGPathCloseSubpath(v24);
  if (GenericRGB)
  {
    CGContextSetFillColorWithColor(Type, GenericRGB);
    CGContextAddPath(Type, v24);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, v24);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v24);
  v26 = OICreateDimmedColorFromColor(GenericRGB, 0.5);
  v27 = CGPathCreateMutable();
  CGPathMoveToPoint(v27, 0, v29, v19);
  CGPathAddLineToPoint(v27, 0, v29, floor(v5 + v28) + 0.5);
  CGPathAddLineToPoint(v27, 0, v20, v25);
  CGPathAddLineToPoint(v27, 0, v20, v21);
  CGPathCloseSubpath(v27);
  if (v26)
  {
    CGContextSetFillColorWithColor(Type, v26);
    CGContextAddPath(Type, v27);
    CGContextFillPath(Type);
  }
  if (v11)
  {
    CGContextSetStrokeColorWithColor(Type, v11);
    CGContextAddPath(Type, v27);
    CGContextSetLineWidth(Type, PlotStrokeWidth);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v27);
  CGColorRelease(v26);
  if (Axis && OIAxisGetDrawMajorGridlines((uint64_t)Axis))
    _OIAxisRenderVerticallUnitLines(a1, (uint64_t)Axis, v15, v31);
  if (v13 && OIAxisGetDrawMajorGridlines((uint64_t)v13))
    _OIAxisRenderHorizontalUnitLines(a1, (uint64_t)v13, v15, v31);
  CGColorRelease(GenericRGB);
  CGColorRelease(v11);
}

void OIRender3DFlippedOrthoAxisForegroundInChart(uint64_t a1)
{
  CGContext *Type;
  _QWORD *Axis;
  const void *v4;
  uint64_t FontSize;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;

  Type = (CGContext *)OIAxisGetType(a1);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v4 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  FontSize = (uint64_t)OILabelGetFontSize((uint64_t)v4);
  OIChartGetPlotArea(a1);
  v7 = v6;
  v8 = (double)(2 * FontSize);
  v10 = OIChartGetRotation(a1) / 45.0 * (v9 / v8);
  v11 = v7 / v8 * (OIChartGetElevation(a1) / 90.0);
  CGContextSaveGState(Type);
  if (!Axis)
  {
LABEL_4:
    if (!v4)
      goto LABEL_10;
    goto LABEL_5;
  }
  if (OIAxisGetType((uint64_t)Axis))
  {
    _OIAxisRenderHorizontalUnits(a1, (uint64_t)Axis, v10, v12, 0);
    goto LABEL_4;
  }
  _OIAxisRenderHorizontalLabels(a1, Axis, (uint64_t)v4, 0, v10);
  if (!v4)
    goto LABEL_10;
LABEL_5:
  if (OIAxisGetType((uint64_t)v4))
    _OIAxisRenderVerticalUnits(a1, (uint64_t)v4, v10, v11, v13, 0);
  else
    _OIAxisRenderVerticalLabels(a1, (uint64_t)v4, (uint64_t)Axis, 0, v10, v11);
LABEL_10:
  CGContextRestoreGState(Type);
}

void OIRenderRadarAxisBackgroundInChart(uint64_t a1)
{
  CGContext *Type;
  double PlotArea;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  const void *Axis;
  const void *v12;
  double MinValue;
  double v14;
  double Unit;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  __double2 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double FontSize;
  CGSize v34;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OIAxisAreLabelsCentered(a1);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v12 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  CGContextSaveGState(Type);
  CGContextBeginPath(Type);
  if (v10)
  {
    v34.width = 0.0;
    v34.height = 0.0;
    CGContextSetShadow(Type, v34, 0.0);
  }
  CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  CGContextSetLineWidth(Type, 0.3);
  FontSize = OILabelGetFontSize((uint64_t)Axis);
  MinValue = OIAxisGetMinValue((uint64_t)v12);
  v14 = OILabelGetFontSize((uint64_t)v12);
  Unit = OIAxisGetUnit((uint64_t)v12);
  v16 = MinValue / Unit;
  v31 = Unit;
  v17 = v14 / Unit + 1.0;
  v18 = (double)(uint64_t)(MinValue / Unit);
  v32 = v17;
  if (v17 > v18)
  {
    v19 = PlotArea + v7 * 0.5;
    v20 = (uint64_t)v16;
    v21 = v5 + v9 * 0.5;
    v22 = FontSize + 1.0;
    do
    {
      if (v22 > 0.0)
      {
        v23 = 0;
        v24 = v31 * v18;
        v25 = 1;
        do
        {
          v26 = OIAxisConvertValueToLocal((uint64_t)v12, v24) * 0.5;
          v27 = __sincos_stret((double)v23 * -3.14159265 / FontSize + 1.57079633);
          v28 = floor(v19 + v26 * v27.__cosval) + 0.5;
          v29 = floor(v21 + v26 * v27.__sinval) + 0.5;
          if (v25 == 1)
            CGContextMoveToPoint(Type, v28, v29);
          else
            CGContextAddLineToPoint(Type, v28, v29);
          v30 = (double)v25++;
          v23 += 2;
        }
        while (v22 > v30);
      }
      CGContextStrokePath(Type);
      v18 = (double)++v20;
    }
    while (v32 > (double)v20);
  }
  CGContextRestoreGState(Type);
}

void OIRenderRadarAxisForegroundInChart(uint64_t a1)
{
  CGContext *Type;
  double PlotArea;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  const void *v11;
  double v12;
  double FontSize;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  __double2 v19;
  double v20;
  double v21;
  double v22;
  double Scale;
  double Unit;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  unint64_t v32;
  __CFString *v33;
  CTFontRef v34;
  void *v35;
  double MinValue;
  double v37;
  double v38;
  const void *Axis;
  double v40;
  _QWORD v41[8];
  _QWORD v42[2];
  _QWORD v43[4];
  CGSize v44;

  v43[2] = *MEMORY[0x24BDAC8D0];
  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OIAxisAreLabelsCentered(a1);
  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  v11 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  CGContextSaveGState(Type);
  CGContextBeginPath(Type);
  if (v10)
  {
    v44.width = 0.0;
    v44.height = 0.0;
    CGContextSetShadow(Type, v44, 0.0);
  }
  v40 = v5 + v9 * 0.5;
  v12 = PlotArea + v7 * 0.5;
  CGContextSetRGBStrokeColor(Type, 0.0, 0.0, 0.0, 1.0);
  CGContextSetLineWidth(Type, 0.3);
  FontSize = OILabelGetFontSize((uint64_t)Axis);
  MinValue = OIAxisGetMinValue((uint64_t)v11);
  v14 = OILabelGetFontSize((uint64_t)v11);
  if (FontSize > 0.0)
  {
    v15 = 0;
    v37 = floor(v40) + 0.5;
    v38 = floor(v12) + 0.5;
    v16 = 1;
    do
    {
      v17 = v14;
      v18 = OIAxisConvertValueToLocal((uint64_t)v11, v14) * 0.5;
      v19 = __sincos_stret((double)v15 * -3.14159265 / FontSize + 1.57079633);
      v20 = v12 + v18 * v19.__cosval;
      CGContextMoveToPoint(Type, v38, v37);
      v21 = floor(v40 + v18 * v19.__sinval);
      v14 = v17;
      CGContextAddLineToPoint(Type, floor(v20) + 0.5, v21 + 0.5);
      v22 = (double)v16++;
      v15 += 2;
    }
    while (FontSize > v22);
  }
  CGContextStrokePath(Type);
  Scale = OIAxisGetScale((uint64_t)v11);
  Unit = OIAxisGetUnit((uint64_t)v11);
  v25 = v14 / Unit + 1.0;
  v26 = (double)(uint64_t)(MinValue / Unit);
  if (v25 > v26)
  {
    v27 = fmin(Scale * Unit, 10.0);
    v28 = *MEMORY[0x24BDC4C28];
    v29 = *MEMORY[0x24BDC4EE0];
    v30 = (uint64_t)(MinValue / Unit) + 1;
    do
    {
      v31 = Unit * v26;
      v32 = 0x24BDD1000uLL;
      if (v14 >= 1.0)
      {
        LODWORD(v32) = llround(v31);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v32);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f,1"), *(_QWORD *)&v31);
      }
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v42[0] = v28;
      v34 = OICreateDefaultFontWithSize(v27);
      v42[1] = v29;
      v43[0] = v34;
      v43[1] = OIAxisGetTextColor((uint64_t)Axis);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __OIRenderRadarAxisForegroundInChart_block_invoke;
      v41[3] = &__block_descriptor_64_e29__CGPoint_dd_24__0_CGSize_dd_8l;
      v41[4] = v11;
      *(double *)&v41[5] = v31;
      *(double *)&v41[6] = v12;
      *(double *)&v41[7] = v40;
      OIDrawStringWithAttributes(v33, v35, Type, v41);

      v26 = (double)v30++;
    }
    while (v25 > v26);
  }
  CGContextRestoreGState(Type);
}

__CFArray *_OIAxisRenderBuildStringArrayAndComputeWidth(void *a1, uint64_t a2, CGFloat a3, uint64_t a4, double *a5)
{
  uint64_t (**v8)(id, uint64_t, char *);
  __CFArray *Mutable;
  const void *v10;
  double v11;
  const __CFString *v12;
  const __CFString *v13;
  double v14;
  char v16;

  v8 = a1;
  v16 = 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v10 = (const void *)*MEMORY[0x24BDBD430];
  v11 = 0.0;
  do
  {
    v12 = (const __CFString *)v8[2](v8, a2, &v16);
    if (v16)
      break;
    v13 = v12;
    if (v12)
    {
      CFArrayAppendValue(Mutable, v12);
      CFRelease(v13);
    }
    else
    {
      CFArrayAppendValue(Mutable, v10);
    }
    v14 = OISizeForStringInContext(v13, a3) + 2.0;
    if (v14 > v11)
      v11 = v14;
    ++a2;
  }
  while (!v16);
  if (a5)
    *a5 = v11;

  return Mutable;
}

CFStringRef OIFormatterCreateStringFromDouble(const __CFString *a1, double a2)
{
  const __CFLocale *v3;
  const __CFAllocator *v4;
  __CFNumberFormatter *v5;
  __CFNumberFormatter *v6;
  CFStringRef v7;
  double valuePtr;

  valuePtr = a2;
  v3 = CFLocaleCopyCurrent();
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, kCFNumberFormatterDecimalStyle);
  v6 = v5;
  if (a1)
    CFNumberFormatterSetFormat(v5, a1);
  CFRelease(v3);
  v7 = CFNumberFormatterCreateStringWithValue(v4, v6, kCFNumberDoubleType, &valuePtr);
  CFRelease(v6);
  return v7;
}

CFStringRef OIFormatterCreateDateStringFromDouble(const __CFString *a1, CFAbsoluteTime a2)
{
  const __CFLocale *v4;
  const __CFAllocator *v5;
  __CFDateFormatter *v6;
  __CFDateFormatter *v7;
  const __CFDate *v8;
  CFStringRef StringWithDate;

  v4 = CFLocaleCopyCurrent();
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  v7 = v6;
  if (a1)
    CFDateFormatterSetFormat(v6, a1);
  CFRelease(v4);
  v8 = CFDateCreate(v5, a2);
  StringWithDate = CFDateFormatterCreateStringWithDate(v5, v7, v8);
  CFRelease(v7);
  CFRelease(v8);
  return StringWithDate;
}

CFStringRef OIFormatterCreatePercentStringFromDouble(const __CFString *a1, double a2)
{
  const __CFLocale *v3;
  const __CFAllocator *v4;
  __CFNumberFormatter *v5;
  __CFNumberFormatter *v6;
  CFNumberRef v7;
  CFStringRef v8;
  uint64_t v10;
  double valuePtr;

  valuePtr = a2;
  v3 = CFLocaleCopyCurrent();
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, kCFNumberFormatterPercentStyle);
  v6 = v5;
  if (a1)
    CFNumberFormatterSetFormat(v5, a1);
  v10 = 0x3FF0000000000000;
  v7 = CFNumberCreate(v4, kCFNumberFloatType, &v10);
  CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x24BDBD4E0], v7);
  CFRelease(v7);
  CFRelease(v3);
  v8 = CFNumberFormatterCreateStringWithValue(v4, v6, kCFNumberDoubleType, &valuePtr);
  CFRelease(v6);
  return v8;
}

uint64_t OIFormatterCreateStringUsingCustomFormatter(uint64_t a1, uint64_t (*a2)(void))
{
  if (a2)
    return a2();
  CFShow(CFSTR("formatterCallback not defined"));
  return 0;
}

_QWORD *_OIErrorBarRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  ++*a2;
  return result;
}

void _OIErrorBarRelease(uint64_t a1, _QWORD *a2)
{
  OIErrorBarRelease(a2);
}

double OIErrorBarCreate()
{
  const __CFAllocator *Default;
  _QWORD *v1;
  double result;

  Default = CFAllocatorGetDefault();
  v1 = CFAllocatorAllocate(Default, 24, 0);
  *v1 = 1;
  *(_QWORD *)&result = 0x200000000;
  v1[1] = 0x200000000;
  v1[2] = 0x3FF0000000000000;
  return result;
}

void OIErrorBarRelease(_QWORD *a1)
{
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

_QWORD *OIErrorBarCreateFromDictionary(const __CFDictionary *a1)
{
  const __CFAllocator *Default;
  _QWORD *v3;
  const __CFNumber *Value;
  int v5;
  int v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  double v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t valuePtr;

  if (!a1)
    return 0;
  Default = CFAllocatorGetDefault();
  v3 = CFAllocatorAllocate(Default, 24, 0);
  *v3 = 1;
  v3[1] = 0x200000000;
  v3[2] = 0x3FF0000000000000;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesErrorBarTypeKey"));
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
    v5 = valuePtr;
  }
  else
  {
    v5 = 0;
  }
  *((_DWORD *)v3 + 2) = v5;
  v6 = 2;
  v12 = 2;
  v7 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesErrorBarValueTypeKey"));
  if (v7)
  {
    CFNumberGetValue(v7, kCFNumberNSIntegerType, &v12);
    v6 = v12;
  }
  *((_DWORD *)v3 + 3) = v6;
  v11 = 0x3FF0000000000000;
  v8 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesErrorBarValueKey"));
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberCGFloatType, &v11);
    v9 = *(double *)&v11;
  }
  else
  {
    v9 = 1.0;
  }
  *((double *)v3 + 2) = v9;
  return v3;
}

uint64_t OIErrorBarSetType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t OIErrorBarSetValueType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  return result;
}

uint64_t OIErrorBarSetValue(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  return result;
}

uint64_t OIErrorBarGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t OIErrorBarGetValueType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

double OIErrorBarGetValue(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

_QWORD *_OIAxisRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  ++*a2;
  return result;
}

void _OIAxisRelease(uint64_t a1, _QWORD *a2)
{
  OIAxisRelease(a2);
}

char *_OIAxisCreate()
{
  const __CFAllocator *Default;
  char *v1;

  Default = CFAllocatorGetDefault();
  v1 = (char *)CFAllocatorAllocate(Default, 176, 0);
  *(_QWORD *)v1 = 1;
  *((_QWORD *)v1 + 12) = 0;
  v1[72] = 0;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *((_QWORD *)v1 + 15) = 0;
  *((_QWORD *)v1 + 16) = 0;
  *((_QWORD *)v1 + 14) = 0;
  v1[104] = 1;
  v1[136] = 0;
  *((_QWORD *)v1 + 19) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((_QWORD *)v1 + 18) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  *((_QWORD *)v1 + 20) = 0x3FF0000000000000;
  v1[168] = 0;
  return v1;
}

double OIAxisCreateWithLabelCount(uint64_t a1)
{
  char *v2;
  double result;

  v2 = _OIAxisCreate();
  *((_QWORD *)v2 + 2) = 0;
  *((_QWORD *)v2 + 5) = 0;
  result = (double)a1;
  *((double *)v2 + 6) = (double)a1;
  *((_QWORD *)v2 + 7) = 0x3FF0000000000000;
  return result;
}

double OIAxisCreateWithRange(double a1, double a2)
{
  char *v4;
  double result;

  v4 = _OIAxisCreate();
  *((_QWORD *)v4 + 2) = 1;
  *((double *)v4 + 5) = a1;
  *((double *)v4 + 6) = a2;
  result = fabs((a2 - a1) / 5.0);
  *((double *)v4 + 7) = result;
  return result;
}

void OIAxisRelease(_QWORD *a1)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  CGColor *v7;
  CGColor *v8;
  const void *v9;
  const void *v10;
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[1];
      if (v3)
        CFRelease(v3);
      v4 = (const void *)a1[4];
      if (v4)
        CFRelease(v4);
      v5 = (const void *)a1[12];
      if (v5)
        CFRelease(v5);
      v6 = (const void *)a1[14];
      if (v6)
        CFRelease(v6);
      v7 = (CGColor *)a1[18];
      if (v7)
        CGColorRelease(v7);
      v8 = (CGColor *)a1[19];
      if (v8)
        CGColorRelease(v8);
      v9 = (const void *)a1[15];
      if (v9)
        CFRelease(v9);
      v10 = (const void *)a1[16];
      if (v10)
        CFRelease(v10);
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

uint64_t _OIAxisGetMinMaxFromArray(uint64_t result, double *a2, double *a3)
{
  const __CFArray *v5;
  uint64_t v6;
  CFIndex v7;
  double v8;
  double v9;
  const __CFNumber *ValueAtIndex;
  double v11;
  double v12;
  double valuePtr;

  if (result)
  {
    v5 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    if (result < 1)
    {
      v9 = 2.22507386e-308;
      v8 = 1.79769313e308;
    }
    else
    {
      v6 = result;
      v7 = 0;
      v8 = 1.79769313e308;
      v9 = 2.22507386e-308;
      do
      {
        valuePtr = 0.0;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v5, v7);
        result = CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
        if (valuePtr > v9)
          v9 = valuePtr;
        if (valuePtr < v8)
          v8 = valuePtr;
        ++v7;
      }
      while (v6 != v7);
    }
    v11 = 0.0;
    if (v8 != 1.79769313e308)
      v11 = v8;
    v12 = 1.0;
    if (v9 != 2.22507386e-308)
      v12 = v9;
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }
  *a2 = v11;
  *a3 = v12;
  return result;
}

const __CFNumber *OIAxisUpdateWithDictionaryDescription(const __CFNumber *result, CFDictionaryRef theDict)
{
  uint64_t v3;
  const __CFNumber *Value;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID v13;
  CFNumberRef v14;
  const void *v15;
  uint64_t v16;
  const __CFNumber *v17;
  double v18;
  const __CFNumber *v19;
  double v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFArray *v24;
  CFIndex v25;
  uint64_t v26;
  CFIndex j;
  const __CFNumber *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  CFIndex v33;
  const __CFNumber *v34;
  const __CFNumber *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  const __CFNumber *v43;
  CGColor *v44;
  CGColor *v45;
  CGColor *v46;
  const __CFNumber *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  CGColor *v51;
  CGColor *v52;
  CGColor *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double valuePtr;
  double v61;

  if (!result || !theDict)
    return result;
  v3 = (uint64_t)result;
  v61 = 0.0;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisValueTypeKey"));
  if (Value)
  {
    LODWORD(valuePtr) = 0;
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      v5 = 3;
      if (LODWORD(valuePtr) != 3)
        v5 = 1;
      v6 = 2;
      if (LODWORD(valuePtr) != 2)
        v6 = v5;
      *(_QWORD *)(v3 + 16) = v6;
    }
  }
  v7 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisValuesKey"));
  if (v7)
  {
    v8 = v7;
    Count = CFArrayGetCount(v7);
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, i);
        v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFNumberGetTypeID())
        {
          CFArrayInsertValueAtIndex(Mutable, i, ValueAtIndex);
        }
        else
        {
          LODWORD(valuePtr) = 0;
          v14 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
          CFArrayInsertValueAtIndex(Mutable, i, v14);
          CFRelease(v14);
        }
      }
    }
  }
  else
  {
    Mutable = 0;
  }
  *(_QWORD *)(v3 + 112) = Mutable;
  v15 = CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisLabelsKey"));
  *(_QWORD *)(v3 + 96) = v15;
  if (v15)
    CFRetain(v15);
  if (*(_QWORD *)(v3 + 24) != 3)
  {
    v16 = *(_QWORD *)(v3 + 16);
    switch(v16)
    {
      case 3:
        goto LABEL_25;
      case 2:
        v24 = *(const __CFArray **)(v3 + 96);
        if (v24)
        {
          v25 = CFArrayGetCount(v24);
          *(_OWORD *)(v3 + 40) = xmmword_22FA26D00;
          if (v25 < 1)
          {
            *(_QWORD *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
            v31 = 2.22507386e-308;
            v37 = 1.79769313e308;
            v30 = 1.79769313e308;
          }
          else
          {
            v26 = v25;
            for (j = 0; j != v26; ++j)
            {
              valuePtr = 0.0;
              v28 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), j);
              CFNumberGetValue(v28, kCFNumberCGFloatType, &valuePtr);
              v29 = valuePtr;
              v30 = *(double *)(v3 + 40);
              if (valuePtr < v30)
              {
                *(double *)(v3 + 40) = valuePtr;
                v30 = v29;
              }
              v31 = *(double *)(v3 + 48);
              if (v29 > v31)
              {
                *(double *)(v3 + 48) = v29;
                v31 = v29;
              }
            }
            *(_QWORD *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
            v32 = v26 - 2;
            if (v26 < 2)
            {
              v37 = 1.79769313e308;
            }
            else
            {
              v33 = 0;
              do
              {
                v59 = 0.0;
                valuePtr = 0.0;
                v34 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), v33);
                CFNumberGetValue(v34, kCFNumberCGFloatType, &valuePtr);
                v35 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), ++v33);
                CFNumberGetValue(v35, kCFNumberCGFloatType, &v59);
                if (v59 - valuePtr != 0.0)
                {
                  v36 = vabdd_f64(v59, valuePtr);
                  if (v36 < *(double *)(v3 + 56))
                    *(double *)(v3 + 56) = v36;
                }
              }
              while (v33 - 1 != v32);
              v30 = *(double *)(v3 + 40);
              v31 = *(double *)(v3 + 48);
              v37 = *(double *)(v3 + 56);
            }
          }
          *(_QWORD *)(v3 + 88) = (uint64_t)(ceil((v31 - v30) / v37) + 1.0);
          *(_BYTE *)(v3 + 104) = 1;
        }
        else
        {
          v39 = *(double *)(v3 + 40);
          v38 = *(double *)(v3 + 48);
          v40 = (v38 - v39) / 6.0;
          v41 = v39 - v40;
          v42 = v38 + v40;
          *(double *)(v3 + 40) = v41;
          *(double *)(v3 + 48) = v42;
          *(double *)(v3 + 56) = v40;
          *(_QWORD *)(v3 + 88) = (uint64_t)(ceil((v42 - v41) / v40) + 1.0);
        }
        break;
      case 1:
LABEL_25:
        OIAxisImproveAxisRange(v3);
        v59 = 0.0;
        valuePtr = 0.0;
        _OIAxisGetMinMaxFromArray(*(_QWORD *)(v3 + 112), &valuePtr, &v59);
        if (valuePtr != 0.0 || v59 != 0.0)
          _OIAxisImproveAxisRange(&valuePtr, &v59, 0);
        v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisMinKey"));
        v61 = 0.0;
        if (!v17 || (CFNumberGetValue(v17, kCFNumberCGFloatType, &v61), v18 = v61, v61 == 0.0))
        {
          if (!*(_QWORD *)(v3 + 112))
          {
LABEL_33:
            v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisMaxKey"));
            v61 = 0.0;
            if (!v19 || (CFNumberGetValue(v19, kCFNumberCGFloatType, &v61), v20 = v61, v61 == 0.0))
            {
              if (!*(_QWORD *)(v3 + 112))
                goto LABEL_38;
              v20 = v59;
            }
            *(double *)(v3 + 48) = v20;
LABEL_38:
            v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisUnitKey"));
            if (v21)
            {
              v61 = 0.0;
              CFNumberGetValue(v21, kCFNumberCGFloatType, &v61);
              if (v61 > 0.0)
                *(double *)(v3 + 56) = v61;
            }
            v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisHasLogarithmicScaleKey"));
            if (v22)
              CFNumberGetValue(v22, kCFNumberSInt8Type, (void *)(v3 + 72));
            v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisCenterLabelsKey"));
            if (v23)
              CFNumberGetValue(v23, kCFNumberSInt8Type, (void *)(v3 + 104));
            break;
          }
          v18 = valuePtr;
        }
        *(double *)(v3 + 40) = v18;
        goto LABEL_33;
    }
  }
  v43 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisHideTextKey"));
  if (v43)
    CFNumberGetValue(v43, kCFNumberSInt8Type, (void *)(v3 + 136));
  v44 = (CGColor *)CFDictionaryGetValue(theDict, CFSTR("kOIChartStrokeColorKey"));
  if (v44)
  {
    v45 = v44;
    v46 = *(CGColor **)(v3 + 144);
    if (v46)
      CGColorRelease(v46);
    *(_QWORD *)(v3 + 144) = CGColorRetain(v45);
  }
  v47 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartStrokeWidthKey"));
  if (v47)
    CFNumberGetValue(v47, kCFNumberCGFloatType, (void *)(v3 + 160));
  v48 = CFDictionaryGetValue(theDict, CFSTR("kOIChartLabelKey"));
  *(_QWORD *)(v3 + 32) = v48;
  if (v48)
    CFRetain(v48);
  v49 = CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisValueFormatKey"));
  *(_QWORD *)(v3 + 120) = v49;
  if (v49)
    CFRetain(v49);
  v50 = CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisCustomFormatterKey"));
  *(_QWORD *)(v3 + 128) = v50;
  if (v50)
    CFRetain(v50);
  v51 = (CGColor *)CFDictionaryGetValue(theDict, CFSTR("kOIChartTextColorKey"));
  if (v51)
  {
    v52 = v51;
    v53 = *(CGColor **)(v3 + 152);
    if (v53)
      CGColorRelease(v53);
    *(_QWORD *)(v3 + 152) = CGColorRetain(v52);
  }
  result = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisDrawMajorGridlines"));
  if (result)
    result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt8Type, (void *)(v3 + 168));
  v54 = *(double *)(v3 + 40);
  v55 = *(double *)(v3 + 48);
  if (v54 <= v55)
  {
    v56 = *(double *)(v3 + 48);
    if (v54 == v55)
    {
      *(_OWORD *)(v3 + 40) = xmmword_22FA26D10;
      v54 = 0.0;
      v56 = 100.0;
    }
  }
  else
  {
    *(double *)(v3 + 40) = v55;
    *(double *)(v3 + 48) = v54;
    v56 = v54;
    v54 = v55;
  }
  v57 = *(double *)(v3 + 56);
  v58 = vabdd_f64(v56, v54) / 100.0;
  if (v57 < v58)
  {
    *(double *)(v3 + 56) = v58;
    v57 = v58;
  }
  if (v57 == 0.0)
  {
    v57 = (fabs(v56) - fabs(v54)) / 5.0;
    *(double *)(v3 + 56) = v57;
  }
  if (v57 < 0.0)
    *(double *)(v3 + 56) = fabs(v57);
  if (*(_BYTE *)(v3 + 72) && v54 <= 0.0 && v56 > 1.0)
    *(_QWORD *)(v3 + 40) = 0x3FF0000000000000;
  return result;
}

void OIAxisImproveAxisRange(uint64_t a1)
{
  if (a1 && (*(_QWORD *)(a1 + 16) | 2) == 3 && *(_QWORD *)(a1 + 24) != 3)
    _OIAxisImproveAxisRange((double *)(a1 + 40), (double *)(a1 + 48), (double *)(a1 + 56));
}

void _OIAxisImproveAxisRange(double *a1, double *a2, double *a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  _OIAxisRoundUpValue(&v10, *a2);
  *(_QWORD *)a2 = v6;
  _OIAxisRoundDownValue(&v11, *a1);
  *a1 = v7;
  v8 = *a2;
  if (v7 > 0.0 && v8 > 0.0 && v7 < v8 * 9.0 / 10.0)
  {
    *a1 = 0.0;
    v8 = *a2;
    v7 = 0.0;
LABEL_10:
    if (v8 != v7)
      goto LABEL_16;
    if (v8 > 0.0)
    {
      *a1 = 0.0;
      if (!a3)
        return;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v7 >= 0.0 || v8 >= 0.0 || v8 <= v7 * 9.0 / 10.0)
    goto LABEL_10;
  *a2 = 0.0;
  v7 = *a1;
  if (*a1 != 0.0)
  {
LABEL_16:
    if (!a3)
      return;
    goto LABEL_17;
  }
LABEL_14:
  if (v7 < 0.0)
  {
    *a2 = 0.0;
    goto LABEL_16;
  }
  *a2 = 1.0;
  if (!a3)
    return;
LABEL_17:
  v9 = v11;
  if (v10 > v11)
    v9 = v10;
  *a3 = v9;
}

void _OIAxisRoundUpValue(double *a1, double a2)
{
  double v4;
  long double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = 0.0;
  if (a2 == 0.0)
    goto LABEL_24;
  v5 = fabs(a2);
  v6 = log10(v5);
  v7 = __exp10(trunc(v6));
  v8 = v5 / v7;
  v9 = 2.0;
  if (a2 >= 0.0)
  {
    if (v8 < 2.0)
    {
      v10 = v7 * 0.4;
      goto LABEL_21;
    }
    v9 = 4.0;
    if (v8 >= 4.0)
    {
      v9 = 5.0;
      v10 = v7;
      if (v8 >= 5.0)
      {
        v9 = 6.0;
        v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          v9 = 8.0;
          if (v8 >= 8.0)
            v9 = 10.0;
        }
      }
      goto LABEL_21;
    }
LABEL_10:
    v10 = v7;
    goto LABEL_21;
  }
  if (v8 >= 2.0)
  {
    v9 = 4.0;
    if (v8 >= 4.0)
    {
      v10 = v7;
      if (v8 >= 5.0)
      {
        v9 = 6.0;
        v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          if (v8 >= 8.0)
            v9 = 8.0;
        }
        else
        {
          v9 = 5.0;
        }
      }
      goto LABEL_21;
    }
    v9 = 2.0;
    goto LABEL_10;
  }
  v10 = v7 * 0.4;
  v9 = 0.0;
LABEL_21:
  v11 = fabs(v7 * v9);
  if (!a1)
    return;
  v12 = v11 == INFINITY;
  v4 = 2.0e307;
  if (!v12)
    v4 = v10;
LABEL_24:
  *a1 = v4;
}

void _OIAxisRoundDownValue(double *a1, double a2)
{
  double v4;
  long double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = 0.0;
  if (a2 == 0.0)
    goto LABEL_24;
  v5 = fabs(a2);
  v6 = log10(v5);
  v7 = __exp10(trunc(v6));
  v8 = v5 / v7;
  v9 = 2.0;
  if (a2 < 0.0)
  {
    if (v8 < 2.0)
    {
      v10 = v7 * 0.4;
      goto LABEL_21;
    }
    v9 = 4.0;
    if (v8 >= 4.0)
    {
      v9 = 5.0;
      v10 = v7;
      if (v8 >= 5.0)
      {
        v9 = 6.0;
        v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          v9 = 8.0;
          if (v8 >= 8.0)
            v9 = 10.0;
        }
      }
      goto LABEL_21;
    }
LABEL_10:
    v10 = v7;
    goto LABEL_21;
  }
  if (v8 >= 2.0)
  {
    v9 = 4.0;
    if (v8 >= 4.0)
    {
      v10 = v7;
      if (v8 >= 5.0)
      {
        v9 = 6.0;
        v10 = v7 + v7;
        if (v8 >= 6.0)
        {
          if (v8 >= 8.0)
            v9 = 8.0;
        }
        else
        {
          v9 = 5.0;
        }
      }
      goto LABEL_21;
    }
    v9 = 2.0;
    goto LABEL_10;
  }
  v10 = v7 * 0.4;
  v9 = 0.0;
LABEL_21:
  v11 = fabs(v7 * v9);
  if (!a1)
    return;
  v12 = v11 == INFINITY;
  v4 = 2.0e307;
  if (!v12)
    v4 = v10;
LABEL_24:
  *a1 = v4;
}

double _OIAxisBestUnit(double a1, double a2, double a3, double a4)
{
  if (a4 <= a3)
    return a3;
  else
    return a4;
}

void OIAxisUpdateScaleForLength(uint64_t a1, double a2)
{
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v4 = *(double *)(a1 + 48) - *(double *)(a1 + 40);
      if (v4 != 1.0)
      {
        v5 = v4;
        v6 = log10f(v5);
LABEL_12:
        a2 = a2 / v6;
      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 16) == 2)
      {
        v6 = (double)*(uint64_t *)(a1 + 88);
        goto LABEL_12;
      }
      if (!*(_BYTE *)(a1 + 104) && *(_QWORD *)(a1 + 96))
      {
        v6 = *(double *)(a1 + 48) + -1.0 - *(double *)(a1 + 40);
        goto LABEL_12;
      }
      v8 = *(double *)(a1 + 40);
      v7 = *(double *)(a1 + 48);
      if (v7 != v8)
      {
        v6 = v7 - v8;
        goto LABEL_12;
      }
    }
    *(double *)(a1 + 64) = a2;
  }
}

double OIAxisConvertValueToLocal(uint64_t a1, double result)
{
  double v2;
  double v4;
  double v5;
  float v6;

  v2 = result;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16) == 2)
    {
      v4 = *(double *)(a1 + 64);
      v5 = (v2 - *(double *)(a1 + 40)) / *(double *)(a1 + 56);
    }
    else
    {
      result = *(double *)(a1 + 40);
      v5 = v2 - result;
      if (*(_BYTE *)(a1 + 72) && v5 > 0.0)
      {
        if (v5 == 1.0)
          return result;
        v6 = v5;
        v4 = log10f(v6);
        v5 = *(double *)(a1 + 64);
      }
      else
      {
        v4 = *(double *)(a1 + 64);
      }
    }
    return round(v5 * v4);
  }
  return result;
}

uint64_t OIAxisSetType(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t OIAxisGetType(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t OIAxisSetSubType(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t OIAxisGetSubType(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t OIAxisSetMinValue(uint64_t result, double a2)
{
  *(double *)(result + 40) = a2;
  return result;
}

double OIAxisGetMinValue(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

uint64_t OIAxisSetUnit(uint64_t result, double a2)
{
  *(double *)(result + 56) = a2;
  return result;
}

double OIAxisGetUnit(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double OIAxisGetScale(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

const __CFArray *OIAxisGetValueCount(_QWORD *a1)
{
  uint64_t v1;
  const __CFArray *result;

  v1 = a1[2];
  if (v1 == 2)
    return (const __CFArray *)a1[11];
  if (v1)
    return 0;
  result = (const __CFArray *)a1[12];
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

uint64_t OIAxisAreLabelsCentered(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 104);
}

uint64_t OIAxisIsLogarithmic(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 72);
}

uint64_t OIAxisIsHidden(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 136);
}

uint64_t OIAxisGetLabel(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t OIAxisGetLabels(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t OIAxisGetValues(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t OIAxisGetTextColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 152);
}

CGColor *OIAxisSetStrokeColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 144);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 144) = result;
  }
  return result;
}

uint64_t OIAxisGetStrokeColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

double OIAxisGetStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 160);
}

uint64_t OIAxisGetICUFormating(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t OIAxisGetCustomNumberFormatter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 128);
}

uint64_t OIAxisSetDrawMajorGridlines(uint64_t result, char a2)
{
  *(_BYTE *)(result + 168) = a2;
  return result;
}

uint64_t OIAxisGetDrawMajorGridlines(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 168);
}

void OIRenderDoughnutInChart(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count;
  uint64_t v5;
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  CFIndex v16;
  uint64_t v17;
  const void *ValueAtIndex;
  const __CFArray *Values;
  CFIndex v20;
  uint64_t v21;
  double v22;
  CFIndex v23;
  CFIndex v24;
  double v25;
  const void *v26;
  const __CFArray *v27;
  const __CFArray *v28;
  const __CFNumber *v29;
  CFIndex v30;
  CFIndex v31;
  double v32;
  double v33;
  double v34;
  const void *v35;
  const __CFArray *v36;
  uint64_t TextColor;
  uint64_t StrokeColor;
  double Offset;
  double v40;
  const __CFNumber *v41;
  double v42;
  double v43;
  double v44;
  __double2 v45;
  CGFloat v46;
  __double2 v47;
  CGFloat v48;
  double v49;
  __double2 v50;
  CGPathDrawingMode v51;
  BOOL v52;
  double v53;
  double v54;
  double v55;
  double valuePtr;
  CGSize v57;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = OIAxisAreLabelsCentered(a1);
      if (v5 >= 1)
      {
        v15 = v14;
        v16 = 0;
        v17 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, v16);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          if (Values)
          {
            v20 = CFArrayGetCount(Values);
            v21 = v20 <= v17 ? v17 : v20;
            if (v20)
              v17 = v21;
          }
          ++v16;
        }
        while (v5 != v16);
        if (v17)
        {
          CGContextSaveGState(Type);
          if (v11 >= v13)
            v22 = v13;
          else
            v22 = v11;
          if (v15)
          {
            v57.width = 0.0;
            v57.height = -4.0;
            CGContextSetShadow(Type, v57, 6.0);
          }
          if (v17 >= 1)
          {
            v23 = 0;
            v54 = v9 + v13 * 0.5;
            v55 = PlotArea + v11 * 0.5;
            v53 = v22 * 0.9 * 0.5 / (double)(v17 + 1);
            do
            {
              v24 = 0;
              v25 = 0.0;
              do
              {
                v26 = CFArrayGetValueAtIndex(theArray, v24);
                v27 = (const __CFArray *)OISeriesGetValues((uint64_t)v26);
                if (v27)
                {
                  v28 = v27;
                  if (v23 < CFArrayGetCount(v27))
                  {
                    v29 = (const __CFNumber *)CFArrayGetValueAtIndex(v28, v23);
                    valuePtr = 0.0;
                    CFNumberGetValue(v29, kCFNumberCGFloatType, &valuePtr);
                    v25 = v25 + fabs(valuePtr);
                  }
                }
                ++v24;
              }
              while (v5 != v24);
              if (v25 == 0.0)
              {
                v30 = v23 + 1;
              }
              else
              {
                v31 = 0;
                v32 = 1.57079633;
                v33 = v53 * (double)(v23 + 1);
                v34 = v53 * (double)(v23 + 2);
                do
                {
                  v35 = CFArrayGetValueAtIndex(theArray, v31);
                  v36 = (const __CFArray *)OISeriesGetValues((uint64_t)v35);
                  TextColor = OILabelGetTextColor((uint64_t)v35);
                  StrokeColor = OILabelGetStrokeColor((uint64_t)v35);
                  Offset = OISeriesGetOffset((uint64_t)v35);
                  if (v36 && (v40 = Offset, v23 < CFArrayGetCount(v36)))
                  {
                    v41 = (const __CFNumber *)CFArrayGetValueAtIndex(v36, v23);
                    valuePtr = 0.0;
                    CFNumberGetValue(v41, kCFNumberCGFloatType, &valuePtr);
                    v42 = fabs(valuePtr);
                    valuePtr = v42;
                    v43 = 0.0;
                    v44 = 0.0;
                    if (v23 >= v17 - 1)
                    {
                      v45 = __sincos_stret(v32 + v42 * -3.14159265 / v25);
                      v43 = v40 * v45.__cosval;
                      v44 = v40 * v45.__sinval;
                    }
                    v46 = v55 + v43;
                    v47 = __sincos_stret(v32);
                    v48 = v54 + v44;
                    CGContextMoveToPoint(Type, v46 + v33 * v47.__cosval, v48 + v33 * v47.__sinval);
                    CGContextAddLineToPoint(Type, v46 + v34 * v47.__cosval, v48 + v34 * v47.__sinval);
                    v49 = v32 + valuePtr / v25 * -6.28318531;
                    CGContextAddArc(Type, v46, v48, v34, v32, v49, 1);
                    v50 = __sincos_stret(v49);
                    CGContextAddLineToPoint(Type, v46 + v33 * v50.__cosval, v48 + v33 * v50.__sinval);
                    CGContextAddArc(Type, v46, v48, v33, v49, v32, 0);
                    OISeriesSetupStrokeAndFillForContext((uint64_t)v35, Type);
                    if (StrokeColor | TextColor)
                    {
                      if (StrokeColor && TextColor)
                      {
                        v51 = kCGPathFillStroke;
                      }
                      else if (TextColor || !StrokeColor)
                      {
                        if (StrokeColor)
                          v52 = 1;
                        else
                          v52 = TextColor == 0;
                        if (v52)
                          v51 = kCGPathFillStroke;
                        else
                          v51 = kCGPathFill;
                      }
                      else
                      {
                        v51 = kCGPathStroke;
                      }
                      CGContextDrawPath(Type, v51);
                    }
                  }
                  else
                  {
                    v49 = v32;
                  }
                  ++v31;
                  v32 = v49;
                }
                while (v5 != v31);
                v30 = v23 + 1;
              }
              v23 = v30;
            }
            while (v30 != v17);
          }
          CGContextRestoreGState(Type);
        }
      }
    }
  }
}

char *OIChartCreate(const __CFAllocator *Default, CGContext *a2, double a3, double a4)
{
  char *v5;
  const __CFAllocator *v8;
  const CFDictionaryKeyCallBacks *v9;
  const CFDictionaryValueCallBacks *v10;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v12;

  if (!a2)
    return 0;
  v5 = 0;
  if (a3 > 0.0 && a4 > 0.0)
  {
    v8 = Default;
    if (!Default)
      Default = CFAllocatorGetDefault();
    v5 = (char *)CFAllocatorAllocate(Default, 312, 0);
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
    *(_OWORD *)(v5 + 232) = 0u;
    v5[104] = 1;
    *(_QWORD *)v5 = 1;
    *((_QWORD *)v5 + 1) = v8;
    *((_DWORD *)v5 + 68) = 0;
    *((double *)v5 + 3) = a3;
    *((double *)v5 + 4) = a4;
    *((_QWORD *)v5 + 2) = CGContextRetain(a2);
    *((_QWORD *)v5 + 32) = 0;
    *((_QWORD *)v5 + 33) = 0;
    *((_QWORD *)v5 + 35) = 15;
    *((_QWORD *)v5 + 36) = 20;
    *((_QWORD *)v5 + 14) = OIColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0);
    *((_QWORD *)v5 + 15) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    *((_QWORD *)v5 + 16) = 0x4000000000000000;
    *((_QWORD *)v5 + 17) = 0;
    *((_QWORD *)v5 + 18) = 0;
    *((_QWORD *)v5 + 19) = 0x3FF0000000000000;
    *((_QWORD *)v5 + 20) = 0;
    *((_QWORD *)v5 + 21) = 0;
    *((_QWORD *)v5 + 22) = 0x3FF0000000000000;
    *((_QWORD *)v5 + 23) = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
    v5[192] = 0;
    *((_QWORD *)v5 + 25) = -1;
    *((_WORD *)v5 + 148) = 0;
    v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    *((_QWORD *)v5 + 26) = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], &OIAxisDictionaryValueCallbacks);
    *((_QWORD *)v5 + 31) = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    Mutable = CFDictionaryCreateMutable(0, 0, v9, MEMORY[0x24BDBD6B0]);
    CFArrayAppendValue(*((CFMutableArrayRef *)v5 + 31), Mutable);
    CFRelease(Mutable);
    v12 = CFDictionaryCreateMutable(0, 0, v9, v10);
    CFArrayAppendValue(*((CFMutableArrayRef *)v5 + 31), v12);
    CFRelease(v12);
    *((_QWORD *)v5 + 38) = 0;
    OIChartSetupRendererMapping((uint64_t)v5);
  }
  return v5;
}

void OIChartRelease(_QWORD *ptr)
{
  CGContext *v3;
  CGColor *v4;
  CGColor *v5;
  CGColor *v6;
  CGColor *v7;
  CGColor *v8;
  CGColor *v9;
  CGColor *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const __CFAllocator *Default;

  if (ptr)
  {
    if ((*ptr)-- == 1)
    {
      v3 = (CGContext *)ptr[2];
      if (v3)
        CGContextRelease(v3);
      v4 = (CGColor *)ptr[14];
      if (v4)
        CGColorRelease(v4);
      v5 = (CGColor *)ptr[15];
      if (v5)
        CGColorRelease(v5);
      v6 = (CGColor *)ptr[17];
      if (v6)
        CGColorRelease(v6);
      v7 = (CGColor *)ptr[18];
      if (v7)
        CGColorRelease(v7);
      v8 = (CGColor *)ptr[20];
      if (v8)
        CGColorRelease(v8);
      v9 = (CGColor *)ptr[21];
      if (v9)
        CGColorRelease(v9);
      v10 = (CGColor *)ptr[23];
      if (v10)
        CGColorRelease(v10);
      v11 = (const void *)ptr[26];
      if (v11)
        CFRelease(v11);
      v12 = (const void *)ptr[27];
      if (v12)
        CFRelease(v12);
      v13 = (const void *)ptr[28];
      if (v13)
        CFRelease(v13);
      v14 = (const void *)ptr[29];
      if (v14)
        CFRelease(v14);
      v15 = (const void *)ptr[30];
      if (v15)
        CFRelease(v15);
      v16 = (const void *)ptr[31];
      if (v16)
        CFRelease(v16);
      v17 = (const void *)ptr[32];
      if (v17)
        CFRelease(v17);
      v18 = (const void *)ptr[33];
      if (v18)
        CFRelease(v18);
      Default = (const __CFAllocator *)ptr[1];
      if (!Default)
        Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, ptr);
    }
  }
}

const __CFArray *OIChartGetSeriesCount(uint64_t a1)
{
  const __CFArray *result;

  result = *(const __CFArray **)(a1 + 264);
  if (result)
    return (const __CFArray *)CFArrayGetCount(result);
  return result;
}

void OIChartAddLabel(uint64_t a1, void *value)
{
  __CFArray *Mutable;

  if (value)
  {
    Mutable = *(__CFArray **)(a1 + 256);
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable(0, 0, &OILabelArrayCallbacks);
      *(_QWORD *)(a1 + 256) = Mutable;
    }
    CFArrayAppendValue(Mutable, value);
  }
}

void _OIChartAddSerieToRenderTree(uint64_t a1, const void *a2)
{
  const __CFArray *v3;
  unsigned int v4;
  const __CFDictionary *ValueAtIndex;
  const void *SubType;
  void *Value;

  v3 = *(const __CFArray **)(a1 + 248);
  v4 = OISeriesIsOnSecondaryAxis((uint64_t)a2);
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
  SubType = (const void *)OIAxisGetSubType((uint64_t)a2);
  Value = (void *)CFDictionaryGetValue(ValueAtIndex, SubType);
  if (!Value)
  {
    Value = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
    CFDictionarySetValue(ValueAtIndex, SubType, Value);
    CFRelease(Value);
  }
  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

void OIChartAddSeries(uint64_t a1, void *value)
{
  __CFArray *Mutable;

  if (value)
  {
    Mutable = *(__CFArray **)(a1 + 264);
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
      *(_QWORD *)(a1 + 264) = Mutable;
    }
    CFArrayAppendValue(Mutable, value);
    _OIChartAddSerieToRenderTree(a1, value);
  }
}

CFIndex OIChartGetValueCountForAxis(uint64_t a1, uint64_t a2)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  const void *ValueAtIndex;
  const __CFArray *Values;
  CFIndex v10;

  v2 = *(const __CFArray **)(a1 + 264);
  if (!v2)
    return 0;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 264));
  if (Count < 1)
    return 0;
  v5 = Count;
  v6 = 0;
  v7 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v2, v6);
    if (OIAxisGetType((uint64_t)ValueAtIndex) == a2)
    {
      Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
      v10 = CFArrayGetCount(Values);
      if (v10 > v7)
        v7 = v10;
    }
    ++v6;
  }
  while (v5 != v6);
  return v7;
}

uint64_t OIChartGetSeries(uint64_t a1)
{
  return *(_QWORD *)(a1 + 264);
}

void OIChartDraw(uint64_t a1)
{
  const __CFString *Copy;
  CFIndex v3;
  char v4;
  char v5;
  const __CFDictionary *ValueAtIndex;
  int64_t Count;
  int64_t v8;
  char v9;
  const void **v10;
  CFComparisonResult v11;
  const void **v12;
  void (*Value)(uint64_t);
  const __CFArray *v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  __CFArray *Mutable;
  CFIndex v19;
  const void *v20;
  const void *SubType;
  const void *v22;
  void (*v23)(uint64_t, __CFArray *, _QWORD);
  void (*v24)(uint64_t, __CFArray *, _QWORD);
  unsigned int v25;
  CFIndex v26;
  char v27;
  char v28;
  const __CFDictionary *v29;
  int64_t v30;
  const void **v31;
  const void **v32;
  const void **v33;
  const void **v34;
  const void *v35;
  void (*v36)(uint64_t, const void *, CFIndex);
  void (*v37)(uint64_t);
  void (*v38)(uint64_t);

  _OIChartDrawCanvas(a1);
  Copy = 0;
  v3 = 0;
  v4 = 1;
  while (1)
  {
    v5 = v4;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), v3);
    Count = CFDictionaryGetCount(ValueAtIndex);
    if (Count >= 1)
    {
      v8 = Count;
      if (Copy)
      {
        v9 = 1;
        if (Count != 1)
          goto LABEL_10;
        v10 = (const void **)malloc_type_calloc(1uLL, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(ValueAtIndex, v10, 0);
        v11 = CFStringCompare(Copy, (CFStringRef)*v10, 1uLL);
        free(v10);
        if (v11)
          goto LABEL_10;
        goto LABEL_8;
      }
      v12 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(ValueAtIndex, v12, 0);
      Copy = CFStringCreateCopy(0, (CFStringRef)*v12);
      free(v12);
      if (v8 != 1)
        break;
    }
LABEL_8:
    v4 = 0;
    v9 = 0;
    v3 = 1;
    if ((v5 & 1) == 0)
    {
      if (!Copy)
        return;
      goto LABEL_10;
    }
  }
  v9 = 1;
  if (!Copy)
    return;
LABEL_10:
  if (!*(_BYTE *)(a1 + 296))
  {
    Value = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 216), Copy);
    if (Value)
      Value(a1);
    if ((v9 & 1) != 0)
    {
      v14 = *(const __CFArray **)(a1 + 264);
      v15 = CFArrayGetCount(v14);
      v16 = v15 - 1;
      if (v15 >= 1)
      {
        v17 = v15;
        Mutable = 0;
        v19 = 0;
        do
        {
          v20 = CFArrayGetValueAtIndex(v14, v19);
          if (!Mutable)
            Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
          SubType = (const void *)OIAxisGetSubType((uint64_t)v20);
          CFArrayAppendValue(Mutable, v20);
          if (v19 < v16
            && (v22 = CFArrayGetValueAtIndex(v14, v19 + 1), (const void *)OIAxisGetSubType((uint64_t)v22) == SubType))
          {
            ++v19;
          }
          else
          {
            v23 = (void (*)(uint64_t, __CFArray *, _QWORD))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 232), SubType);
            if (v23)
            {
              v24 = v23;
              v25 = OISeriesIsOnSecondaryAxis((uint64_t)v20);
              v24(a1, Mutable, v25);
            }
            CFRelease(Mutable);
            Mutable = 0;
            ++v19;
          }
        }
        while (v19 != v17);
        if (Mutable)
          CFRelease(Mutable);
      }
    }
    else
    {
      v26 = 0;
      v27 = 1;
      do
      {
        v28 = v27;
        v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 248), v26);
        v30 = CFDictionaryGetCount(v29);
        v31 = (const void **)malloc_type_calloc(v30, 8uLL, 0x6004044C4A2DFuLL);
        v32 = (const void **)malloc_type_calloc(v30, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(v29, v31, v32);
        if (v30 >= 1)
        {
          v33 = v31;
          v34 = v32;
          do
          {
            v35 = *v34;
            v36 = (void (*)(uint64_t, const void *, CFIndex))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 232), *v33);
            if (v36)
              v36(a1, v35, v26);
            ++v34;
            ++v33;
            --v30;
          }
          while (v30);
        }
        free(v31);
        free(v32);
        v27 = 0;
        v26 = 1;
      }
      while ((v28 & 1) != 0);
    }
    v37 = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 224), Copy);
    if (v37)
      v37(a1);
  }
  if (!*(_BYTE *)(a1 + 297))
  {
    v38 = (void (*)(uint64_t))CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 240), Copy);
    if (v38)
      v38(a1);
  }
  if (!*(_BYTE *)(a1 + 296))
    _OIChartDrawLabels(a1);
  CFRelease(Copy);
}

void _OIChartDrawCanvas(uint64_t a1)
{
  CGFloat v2;
  CGFloat v3;
  CGColor *v4;
  CGColor *v5;
  CGRect v6;
  CGRect v7;

  v2 = *(double *)(a1 + 24);
  v3 = *(double *)(a1 + 32);
  v4 = *(CGColor **)(a1 + 112);
  if (v4)
  {
    CGContextSetFillColorWithColor(*(CGContextRef *)(a1 + 16), v4);
    v6.origin.x = 0.0;
    v6.origin.y = 0.0;
    v6.size.width = v2;
    v6.size.height = v3;
    CGContextFillRect(*(CGContextRef *)(a1 + 16), v6);
  }
  v5 = *(CGColor **)(a1 + 120);
  if (v5)
  {
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 16), v5);
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 16), *(CGFloat *)(a1 + 128));
    v7.origin.x = 0.0;
    v7.origin.y = 0.0;
    v7.size.width = v2;
    v7.size.height = v3;
    CGContextStrokeRect(*(CGContextRef *)(a1 + 16), v7);
  }
}

void _OIChartDrawLabels(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;

  v2 = *(const __CFArray **)(a1 + 256);
  if (v2)
  {
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 256), i);
        OILabelRenderInContext((uint64_t)ValueAtIndex, *(CGContextRef *)(a1 + 16));
      }
    }
  }
}

CGImageRef OIChartCreateImage(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 272))
    return 0;
  else
    return CGBitmapContextCreateImage(*(CGContextRef *)(a1 + 16));
}

CFTypeRef OIChartSetBackgroundAxisRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 216);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 216) = result;
  }
  return result;
}

CFTypeRef OIChartSetForegroundAxisRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 224);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 224) = result;
  }
  return result;
}

CFTypeRef OIChartSetChartRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 232);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 232) = result;
  }
  return result;
}

CFTypeRef OIChartSetLegendRendererMapping(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 240);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 240) = result;
  }
  return result;
}

double OIChartGetSize(uint64_t a1)
{
  return *(double *)(a1 + 24);
}

uint64_t OIChartSetStatus(uint64_t result, int a2)
{
  *(_DWORD *)(result + 272) = a2;
  return result;
}

uint64_t OIChartGetStatus(uint64_t a1)
{
  return *(unsigned int *)(a1 + 272);
}

double *OIChartSetPlotArea(double *result, double a2, double a3, double a4, double a5)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

double OIChartGetPlotArea(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double *OIChartSetLegendArea(double *result, double a2, double a3, double a4, double a5)
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

double OIChartGetLegendArea(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

void OIChartSetAxis(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 208), a2, a3);
}

const void *OIChartGetAxis(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 208), a2);
}

uint64_t OIChartSetUseShadows(uint64_t result, char a2)
{
  *(_BYTE *)(result + 104) = a2;
  return result;
}

CGColor *OIChartSetCanvasFillColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 112);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 112) = result;
  }
  return result;
}

CGColor *OIChartSetCanvasStrokeColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 120);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 120) = result;
  }
  return result;
}

uint64_t OIChartSetCanvasStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 128) = a2;
  return result;
}

double OIChartGetCanvasStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 128);
}

CGColor *OIChartSetPlotFillColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 136);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 136) = result;
  }
  return result;
}

uint64_t OIChartGetPlotFillColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t OIChartSetPlotStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 152) = a2;
  return result;
}

double OIChartGetPlotStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 152);
}

CGColor *OIChartSetLegendFillColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 160);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 160) = result;
  }
  return result;
}

uint64_t OIChartGetLegendFillColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 160);
}

CGColor *OIChartSetLegendStrokeColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 168);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 168) = result;
  }
  return result;
}

uint64_t OIChartGetLegendStrokeColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 168);
}

CGColor *OIChartSetLegendTextColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 184);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 184) = result;
  }
  return result;
}

uint64_t OIChartGetLegendTextColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 184);
}

uint64_t OIChartSetLegendStrokeWidth(uint64_t result, double a2)
{
  *(double *)(result + 176) = a2;
  return result;
}

double OIChartGetLegendStrokeWidth(uint64_t a1)
{
  return *(double *)(a1 + 176);
}

uint64_t OIChartSetLegendHasShadow(uint64_t result, char a2)
{
  *(_BYTE *)(result + 192) = a2;
  return result;
}

uint64_t OIChartGetLegendHasShadow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 192);
}

uint64_t OIChartSetLegendPlacement(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 200) = a2;
  return result;
}

uint64_t OIChartGetLegendPlacement(uint64_t a1)
{
  return *(_QWORD *)(a1 + 200);
}

uint64_t OIChartSetRotation(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 288) = a2 % 45;
  return result;
}

double OIChartGetRotation(uint64_t a1)
{
  return (double)*(uint64_t *)(a1 + 288);
}

uint64_t OIChartSetElevation(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 280) = a2 % 90;
  return result;
}

double OIChartGetElevation(uint64_t a1)
{
  return (double)*(uint64_t *)(a1 + 280);
}

uint64_t OIChartSetHidePlotArea(uint64_t result, char a2)
{
  *(_BYTE *)(result + 296) = a2;
  return result;
}

uint64_t OIChartGetHidePlotArea(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 296);
}

uint64_t OIChartSetHideLegend(uint64_t result, char a2)
{
  *(_BYTE *)(result + 297) = a2;
  return result;
}

uint64_t OIChartGetHideLegend(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 297);
}

uint64_t OIChartSetCustomFormatterCallback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 304) = a2;
  return result;
}

uint64_t OIChartGetCustomFormatterCallback(uint64_t a1)
{
  return *(_QWORD *)(a1 + 304);
}

_QWORD *_OILabelCollectionRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  if (a2)
    ++*a2;
  return result;
}

void _OILabelCollectionRelease(uint64_t a1, _QWORD *a2)
{
  OILabelCollectionRelease(a2);
}

_QWORD *OILabelCollectionCreate()
{
  const __CFAllocator *Default;
  _QWORD *v1;
  const __CFAllocator *v2;

  Default = CFAllocatorGetDefault();
  v1 = CFAllocatorAllocate(Default, 16, 0);
  *v1 = 1;
  v2 = CFAllocatorGetDefault();
  v1[1] = CFArrayCreateMutable(v2, 0, &OILabelArrayCallbacks);
  return v1;
}

_QWORD *OILabelCollectionRetain(_QWORD *result)
{
  if (result)
    ++*result;
  return result;
}

void OILabelCollectionRelease(_QWORD *a1)
{
  const void *v3;
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[1];
      if (v3)
        CFRelease(v3);
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void OILabelCollectionAddString(uint64_t a1, const void *a2, double a3, double a4, double a5, double a6)
{
  double *v7;
  double *v8;

  v7 = OILabelCreate(a2, a3, a4, a5, a6);
  if (v7)
  {
    v8 = v7;
    OILabelSetAlignment((uint64_t)v7, 2);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 8), v8);
    OILabelRelease(v8);
  }
}

void OILabelCollectionAddNumber(uint64_t a1, const __CFString *a2, double a3, double a4, double a5, double a6, double a7)
{
  CFStringRef StringFromDouble;
  CFStringRef v13;

  StringFromDouble = OIFormatterCreateStringFromDouble(a2, a3);
  if (StringFromDouble)
  {
    v13 = StringFromDouble;
    OILabelCollectionAddString(a1, StringFromDouble, a4, a5, a6, a7);
    CFRelease(v13);
  }
}

void OILabelCollectionAddNumberWithFormatter(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), double a4, double a5, double a6, double a7, double a8)
{
  const void *StringUsingCustomFormatter;
  const void *v14;

  StringUsingCustomFormatter = (const void *)OIFormatterCreateStringUsingCustomFormatter(a2, a3);
  if (StringUsingCustomFormatter)
  {
    v14 = StringUsingCustomFormatter;
    OILabelCollectionAddString(a1, StringUsingCustomFormatter, a5, a6, a7, a8);
    CFRelease(v14);
  }
}

void OIRenderPieInChart(uint64_t a1, uint64_t a2)
{
  OIPieChartRenderer *v3;

  v3 = -[OIPieChartRenderer initWithChart:]([OIPieChartRenderer alloc], "initWithChart:", a1);
  -[OIPieChartRenderer renderThreeDimensional:pieFromSeriesArray:](v3, "renderThreeDimensional:pieFromSeriesArray:", 0, a2);

}

void _OIRenderPieInChart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OIPieChartRenderer *v6;

  v6 = -[OIPieChartRenderer initWithChart:]([OIPieChartRenderer alloc], "initWithChart:", a1);
  -[OIPieChartRenderer renderThreeDimensional:pieFromSeriesArray:](v6, "renderThreeDimensional:pieFromSeriesArray:", a4, a2);

}

void OIRender3DPieInChart(uint64_t a1, uint64_t a2)
{
  OIPieChartRenderer *v3;

  v3 = -[OIPieChartRenderer initWithChart:]([OIPieChartRenderer alloc], "initWithChart:", a1);
  -[OIPieChartRenderer renderThreeDimensional:pieFromSeriesArray:](v3, "renderThreeDimensional:pieFromSeriesArray:", 1, a2);

}

void OIRenderStocksInChart(uint64_t a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  CGContext *Type;
  const void *ValueAtIndex;
  const void *v8;
  const void *v9;
  const void *v10;
  CGRect v11;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count > 2)
    {
      v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      v8 = CFArrayGetValueAtIndex(theArray, 1);
      v9 = CFArrayGetValueAtIndex(theArray, 2);
      v10 = 0;
      if (v5 == 4)
        v10 = CFArrayGetValueAtIndex(theArray, 3);
      CGContextSaveGState(Type);
      v11.origin.x = OIChartGetPlotArea(a1);
      CGContextClipToRect(Type, v11);
      _OIRenderStockDayRangesInChart(a1, (uint64_t)ValueAtIndex, (uint64_t)v8);
      _OIRenderStockOpeningRangesInChart(a1, (uint64_t)v10, (uint64_t)v9);
      CGContextRestoreGState(Type);
    }
    else
    {
      OIChartSetStatus(a1, 5);
    }
  }
}

void _OIRenderStockDayRangesInChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  int v10;
  uint64_t String;
  uint64_t v12;
  uint64_t v13;
  const __CFArray *Values;
  const __CFArray *v15;
  CFIndex Count;
  uint64_t v17;
  CGColor *StrokeColor;
  double StrokeWidth;
  double Scale;
  int v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double valuePtr;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v9 = v8;
  v10 = OIAxisAreLabelsCentered(a1);
  String = OILabelGetString(a2);
  v12 = OIAxisGetType(a2);
  if (String)
  {
    v13 = v12;
    if (v12)
    {
      Values = (const __CFArray *)OISeriesGetValues(a2);
      v15 = (const __CFArray *)OISeriesGetValues(a3);
      Count = CFArrayGetCount(Values);
      if (Count)
      {
        v17 = Count;
        if (Count == CFArrayGetCount(v15))
        {
          StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
          CGContextSetStrokeColorWithColor(Type, StrokeColor);
          if (OILabelGetStrokeColor(a2))
            StrokeWidth = OILabelGetStrokeWidth(a2);
          else
            StrokeWidth = 1.0;
          CGContextSetLineWidth(Type, StrokeWidth);
          Scale = OIAxisGetScale(String);
          v21 = OIAxisAreLabelsCentered(String);
          v22 = floor(Scale * 0.5);
          v23 = 0;
          if (v21)
            v24 = v22;
          else
            v24 = 0.0;
          if (v10)
          {
            v25 = 0;
            CGContextSetShadow(Type, *(CGSize *)(&v23 - 1), 0.0);
          }
          if (v17 >= 1)
          {
            for (i = 0; i != v17; ++i)
            {
              valuePtr = 0.0;
              ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
              CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
              v33 = 0.0;
              v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, i);
              CFNumberGetValue(v28, kCFNumberCGFloatType, &v33);
              v29 = PlotArea + OIAxisConvertValueToLocal(String, (double)i);
              v30 = v9 + OIAxisConvertValueToLocal(v13, valuePtr);
              v31 = PlotArea + OIAxisConvertValueToLocal(String, (double)i);
              v32 = v9 + OIAxisConvertValueToLocal(v13, v33);
              CGContextMoveToPoint(Type, floor(v24 + v29) + 0.5, floor(v30) + 0.5);
              CGContextAddLineToPoint(Type, floor(v24 + v31) + 0.5, floor(v32) + 0.5);
            }
          }
          CGContextStrokePath(Type);
        }
      }
    }
  }
}

void _OIRenderStockOpeningRangesInChart(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  int v10;
  uint64_t String;
  uint64_t v12;
  uint64_t v13;
  const __CFArray *Values;
  const __CFArray *v15;
  CFIndex Count;
  CGColor *StrokeColor;
  double StrokeWidth;
  double Scale;
  CFIndex v20;
  double v21;
  double v22;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double valuePtr;
  CGSize v36;
  CGRect v37;
  CGRect v38;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v9 = v8;
  v10 = OIAxisAreLabelsCentered(a1);
  String = OILabelGetString(a3);
  v12 = OIAxisGetType(a3);
  if (String)
  {
    v13 = v12;
    if (v12)
    {
      Values = (const __CFArray *)OISeriesGetValues(a2);
      v15 = (const __CFArray *)OISeriesGetValues(a3);
      Count = 0;
      if (a2 && Values)
        Count = CFArrayGetCount(Values);
      if (v15 && Count == CFArrayGetCount(v15))
      {
        StrokeColor = (CGColor *)OILabelGetStrokeColor(a3);
        CGContextSetStrokeColorWithColor(Type, StrokeColor);
        if (OILabelGetStrokeColor(a3))
          StrokeWidth = OILabelGetStrokeWidth(a3);
        else
          StrokeWidth = 1.0;
        CGContextSetLineWidth(Type, StrokeWidth);
        Scale = OIAxisGetScale(String);
        OIAxisAreLabelsCentered(String);
        if (v10)
        {
          v36.width = 0.0;
          v36.height = 0.0;
          CGContextSetShadow(Type, v36, 0.0);
        }
        if (Count >= 1)
        {
          v20 = 0;
          v21 = Scale * 0.25;
          v22 = Scale * 0.5;
          do
          {
            valuePtr = 0.0;
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v20);
            CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr);
            v34 = 0.0;
            v24 = (const __CFNumber *)CFArrayGetValueAtIndex(v15, v20);
            CFNumberGetValue(v24, kCFNumberCGFloatType, &v34);
            v25 = OIAxisConvertValueToLocal(String, (double)v20);
            v26 = OIAxisConvertValueToLocal(v13, valuePtr);
            OIAxisConvertValueToLocal(String, (double)v20);
            v27 = OIAxisConvertValueToLocal(v13, v34);
            if (valuePtr >= v34)
            {
              v28 = 0.0;
              v29 = 0.0;
              v30 = 0.0;
            }
            else
            {
              v28 = 1.0;
              v29 = 1.0;
              v30 = 1.0;
            }
            CGContextSetRGBFillColor(Type, v28, v29, v30, 1.0);
            v31 = v9 + v26;
            v32 = v21 + PlotArea + v25;
            v33 = v9 + v27 - v31;
            v37.origin.x = v32;
            v37.origin.y = v31;
            v37.size.width = v22;
            v37.size.height = v33;
            CGContextFillRect(Type, v37);
            v38.origin.x = v32;
            v38.origin.y = v31;
            v38.size.width = v22;
            v38.size.height = v33;
            CGContextStrokeRect(Type, v38);
            ++v20;
          }
          while (Count != v20);
        }
        CGContextStrokePath(Type);
      }
    }
  }
}

void OIRenderLegendInChart(uint64_t a1)
{
  const __CFArray *Series;

  Series = (const __CFArray *)OIChartGetSeries(a1);
  _OIRenderLegendForSeriesInChart(a1, Series);
}

void _OIRenderLegendForSeriesInChart(uint64_t a1, const __CFArray *a2)
{
  CGContext *Type;
  int v5;
  CGColor *LegendFillColor;
  uint64_t LegendTextColor;
  CGColor *LegendStrokeColor;
  double LegendStrokeWidth;
  double LegendArea;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  CFIndex Count;
  CFIndex v20;
  uint64_t v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v27;
  uint64_t v28;
  CFIndex v29;
  double v30;
  const void *v31;
  const __CFString *v32;
  double v33;
  CFIndex v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  const void *ValueAtIndex;
  uint64_t Labels;
  CGColor *TextColor;
  CGColor *StrokeColor;
  CGColor *MarkerColor;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  CTFontRef v54;
  const __CFString *v55;
  double StrokeWidth;
  unint64_t v57;
  uint64_t v58;
  double v59;
  CGColor *v60;
  double v61;
  BOOL v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  const __CFArray *v70;
  CGContext *c;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  CFIndex v76;
  uint64_t Label;
  _QWORD v78[15];
  BOOL v79;
  CGSize v80;
  CGSize v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  Type = (CGContext *)OIAxisGetType(a1);
  v5 = OIAxisAreLabelsCentered(a1);
  LegendFillColor = (CGColor *)OIChartGetLegendFillColor(a1);
  LegendTextColor = OIChartGetLegendTextColor(a1);
  LegendStrokeColor = (CGColor *)OIChartGetLegendStrokeColor(a1);
  LegendStrokeWidth = OIChartGetLegendStrokeWidth(a1);
  LegendArea = OIChartGetLegendArea(a1);
  if (v13 == 0.0)
    return;
  v14 = LegendArea;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  CGContextSaveGState(Type);
  if ((OIChartGetLegendHasShadow(a1) & v5) == 1)
  {
    v80.width = 0.0;
    v80.height = -4.0;
    CGContextSetShadow(Type, v80, 6.0);
  }
  if (LegendFillColor)
  {
    CGContextSetFillColorWithColor(Type, LegendFillColor);
    v82.origin.x = floor(v14) + 0.5;
    v82.origin.y = floor(v15) + 0.5;
    v82.size.width = ceil(v16);
    v82.size.height = ceil(v17);
    CGContextFillRect(Type, v82);
  }
  if (v5)
  {
    v81.width = 0.0;
    v81.height = 0.0;
    CGContextSetShadow(Type, v81, 0.0);
  }
  if (a2)
  {
    v59 = LegendStrokeWidth;
    CGContextSaveGState(Type);
    v18 = OIChartGetLegendPlacement(a1) & 0xFFFFFFFFFFFFFFFDLL;
    v67 = v14;
    v83.origin.x = v14;
    v83.origin.y = v15;
    v83.size.width = v16;
    v83.size.height = v17;
    CGContextClipToRect(Type, v83);
    Count = CFArrayGetCount(a2);
    v20 = Count;
    v21 = Count + 1;
    v22 = v17 / (double)(Count + 1);
    v23 = v22 > 11.0 || v18 == 0;
    v24 = v22 + -1.0;
    if (v23)
      v25 = 10.0;
    else
      v25 = v24;
    v62 = v18 == 0;
    if (v24 >= 10.0 || v18 == 0)
      v27 = 10.0;
    else
      v27 = v24;
    v74 = v18;
    v64 = v15;
    if (v18)
    {
      if (Count >= 11)
      {
        v21 = (uint64_t)(floor((double)Count / 10.0) + 1.0);
        v28 = Count / v21 + 1;
        goto LABEL_29;
      }
      v21 = 1;
      v28 = Count;
    }
    else
    {
      if (Count >= 7)
      {
        v28 = (uint64_t)(floor((double)Count / 6.0) + 1.0);
        v21 = Count / v28 + 1;
        goto LABEL_29;
      }
      v28 = 1;
    }
    if (Count < 1)
    {
      v34 = 0;
      v30 = 0.0;
LABEL_35:
      v35 = ceil(v25);
      v36 = v16 / (double)v21;
      v65 = v17;
      if (v17 / (double)v28 <= 25.0)
        v37 = v17 / (double)v28;
      else
        v37 = 25.0;
      v60 = LegendStrokeColor;
      v75 = LegendTextColor;
      if (v30 <= v36)
      {
        v63 = v35;
      }
      else
      {
        v63 = v35 * (v36 / v30);
        v27 = v27 * (v36 / v30);
      }
      v66 = v21;
      if (v21 >= 1)
      {
        v68 = 0;
        if (v28 >= 0)
          v38 = v28;
        else
          v38 = v28 + 1;
        v58 = v38 >> 1;
        v39 = ceil(v63);
        v57 = (unint64_t)v21 >> 1;
        v72 = *MEMORY[0x24BDC4EE0];
        v73 = *MEMORY[0x24BDC4C28];
        v70 = a2;
        c = Type;
        v69 = v28;
        while (v28 < 1)
        {
          if (v34 < 0)
            goto LABEL_65;
LABEL_64:
          v20 -= v28;
          if (++v68 == v66)
            goto LABEL_65;
        }
        v40 = 0;
        v41 = floor(v67 + v36 * (double)v68);
        v61 = floor(v67 + v16 * 0.5 + -v36 * ((double)(uint64_t)(v57 - v68) + -0.5));
        v42 = -1;
        v43 = v58;
        v76 = v20;
        while (v20 + v42 >= 0)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a2, v20 + v42);
          Label = OIAxisGetLabel((uint64_t)ValueAtIndex);
          Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          TextColor = (CGColor *)OILabelGetTextColor((uint64_t)ValueAtIndex);
          StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
          if (v74)
          {
            v49 = v64 + v65 * 0.5 + v37 * (double)v43;
            v50 = v41;
          }
          else
          {
            v49 = v64 + v65 + -v37 * (double)(v40 + 1);
            v50 = v61;
          }
          v51 = floor(v49) + 0.5;
          v52 = v50 + 0.5;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = OICreateDefaultFontWithSize(v27);
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, v73);

          objc_msgSend(v53, "setObject:forKeyedSubscript:", v75, v72);
          if (Labels && MarkerColor)
          {
            Type = c;
            CGContextSetFillColorWithColor(c, MarkerColor);
            v84.origin.x = v52;
            v84.origin.y = v51;
            v84.size.width = v39;
            v84.size.height = v39;
            CGContextFillRect(c, v84);
            v28 = v69;
            a2 = v70;
            v55 = (const __CFString *)Label;
          }
          else
          {
            Type = c;
            if (TextColor)
            {
              CGContextSetFillColorWithColor(c, TextColor);
              v85.origin.x = v52;
              v85.origin.y = v51;
              v85.size.width = v39;
              v85.size.height = v39;
              CGContextFillRect(c, v85);
            }
            v28 = v69;
            a2 = v70;
            v55 = (const __CFString *)Label;
            if (StrokeColor)
            {
              CGContextSetStrokeColorWithColor(c, StrokeColor);
              StrokeWidth = OILabelGetStrokeWidth((uint64_t)ValueAtIndex);
              CGContextSetLineWidth(c, StrokeWidth);
              CGContextSetLineJoin(c, kCGLineJoinRound);
              CGContextSetLineCap(c, kCGLineCapRound);
              v86.origin.x = v52;
              v86.origin.y = v51;
              v86.size.width = v39;
              v86.size.height = v39;
              CGContextStrokeRect(c, v86);
            }
          }
          if (v55)
          {
            v78[0] = MEMORY[0x24BDAC760];
            v78[1] = 3221225472;
            v78[2] = ___OIRenderLegendForSeriesInChart_block_invoke;
            v78[3] = &__block_descriptor_121_e29__CGPoint_dd_24__0_CGSize_dd_8l;
            v79 = v62;
            *(double *)&v78[4] = v67;
            *(double *)&v78[5] = v64;
            *(double *)&v78[6] = v16;
            *(double *)&v78[7] = v65;
            *(double *)&v78[8] = v36;
            *(double *)&v78[9] = v37;
            v78[10] = v66;
            v78[11] = v68;
            *(double *)&v78[12] = v63;
            v78[13] = v40;
            v78[14] = v28;
            OIDrawStringWithAttributes(v55, v53, Type, v78);
          }

          ++v40;
          --v43;
          --v42;
          v20 = v76;
          if (v28 == v40)
          {
            v34 = v76 - v40;
            goto LABEL_64;
          }
        }
      }
LABEL_65:
      CGContextRestoreGState(Type);
      LegendStrokeColor = v60;
      v17 = v65;
      v15 = v64;
      v14 = v67;
      LegendStrokeWidth = v59;
      goto LABEL_66;
    }
LABEL_29:
    v29 = 0;
    v30 = 0.0;
    do
    {
      v31 = CFArrayGetValueAtIndex(a2, v29);
      v32 = (const __CFString *)OIAxisGetLabel((uint64_t)v31);
      if (v32)
      {
        v33 = OISizeForStringInContext(v32, v27);
        if (v33 > v30)
          v30 = v33;
      }
      ++v29;
    }
    while (v20 != v29);
    v34 = v20;
    goto LABEL_35;
  }
LABEL_66:
  if (LegendStrokeColor)
  {
    CGContextSetLineWidth(Type, LegendStrokeWidth);
    CGContextSetStrokeColorWithColor(Type, LegendStrokeColor);
    v87.origin.x = floor(v14) + 0.5;
    v87.origin.y = floor(v15) + 0.5;
    v87.size.width = ceil(v16);
    v87.size.height = ceil(v17);
    CGContextStrokeRect(Type, v87);
  }
  CGContextRestoreGState(Type);
}

void OIRenderXYLegendInChart(uint64_t a1)
{
  const __CFArray *Series;

  Series = (const __CFArray *)OIChartGetSeries(a1);
  _OIRenderLegendForSeriesInChart(a1, Series);
}

void OIRenderBubbleLegendInChart(uint64_t a1)
{
  __CFArray *Mutable;
  const __CFArray *Series;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const void *ValueAtIndex;

  Mutable = CFArrayCreateMutable(0, 0, &OISeriesArrayCallbacks);
  Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    v4 = Series;
    Count = CFArrayGetCount(Series);
    if (Count >= 1)
    {
      v6 = Count;
      for (i = 0; i < v6; i += 2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  _OIRenderLegendForSeriesInChart(a1, Mutable);
  CFRelease(Mutable);
}

_QWORD *_OISeriesRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  ++*a2;
  return result;
}

void _OISeriesRelease(uint64_t a1, _QWORD *a2)
{
  OISeriesRelease(a2);
}

_QWORD *OISeriesCreate(const __CFArray *a1, const void *a2)
{
  CFIndex Count;
  _QWORD *v5;
  const __CFAllocator *Default;
  CFIndex v7;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID v11;
  CFNumberRef v12;
  int valuePtr;

  if (!a1)
    return 0;
  Count = CFArrayGetCount(a1);
  v5 = 0;
  if (a2 && Count)
  {
    Default = CFAllocatorGetDefault();
    v5 = CFAllocatorAllocate(Default, 144, 0);
    *v5 = 1;
    v7 = CFArrayGetCount(a1);
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (v7 >= 1)
    {
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
        v11 = CFGetTypeID(ValueAtIndex);
        if (v11 == CFNumberGetTypeID())
        {
          CFArrayInsertValueAtIndex(Mutable, i, ValueAtIndex);
        }
        else
        {
          valuePtr = 0;
          v12 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
          CFArrayInsertValueAtIndex(Mutable, i, v12);
          CFRelease(v12);
        }
      }
    }
    v5[6] = Mutable;
    v5[3] = CFRetain(a2);
    v5[4] = 0;
    *((_BYTE *)v5 + 40) = 0;
    v5[1] = 0;
    v5[2] = 0;
    v5[7] = 0;
    v5[8] = 0;
    v5[9] = 0x4000000000000000;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 6) = 0u;
    *((_OWORD *)v5 + 7) = xmmword_22FA26D80;
    *((_BYTE *)v5 + 128) = 0;
    v5[17] = 0;
  }
  return v5;
}

void OISeriesRelease(_QWORD *a1)
{
  const void *v3;
  _QWORD *v4;
  _QWORD *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  CGColor *v9;
  CGColor *v10;
  CGImage *v11;
  CGColor *v12;
  _QWORD *v13;
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[7];
      if (v3)
        CFRelease(v3);
      v4 = (_QWORD *)a1[1];
      if (v4)
        OIAxisRelease(v4);
      v5 = (_QWORD *)a1[2];
      if (v5)
        OIAxisRelease(v5);
      v6 = (const void *)a1[3];
      if (v6)
        CFRelease(v6);
      v7 = (const void *)a1[4];
      if (v7)
        CFRelease(v7);
      v8 = (const void *)a1[6];
      if (v8)
        CFRelease(v8);
      v9 = (CGColor *)a1[8];
      if (v9)
        CGColorRelease(v9);
      v10 = (CGColor *)a1[10];
      if (v10)
        CGColorRelease(v10);
      v11 = (CGImage *)a1[11];
      if (v11)
        CGImageRelease(v11);
      v12 = (CGColor *)a1[13];
      if (v12)
        CGColorRelease(v12);
      v13 = (_QWORD *)a1[17];
      if (v13)
        OIErrorBarRelease(v13);
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

_QWORD *OISeriesCreateFromDictionary(const __CFDictionary *a1)
{
  const __CFString *Value;
  const __CFString *v3;
  const __CFArray *v4;
  _QWORD *v5;
  const void *v6;
  const __CFNumber *v7;
  char v8;
  const void *v9;
  CGColor *v10;
  const __CFNumber *v11;
  uint64_t v12;
  CGColor *v13;
  CGImage *v14;
  const __CFNumber *v15;
  uint64_t v16;
  CGColor *v17;
  const __CFNumber *v18;
  uint64_t v19;
  const __CFNumber *v20;
  uint64_t v21;
  const __CFNumber *v22;
  BOOL v23;
  const __CFDictionary *v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char valuePtr;

  if (!a1)
    return 0;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesTypeKey"));
  if (Value)
    v3 = Value;
  else
    v3 = CFSTR("kOIChartColumnType");
  v4 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesValuesKey"));
  v5 = OISeriesCreate(v4, v3);
  if (v5)
  {
    v6 = CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesBaseValuesKey"));
    if (v6)
      OISeriesSetBaseValues((uint64_t)v5, v6);
    valuePtr = 0;
    v7 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesOnSecondaryAxisKey"));
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberSInt8Type, &valuePtr);
      v8 = valuePtr;
    }
    else
    {
      v8 = 0;
    }
    *((_BYTE *)v5 + 40) = v8;
    v9 = CFDictionaryGetValue(a1, CFSTR("kOIChartLabelKey"));
    OISeriesSetLabel((uint64_t)v5, v9);
    v10 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartStrokeColorKey"));
    OILabelSetStrokeColor((uint64_t)v5, v10);
    v30 = 0;
    v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartStrokeWidthKey"));
    if (v11)
    {
      CFNumberGetValue(v11, kCFNumberCGFloatType, &v30);
      v12 = v30;
    }
    else
    {
      v12 = 0;
    }
    v5[9] = v12;
    v13 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartFillColorKey"));
    OILabelSetTextColor((uint64_t)v5, v13);
    v14 = (CGImage *)CFDictionaryGetValue(a1, CFSTR("kOIChartFillImageKey"));
    OISeriesSetFillImage((uint64_t)v5, v14);
    v29 = 0;
    v15 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesMarkerTypeKey"));
    if (v15)
    {
      CFNumberGetValue(v15, kCFNumberNSIntegerType, &v29);
      v16 = v29;
      v5[12] = v29;
      if (v16)
      {
        v17 = (CGColor *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesMarkerColorKey"));
        if (!v17)
          v17 = (CGColor *)v5[8];
        OISeriesSetMarkerColor((uint64_t)v5, v17);
        v28 = 0;
        v18 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesMarkerWidthKey"));
        if (v18)
        {
          CFNumberGetValue(v18, kCFNumberCGFloatType, &v28);
          v19 = v28;
        }
        else
        {
          v19 = 0;
        }
        v5[14] = v19;
      }
    }
    else
    {
      v5[12] = 0;
    }
    v28 = 0;
    v20 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesOffsetKey"));
    if (v20)
    {
      CFNumberGetValue(v20, kCFNumberCGFloatType, &v28);
      v21 = v28;
    }
    else
    {
      v21 = 0;
    }
    v5[15] = v21;
    v27 = 0;
    v22 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesShowValuesKey"));
    if (v22)
    {
      CFNumberGetValue(v22, kCFNumberNSIntegerType, &v27);
      v23 = v27 != 0;
    }
    else
    {
      v23 = 0;
    }
    *((_BYTE *)v5 + 128) = v23;
    v24 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("kOIChartSeriesErrorBarKey"));
    if (v24)
    {
      v25 = OIErrorBarCreateFromDictionary(v24);
      OISeriesSetErrorBar((uint64_t)v5, v25);
      OIErrorBarRelease(v25);
    }
  }
  return v5;
}

CFTypeRef OISeriesSetBaseValues(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 56);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 56) = result;
  }
  return result;
}

uint64_t OISeriesSetSecondary(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

CFTypeRef OISeriesSetLabel(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a1 + 32);
  if (result != cf)
  {
    if (result)
      CFRelease(result);
    result = CFRetain(cf);
    *(_QWORD *)(a1 + 32) = result;
  }
  return result;
}

CGImage *OISeriesSetFillImage(uint64_t a1, CGImageRef image)
{
  CGImage *result;

  result = *(CGImage **)(a1 + 88);
  if (result != image)
  {
    if (result)
      CGImageRelease(result);
    result = CGImageRetain(image);
    *(_QWORD *)(a1 + 88) = result;
  }
  return result;
}

uint64_t OISeriesSetMarkerType(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 96) = a2;
  return result;
}

CGColor *OISeriesSetMarkerColor(uint64_t a1, CGColorRef color)
{
  CGColor *result;

  result = *(CGColor **)(a1 + 104);
  if (result != color)
  {
    if (result)
      CGColorRelease(result);
    result = CGColorRetain(color);
    *(_QWORD *)(a1 + 104) = result;
  }
  return result;
}

uint64_t OISeriesSetMarkerWidth(uint64_t result, double a2)
{
  *(double *)(result + 112) = a2;
  return result;
}

uint64_t OISeriesSetOffset(uint64_t result, double a2)
{
  *(double *)(result + 120) = a2;
  return result;
}

uint64_t OISeriesSetShowValues(uint64_t result, char a2)
{
  *(_BYTE *)(result + 128) = a2;
  return result;
}

_QWORD *OISeriesSetErrorBar(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 136);
  if (result != a2)
  {
    if (result)
      OIErrorBarRelease(result);
    result = OILabelRetain(a2);
    *(_QWORD *)(a1 + 136) = result;
  }
  return result;
}

uint64_t OISeriesGetValues(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

_QWORD *OISeriesSetBaseAxis(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 8);
  if (result != a2)
  {
    if (result)
      OIAxisRelease(result);
    result = OILabelRetain(a2);
    *(_QWORD *)(a1 + 8) = result;
  }
  return result;
}

_QWORD *OISeriesSetValueAxis(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 16);
  if (result != a2)
  {
    if (result)
      OIAxisRelease(result);
    result = OILabelRetain(a2);
    *(_QWORD *)(a1 + 16) = result;
  }
  return result;
}

uint64_t OISeriesGetFillImage(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t OISeriesGetMarkerColor(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

double OISeriesGetMarkerWidth(uint64_t a1)
{
  return *(double *)(a1 + 112);
}

double OISeriesGetOffset(uint64_t a1)
{
  return *(double *)(a1 + 120);
}

uint64_t OISeriesGetShowValues(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t OISeriesIsOnSecondaryAxis(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

double OISeriesGetBaseValueAtIndex(uint64_t a1, CFIndex a2)
{
  const __CFArray *v4;
  const __CFNumber *ValueAtIndex;
  double valuePtr;

  v4 = *(const __CFArray **)(a1 + 56);
  if (v4
    && CFArrayGetCount(v4) > a2
    && (valuePtr = 0.0,
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), a2),
        CFNumberGetValue(ValueAtIndex, kCFNumberCGFloatType, &valuePtr)))
  {
    return valuePtr;
  }
  else
  {
    return (double)a2;
  }
}

void OISeriesSetupFillImageForContext(uint64_t a1, CGContext *a2)
{
  void *v2;
  CGColorSpace *Pattern;
  double Width;
  double Height;
  CGFloat v7;
  size_t v8;
  __int128 v9;
  uint64_t v10;
  double v11;
  double v12;
  CGPattern *v13;
  CGAffineTransform v14;
  CGPatternCallbacks callbacks;

  v2 = *(void **)(a1 + 88);
  if (v2)
  {
    *(_OWORD *)&callbacks.version = xmmword_24FD38AC8;
    callbacks.releaseInfo = (CGPatternReleaseInfoCallback)releaseImagePattern;
    Pattern = CGColorSpaceCreatePattern(0);
    CGContextSetFillColorSpace(a2, Pattern);
    CGColorSpaceRelease(Pattern);
    CFRetain(v2);
    Width = (double)CGImageGetWidth((CGImageRef)v2);
    Height = (double)CGImageGetHeight((CGImageRef)v2);
    v7 = (double)CGImageGetWidth((CGImageRef)v2);
    v8 = CGImageGetHeight((CGImageRef)v2);
    v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v14.c = v9;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v10 = 0;
    *(_QWORD *)&v9 = 0;
    v11 = Width;
    v12 = Height;
    v13 = CGPatternCreate(v2, *(CGRect *)((char *)&v9 - 8), &v14, v7, (double)v8, kCGPatternTilingNoDistortion, 1, &callbacks);
    v14.a = 1.0;
    CGContextSetFillPattern(a2, v13, &v14.a);
    CGPatternRelease(v13);
  }
}

void drawImagePattern(CGImage *a1, CGContext *a2)
{
  CGFloat Width;
  CGRect v5;

  Width = (double)CGImageGetWidth(a1);
  v5.size.height = (double)CGImageGetHeight(a1);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = Width;
  CGContextDrawImage(a2, v5, a1);
}

void OISeriesSetupStrokeAndFillForContext(uint64_t a1, CGContextRef c)
{
  CGColor *v4;
  CGColor *v5;

  v4 = *(CGColor **)(a1 + 80);
  if (v4)
    CGContextSetFillColorWithColor(c, v4);
  OISeriesSetupFillImageForContext(a1, c);
  v5 = *(CGColor **)(a1 + 64);
  if (v5)
  {
    CGContextSetStrokeColorWithColor(c, v5);
    CGContextSetLineWidth(c, *(CGFloat *)(a1 + 72));
    CGContextSetLineJoin(c, kCGLineJoinRound);
    CGContextSetLineCap(c, kCGLineCapRound);
  }
}

void OIRenderColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderColumnsInChart(a1, a2, 0.0, 0.0);
}

void _OIRenderColumnsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  CFIndex Count;
  uint64_t v7;
  CGContext *Type;
  double PlotArea;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  const void *ValueAtIndex;
  uint64_t String;
  uint64_t v19;
  double MinValue;
  double FontSize;
  double Scale;
  int v23;
  double v24;
  uint64_t v25;
  CFIndex i;
  const void *v27;
  const __CFArray *Values;
  CFIndex v29;
  CFIndex v30;
  double v31;
  CFIndex j;
  const void *v33;
  double BaseValueAtIndex;
  const __CFArray *v35;
  const __CFNumber *v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t PlotFillColor;
  CGContext *v44;
  double v45;
  double v46;
  _QWORD *v47;
  double v48;
  _BYTE *v49;
  double v50;
  double v51;
  double v52;
  double valuePtr[2];
  CGSize v56;
  CGRect v57;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v7 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v52 = PlotArea;
      v57.origin.x = PlotArea;
      v57.origin.y = v11;
      v57.size.width = v13;
      v57.size.height = v15;
      CGContextClipToRect(Type, v57);
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      v19 = OIAxisGetType((uint64_t)ValueAtIndex);
      MinValue = OIAxisGetMinValue(v19);
      FontSize = OILabelGetFontSize(v19);
      Scale = OIAxisGetScale(String);
      v48 = OIAxisGetScale(v19);
      v23 = OIAxisAreLabelsCentered(String);
      v24 = Scale * -0.5;
      if (v23)
        v24 = 0.0;
      v51 = v24;
      if (v16)
      {
        v56.width = 4.0;
        v56.height = -4.0;
        CGContextSetShadow(Type, v56, 3.0);
      }
      v44 = Type;
      v25 = 0;
      if (v7 >= 1)
      {
        for (i = 0; i != v7; ++i)
        {
          v27 = CFArrayGetValueAtIndex(theArray, i);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)v27);
          v29 = CFArrayGetCount(Values);
          if (v29 > v25)
            v25 = v29;
        }
      }
      v49 = OIErrorBarRendererCreate(1);
      v47 = OILabelCollectionCreate();
      if (v25 >= 1)
      {
        v30 = 0;
        v31 = floor(Scale / (double)(v7 + 1));
        v50 = floor(v31 * 0.5);
        v45 = ceil(v31 * 0.5);
        v46 = ceil(v31 + 4.0);
        do
        {
          if (v7 >= 1)
          {
            for (j = 0; j != v7; ++j)
            {
              v33 = CFArrayGetValueAtIndex(theArray, j);
              BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)v33, v30);
              v35 = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
              if (v30 < CFArrayGetCount(v35))
              {
                valuePtr[0] = 0.0;
                v36 = (const __CFNumber *)CFArrayGetValueAtIndex(v35, v30);
                CFNumberGetValue(v36, kCFNumberCGFloatType, valuePtr);
                v37 = valuePtr[0];
                if (valuePtr[0] <= FontSize)
                {
                  v38 = valuePtr[0] < MinValue;
                }
                else
                {
                  v37 = FontSize;
                  v38 = 1;
                }
                if (v38)
                {
                  if (v37 < MinValue)
                    v37 = MinValue;
                  valuePtr[0] = v37;
                }
                OIAxisConvertValueToLocal(String, BaseValueAtIndex);
                v39 = v11 + OIAxisConvertValueToLocal(v19, 0.0);
                v40 = v50 + v51 + v52 + OIAxisConvertValueToLocal(String, BaseValueAtIndex) + v31 * (double)j;
                v41 = v11 + OIAxisConvertValueToLocal(v19, valuePtr[0]) - v39;
                _OIRenderColumnFloor(a1, v40, v39, v31, v41, a3, a4);
                _OIRenderColumn(a1, (uint64_t)v33, v40, v39, v31, v41, a3, a4);
                v42 = v39 + v41;
                if (OISeriesGetShowValues((uint64_t)v33))
                  OILabelCollectionAddNumber((uint64_t)v47, 0, valuePtr[0], floor(v40 + -2.0) + 0.5, floor(v42) + 0.5, v46, v45);
                PlotFillColor = OIChartGetPlotFillColor((uint64_t)v33);
                if (PlotFillColor)
                  OIErrorBarRendererAddPoint((uint64_t)v49, PlotFillColor, v31 * 0.5 + v40, v42, valuePtr[0], v48);
              }
            }
          }
          ++v30;
        }
        while (v30 != v25);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v49, v44);
      OIErrorBarRendererRelease(v49);
      OILabelCollectionRenderInContext((uint64_t)v47, v44);
      OILabelCollectionRelease(v47);
      CGContextRestoreGState(v44);
    }
  }
}

void OIRenderStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedColumnsInChart(a1, a2, 0, 0.0, 0.0);
}

void _OIRenderStackedColumnsInChart(uint64_t a1, CFArrayRef theArray, int a3, double a4, double a5)
{
  CFIndex Count;
  uint64_t v9;
  CGContext *Type;
  double PlotArea;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  int v18;
  const void *ValueAtIndex;
  uint64_t String;
  uint64_t v21;
  double FontSize;
  double v23;
  double v24;
  int v25;
  double v26;
  double v27;
  CFIndex v28;
  int v29;
  double v30;
  double v31;
  CFIndex i;
  const void *v33;
  const __CFArray *Values;
  const __CFNumber *v35;
  CFIndex v36;
  double v37;
  double v38;
  const void *v39;
  const __CFArray *v40;
  const __CFNumber *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t PlotFillColor;
  double v58;
  double v59;
  CGContext *v60;
  int v61;
  uint64_t v62;
  _BYTE *v63;
  double Scale;
  _QWORD *v65;
  double v66;
  double v67;
  double v68;
  double MinValue;
  CGFloat v70;
  double v71;
  double v72;
  double v75;
  double v76;
  double valuePtr[2];
  CGSize v78;
  CGRect v79;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v9 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = OIAxisAreLabelsCentered(a1);
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      v21 = OIAxisGetType((uint64_t)ValueAtIndex);
      FontSize = OILabelGetFontSize(String);
      MinValue = OIAxisGetMinValue(v21);
      v68 = OILabelGetFontSize(v21);
      Scale = OIAxisGetScale(v21);
      v23 = OIAxisGetScale(String);
      if ((uint64_t)FontSize > 0x2000)
      {
        NSLog(CFSTR("Skipping rendering of huge graph with %ld columns"), v23, (uint64_t)FontSize);
        return;
      }
      v24 = v23;
      CGContextSaveGState(Type);
      v79.origin.x = PlotArea;
      v70 = v13;
      v79.origin.y = v13;
      v79.size.width = v15;
      v79.size.height = v17;
      CGContextClipToRect(Type, v79);
      v25 = OIAxisAreLabelsCentered(String);
      v26 = v24 * -0.5;
      if (v25)
        v26 = 0.0;
      v72 = v26;
      if (v18)
      {
        v78.width = 4.0;
        v78.height = -4.0;
        CGContextSetShadow(Type, v78, 3.0);
      }
      v60 = Type;
      v63 = OIErrorBarRendererCreate(1);
      v65 = OILabelCollectionCreate();
      v62 = (uint64_t)FontSize;
      v27 = v13;
      if ((uint64_t)FontSize < 1)
        goto LABEL_50;
      v28 = 0;
      v71 = floor(v24 * 0.25);
      v76 = floor(v24 * 0.5);
      if (v9 > 0)
        v29 = a3;
      else
        v29 = 0;
      v61 = v29;
      while (1)
      {
        v75 = (double)v28;
        OIAxisConvertValueToLocal(String, (double)v28);
        v30 = OIAxisConvertValueToLocal(v21, 0.0);
        v31 = 0.0;
        if (v61)
        {
          for (i = 0; i != v9; ++i)
          {
            v33 = CFArrayGetValueAtIndex(theArray, i);
            Values = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
            if (CFArrayGetCount(Values) > v28)
            {
              valuePtr[0] = 0.0;
              v35 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v28);
              CFNumberGetValue(v35, kCFNumberCGFloatType, valuePtr);
              v31 = v31 + fabs(valuePtr[0]);
            }
          }
        }
        if (v9 < 1)
        {
LABEL_48:
          v58 = v72 + PlotArea + OIAxisConvertValueToLocal(String, v75);
          v59 = OIAxisConvertValueToLocal(v21, 0.0);
          _OIRenderColumnFloor(a1, floor(v71 + v58) + 0.5, floor(v27 + v59) + 0.5, v76, 0.0, a4, a5);
          goto LABEL_49;
        }
        v36 = 0;
        v37 = v27 + v30;
        v38 = 0.0;
        v66 = v37;
        v67 = 0.0;
        do
        {
          v39 = CFArrayGetValueAtIndex(theArray, v36);
          v40 = (const __CFArray *)OISeriesGetValues((uint64_t)v39);
          if (CFArrayGetCount(v40) <= v28)
            goto LABEL_46;
          valuePtr[0] = 0.0;
          v41 = (const __CFNumber *)CFArrayGetValueAtIndex(v40, v28);
          CFNumberGetValue(v41, kCFNumberCGFloatType, valuePtr);
          v42 = valuePtr[0];
          if (a3)
          {
            if (valuePtr[0] == 0.0)
            {
              v43 = 0.0;
              if (v31 == 0.0)
                goto LABEL_34;
            }
            v42 = valuePtr[0] / v31;
          }
          if (v42 >= 0.0)
          {
            v43 = v42;
LABEL_34:
            v50 = v38 + v43;
            if (v38 + v43 > v68)
              v50 = v68;
            if (v50 >= MinValue)
              v38 = v50;
            else
              v38 = MinValue;
            v46 = OIAxisConvertValueToLocal(String, v75);
            v51 = v27 + OIAxisConvertValueToLocal(v21, v38);
            v49 = v51 - v37;
            v48 = v37;
            v42 = v43;
            v37 = v51;
            goto LABEL_40;
          }
          v44 = v67 + v42;
          if (v67 + v42 < MinValue)
            v44 = MinValue;
          if (v44 <= v68)
            v45 = v44;
          else
            v45 = v68;
          v46 = OIAxisConvertValueToLocal(String, v75);
          v67 = v45;
          v47 = v27 + OIAxisConvertValueToLocal(v21, v45);
          v48 = v66;
          v49 = v47 - v66;
          v66 = v47;
LABEL_40:
          v52 = PlotArea;
          v53 = floor(v71 + v72 + PlotArea + v46);
          v54 = ceil(v49);
          v55 = floor(v48) + 0.5;
          v56 = v53 + 0.5;
          _OIRenderColumn(a1, (uint64_t)v39, v53 + 0.5, v55, v76, v54, a4, a5);
          if (OISeriesGetShowValues((uint64_t)v39))
            OILabelCollectionAddNumber((uint64_t)v65, 0, valuePtr[0], floor(v56) + 0.5, floor(v55) + 0.5, v76, v54);
          if ((a3 & 1) == 0)
          {
            PlotFillColor = OIChartGetPlotFillColor((uint64_t)v39);
            if (PlotFillColor)
              OIErrorBarRendererAddPoint((uint64_t)v63, PlotFillColor, v76 * 0.5 + v56, v55 + v54, v42, Scale);
          }
          PlotArea = v52;
          v27 = v70;
LABEL_46:
          ++v36;
        }
        while (v9 != v36);
        if (v38 == 0.0)
          goto LABEL_48;
LABEL_49:
        if (++v28 == v62)
        {
LABEL_50:
          OIErrorBarRendererRenderInContext((uint64_t)v63, v60);
          OIErrorBarRendererRelease(v63);
          OILabelCollectionRenderInContext((uint64_t)v65, v60);
          OILabelCollectionRelease(v65);
          CGContextRestoreGState(v60);
          return;
        }
      }
    }
  }
}

void OIRenderPercentStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedColumnsInChart(a1, a2, 1, 0.0, 0.0);
}

void OIRender3DColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderColumnsInChart(a1, a2, v10, v11);
}

void OIRender3DLayeredColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  const __CFArray *SeriesCount;
  double FontSize;
  double v11;
  double v12;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  SeriesCount = OIChartGetSeriesCount(a1);
  FontSize = (double)(uint64_t)OILabelGetFontSize((uint64_t)Axis);
  v11 = OIChartGetRotation(a1) / 45.0 * (v6 * (double)(uint64_t)SeriesCount / FontSize);
  v12 = v8 * (double)(uint64_t)SeriesCount / FontSize * (OIChartGetElevation(a1) / 90.0);
  _OIRenderMultiLevelColumnsInChart(a1, a2, v11, v12);
}

void _OIRenderMultiLevelColumnsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  CGContext *Type;
  double PlotArea;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  int v14;
  const void *ValueAtIndex;
  uint64_t String;
  uint64_t v17;
  double FontSize;
  double Scale;
  int v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  const void *v30;
  const __CFArray *Values;
  const __CFNumber *v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGContext *c;
  CFIndex Count;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double MinValue;
  double valuePtr[2];
  CGSize v50;
  CGRect v51;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v44 = v9;
      v45 = PlotArea;
      v51.origin.x = PlotArea;
      v51.origin.y = v9;
      v51.size.width = v11;
      v51.size.height = v13;
      CGContextClipToRect(Type, v51);
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      v17 = OIAxisGetType((uint64_t)ValueAtIndex);
      FontSize = OILabelGetFontSize(String);
      MinValue = OIAxisGetMinValue(v17);
      v43 = OILabelGetFontSize(v17);
      Scale = OIAxisGetScale(String);
      v20 = OIAxisAreLabelsCentered(String);
      v21 = Scale * -0.5;
      if (v20)
        v21 = 0.0;
      v42 = v21;
      if (v14)
      {
        v50.width = 4.0;
        v50.height = -4.0;
        CGContextSetShadow(Type, v50, 3.0);
      }
      c = Type;
      v22 = (uint64_t)FontSize;
      if ((uint64_t)FontSize >= 1)
      {
        v23 = 0;
        v24 = floor(Scale * 0.5);
        v41 = floor(Scale * 0.25);
        v25 = (double)Count;
        v26 = a4 / (double)Count;
        v27 = a3 / (double)Count;
        do
        {
          if (Count >= 1)
          {
            v28 = Count + 1;
            do
            {
              v29 = v28 - 2;
              v30 = CFArrayGetValueAtIndex(theArray, v28 - 2);
              Values = (const __CFArray *)OISeriesGetValues((uint64_t)v30);
              if (v23 < CFArrayGetCount(Values))
              {
                valuePtr[0] = 0.0;
                v32 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v23);
                CFNumberGetValue(v32, kCFNumberCGFloatType, valuePtr);
                v33 = valuePtr[0];
                if (valuePtr[0] <= v43)
                {
                  v34 = valuePtr[0] < MinValue;
                }
                else
                {
                  v33 = v43;
                  v34 = 1;
                }
                if (v34)
                {
                  if (v33 < MinValue)
                    v33 = MinValue;
                  valuePtr[0] = v33;
                }
                OIAxisConvertValueToLocal(String, (double)v23);
                v35 = v44 + OIAxisConvertValueToLocal(v17, 0.0);
                v36 = a3 * (double)v29 / v25 + v41 + v42 + v45 + OIAxisConvertValueToLocal(String, (double)v23);
                v37 = a4 * (double)v29 / v25 + v35;
                v38 = v44 + OIAxisConvertValueToLocal(v17, valuePtr[0]) - v35;
                _OIRenderColumnFloor(a1, v36, v37, v24, v38, v27, v26);
                _OIRenderColumn(a1, (uint64_t)v30, v36, v37, v24, v38, v27, v26);
              }
              --v28;
            }
            while (v28 > 1);
          }
          ++v23;
        }
        while (v23 != v22);
      }
      CGContextRestoreGState(c);
    }
  }
}

void OIRender3DStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderStackedColumnsInChart(a1, a2, 0, v10, v11);
}

void OIRender3DPercentStackedColumnsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderStackedColumnsInChart(a1, a2, 1, v10, v11);
}

void _OIRenderColumnFloor(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  CGContext *Type;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPath *Mutable;
  CGColor *GenericRGB;
  CGFloat v19;
  CGFloat v20;
  double v21;

  Type = (CGContext *)OIAxisGetType(a1);
  v13 = a2 + a6 * 0.25;
  v14 = a3 + a7 * 0.25;
  v15 = a6 * 0.5;
  v16 = a7 * 0.5;
  Mutable = CGPathCreateMutable();
  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  v19 = floor(v14) + 0.5;
  CGPathMoveToPoint(Mutable, 0, floor(v13) + 0.5, v19);
  v20 = floor(v16 + v14) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, floor(v15 + v13) + 0.5, v20);
  v21 = a4 + v13;
  CGPathAddLineToPoint(Mutable, 0, floor(v15 + v21) + 0.5, v20);
  CGPathAddLineToPoint(Mutable, 0, floor(v21) + 0.5, v19);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(Type, GenericRGB);
  CGContextAddPath(Type, Mutable);
  CGContextFillPath(Type);
  CGPathRelease(Mutable);
  CGColorRelease(GenericRGB);
}

void _OIRenderColumn(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  CGContext *Type;
  CGColor *TextColor;
  CGColor *StrokeColor;
  uint64_t FillImage;
  double StrokeWidth;
  CGFloat v20;
  double v21;
  double v22;
  CGPath *Mutable;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGColor *v35;
  CGPath *v36;
  double v37;
  double v38;
  CGPath *v39;
  CGColor *v40;
  CGFloat x;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat width;
  CGRect v48;
  CGRect v49;

  Type = (CGContext *)OIAxisGetType(a1);
  TextColor = (CGColor *)OILabelGetTextColor(a2);
  StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
  FillImage = OISeriesGetFillImage(a2);
  StrokeWidth = OILabelGetStrokeWidth(a2);
  v20 = StrokeWidth;
  if (a7 == 0.0 && a8 == 0.0)
  {
    if (FillImage)
    {
      OISeriesSetupFillImageForContext(a2, Type);
    }
    else
    {
      if (!TextColor)
        goto LABEL_10;
      CGContextSetFillColorWithColor(Type, TextColor);
    }
    v48.origin.x = a3;
    v48.origin.y = a4;
    v48.size.width = a5;
    v48.size.height = a6;
    CGContextFillRect(Type, v48);
LABEL_10:
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextSetLineWidth(Type, v20);
      v49.origin.x = a3;
      v49.origin.y = a4;
      v49.size.width = a5;
      v49.size.height = a6;
      CGContextStrokeRect(Type, v49);
    }
    return;
  }
  width = StrokeWidth;
  v21 = a3 + a7 * 0.25;
  v22 = a4 + a8 * 0.25;
  Mutable = CGPathCreateMutable();
  v24 = floor(v21) + 0.5;
  v25 = a5;
  v26 = floor(v22) + 0.5;
  CGPathMoveToPoint(Mutable, 0, v24, v26);
  v46 = a6;
  v44 = v22;
  v27 = a6 + v22;
  v28 = v26;
  v43 = v27;
  v29 = floor(v27) + 0.5;
  x = v24;
  CGPathAddLineToPoint(Mutable, 0, v24, v29);
  v42 = v21;
  v30 = v25 + v21;
  v31 = floor(v25 + v21) + 0.5;
  v45 = v29;
  CGPathAddLineToPoint(Mutable, 0, v31, v29);
  CGPathAddLineToPoint(Mutable, 0, v31, v28);
  CGPathCloseSubpath(Mutable);
  if (FillImage)
  {
    OISeriesSetupFillImageForContext(a2, Type);
    v32 = a8;
LABEL_14:
    CGContextAddPath(Type, Mutable);
    CGContextFillPath(Type);
    goto LABEL_15;
  }
  v32 = a8;
  if (TextColor)
  {
    CGContextSetFillColorWithColor(Type, TextColor);
    goto LABEL_14;
  }
LABEL_15:
  v34 = v32 * 0.5;
  if (StrokeColor)
  {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    CGContextAddPath(Type, Mutable);
    CGContextSetLineWidth(Type, width);
    CGContextStrokePath(Type);
  }
  CGPathRelease(Mutable);
  v35 = OICreateDimmedColorFromColor(TextColor, 0.5);
  v36 = CGPathCreateMutable();
  CGPathMoveToPoint(v36, 0, v31, v28);
  CGPathAddLineToPoint(v36, 0, v31, v45);
  v33 = a7 * 0.5;
  v37 = floor(a7 * 0.5 + v30) + 0.5;
  v38 = floor(v34 + v43) + 0.5;
  CGPathAddLineToPoint(v36, 0, v37, v38);
  CGPathAddLineToPoint(v36, 0, v37, floor(v34 + v44) + 0.5);
  CGPathCloseSubpath(v36);
  if (v35)
  {
    CGContextSetFillColorWithColor(Type, v35);
    CGContextAddPath(Type, v36);
    CGContextFillPath(Type);
  }
  if (StrokeColor)
  {
    CGContextSetStrokeColorWithColor(Type, StrokeColor);
    CGContextAddPath(Type, v36);
    CGContextSetLineWidth(Type, width);
    CGContextStrokePath(Type);
  }
  CGPathRelease(v36);
  CGColorRelease(v35);
  if (v46 >= 0.0)
  {
    v39 = CGPathCreateMutable();
    v40 = OICreateDimmedColorFromColor(TextColor, 0.8);
    CGPathMoveToPoint(v39, 0, x, v45);
    CGPathAddLineToPoint(v39, 0, floor(v33 + v42) + 0.5, v38);
    CGPathAddLineToPoint(v39, 0, v37, v38);
    CGPathAddLineToPoint(v39, 0, v31, v45);
    CGPathCloseSubpath(v39);
    if (v40)
    {
      CGContextSetFillColorWithColor(Type, v40);
      CGContextAddPath(Type, v39);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, v39);
      CGContextSetLineWidth(Type, width);
      CGContextStrokePath(Type);
    }
    CGPathRelease(v39);
    CGColorRelease(v40);
  }
}

void OIRenderRadarInChart(uint64_t a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  CFIndex Count;
  uint64_t v5;
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const void *ValueAtIndex;
  uint64_t String;
  uint64_t v16;
  double FontSize;
  CFIndex v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  const void *v24;
  const __CFArray *Values;
  uint64_t StrokeColor;
  CFIndex v27;
  CFIndex v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFIndex i;
  const __CFNumber *v33;
  double v34;
  __double2 v35;
  double v36;
  double v37;
  uint64_t v38;
  double x;
  uint64_t v40;
  const __CFArray *v41;
  int v42;
  uint64_t v43;
  uint64_t TextColor;
  double valuePtr;
  CGSize v46;
  CGRect v47;

  if (theArray)
  {
    v2 = theArray;
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v42 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      v47.origin.x = PlotArea;
      v47.origin.y = v9;
      v47.size.width = v11;
      v47.size.height = v13;
      CGContextClipToRect(Type, v47);
      ValueAtIndex = CFArrayGetValueAtIndex(v2, 0);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      v16 = OIAxisGetType((uint64_t)ValueAtIndex);
      FontSize = OILabelGetFontSize(String);
      if (v5 >= 1)
      {
        v18 = 0;
        v19 = PlotArea + v11 * 0.5;
        v20 = v9 + v13 * 0.5;
        v21 = (uint64_t)FontSize;
        v22 = (double)(uint64_t)FontSize;
        x = floor(v19) + 0.5;
        v23 = floor(v20) + 0.5;
        v40 = v5;
        v41 = v2;
        do
        {
          v24 = CFArrayGetValueAtIndex(v2, v18);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)v24);
          TextColor = OILabelGetTextColor((uint64_t)v24);
          StrokeColor = OILabelGetStrokeColor((uint64_t)v24);
          if (v42)
          {
            v46.width = 0.0;
            v46.height = -2.0;
            CGContextSetShadow(Type, v46, 3.0);
          }
          valuePtr = 0.0;
          v27 = CFArrayGetCount(Values);
          if (!v27)
            goto LABEL_24;
          v28 = v27;
          v43 = StrokeColor;
          v29 = v21;
          if (v27 >= v21)
            v30 = v21;
          else
            v30 = v27;
          if (v30 >= 1)
          {
            v31 = 0;
            for (i = 0; i != v30; ++i)
            {
              v33 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
              CFNumberGetValue(v33, kCFNumberCGFloatType, &valuePtr);
              v34 = OIAxisConvertValueToLocal(v16, valuePtr) * 0.5;
              v35 = __sincos_stret((double)v31 * -3.14159265 / v22 + 1.57079633);
              v36 = floor(v19 + v34 * v35.__cosval) + 0.5;
              v37 = floor(v20 + v34 * v35.__sinval) + 0.5;
              if (i)
                CGContextAddLineToPoint(Type, v36, v37);
              else
                CGContextMoveToPoint(Type, v36, v37);
              v31 += 2;
            }
          }
          OISeriesSetupStrokeAndFillForContext((uint64_t)v24, Type);
          v21 = v29;
          if (v28 >= v29)
          {
            CGContextClosePath(Type);
            v5 = v40;
            v2 = v41;
            v38 = v43;
            if (!TextColor)
              goto LABEL_22;
          }
          else
          {
            v5 = v40;
            v2 = v41;
            v38 = v43;
            if (!TextColor)
              goto LABEL_22;
            CGContextAddLineToPoint(Type, x, v23);
            CGContextClosePath(Type);
          }
          CGContextFillPath(Type);
LABEL_22:
          if (v38)
            CGContextStrokePath(Type);
LABEL_24:
          ++v18;
        }
        while (v18 != v5);
      }
      CGContextRestoreGState(Type);
    }
  }
}

void OILabelRenderInContext(uint64_t a1, CGContextRef c)
{
  int HasShadow;
  const __CFString *String;
  double Frame;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGColor *FillColor;
  CGColor *v14;
  uint64_t TextColor;
  double FontSize;
  double v17;
  double v18;
  double v19;
  double v20;
  int Alignment;
  double v22;
  double v23;
  void *v24;
  CTFontRef v25;
  void *v26;
  void *v27;
  double StrokeWidth;
  _QWORD v29[6];
  _QWORD v30[2];
  _QWORD v31[3];
  CGSize v32;
  CGSize v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v31[2] = *MEMORY[0x24BDAC8D0];
  CGContextSaveGState(c);
  HasShadow = OILabelHasShadow(a1);
  if (HasShadow)
  {
    v32.width = 0.0;
    v32.height = -4.0;
    CGContextSetShadow(c, v32, 6.0);
  }
  String = (const __CFString *)OILabelGetString(a1);
  Frame = OILabelGetFrame(a1);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  FillColor = (CGColor *)OILabelGetFillColor(a1);
  v14 = (CGColor *)OILabelGetFillColor(a1);
  TextColor = OILabelGetTextColor(a1);
  StrokeWidth = OILabelGetStrokeWidth(a1);
  if (FillColor)
  {
    CGContextSetFillColorWithColor(c, FillColor);
    v34.origin.x = floor(Frame) + 0.5;
    v34.origin.y = floor(v8) + 0.5;
    v34.size.width = ceil(v10);
    v34.size.height = ceil(v12);
    CGContextFillRect(c, v34);
  }
  if (HasShadow)
  {
    v33.width = 0.0;
    v33.height = 0.0;
    CGContextSetShadow(c, v33, 0.0);
  }
  v35.origin.x = Frame;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  CGContextClipToRect(c, v35);
  FontSize = OILabelGetFontSize(a1);
  if (FontSize <= v12)
    v17 = FontSize;
  else
    v17 = v12 + -1.0;
  CGContextSetTextDrawingMode(c, kCGTextFill);
  v19 = OISizeForStringInContext(String, v17);
  if (v19 > v10 + -4.0)
  {
    v17 = v17 * ((v10 + -4.0) / v19);
    v19 = OISizeForStringInContext(String, v17);
  }
  v20 = v18;
  Alignment = OILabelGetAlignment(a1);
  v22 = Frame + v10 - v19;
  if (Alignment != 1)
    v22 = Frame;
  if (Alignment == 2)
    v23 = Frame + v10 * 0.5 - v19 * 0.5;
  else
    v23 = v22;
  v24 = (void *)MEMORY[0x24BDBCED8];
  v30[0] = *MEMORY[0x24BDC4C28];
  v25 = OICreateDefaultFontWithSize(v17);
  v30[1] = *MEMORY[0x24BDC4EE0];
  v31[0] = v25;
  v31[1] = TextColor;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryWithDictionary:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && StrokeWidth != 0.0)
  {
    CGContextSetLineWidth(c, StrokeWidth);
    CGContextSetStrokeColorWithColor(c, v14);
    v36.origin.x = floor(Frame) + 0.5;
    v36.origin.y = floor(v8) + 0.5;
    v36.size.width = ceil(v10);
    v36.size.height = ceil(v12);
    CGContextStrokeRect(c, v36);
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __OILabelRenderInContext_block_invoke;
  v29[3] = &__block_descriptor_48_e29__CGPoint_dd_24__0_CGSize_dd_8l;
  *(double *)&v29[4] = v23;
  *(double *)&v29[5] = v8 + (v12 + -4.0 - v20) * 0.5 + 2.0;
  OIDrawStringWithAttributes(String, v27, c, v29);
  CGContextRestoreGState(c);

}

void OILabelCollectionRenderInContext(uint64_t a1, CGContext *a2)
{
  const __CFArray *String;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  double v7;
  const void *ValueAtIndex;
  double MinFontSize;
  CFIndex v10;
  CFIndex v11;
  CFIndex i;
  const void *v13;
  __int128 v14;
  CFIndex v15;
  CFIndex v16;
  CFIndex j;
  const void *v18;
  CGAffineTransform v19;

  String = (const __CFArray *)OILabelGetString(a1);
  Count = CFArrayGetCount(String);
  if (Count < 1)
  {
    v7 = 100.0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    v7 = 100.0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(String, v6);
      MinFontSize = _OILabelGetMinFontSize((uint64_t)ValueAtIndex);
      if (MinFontSize < v7)
        v7 = MinFontSize;
      ++v6;
    }
    while (v5 != v6);
  }
  v10 = CFArrayGetCount(String);
  if (v10 >= 1)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
    {
      v13 = CFArrayGetValueAtIndex(String, i);
      OILabelSetFontSize((uint64_t)v13, v7);
    }
  }
  CGContextSaveGState(a2);
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v19.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v19.c = v14;
  *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGContextSetTextMatrix(a2, &v19);
  v15 = CFArrayGetCount(String);
  if (v15 >= 1)
  {
    v16 = v15;
    for (j = 0; j != v16; ++j)
    {
      v18 = CFArrayGetValueAtIndex(String, j);
      OILabelRenderInContext((uint64_t)v18, a2);
    }
  }
  CGContextRestoreGState(a2);
}

double _OILabelGetMinFontSize(uint64_t a1)
{
  const __CFString *String;
  double v3;
  double v4;
  double FontSize;
  double v6;

  String = (const __CFString *)OILabelGetString(a1);
  OILabelGetFrame(a1);
  v4 = v3;
  FontSize = OILabelGetFontSize(a1);
  v6 = OISizeForStringInContext(String, FontSize);
  if (v6 > v4 + -4.0)
    return FontSize * ((v4 + -4.0) / v6);
  return FontSize;
}

CGImageRef OIChartingCreateImageRef(const __CFDictionary *a1, _DWORD *a2, double a3, double a4)
{
  return OIChartingCreateImageRefWithFormatterCallback(a1, 0, a2, a3, a4);
}

CGImageRef OIChartingCreateImageRefWithFormatterCallback(const __CFDictionary *a1, uint64_t a2, _DWORD *a3, double a4, double a5)
{
  CGImageRef Image;
  size_t v11;
  void *v12;
  CGColorSpace *DeviceRGB;
  CGContext *v14;
  CGContext *v15;
  double *ChartFromData;
  double *v17;

  if (!a1)
    return 0;
  Image = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    v11 = vcvtd_n_u64_f64(a4, 2uLL);
    v12 = malloc_type_calloc((unint64_t)a5, v11, 0x70311256uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v14 = CGBitmapContextCreate(v12, (unint64_t)a4, (unint64_t)a5, 8uLL, v11, DeviceRGB, 0x2002u);
    if (v14)
    {
      v15 = v14;
      CGContextSetShouldAntialias(v14, 1);
      ChartFromData = _OIChartingCreateChartFromData(a1, v15, a2, a4, a5);
      if (ChartFromData)
      {
        v17 = ChartFromData;
        if (OIChartGetStatus((uint64_t)ChartFromData))
        {
          Image = 0;
        }
        else
        {
          OIChartDraw((uint64_t)v17);
          Image = OIChartCreateImage((uint64_t)v17);
        }
        *a3 = OIChartGetStatus((uint64_t)v17);
        OIChartRelease(v17);
      }
      else
      {
        CFShow(CFSTR("Cannot create chart object"));
        Image = 0;
        *a3 = 1;
      }
      CGContextRelease(v15);
      if (!DeviceRGB)
        goto LABEL_16;
    }
    else
    {
      CFShow(CFSTR("Cannot create context"));
      Image = 0;
      *a3 = 0;
      if (!DeviceRGB)
      {
LABEL_16:
        if (v12)
          free(v12);
        return Image;
      }
    }
    CGColorSpaceRelease(DeviceRGB);
    goto LABEL_16;
  }
  return Image;
}

double *_OIChartingCreateChartFromData(const __CFDictionary *a1, CGContext *a2, uint64_t a3, double a4, double a5)
{
  char *v7;
  double *v8;

  v7 = OIChartCreate(0, a2, a4, a5);
  v8 = (double *)v7;
  if (v7)
  {
    OIChartSetCustomFormatterCallback((uint64_t)v7, a3);
    _OIChartingSetupColors((uint64_t)v8, a1);
    _OIChartingGetSeriesFromData((uint64_t)v8, a1);
    _OIChartingSetupAxisRanges((uint64_t)v8);
    _OIChartingSetupArea(v8, a1);
    _OIChartingUpdateAxisWithData((uint64_t)v8, a1);
    _OIChartingGetLabelsFromData((uint64_t)v8, a1);
  }
  return v8;
}

__CFData *OIChartingCreatePDFData(const __CFDictionary *a1, _DWORD *a2, CGFloat a3, CGFloat a4)
{
  return OIChartingCreatePDFDataWithFormatterCallback(a1, 0, a2, a3, a4);
}

__CFData *OIChartingCreatePDFDataWithFormatterCallback(const __CFDictionary *a1, uint64_t a2, _DWORD *a3, CGFloat a4, CGFloat a5)
{
  __CFData *Mutable;
  CGDataConsumer *v11;
  CGDataConsumer *v12;
  CGContext *v13;
  CGContext *v14;
  double *ChartFromData;
  double *v16;
  CGRect v18;

  if (!a1)
    return 0;
  Mutable = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    Mutable = CFDataCreateMutable(0, 0);
    v11 = CGDataConsumerCreateWithCFData(Mutable);
    if (v11)
    {
      v12 = v11;
      v18.origin.x = 0.0;
      v18.origin.y = 0.0;
      v18.size.width = a4;
      v18.size.height = a5;
      v13 = CGPDFContextCreate(v11, &v18, 0);
      if (v13)
      {
        v14 = v13;
        ChartFromData = _OIChartingCreateChartFromData(a1, v13, a2, a4, a5);
        if (ChartFromData)
        {
          v16 = ChartFromData;
          if (!OIChartGetStatus((uint64_t)ChartFromData))
          {
            CGContextBeginPage(v14, &v18);
            CGContextSetShouldAntialias(v14, 1);
            OIChartDraw((uint64_t)v16);
            CGContextEndPage(v14);
          }
          *a3 = OIChartGetStatus((uint64_t)v16);
          OIChartRelease(v16);
        }
        CGContextRelease(v14);
      }
      else
      {
        CFShow(CFSTR("Cannot create PDF context"));
        *a3 = 0;
      }
      CGDataConsumerRelease(v12);
    }
    else
    {
      CFShow(CFSTR("Cannot create DataConsumer"));
      *a3 = 0;
    }
  }
  return Mutable;
}

uint64_t _OIChartingSetupColors(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CGColor *v7;
  CGColor *v8;
  const __CFNumber *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  CGColor *v12;
  CGColor *v13;
  const __CFNumber *v14;
  int v15;
  double v16;
  CGColor *GenericRGB;
  CGColor *v18;
  const __CFNumber *v19;
  uint64_t result;
  const __CFDictionary *v21;
  CGColor *v22;
  CGColor *v23;
  CGColor *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t valuePtr;
  double v31;

  v31 = 0.0;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartUseShadowsKey"));
  if (Value)
  {
    valuePtr = 0;
    if (CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr))
      OIChartSetUseShadows(a1, valuePtr != 0);
  }
  v5 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("kOIChartCanvasKey"));
  if (v5)
  {
    v6 = v5;
    v7 = (CGColor *)CFDictionaryGetValue(v5, CFSTR("kOIChartStrokeColorKey"));
    v8 = (CGColor *)CFDictionaryGetValue(v6, CFSTR("kOIChartFillColorKey"));
    v9 = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("kOIChartStrokeWidthKey"));
    if (v9 && CFNumberGetValue(v9, kCFNumberCGFloatType, &v31))
      OIChartSetCanvasStrokeWidth(a1, v31);
    if (v8)
      OIChartSetCanvasFillColor(a1, v8);
    if (v7)
      OIChartSetCanvasStrokeColor(a1, v7);
  }
  v10 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("kOIChartPlotKey"));
  if (v10)
  {
    v11 = v10;
    v12 = (CGColor *)CFDictionaryGetValue(v10, CFSTR("kOIChartStrokeColorKey"));
    v13 = (CGColor *)CFDictionaryGetValue(v11, CFSTR("kOIChartFillColorKey"));
    v14 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("kOIChartStrokeWidthKey"));
    if (v13)
    {
      OIChartSetPlotFillColor(a1, v13);
      if (v12)
        goto LABEL_15;
    }
    else
    {
      GenericRGB = OIColorCreateGenericRGB(0.8, 0.8, 0.8, 1.0);
      OIChartSetPlotFillColor(a1, GenericRGB);
      CGColorRelease(GenericRGB);
      if (v12)
      {
LABEL_15:
        OIAxisSetStrokeColor(a1, v12);
        if (v14)
          goto LABEL_16;
        goto LABEL_21;
      }
    }
    v18 = OIColorCreateGenericRGB(0.5, 0.5, 0.5, 1.0);
    OIAxisSetStrokeColor(a1, v18);
    CGColorRelease(v18);
    if (v14)
    {
LABEL_16:
      v15 = CFNumberGetValue(v14, kCFNumberCGFloatType, &v31);
      v16 = v31;
      if (!v15)
        v16 = 1.0;
      goto LABEL_22;
    }
LABEL_21:
    v16 = 1.0;
LABEL_22:
    OIChartSetPlotStrokeWidth(a1, v16);
    v19 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("kOIChartHidePlotAreaKey"));
    if (v19)
    {
      valuePtr = 0;
      if (CFNumberGetValue(v19, kCFNumberNSIntegerType, &valuePtr))
        OIChartSetHidePlotArea(a1, valuePtr != 0);
    }
  }
  result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("kOIChartLegendKey"));
  if (result)
  {
    v21 = (const __CFDictionary *)result;
    v29 = 0;
    valuePtr = 0;
    v22 = (CGColor *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("kOIChartStrokeColorKey"));
    v23 = (CGColor *)CFDictionaryGetValue(v21, CFSTR("kOIChartFillColorKey"));
    v24 = (CGColor *)CFDictionaryGetValue(v21, CFSTR("kOIChartTextColorKey"));
    v25 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("kOIChartStrokeWidthKey"));
    if (v25 && CFNumberGetValue(v25, kCFNumberCGFloatType, &v31))
      OIChartSetLegendStrokeWidth(a1, v31);
    v26 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("kOIChartHasShadowKey"));
    if (v26 && CFNumberGetValue(v26, kCFNumberCGFloatType, &valuePtr))
      OIChartSetLegendHasShadow(a1, valuePtr != 0);
    v27 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("kOIChartLegendPlacementKey"));
    if (v27 && CFNumberGetValue(v27, kCFNumberNSIntegerType, &v29))
      OIChartSetLegendPlacement(a1, v29);
    if (v24)
      OIChartSetLegendTextColor(a1, v24);
    if (v23)
      OIChartSetLegendFillColor(a1, v23);
    if (v22)
      OIChartSetLegendStrokeColor(a1, v22);
    result = (uint64_t)CFDictionaryGetValue(v21, CFSTR("kOIChartHideLegendKey"));
    if (result)
    {
      v28 = 0;
      result = CFNumberGetValue((CFNumberRef)result, kCFNumberNSIntegerType, &v28);
      if ((_DWORD)result)
        return OIChartSetHideLegend(a1, v28 != 0);
    }
  }
  return result;
}

void _OIChartingGetSeriesFromData(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFArray *Value;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  char v8;
  const __CFDictionary *ValueAtIndex;
  _QWORD *v10;
  _QWORD *v11;
  const __CFString *SubType;
  CFComparisonResult v13;
  uint64_t v14;
  int v15;
  int v16;
  const __CFNumber *v17;
  CGColor *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t valuePtr;
  _OWORD v23[4];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("kOIChartSeriesKey"));
  if (!Value)
    return;
  v4 = Value;
  memset(v23, 0, sizeof(v23));
  Count = CFArrayGetCount(Value);
  if (Count < 1)
    return;
  v6 = Count;
  v7 = 0;
  v8 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    v10 = OISeriesCreateFromDictionary(ValueAtIndex);
    if (!v10)
      goto LABEL_52;
    v11 = v10;
    SubType = (const __CFString *)OIAxisGetSubType((uint64_t)v10);
    if (CFStringCompare(SubType, CFSTR("kOIChartStackedColumnType"), 0)
      && CFStringCompare(SubType, CFSTR("kOIChart3DStackedColumnType"), 0))
    {
      if (CFStringCompare(SubType, CFSTR("kOIChartPercentStackedColumnType"), 0) == kCFCompareEqualTo
        || CFStringCompare(SubType, CFSTR("kOIChart3DPercentStackedColumnType"), 0) == kCFCompareEqualTo)
      {
        goto LABEL_28;
      }
      if (CFStringCompare(SubType, CFSTR("kOIChartBarType"), 0) == kCFCompareEqualTo
        || CFStringCompare(SubType, CFSTR("kOIChart3DBarType"), 0) == kCFCompareEqualTo)
      {
        v19 = 0;
LABEL_57:
        _OIChartingSetupBarTypeAxis(a1, (uint64_t)v11, v19);
        goto LABEL_30;
      }
      if (CFStringCompare(SubType, CFSTR("kOIChartStackedBarType"), 0) == kCFCompareEqualTo
        || CFStringCompare(SubType, CFSTR("kOIChart3DStackedBarType"), 0) == kCFCompareEqualTo)
      {
        v19 = 2;
        goto LABEL_57;
      }
      if (CFStringCompare(SubType, CFSTR("kOIChartPercentStackedBarType"), 0) == kCFCompareEqualTo
        || CFStringCompare(SubType, CFSTR("kOIChart3DPercentStackedBarType"), 0) == kCFCompareEqualTo)
      {
        v19 = 3;
        goto LABEL_57;
      }
      if (CFStringCompare(SubType, CFSTR("kOIChartStackedLineType"), 0)
        && CFStringCompare(SubType, CFSTR("kOIChartStackedLineType"), 0))
      {
        if (CFStringCompare(SubType, CFSTR("kOIChartPercentStackedLineType"), 0)
          && CFStringCompare(SubType, CFSTR("kOIChartPercentStackedLineType"), 0))
        {
          if (CFStringCompare(SubType, CFSTR("kOIChartXYType"), 0) == kCFCompareEqualTo
            || CFStringCompare(SubType, CFSTR("kOIChartBubbleType"), 0) == kCFCompareEqualTo)
          {
            _OIChartingSetupXYTypeAxis(a1, (uint64_t)v11);
            goto LABEL_30;
          }
          if (CFStringCompare(SubType, CFSTR("kOIChartPieType"), 0) == kCFCompareEqualTo
            || CFStringCompare(SubType, CFSTR("kOIChart3DPieType"), 0) == kCFCompareEqualTo
            || (v13 = CFStringCompare(SubType, CFSTR("kOIChartDoughnutType"), 0), v14 = 0, v13 == kCFCompareEqualTo))
          {
            if ((OIChartGetHidePlotArea(a1) & 1) == 0)
              OIChartSetLegendPlacement(a1, 3);
            v15 = 1;
            goto LABEL_31;
          }
          goto LABEL_29;
        }
LABEL_28:
        v14 = 3;
        goto LABEL_29;
      }
    }
    v14 = 2;
LABEL_29:
    _OIChartingSetupColumnTypeAxis(a1, (uint64_t)v11, v14);
LABEL_30:
    v15 = v16;
LABEL_31:
    if (!OILabelGetTextColor((uint64_t)v11)
      && (!OILabelGetStrokeColor((uint64_t)v11) || OILabelGetStrokeWidth((uint64_t)v11) == 0.0))
    {
      if ((v8 & 1) == 0)
      {
        valuePtr = 0;
        v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("kOIChartColorThemeKey"));
        if (v17 && !CFNumberGetValue(v17, kCFNumberNSIntegerType, &valuePtr))
          valuePtr = 0;
        _OIChartingInitColors((CGColorRef *)v23, valuePtr);
      }
      if (CFStringCompare(SubType, CFSTR("kOIChartXYType"), 0)
        && CFStringCompare(SubType, CFSTR("kOIChartLineType"), 0)
        && CFStringCompare(SubType, CFSTR("kOIChartStackedLineType"), 0)
        && CFStringCompare(SubType, CFSTR("kOIChartPercentStackedLineType"), 0))
      {
        OILabelSetTextColor((uint64_t)v11, *((CGColorRef *)v23 + (v7 & 7)));
      }
      else
      {
        v18 = (CGColor *)*((_QWORD *)v23 + (v7 & 7));
        OILabelSetStrokeColor((uint64_t)v11, v18);
        if (OILabelGetStrokeWidth((uint64_t)v11) == 0.0)
          OILabelSetStrokeWidth((uint64_t)v11, 1.0);
        if (OIAxisGetLabels((uint64_t)v11))
          OISeriesSetMarkerColor((uint64_t)v11, v18);
      }
      v8 = 1;
    }
    if (v15)
      OIChartAddSeries(a1, v11);
    OISeriesRelease(v11);
LABEL_52:
    ++v7;
  }
  while (v6 != v7);
  if ((v8 & 1) != 0)
  {
    for (i = 0; i != 64; i += 8)
      CGColorRelease(*(CGColorRef *)((char *)v23 + i));
  }
}

void _OIChartingSetupAxisRanges(uint64_t a1)
{
  const void *Axis;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  if (Axis)
  {
    v3 = (uint64_t)Axis;
    if (OIAxisGetType((uint64_t)Axis) == 1)
    {
      if (OIAxisGetSubType(v3) == 1)
        _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(a1, v3);
      else
        _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v3);
    }
  }
  v4 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  if (v4)
  {
    v5 = (uint64_t)v4;
    if (OIAxisGetType((uint64_t)v4) == 1 && OIAxisGetSubType(v5) != 1)
      _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v5);
  }
  v6 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
  if (v6)
  {
    v7 = (uint64_t)v6;
    if (OIAxisGetType((uint64_t)v6) == 1)
    {
      if (OIAxisGetSubType(v7) == 1)
        _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(a1, v7);
      else
        _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v7);
    }
  }
  v8 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (OIAxisGetType((uint64_t)v8) == 1 && OIAxisGetSubType(v9) != 1)
      _OIChartingUpdateAxisRangeWithValuesFromSeries(a1, v9);
  }
}

double *_OIChartingSetupArea(double *a1, const __CFDictionary *a2)
{
  double Size;
  double v5;
  double v6;
  double v7;
  const __CFDictionary *Value;
  const __CFDictionary *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  const __CFDictionary *v14;
  double v15;
  double v16;
  double v17;
  const __CFArray *SeriesCount;
  uint64_t LegendPlacement;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  const __CFArray *v26;
  double height;
  double width;
  double y;
  double x;
  int HideLegend;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v37;

  Size = OIChartGetSize((uint64_t)a1);
  v6 = v5;
  v7 = v5 * 0.98;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("kOIChartTitleKey"));
  if (Value)
  {
    v9 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("kOIChartTitleAreaKey"));
    if (v9)
      v10 = v7;
    else
      v10 = v7 + -28.0;
  }
  else
  {
    v9 = 0;
    v10 = v7;
  }
  v11 = Size * 0.01;
  v12 = v6 * 0.01;
  v13 = Size * 0.98;
  v14 = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("kOIChartLegendKey"));
  if (!v14)
  {
    if (OIChartGetLegendPlacement((uint64_t)a1) == -1)
    {
      v15 = v11;
      v16 = v12;
      v17 = v13;
      goto LABEL_38;
    }
    memset(&v37, 0, sizeof(v37));
    if (v9)
      goto LABEL_8;
LABEL_13:
    SeriesCount = OIChartGetSeriesCount((uint64_t)a1);
    LegendPlacement = OIChartGetLegendPlacement((uint64_t)a1);
    v20 = (uint64_t)(floor((double)(uint64_t)SeriesCount / 10.0) + 1.0);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    switch(LegendPlacement)
    {
      case 0:
        v37.origin.x = v11;
        v37.origin.y = v12;
        v22 = (double)(20 * v20);
        if (v10 * 0.5 < v22)
          v22 = v10 * 0.5;
        v37.size.width = v13;
        v37.size.height = v22;
        v10 = v10 - v22;
        v16 = v12 + v22;
        v15 = v11;
        goto LABEL_10;
      case 1:
        v25 = (double)v20 * 0.15 * v13;
        if (v25 > v13 * 0.5)
          v25 = v13 * 0.5;
        v37.size.width = v25;
        v17 = v13 - v25;
        v37.origin.x = v13 - v25;
        v26 = OIChartGetSeriesCount((uint64_t)a1);
        v10 = v10 - (double)(10 * (uint64_t)v26);
        v37.size.height = (double)(10 * (uint64_t)v26);
        v37.origin.y = v10;
        goto LABEL_30;
      case 2:
        v23 = (double)(20 * v20);
        if (v10 * 0.5 < v23)
          v23 = v10 * 0.5;
        v37.size.width = v13;
        v37.size.height = v23;
        v10 = v10 - v23;
        v37.origin.x = v11;
        v37.origin.y = v10;
        goto LABEL_9;
      case 3:
      case 7:
        v21 = (double)v20 * 0.15 * v13;
        if (v21 > v13 * 0.5)
          v21 = v13 * 0.5;
        v37.size.width = v21;
        v37.size.height = v10;
        v17 = v13 - v21;
        v37.origin.x = v13 - v21;
        v37.origin.y = v12;
LABEL_30:
        v15 = v11;
        goto LABEL_31;
      case 4:
        v37.origin.x = v11;
        v37.origin.y = v12;
        v24 = (double)v20 * 0.15 * v13;
        if (v24 > v13 * 0.5)
          v24 = v13 * 0.5;
        v37.size.width = v24;
        v37.size.height = v10;
        v17 = v13 - v24;
        v15 = v11 + v24;
LABEL_31:
        v16 = v12;
        break;
      case 5:
      case 6:
        goto LABEL_32;
      default:
        goto LABEL_9;
    }
    goto LABEL_32;
  }
  memset(&v37, 0, sizeof(v37));
  v9 = (const __CFDictionary *)CFDictionaryGetValue(v14, CFSTR("kOIChartLegendAreaKey"));
  if (!v9)
    goto LABEL_13;
LABEL_8:
  CGRectMakeWithDictionaryRepresentation(v9, &v37);
LABEL_9:
  v15 = v11;
  v16 = v12;
LABEL_10:
  v17 = v13;
LABEL_32:
  if (v37.size.width > 0.0 && v37.size.height > 0.0)
  {
    if ((OIChartGetHidePlotArea((uint64_t)a1) & 1) != 0)
    {
      v37.origin.x = v11;
      v37.origin.y = v12;
      height = v7;
      width = v13;
      y = v12;
      x = v11;
      v37.size.width = v13;
      v37.size.height = v7;
    }
    else
    {
      y = v37.origin.y;
      x = v37.origin.x;
      height = v37.size.height;
      width = v37.size.width;
    }
    OIChartSetLegendArea(a1, x, y, width, height);
  }
LABEL_38:
  HideLegend = OIChartGetHideLegend((uint64_t)a1);
  if (HideLegend)
    v32 = v11;
  else
    v32 = v15;
  if (HideLegend)
    v33 = v12;
  else
    v33 = v16;
  if (HideLegend)
    v34 = v13;
  else
    v34 = v17;
  if (HideLegend)
    v35 = v7;
  else
    v35 = v10;
  return OIChartSetPlotArea(a1, v32 + v34 * 0.12, v33 + v35 * 0.12, v34 - (v34 * 0.12 + v34 * 0.12 * 0.5), v35 + v35 * 0.12 * -2.0);
}

const __CFDictionary *_OIChartingUpdateAxisWithData(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Axis;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFNumber *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFNumber *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFNumber *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const __CFDictionary *result;
  const __CFDictionary *v27;
  const __CFNumber *v28;
  uint64_t valuePtr;

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("kOIChartAxisKey"));
  if (Value)
  {
    v5 = Value;
    v6 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("kOIChartAxisXKey"));
    if (v6)
    {
      v7 = v6;
      Axis = (const __CFNumber *)OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
      OIAxisUpdateWithDictionaryDescription(Axis, v7);
    }
    v9 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("kOIChartAxisYKey"));
    if (v9)
    {
      v10 = v9;
      v11 = (const __CFNumber *)OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
      OIAxisUpdateWithDictionaryDescription(v11, v10);
    }
    v12 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("kOIChartAxisSecondaryXKey"));
    if (v12)
    {
      v13 = v12;
      v14 = (const __CFNumber *)OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
      OIAxisUpdateWithDictionaryDescription(v14, v13);
    }
    v15 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("kOIChartAxisSecondaryYKey"));
    if (v15)
    {
      v16 = v15;
      v17 = (const __CFNumber *)OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
      OIAxisUpdateWithDictionaryDescription(v17, v16);
    }
  }
  OIChartGetPlotArea(a1);
  v19 = v18;
  v21 = v20;
  v22 = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  OIAxisUpdateScaleForLength((uint64_t)v22, v19);
  v23 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
  OIAxisUpdateScaleForLength((uint64_t)v23, v19);
  v24 = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  OIAxisUpdateScaleForLength((uint64_t)v24, v21);
  v25 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
  OIAxisUpdateScaleForLength((uint64_t)v25, v21);
  result = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("kOIChart3DSettingsKey"));
  if (result)
  {
    v27 = result;
    v28 = (const __CFNumber *)CFDictionaryGetValue(result, CFSTR("kOIChart3DRotationKey"));
    if (v28)
    {
      valuePtr = 0;
      CFNumberGetValue(v28, kCFNumberNSIntegerType, &valuePtr);
      OIChartSetRotation(a1, valuePtr);
    }
    result = (const __CFDictionary *)CFDictionaryGetValue(v27, CFSTR("kOIChart3DElevationKey"));
    if (result)
    {
      valuePtr = 0;
      CFNumberGetValue(result, kCFNumberNSIntegerType, &valuePtr);
      return (const __CFDictionary *)OIChartSetElevation(a1, valuePtr);
    }
  }
  return result;
}

void _OIChartingGetLabelsFromData(uint64_t a1, const __CFDictionary *a2)
{
  double PlotArea;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Size;
  double v12;
  double v13;
  const __CFDictionary *Value;
  const __CFDictionary *v15;
  double *v16;
  double *v17;
  CGColor *v18;
  double v19;
  double v20;
  const __CFString *String;
  double v22;
  double v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  double *v28;
  double *v29;
  double v30;
  double v31;
  const __CFString *v32;
  double v33;
  double v34;
  double v35;
  const __CFDictionary *v36;
  const __CFDictionary *v37;
  double *v38;
  double *v39;
  double v40;
  double v41;
  const __CFString *v42;
  double v43;
  const __CFDictionary *v44;
  const __CFDictionary *v45;
  double *v46;
  double *v47;
  double v48;
  double v49;
  const __CFString *v50;
  double v51;
  const __CFDictionary *v52;
  const __CFDictionary *v53;
  double *v54;
  double *v55;
  double v56;
  double v57;
  const __CFString *v58;
  double v59;

  OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  Size = OIChartGetSize(a1);
  v13 = v12;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("kOIChartTitleKey"));
  if (Value)
  {
    v15 = Value;
    v16 = OILabelCreateFromDictionary(Value);
    if (v16)
    {
      v17 = v16;
      OILabelSetAlignment((uint64_t)v16, 2);
      OILabelSetFontSize((uint64_t)v17, 14.0);
      v18 = (CGColor *)CFDictionaryGetValue(v15, CFSTR("kOIChartTextColorKey"));
      if (v18)
        OILabelSetTextColor((uint64_t)v17, v18);
      OILabelGetFrame((uint64_t)v17);
      if (v20 == 0.0 || v19 == 0.0)
      {
        String = (const __CFString *)OILabelGetString((uint64_t)v17);
        v22 = OISizeForStringInContext(String, 14.0);
        OILabelSetFrame(v17, (Size - v22) * 0.5, v13 - v23, v22, v23);
      }
      OIChartAddLabel(a1, v17);
      OILabelRelease(v17);
    }
  }
  v24 = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("kOIChartAxisKey"));
  if (v24)
  {
    v25 = v24;
    if (OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey")))
    {
      v26 = (const __CFDictionary *)CFDictionaryGetValue(v25, CFSTR("kOIChartAxisXKey"));
      if (v26)
      {
        v27 = (const __CFDictionary *)CFDictionaryGetValue(v26, CFSTR("kOIChartAxisTitleKey"));
        if (v27)
        {
          v28 = OILabelCreateFromDictionary(v27);
          if (v28)
          {
            v29 = v28;
            OILabelSetFontSize((uint64_t)v28, 10.0);
            OILabelGetFrame((uint64_t)v29);
            if (v31 == 0.0 || v30 == 0.0)
            {
              v32 = (const __CFString *)OILabelGetString((uint64_t)v29);
              v33 = OISizeForStringInContext(v32, 10.0);
              v34 = v6 + -30.0;
              v35 = v6 * 0.8;
              if (v6 + -30.0 < 0.0)
                v34 = 0.0;
              if (v35 > v13 * 0.8)
                v35 = v13 * 0.8;
              OILabelSetFrame(v29, PlotArea + v8 * 0.5 - v33, v34, v33 + v33, v35);
            }
            OIChartAddLabel(a1, v29);
            OILabelRelease(v29);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey")))
    {
      v36 = (const __CFDictionary *)CFDictionaryGetValue(v25, CFSTR("kOIChartAxisYKey"));
      if (v36)
      {
        v37 = (const __CFDictionary *)CFDictionaryGetValue(v36, CFSTR("kOIChartAxisTitleKey"));
        if (v37)
        {
          v38 = OILabelCreateFromDictionary(v37);
          if (v38)
          {
            v39 = v38;
            OILabelSetFontSize((uint64_t)v38, 10.0);
            OILabelGetFrame((uint64_t)v39);
            if (v41 == 0.0 || v40 == 0.0)
            {
              v42 = (const __CFString *)OILabelGetString((uint64_t)v39);
              v43 = OISizeForStringInContext(v42, 10.0);
              OILabelSetFrame(v39, PlotArea - v43, v6 + v10 + 5.0, v43 + v43, (v13 - (v6 + v10)) * 0.7);
            }
            OIChartAddLabel(a1, v39);
            OILabelRelease(v39);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey")))
    {
      v44 = (const __CFDictionary *)CFDictionaryGetValue(v25, CFSTR("kOIChartAxisSecondaryXKey"));
      if (v44)
      {
        v45 = (const __CFDictionary *)CFDictionaryGetValue(v44, CFSTR("kOIChartAxisTitleKey"));
        if (v45)
        {
          v46 = OILabelCreateFromDictionary(v45);
          if (v46)
          {
            v47 = v46;
            OILabelSetFontSize((uint64_t)v46, 10.0);
            OILabelGetFrame((uint64_t)v47);
            if (v49 == 0.0 || v48 == 0.0)
            {
              v50 = (const __CFString *)OILabelGetString((uint64_t)v47);
              v51 = OISizeForStringInContext(v50, 10.0);
              OILabelSetFrame(v47, PlotArea + v8 * 0.5 - v51, v6 + v10 + 5.0, v51 + v51, v6 * 0.8);
            }
            OIChartAddLabel(a1, v47);
            OILabelRelease(v47);
          }
        }
      }
    }
    if (OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey")))
    {
      v52 = (const __CFDictionary *)CFDictionaryGetValue(v25, CFSTR("kOIChartAxisSecondaryYKey"));
      if (v52)
      {
        v53 = (const __CFDictionary *)CFDictionaryGetValue(v52, CFSTR("kOIChartAxisTitleKey"));
        if (v53)
        {
          v54 = OILabelCreateFromDictionary(v53);
          if (v54)
          {
            v55 = v54;
            OILabelSetFontSize((uint64_t)v54, 10.0);
            OILabelGetFrame((uint64_t)v55);
            if (v57 == 0.0 || v56 == 0.0)
            {
              v58 = (const __CFString *)OILabelGetString((uint64_t)v55);
              v59 = OISizeForStringInContext(v58, 10.0);
              OILabelSetFrame(v55, PlotArea + v8 - v59, v6 + v10 + 5.0, v59 + v59, (v13 - (v6 + v10)) * 0.7);
            }
            OIChartAddLabel(a1, v55);
            OILabelRelease(v55);
          }
        }
      }
    }
  }
}

void _OIChartingSetupBarTypeAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *Axis;
  _QWORD *v7;
  _QWORD *v8;
  const __CFArray *Values;
  CFIndex Count;
  _QWORD *v11;
  const __CFString *v12;
  const __CFArray *v13;
  CFIndex v14;
  _QWORD *v15;
  const __CFString *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  if (!Axis)
  {
    Values = (const __CFArray *)OISeriesGetValues(a2);
    Count = CFArrayGetCount(Values);
    OIAxisCreateWithLabelCount(Count);
    if (!v11)
      return;
    v7 = v11;
    v12 = CFSTR("kOIChartAxisYKey");
LABEL_10:
    OILabelSetString((uint64_t)v7, v12);
    OIChartSetAxis(a1, v12, v7);
    OIAxisRelease(v7);
    goto LABEL_11;
  }
  v7 = Axis;
  if (!OIAxisGetType((uint64_t)Axis))
    goto LABEL_11;
  v8 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryYKey"));
  if (!v8)
  {
    v13 = (const __CFArray *)OISeriesGetValues(a2);
    v14 = CFArrayGetCount(v13);
    OIAxisCreateWithLabelCount(v14);
    if (!v15)
      return;
    v7 = v15;
    v12 = CFSTR("kOIChartAxisSecondaryYKey");
    goto LABEL_10;
  }
  v7 = v8;
  if (OIAxisGetType((uint64_t)v8))
    return;
LABEL_11:
  OISeriesSetBaseAxis(a2, v7);
  if (OISeriesIsOnSecondaryAxis(a2))
    v16 = CFSTR("kOIChartAxisSecondaryXKey");
  else
    v16 = CFSTR("kOIChartAxisXKey");
  v17 = OIChartGetAxis(a1, v16);
  if (!v17)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v19)
      return;
    v18 = (_QWORD *)v19;
    OILabelSetString(v19, v16);
    OIChartSetAxis(a1, v16, v18);
    OIAxisRelease(v18);
    goto LABEL_19;
  }
  v18 = v17;
  if (OIAxisGetType((uint64_t)v17) == 1)
  {
LABEL_19:
    OIAxisSetSubType((uint64_t)v18, a3);
    OISeriesSetValueAxis(a2, v18);
  }
}

void _OIChartingSetupColumnTypeAxis(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *Axis;
  _QWORD *v7;
  _QWORD *v8;
  const __CFArray *Values;
  CFIndex Count;
  _QWORD *v11;
  const __CFString *v12;
  const __CFArray *v13;
  CFIndex v14;
  _QWORD *v15;
  const __CFString *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  if (!Axis)
  {
    Values = (const __CFArray *)OISeriesGetValues(a2);
    Count = CFArrayGetCount(Values);
    OIAxisCreateWithLabelCount(Count);
    if (!v11)
      return;
    v7 = v11;
    v12 = CFSTR("kOIChartAxisXKey");
LABEL_10:
    OILabelSetString((uint64_t)v7, v12);
    OIChartSetAxis(a1, v12, v7);
    OIAxisRelease(v7);
    goto LABEL_11;
  }
  v7 = Axis;
  if (!OIAxisGetType((uint64_t)Axis))
    goto LABEL_11;
  v8 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
  if (!v8)
  {
    v13 = (const __CFArray *)OISeriesGetValues(a2);
    v14 = CFArrayGetCount(v13);
    OIAxisCreateWithLabelCount(v14);
    if (!v15)
      return;
    v7 = v15;
    v12 = CFSTR("kOIChartAxisSecondaryXKey");
    goto LABEL_10;
  }
  v7 = v8;
  if (OIAxisGetType((uint64_t)v8))
    return;
LABEL_11:
  OISeriesSetBaseAxis(a2, v7);
  if (OISeriesIsOnSecondaryAxis(a2))
    v16 = CFSTR("kOIChartAxisSecondaryYKey");
  else
    v16 = CFSTR("kOIChartAxisYKey");
  v17 = OIChartGetAxis(a1, v16);
  if (!v17)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v19)
      return;
    v18 = (_QWORD *)v19;
    OILabelSetString(v19, v16);
    OIChartSetAxis(a1, v16, v18);
    OIAxisRelease(v18);
    goto LABEL_19;
  }
  v18 = v17;
  if (OIAxisGetType((uint64_t)v17) == 1)
  {
LABEL_19:
    OIAxisSetSubType((uint64_t)v18, a3);
    OISeriesSetValueAxis(a2, v18);
  }
}

void _OIChartingSetupXYTypeAxis(uint64_t a1, uint64_t a2)
{
  _QWORD *Axis;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  const __CFString *v8;
  _QWORD *v9;
  const __CFString *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisXKey"));
  if (!Axis)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v7)
      return;
    v5 = v7;
    v8 = CFSTR("kOIChartAxisXKey");
LABEL_10:
    OILabelSetString((uint64_t)v5, v8);
    OIChartSetAxis(a1, v8, v5);
    OIAxisRelease(v5);
    goto LABEL_11;
  }
  v5 = Axis;
  if (OIAxisGetType((uint64_t)Axis) == 1)
    goto LABEL_11;
  v6 = OIChartGetAxis(a1, CFSTR("kOIChartAxisSecondaryXKey"));
  if (!v6)
  {
    OIAxisCreateWithRange(0.0, 100.0);
    if (!v9)
      return;
    v5 = v9;
    v8 = CFSTR("kOIChartAxisSecondaryXKey");
    goto LABEL_10;
  }
  v5 = v6;
  if (OIAxisGetType((uint64_t)v6) != 1)
    return;
LABEL_11:
  OIAxisSetSubType((uint64_t)v5, 1);
  OISeriesSetBaseAxis(a2, v5);
  if (OISeriesIsOnSecondaryAxis(a2))
    v10 = CFSTR("kOIChartAxisSecondaryYKey");
  else
    v10 = CFSTR("kOIChartAxisYKey");
  v11 = OIChartGetAxis(a1, v10);
  if (!v11)
  {
    OIAxisCreateWithRange(0.0, 1.0);
    if (!v13)
      return;
    v12 = (_QWORD *)v13;
    OILabelSetString(v13, v10);
    OIChartSetAxis(a1, v10, v12);
    OIAxisRelease(v12);
    goto LABEL_19;
  }
  v12 = v11;
  if (OIAxisGetType((uint64_t)v11) == 1)
LABEL_19:
    OISeriesSetValueAxis(a2, v12);
}

void _OIChartingUpdateAxisRangeWithValuesFromSeries(uint64_t a1, uint64_t a2)
{
  const __CFArray *Series;
  const __CFArray *v5;
  CFIndex Count;
  uint64_t v7;
  uint64_t SubType;
  CFIndex ValueCountForAxis;
  CFIndex v10;
  CFIndex v11;
  double v12;
  double v13;
  CFIndex v14;
  double v15;
  double v16;
  const void *ValueAtIndex;
  const __CFArray *Values;
  const __CFArray *v19;
  const __CFNumber *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double valuePtr;

  Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    v5 = Series;
    Count = CFArrayGetCount(Series);
    if (Count)
    {
      v7 = Count;
      SubType = OIAxisGetSubType(a2);
      ValueCountForAxis = OIChartGetValueCountForAxis(a1, a2);
      if (ValueCountForAxis < 1)
      {
        v13 = 2.22507386e-308;
        v16 = 1.79769313e308;
      }
      else
      {
        v10 = ValueCountForAxis;
        v11 = 0;
        v12 = 1.79769313e308;
        v13 = 2.22507386e-308;
        do
        {
          if (v7 < 1)
          {
            v16 = 0.0;
            v15 = 0.0;
          }
          else
          {
            v14 = 0;
            v15 = 0.0;
            v16 = 0.0;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v5, v14);
              if (OIAxisGetType((uint64_t)ValueAtIndex) == a2)
              {
                Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
                if (Values)
                {
                  v19 = Values;
                  if (v11 < CFArrayGetCount(Values))
                  {
                    valuePtr = 0.0;
                    v20 = (const __CFNumber *)CFArrayGetValueAtIndex(v19, v11);
                    CFNumberGetValue(v20, kCFNumberCGFloatType, &valuePtr);
                    v21 = valuePtr <= v13 ? v13 : valuePtr;
                    v22 = valuePtr < v12 ? valuePtr : v12;
                    v23 = v16 + valuePtr;
                    v24 = v15 + valuePtr;
                    if (valuePtr <= 0.0)
                      v24 = v15;
                    else
                      v23 = v16;
                    if (SubType == 2)
                    {
                      v16 = v23;
                    }
                    else
                    {
                      v12 = v22;
                      v13 = v21;
                    }
                    if (SubType == 2)
                      v15 = v24;
                  }
                }
              }
              ++v14;
            }
            while (v7 != v14);
          }
          if (SubType == 2)
          {
            if (v15 <= v13)
              v25 = v13;
            else
              v25 = v15;
            if (v15 >= v12)
              v26 = v12;
            else
              v26 = v15;
            if (v16 <= v25)
              v13 = v25;
            else
              v13 = v16;
            if (v16 >= v26)
              v16 = v26;
          }
          else
          {
            v16 = v12;
          }
          ++v11;
          v12 = v16;
        }
        while (v11 != v10);
      }
      if (v16 == 1.79769313e308)
        v16 = 0.0;
      v27 = 1.0;
      if (v13 == 2.22507386e-308)
        v28 = 1.0;
      else
        v28 = v13;
      if (SubType == 3)
      {
        v29 = -0.4;
        if (v16 <= -0.4)
          v29 = -1.0;
        if (v16 >= 0.0)
          v16 = 0.0;
        else
          v16 = v29;
        OIAxisSetUnit(a2, 0.2);
      }
      else
      {
        v27 = v28;
      }
      OIAxisSetMinValue(a2, v16);
      OILabelSetFontSize(a2, v27);
      OIAxisImproveAxisRange(a2);
    }
  }
}

void _OIChartingUpdateAxisRangeWithBaseValuesFromSeries(uint64_t a1, uint64_t a2)
{
  const __CFArray *Series;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  double v8;
  double v9;
  const void *ValueAtIndex;
  const __CFArray *FillColor;
  const __CFArray *v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex i;
  const __CFNumber *v16;
  double v17;
  double valuePtr;

  Series = (const __CFArray *)OIChartGetSeries(a1);
  if (Series)
  {
    v4 = Series;
    Count = CFArrayGetCount(Series);
    if (Count)
    {
      v6 = Count;
      if (Count < 1)
      {
        v9 = 2.22507386e-308;
        v8 = 1.79769313e308;
      }
      else
      {
        v7 = 0;
        v8 = 1.79769313e308;
        v9 = 2.22507386e-308;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, v7);
          if (OILabelGetString((uint64_t)ValueAtIndex) == a2)
          {
            FillColor = (const __CFArray *)OILabelGetFillColor((uint64_t)ValueAtIndex);
            if (FillColor)
            {
              v12 = FillColor;
              v13 = CFArrayGetCount(FillColor);
              if (v13 >= 1)
              {
                v14 = v13;
                for (i = 0; i != v14; ++i)
                {
                  valuePtr = 0.0;
                  v16 = (const __CFNumber *)CFArrayGetValueAtIndex(v12, i);
                  CFNumberGetValue(v16, kCFNumberCGFloatType, &valuePtr);
                  if (valuePtr > v9)
                    v9 = valuePtr;
                  if (valuePtr < v8)
                    v8 = valuePtr;
                }
              }
            }
          }
          ++v7;
        }
        while (v7 != v6);
      }
      v17 = 0.0;
      if (v8 != 1.79769313e308)
        v17 = v8;
      if (v9 == 2.22507386e-308)
        v9 = 1.0;
      OIAxisSetMinValue(a2, v17);
      OILabelSetFontSize(a2, v9);
      OIAxisImproveAxisRange(a2);
    }
  }
}

CGColorRef _OIChartingInitColors(CGColorRef *a1, uint64_t a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGColorRef result;

  if (a2 == 1)
  {
    *a1 = OIColorCreateGenericRGB(0.949019608, 0.874509804, 0.607843137, 1.0);
    a1[1] = OIColorCreateGenericRGB(0.77254902, 0.866666667, 0.71372549, 1.0);
    a1[2] = OIColorCreateGenericRGB(0.349019608, 0.768627451, 0.870588235, 1.0);
    a1[3] = OIColorCreateGenericRGB(0.4, 0.560784314, 0.894117647, 1.0);
    a1[4] = OIColorCreateGenericRGB(0.552941176, 0.447058824, 0.866666667, 1.0);
    a1[5] = OIColorCreateGenericRGB(0.741176471, 0.509803922, 0.807843137, 1.0);
    a1[6] = OIColorCreateGenericRGB(0.949019608, 0.874509804, 0.607843137, 1.0);
    v6 = 1.0;
    v5 = 0.77254902;
    v3 = 0.866666667;
    v4 = 0.71372549;
  }
  else
  {
    if (a2 == 2)
    {
      *a1 = OIColorCreateGenericRGB(0.337254902, 0.584313725, 0.847058824, 1.0);
      a1[1] = OIColorCreateGenericRGB(0.956862745, 0.376470588, 0.392156863, 1.0);
      a1[2] = OIColorCreateGenericRGB(0.619607843, 0.823529412, 0.396078431, 1.0);
      a1[3] = OIColorCreateGenericRGB(0.643137255, 0.501960784, 0.756862745, 1.0);
      a1[4] = OIColorCreateGenericRGB(0.141176471, 0.756862745, 0.870588235, 1.0);
      a1[5] = OIColorCreateGenericRGB(1.0, 0.580392157, 0.278431373, 1.0);
      a1[6] = OIColorCreateGenericRGB(0.588235294, 0.741176471, 0.933333333, 1.0);
      v3 = 0.603921569;
      v4 = 0.611764706;
      v5 = 1.0;
    }
    else
    {
      *a1 = OIColorCreateGenericRGB(0.4, 0.7, 0.99, 1.0);
      a1[1] = OIColorCreateGenericRGB(1.0, 0.0, 0.0, 1.0);
      a1[2] = OIColorCreateGenericRGB(1.0, 0.95, 0.55, 1.0);
      a1[3] = OIColorCreateGenericRGB(0.305882353, 0.88627451, 0.341176471, 1.0);
      a1[4] = OIColorCreateGenericRGB(0.403921569, 0.0666666667, 1.0, 1.0);
      a1[5] = OIColorCreateGenericRGB(0.996078431, 0.654901961, 0.274509804, 1.0);
      a1[6] = OIColorCreateGenericRGB(0.525490196, 0.325490196, 0.341176471, 1.0);
      v5 = 0.635294118;
      v3 = 0.741176471;
      v4 = 0.564705882;
    }
    v6 = 1.0;
  }
  result = OIColorCreateGenericRGB(v5, v3, v4, v6);
  a1[7] = result;
  return result;
}

void _OIChartingReleaseColors(uint64_t a1)
{
  uint64_t i;

  for (i = 0; i != 64; i += 8)
    CGColorRelease(*(CGColorRef *)(a1 + i));
}

void OIRenderXYInChart(uint64_t a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  CFIndex Count;
  uint64_t v5;
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CFIndex v14;
  const void *ValueAtIndex;
  uint64_t Labels;
  const __CFArray *Values;
  double StrokeWidth;
  uint64_t String;
  uint64_t v20;
  uint64_t FillColor;
  const __CFArray *v22;
  CGPath *Mutable;
  double MarkerWidth;
  CFIndex v25;
  CFIndex v26;
  CFIndex v27;
  double v28;
  double v29;
  const __CFNumber *v30;
  const __CFNumber *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGColor *MarkerColor;
  uint64_t v37;
  const __CFArray *v38;
  int v39;
  CGColor *StrokeColor;
  CGContext *c;
  CGPath *path;
  double v43;
  double valuePtr;
  CGSize v45;
  CGRect v46;
  CGRect v47;

  if (theArray)
  {
    v2 = theArray;
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v39 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      c = Type;
      v46.origin.x = PlotArea;
      v46.origin.y = v9;
      v46.size.width = v11;
      v46.size.height = v13;
      CGContextClipToRect(Type, v46);
      if (v5 >= 1)
      {
        v14 = 0;
        v37 = v5;
        v38 = v2;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, v14);
          Labels = OIAxisGetLabels((uint64_t)ValueAtIndex);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
          StrokeColor = (CGColor *)OILabelGetStrokeColor((uint64_t)ValueAtIndex);
          StrokeWidth = OILabelGetStrokeWidth((uint64_t)ValueAtIndex);
          String = OILabelGetString((uint64_t)ValueAtIndex);
          v20 = OIAxisGetType((uint64_t)ValueAtIndex);
          FillColor = OILabelGetFillColor((uint64_t)ValueAtIndex);
          if (FillColor)
          {
            v22 = (const __CFArray *)FillColor;
            Mutable = CGPathCreateMutable();
            if (Labels)
            {
              path = CGPathCreateMutable();
              MarkerWidth = OISeriesGetMarkerWidth((uint64_t)ValueAtIndex);
            }
            else
            {
              path = 0;
              MarkerWidth = 0.0;
            }
            CGContextSetLineWidth(c, StrokeWidth);
            CGContextSetLineJoin(c, kCGLineJoinRound);
            CGContextSetLineCap(c, kCGLineCapRound);
            if (v39)
            {
              v45.width = 0.0;
              v45.height = -2.0;
              CGContextSetShadow(c, v45, 3.0);
            }
            v25 = CFArrayGetCount(v22);
            if (v25 >= 1)
            {
              v26 = v25;
              v27 = 0;
              v28 = MarkerWidth * 0.5;
              v29 = ceil(MarkerWidth);
              do
              {
                if (v27 < CFArrayGetCount(Values))
                {
                  valuePtr = 0.0;
                  v30 = (const __CFNumber *)CFArrayGetValueAtIndex(v22, v27);
                  CFNumberGetValue(v30, kCFNumberCGFloatType, &valuePtr);
                  v43 = 0.0;
                  v31 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v27);
                  CFNumberGetValue(v31, kCFNumberCGFloatType, &v43);
                  v32 = PlotArea + OIAxisConvertValueToLocal(String, valuePtr);
                  v33 = v9 + OIAxisConvertValueToLocal(v20, v43);
                  v34 = floor(v32) + 0.5;
                  v35 = floor(v33) + 0.5;
                  if (!v27)
                  {
                    CGPathMoveToPoint(Mutable, 0, v34, v35);
                    if (!Labels)
                      goto LABEL_17;
LABEL_16:
                    v47.origin.x = floor(v32 - v28) + 0.5;
                    v47.origin.y = floor(v33 - v28) + 0.5;
                    v47.size.width = v29;
                    v47.size.height = v29;
                    CGPathAddRect(path, 0, v47);
                    goto LABEL_17;
                  }
                  CGPathAddLineToPoint(Mutable, 0, v34, v35);
                  if (Labels)
                    goto LABEL_16;
                }
LABEL_17:
                ++v27;
              }
              while (v26 != v27);
            }
            v2 = v38;
            if (StrokeColor)
            {
              CGContextSetLineJoin(c, kCGLineJoinRound);
              CGContextSetLineCap(c, kCGLineCapRound);
              CGContextAddPath(c, Mutable);
              CGContextSetStrokeColorWithColor(c, StrokeColor);
              CGContextSetLineWidth(c, StrokeWidth);
              CGContextStrokePath(c);
            }
            v5 = v37;
            if (Labels)
            {
              MarkerColor = (CGColor *)OISeriesGetMarkerColor((uint64_t)ValueAtIndex);
              CGContextSetFillColorWithColor(c, MarkerColor);
              CGContextAddPath(c, path);
              CGContextFillPath(c);
            }
            if (path)
              CGPathRelease(path);
            if (Mutable)
              CGPathRelease(Mutable);
          }
          ++v14;
        }
        while (v14 != v5);
      }
      CGContextRestoreGState(c);
    }
  }
}

CGColor *OICreateDimmedColorFromColor(CGColor *result, double a2)
{
  CGColor *v2;
  const CGFloat *v3;
  float64x2_t v4;
  uint64_t v10;
  double v11;
  CGColorSpace *ColorSpace;
  CGFloat components[2];
  double v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v2 = result;
    v3 = CGColorGetComponents(result);
    v4 = vmulq_n_f64(*(float64x2_t *)v3, a2);
    __asm { FMOV            V1.2D, #1.0 }
    *(int8x16_t *)components = vbslq_s8((int8x16_t)vcgtq_f64(v4, _Q1), (int8x16_t)_Q1, (int8x16_t)v4);
    v10 = *((_QWORD *)v3 + 3);
    v11 = v3[2] * a2;
    if (v11 > 1.0)
      v11 = 1.0;
    v15 = v11;
    v16 = v10;
    ColorSpace = CGColorGetColorSpace(v2);
    return CGColorCreate(ColorSpace, components);
  }
  return result;
}

CGColorRef OIColorCreateGenericRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColorSpace *v4;
  CGColorRef v5;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
  v5 = CGColorCreate(v4, components);
  CGColorSpaceRelease(v4);
  return v5;
}

const __CFNumber *OIRectMakeWithDictionaryRepresentation(const __CFDictionary *a1, uint64_t a2)
{
  const __CFNumber *result;

  result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("X"));
  if (result)
  {
    CFNumberGetValue(result, kCFNumberFloatType, (void *)a2);
    result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Y"));
    if (result)
    {
      CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 8));
      result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Width"));
      if (result)
      {
        CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 16));
        result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Height"));
        if (result)
        {
          CFNumberGetValue(result, kCFNumberFloatType, (void *)(a2 + 24));
          return (const __CFNumber *)1;
        }
      }
    }
  }
  return result;
}

CTFontRef OICreateDefaultFontWithSize(CGFloat a1)
{
  void *v2;
  const __CFDictionary *v3;
  const __CTFontDescriptor *v4;
  CTFontRef v5;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v2 = (void *)*MEMORY[0x24BDC4D08];
  values = CFSTR("Arial");
  keys[0] = v2;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = CTFontDescriptorCreateWithAttributes(v3);
  CFRelease(v3);
  v5 = CTFontCreateWithFontDescriptor(v4, a1, 0);
  CFRelease(v4);
  if (!v5)
    return CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a1, 0);
  return v5;
}

double OISizeForStringInContext(const __CFString *a1, CGFloat a2)
{
  CTFontRef v3;
  void *v4;
  const __CFAttributedString *v5;
  CFIndex Length;
  const __CFCharacterSet *Predefined;
  const __CTFramesetter *v8;
  double TypographicBounds;
  uint64_t v11;
  CFRange result;
  uint64_t v13;
  _QWORD v14[2];
  CFRange v15;
  CFRange v16;
  CGSize v17;

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = *MEMORY[0x24BDC4C28];
  v3 = OICreateDefaultFontWithSize(a2);
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", a1, v4);
  Length = CFStringGetLength(a1);
  result.location = 0;
  result.length = 0;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  v16.location = 0;
  v16.length = Length;
  if (CFStringFindCharacterFromSet(a1, Predefined, v16, 0, &result))
  {
    v8 = CTFramesetterCreateWithAttributedString(v5);
    v17.width = 3.40282347e38;
    v15.location = 0;
    v15.length = Length;
    v17.height = 3.40282347e38;
    *(_QWORD *)&TypographicBounds = *(_OWORD *)&CTFramesetterSuggestFrameSizeWithConstraints(v8, v15, 0, v17, &result);
  }
  else
  {
    v8 = CTLineCreateWithAttributedString(v5);
    v11 = 0;
    TypographicBounds = CTLineGetTypographicBounds(v8, (CGFloat *)&v11, 0, 0);
  }
  CFRelease(v8);

  return TypographicBounds;
}

void OIDrawStringWithAttributes(const __CFString *a1, void *a2, CGContext *a3, void *a4)
{
  objc_class *v7;
  double (**v8)(_QWORD, double, double);
  id v9;
  const __CFAttributedString *v10;
  CFIndex Length;
  const __CFCharacterSet *Predefined;
  const __CTFramesetter *v13;
  CGSize v14;
  double width;
  double height;
  const __CTLine *v17;
  double v18;
  double v19;
  CGFloat v20;
  const CGPath *v21;
  const __CTFrame *Frame;
  CGFloat ascent;
  CFRange result;
  CFRange v25;
  CFRange v26;
  CFRange v27;
  CGSize v28;
  CGRect v29;

  v7 = (objc_class *)MEMORY[0x24BDD1458];
  v8 = a4;
  v9 = a2;
  v10 = (const __CFAttributedString *)objc_msgSend([v7 alloc], "initWithString:attributes:", a1, v9);

  Length = CFStringGetLength(a1);
  result.location = 0;
  result.length = 0;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  v27.location = 0;
  v27.length = Length;
  if (CFStringFindCharacterFromSet(a1, Predefined, v27, 0, &result))
  {
    v13 = CTFramesetterCreateWithAttributedString(v10);
    v28.width = 1.79769313e308;
    v25.location = 0;
    v25.length = Length;
    v28.height = 1.79769313e308;
    v14 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v25, 0, v28, &result);
    width = v14.width;
    height = v14.height;
    v17 = 0;
  }
  else
  {
    v17 = CTLineCreateWithAttributedString(v10);
    ascent = 0.0;
    width = CTLineGetTypographicBounds(v17, &ascent, 0, 0);
    v13 = 0;
    height = ascent;
  }
  v18 = v8[2](v8, width, height);
  v20 = v19;

  if (v13)
  {
    v29.origin.x = v18;
    v29.origin.y = v20;
    v29.size.width = width;
    v29.size.height = height;
    v21 = CGPathCreateWithRect(v29, 0);
    v26.location = 0;
    v26.length = Length;
    Frame = CTFramesetterCreateFrame(v13, v26, v21, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(v21);
LABEL_8:
    CFRelease(v13);
    goto LABEL_9;
  }
  if (v17)
  {
    CGContextSetTextPosition(a3, v18, v20);
    CTLineDraw(v17, a3);
    v13 = v17;
    goto LABEL_8;
  }
LABEL_9:

}

_QWORD *_OIErrorBarRendererRetain(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  result = a2;
  if (a2)
    ++*a2;
  return result;
}

void _OIErrorBarRendererRelease(uint64_t a1, _QWORD *a2)
{
  OIErrorBarRendererRelease(a2);
}

_BYTE *OIErrorBarRendererCreate(char a1)
{
  const __CFAllocator *Default;
  _BYTE *v3;

  Default = CFAllocatorGetDefault();
  v3 = CFAllocatorAllocate(Default, 32, 0);
  *(_QWORD *)v3 = 1;
  v3[16] = a1;
  *((_QWORD *)v3 + 3) = CGPathCreateMutable();
  return v3;
}

void OIErrorBarRendererRelease(_QWORD *a1)
{
  const void *v3;
  const __CFAllocator *Default;

  if (a1)
  {
    if ((*a1)-- == 1)
    {
      v3 = (const void *)a1[3];
      if (v3)
        CFRelease(v3);
      Default = CFAllocatorGetDefault();
      CFAllocatorDeallocate(Default, a1);
    }
  }
}

void OIErrorBarRendererAddPoint(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  int Type;
  int ValueType;
  double Value;
  double v15;
  CGPath *v16;
  double v17;
  CGPath *v18;
  double v19;
  CGPath *v20;
  double v21;
  double v22;
  CGFloat v23;

  Type = OIErrorBarGetType(a2);
  ValueType = OIErrorBarGetValueType(a2);
  Value = OIErrorBarGetValue(a2);
  if (ValueType == 2)
  {
    v15 = Value * a6;
  }
  else
  {
    if (ValueType != 1)
      return;
    v15 = a5 * a6 * Value / 100.0;
  }
  if (v15 != 0.0)
  {
    if (!*(_BYTE *)(a1 + 16))
    {
      if (Type == 2)
      {
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
        v18 = *(CGPath **)(a1 + 24);
        v19 = a3 + v15;
      }
      else
      {
        if (Type != 1)
        {
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4 + -2.0);
          CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4 + 2.0);
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 - v15, a4);
          v23 = a3 + v15;
          CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v23, a4);
          CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v23, a4 + -2.0);
          v20 = *(CGPath **)(a1 + 24);
          v21 = v23;
          v22 = a4 + 2.0;
          goto LABEL_21;
        }
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
        v18 = *(CGPath **)(a1 + 24);
        v19 = a3 - v15;
      }
      CGPathAddLineToPoint(v18, 0, v19, a4);
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, v19, a4 + -2.0);
      v20 = *(CGPath **)(a1 + 24);
      v22 = a4 + 2.0;
      v21 = v19;
LABEL_21:
      CGPathAddLineToPoint(v20, 0, v21, v22);
      return;
    }
    if (Type == 2)
    {
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
      v16 = *(CGPath **)(a1 + 24);
      v17 = a4 + v15;
    }
    else
    {
      if (Type != 1)
      {
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, a4 - v15);
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + 2.0, a4 - v15);
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4 - v15);
        v17 = a4 + v15;
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, v17);
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, v17);
        v20 = *(CGPath **)(a1 + 24);
        v21 = a3 + 2.0;
        goto LABEL_17;
      }
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3, a4);
      v16 = *(CGPath **)(a1 + 24);
      v17 = a4 - v15;
    }
    CGPathAddLineToPoint(v16, 0, a3, v17);
    CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 24), 0, a3 + -2.0, v17);
    v20 = *(CGPath **)(a1 + 24);
    v21 = a3 + 2.0;
LABEL_17:
    v22 = v17;
    goto LABEL_21;
  }
}

void OIErrorBarRendererRenderInContext(uint64_t a1, CGContext *a2)
{
  CGColor *GenericRGB;

  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetStrokeColorWithColor(a2, GenericRGB);
  CGContextAddPath(a2, *(CGPathRef *)(a1 + 24));
  CGContextStrokePath(a2);
  CGColorRelease(GenericRGB);
}

void OIRenderBubblesInChart(uint64_t a1, CFArrayRef theArray)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v5;
  CGContext *Type;
  double PlotArea;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  CFIndex v15;
  double v16;
  const __CFArray *v17;
  const void *ValueAtIndex;
  const __CFArray *Values;
  uint64_t StrokeColor;
  uint64_t String;
  uint64_t v22;
  uint64_t FillColor;
  const __CFArray *v24;
  const void *v25;
  const __CFArray *v26;
  CFIndex v27;
  CFIndex v28;
  CFIndex v29;
  double v30;
  const __CFNumber *v31;
  CFIndex v32;
  CFIndex v33;
  CFIndex i;
  const __CFNumber *v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CFIndex v43;
  CGContext *c;
  uint64_t TextColor;
  double v46;
  double v47;
  double valuePtr;
  CGSize v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  if (theArray)
  {
    v2 = theArray;
    Count = CFArrayGetCount(theArray);
    if (Count >= 2)
    {
      v5 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = OIAxisAreLabelsCentered(a1);
      CGContextSaveGState(Type);
      c = Type;
      v50.origin.x = PlotArea;
      v50.origin.y = v9;
      v50.size.width = v11;
      v50.size.height = v13;
      CGContextClipToRect(Type, v50);
      if (v11 > v13)
        v11 = v13;
      if (v14)
      {
        v49.width = 4.0;
        v49.height = -4.0;
        CGContextSetShadow(Type, v49, 3.0);
      }
      v15 = 0;
      v43 = v5 - 1;
      v16 = v11 / 5.0;
      do
      {
        v17 = v2;
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v15);
        Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        TextColor = OILabelGetTextColor((uint64_t)ValueAtIndex);
        StrokeColor = OILabelGetStrokeColor((uint64_t)ValueAtIndex);
        String = OILabelGetString((uint64_t)ValueAtIndex);
        v22 = OIAxisGetType((uint64_t)ValueAtIndex);
        FillColor = OILabelGetFillColor((uint64_t)ValueAtIndex);
        if (FillColor)
        {
          v24 = (const __CFArray *)FillColor;
          OISeriesSetupStrokeAndFillForContext((uint64_t)ValueAtIndex, c);
          v25 = CFArrayGetValueAtIndex(v17, v15 | 1);
          v26 = (const __CFArray *)OISeriesGetValues((uint64_t)v25);
          v27 = CFArrayGetCount(v26);
          if (v27 >= 1)
          {
            v28 = v27;
            v29 = 0;
            v30 = 0.0;
            do
            {
              v31 = (const __CFNumber *)CFArrayGetValueAtIndex(v26, v29);
              if (v31)
              {
                valuePtr = 0.0;
                CFNumberGetValue(v31, kCFNumberCGFloatType, &valuePtr);
                v30 = v30 + fabs(valuePtr);
              }
              ++v29;
            }
            while (v28 != v29);
            if (v30 != 0.0)
            {
              v32 = CFArrayGetCount(v24);
              if (v32 >= 1)
              {
                v33 = v32;
                for (i = 0; i != v33; ++i)
                {
                  if (i < CFArrayGetCount(Values) && i < CFArrayGetCount(v26))
                  {
                    valuePtr = 0.0;
                    v35 = (const __CFNumber *)CFArrayGetValueAtIndex(v24, i);
                    CFNumberGetValue(v35, kCFNumberCGFloatType, &valuePtr);
                    v47 = 0.0;
                    v36 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, i);
                    CFNumberGetValue(v36, kCFNumberCGFloatType, &v47);
                    v46 = 0.0;
                    v37 = (const __CFNumber *)CFArrayGetValueAtIndex(v26, i);
                    CFNumberGetValue(v37, kCFNumberCGFloatType, &v46);
                    v46 = v16 * v46 / v30;
                    v38 = PlotArea + OIAxisConvertValueToLocal(String, valuePtr);
                    v39 = OIAxisConvertValueToLocal(v22, v47);
                    v40 = v38 - v46;
                    v41 = v9 + v39 - v46;
                    v42 = v46 + v46;
                    if (TextColor)
                    {
                      v51.origin.x = v40;
                      v51.origin.y = v41;
                      v51.size.width = v46 + v46;
                      v51.size.height = v46 + v46;
                      CGContextFillEllipseInRect(c, v51);
                    }
                    if (StrokeColor)
                    {
                      v52.origin.x = v40;
                      v52.origin.y = v41;
                      v52.size.width = v42;
                      v52.size.height = v42;
                      CGContextStrokeEllipseInRect(c, v52);
                    }
                  }
                }
              }
            }
          }
        }
        v15 += 2;
        v2 = v17;
      }
      while (v15 < v43);
      CGContextRestoreGState(c);
    }
  }
}

void OIRenderBarsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderBarsInChart(a1, a2, 0.0, 0.0);
}

void _OIRenderBarsInChart(uint64_t a1, CFArrayRef theArray, double a3, double a4)
{
  CFIndex Count;
  uint64_t v7;
  CGContext *Type;
  double PlotArea;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  const void *ValueAtIndex;
  uint64_t v18;
  uint64_t String;
  double FontSize;
  double MinValue;
  double v22;
  int v23;
  double v24;
  uint64_t v25;
  CFIndex i;
  const void *v27;
  const __CFArray *Values;
  CFIndex v29;
  CFIndex v30;
  double v31;
  CFIndex j;
  const void *v33;
  double BaseValueAtIndex;
  const __CFArray *v35;
  const __CFNumber *v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t PlotFillColor;
  CGContext *v45;
  double v46;
  _QWORD *v47;
  double Scale;
  _BYTE *v49;
  double v50;
  double v51;
  double v52;
  double valuePtr[2];
  CGSize v56;
  CGRect v57;

  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    if (Count)
    {
      v7 = Count;
      Type = (CGContext *)OIAxisGetType(a1);
      PlotArea = OIChartGetPlotArea(a1);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = OIAxisAreLabelsCentered(a1);
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
      v18 = OIAxisGetType((uint64_t)ValueAtIndex);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      FontSize = OILabelGetFontSize(v18);
      MinValue = OIAxisGetMinValue(v18);
      Scale = OIAxisGetScale(v18);
      CGContextSaveGState(Type);
      v52 = PlotArea;
      v57.origin.x = PlotArea;
      v57.origin.y = v11;
      v57.size.width = v13;
      v57.size.height = v15;
      CGContextClipToRect(Type, v57);
      v22 = OIAxisGetScale(String);
      v23 = OIAxisAreLabelsCentered(String);
      v24 = v22 * -0.5;
      if (v23)
        v24 = 0.0;
      v51 = v24;
      if (v16)
      {
        v56.width = 4.0;
        v56.height = -4.0;
        CGContextSetShadow(Type, v56, 3.0);
      }
      v45 = Type;
      v25 = 0;
      if (v7 >= 1)
      {
        for (i = 0; i != v7; ++i)
        {
          v27 = CFArrayGetValueAtIndex(theArray, i);
          Values = (const __CFArray *)OISeriesGetValues((uint64_t)v27);
          v29 = CFArrayGetCount(Values);
          if (v29 > v25)
            v25 = v29;
        }
      }
      v47 = OILabelCollectionCreate();
      v49 = OIErrorBarRendererCreate(0);
      if (v25 >= 1)
      {
        v30 = 0;
        v31 = floor(v22 / (double)(v7 + 1));
        v50 = floor(v31 * 0.5);
        v46 = ceil(v31 * 3.0);
        do
        {
          if (v7 >= 1)
          {
            for (j = 0; j != v7; ++j)
            {
              v33 = CFArrayGetValueAtIndex(theArray, j);
              BaseValueAtIndex = OISeriesGetBaseValueAtIndex((uint64_t)v33, v30);
              v35 = (const __CFArray *)OISeriesGetValues((uint64_t)v33);
              if (v30 < CFArrayGetCount(v35))
              {
                valuePtr[0] = 0.0;
                v36 = (const __CFNumber *)CFArrayGetValueAtIndex(v35, v30);
                CFNumberGetValue(v36, kCFNumberCGFloatType, valuePtr);
                v37 = valuePtr[0];
                if (valuePtr[0] <= FontSize)
                {
                  v38 = valuePtr[0] < MinValue;
                }
                else
                {
                  v37 = FontSize;
                  v38 = 1;
                }
                if (v38)
                {
                  if (v37 < MinValue)
                    v37 = MinValue;
                  valuePtr[0] = v37;
                }
                v39 = v52 + OIAxisConvertValueToLocal(v18, 0.0);
                OIAxisConvertValueToLocal(String, BaseValueAtIndex);
                v40 = v52 + OIAxisConvertValueToLocal(v18, valuePtr[0]);
                v41 = v50 + v51 + v11 + OIAxisConvertValueToLocal(String, BaseValueAtIndex) + v31 * (double)j;
                v42 = v40 - v39;
                _OIRenderBarFloor(a1, v39, v41, v42, v31, a3, a4);
                _OIRenderBar(a1, (uint64_t)v33, v39, v41, v42, v31, a3, a4);
                v43 = v39 + v42;
                if (OISeriesGetShowValues((uint64_t)v33))
                  OILabelCollectionAddNumber((uint64_t)v47, 0, valuePtr[0], floor(v43) + 0.5, floor(v41) + 0.5, v46, v31);
                PlotFillColor = OIChartGetPlotFillColor((uint64_t)v33);
                if (PlotFillColor)
                  OIErrorBarRendererAddPoint((uint64_t)v49, PlotFillColor, v43, v31 * 0.5 + v41, valuePtr[0], Scale);
              }
            }
          }
          ++v30;
        }
        while (v30 != v25);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v49, v45);
      OIErrorBarRendererRelease(v49);
      OILabelCollectionRenderInContext((uint64_t)v47, v45);
      OILabelCollectionRelease(v47);
      CGContextRestoreGState(v45);
    }
  }
}

void OIRenderStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedBarsInChart(a1, a2, 0, 0.0, 0.0);
}

void _OIRenderStackedBarsInChart(uint64_t a1, const __CFArray *a2, uint64_t a3, double a4, double a5)
{
  CGContext *Type;
  double PlotArea;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int v15;
  int v16;
  CFIndex Count;
  uint64_t v18;
  const void *ValueAtIndex;
  uint64_t v20;
  uint64_t String;
  double v22;
  double v23;
  int v24;
  double v25;
  CFIndex v26;
  BOOL v28;
  double v29;
  double v30;
  CFIndex i;
  const void *v32;
  const __CFArray *Values;
  const __CFNumber *v34;
  CFIndex v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const void *v41;
  const __CFArray *v42;
  const __CFNumber *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t PlotFillColor;
  double v56;
  double v57;
  CGContext *v58;
  BOOL v59;
  uint64_t v60;
  double Scale;
  _BYTE *v62;
  _QWORD *v63;
  double MinValue;
  double FontSize;
  double v66;
  double v67;
  double v68;
  double v71;
  double v72;
  double v73;
  double v74;
  double valuePtr[2];
  CGSize v76;
  CGRect v77;

  Type = (CGContext *)OIAxisGetType(a1);
  PlotArea = OIChartGetPlotArea(a1);
  v71 = v10;
  v72 = PlotArea;
  v12 = v11;
  v14 = v13;
  v15 = OIAxisAreLabelsCentered(a1);
  if (a2)
  {
    v16 = v15;
    Count = CFArrayGetCount(a2);
    if (Count)
    {
      v18 = Count;
      ValueAtIndex = CFArrayGetValueAtIndex(a2, 0);
      v20 = OIAxisGetType((uint64_t)ValueAtIndex);
      String = OILabelGetString((uint64_t)ValueAtIndex);
      FontSize = OILabelGetFontSize(v20);
      MinValue = OIAxisGetMinValue(v20);
      v22 = OILabelGetFontSize(String);
      Scale = OIAxisGetScale(v20);
      CGContextSaveGState(Type);
      v77.origin.y = v71;
      v77.origin.x = v72;
      v77.size.width = v12;
      v77.size.height = v14;
      CGContextClipToRect(Type, v77);
      v23 = OIAxisGetScale(String);
      v60 = (uint64_t)v22;
      v24 = OIAxisAreLabelsCentered(String);
      v25 = v23 * -0.5;
      if (v24)
        v25 = 0.0;
      v68 = v25;
      if (v16)
      {
        v76.width = 4.0;
        v76.height = -4.0;
        CGContextSetShadow(Type, v76, 3.0);
      }
      v58 = Type;
      v63 = OILabelCollectionCreate();
      v62 = OIErrorBarRendererCreate(0);
      if (v60 >= 1)
      {
        v26 = 0;
        v67 = floor(v23 * 0.25);
        v74 = floor(v23 * 0.5);
        v28 = a3 != 1 || v18 < 1;
        v59 = v28;
        do
        {
          v29 = OIAxisConvertValueToLocal(v20, 0.0);
          v73 = (double)v26;
          OIAxisConvertValueToLocal(String, (double)v26);
          v30 = 0.0;
          if (!v59)
          {
            for (i = 0; i != v18; ++i)
            {
              v32 = CFArrayGetValueAtIndex(a2, i);
              Values = (const __CFArray *)OISeriesGetValues((uint64_t)v32);
              if (CFArrayGetCount(Values) > v26)
              {
                valuePtr[0] = 0.0;
                v34 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, v26);
                CFNumberGetValue(v34, kCFNumberCGFloatType, valuePtr);
                v30 = v30 + fabs(valuePtr[0]);
              }
            }
          }
          if (v18 < 1)
            goto LABEL_45;
          v35 = 0;
          v36 = v72 + v29;
          v37 = 1.0;
          if (a3 == 1)
            v37 = v30;
          v66 = v37;
          v38 = 0.0;
          v39 = 0.0;
          v40 = v36;
          do
          {
            v41 = CFArrayGetValueAtIndex(a2, v35);
            v42 = (const __CFArray *)OISeriesGetValues((uint64_t)v41);
            if (CFArrayGetCount(v42) > v26)
            {
              valuePtr[0] = 0.0;
              v43 = (const __CFNumber *)CFArrayGetValueAtIndex(v42, v26);
              CFNumberGetValue(v43, kCFNumberCGFloatType, valuePtr);
              v44 = valuePtr[0] / v66;
              if (valuePtr[0] / v66 >= 0.0)
              {
                v50 = v38 + v44;
                if (v38 + v44 > FontSize)
                  v50 = FontSize;
                if (v50 >= MinValue)
                  v38 = v50;
                else
                  v38 = MinValue;
                v51 = v72 + OIAxisConvertValueToLocal(v20, v38);
                v47 = OIAxisConvertValueToLocal(String, v73);
                v48 = v51 - v36;
                v49 = v36;
                v36 = v51;
              }
              else
              {
                v45 = v39 + v44;
                if (v39 + v44 < MinValue)
                  v45 = MinValue;
                if (v45 <= FontSize)
                  v39 = v45;
                else
                  v39 = FontSize;
                v46 = v72 + OIAxisConvertValueToLocal(v20, v39);
                v47 = OIAxisConvertValueToLocal(String, v73);
                v48 = v46 - v40;
                v49 = v40;
                v40 = v46;
              }
              v52 = ceil(v48);
              v53 = floor(v67 + v68 + v71 + v47) + 0.5;
              v54 = floor(v49) + 0.5;
              _OIRenderBar(a1, (uint64_t)v41, v54, v53, v52, v74, a4, a5);
              if (OISeriesGetShowValues((uint64_t)v41))
                OILabelCollectionAddNumber((uint64_t)v63, 0, valuePtr[0], floor(v54) + 0.5, floor(v53) + 0.5, v52, v74);
              if (!a3)
              {
                PlotFillColor = OIChartGetPlotFillColor((uint64_t)v41);
                if (PlotFillColor)
                  OIErrorBarRendererAddPoint((uint64_t)v62, PlotFillColor, v54 + v52, v74 * 0.5 + v53, v44, Scale);
              }
            }
            ++v35;
          }
          while (v18 != v35);
          if (v38 == 0.0)
          {
LABEL_45:
            v56 = v72 + OIAxisConvertValueToLocal(v20, 0.0);
            v57 = OIAxisConvertValueToLocal(String, v73);
            _OIRenderBarFloor(a1, floor(v67 + v56) + 0.5, floor(v68 + v71 + v57) + 0.5, v74, 0.0, a4, a5);
          }
          ++v26;
        }
        while (v26 != v60);
      }
      OIErrorBarRendererRenderInContext((uint64_t)v62, v58);
      OIErrorBarRendererRelease(v62);
      OILabelCollectionRenderInContext((uint64_t)v63, v58);
      OILabelCollectionRelease(v63);
      CGContextRestoreGState(v58);
    }
  }
}

void OIRenderPercentStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  _OIRenderStackedBarsInChart(a1, a2, 1, 0.0, 0.0);
}

void OIRender3DBarsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderBarsInChart(a1, a2, v10, v11);
}

void OIRender3DStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderStackedBarsInChart(a1, a2, 0, v10, v11);
}

void OIRender3DPercentStackedBarsInChart(uint64_t a1, const __CFArray *a2)
{
  const void *Axis;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  Axis = OIChartGetAxis(a1, CFSTR("kOIChartAxisYKey"));
  OIChartGetPlotArea(a1);
  v6 = v5;
  v8 = v7;
  v9 = (double)(2 * (uint64_t)OILabelGetFontSize((uint64_t)Axis));
  v10 = OIChartGetRotation(a1) / 45.0 * (v6 / v9);
  v11 = OIChartGetElevation(a1) / 90.0 * (v8 / v9);
  _OIRenderStackedBarsInChart(a1, a2, 1, v10, v11);
}

void _OIRenderBarFloor(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  CGContext *Type;
  double v14;
  double v15;
  double v16;
  CGPath *Mutable;
  CGColor *GenericRGB;
  double v19;
  CGFloat v20;

  Type = (CGContext *)OIAxisGetType(a1);
  v14 = a2 + a6 * 0.25;
  v15 = a3 + a7 * 0.25;
  v16 = a7 * 0.5;
  Mutable = CGPathCreateMutable();
  GenericRGB = OIColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0);
  CGPathMoveToPoint(Mutable, 0, floor(a4 + v14) + 0.5, floor(v15) + 0.5);
  v19 = a5 + v15;
  CGPathAddLineToPoint(Mutable, 0, floor(v14) + 0.5, floor(v19) + 0.5);
  v20 = floor(a6 * 0.5 + v14) + 0.5;
  CGPathAddLineToPoint(Mutable, 0, v20, floor(v16 + v19) + 0.5);
  CGPathAddLineToPoint(Mutable, 0, v20, floor(v16 + v15) + 0.5);
  CGPathCloseSubpath(Mutable);
  CGContextSetFillColorWithColor(Type, GenericRGB);
  CGContextAddPath(Type, Mutable);
  CGContextFillPath(Type);
  CGPathRelease(Mutable);
  CGColorRelease(GenericRGB);
}

void _OIRenderBar(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  CGContext *Type;
  CGColor *TextColor;
  CGColor *StrokeColor;
  double StrokeWidth;
  CGFloat v19;
  double v20;
  double v21;
  CGPath *Mutable;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGColor *v40;
  CGPath *v41;
  CGPath *v42;
  CGColor *v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat y;
  CGFloat width;
  CGRect v50;
  CGRect v51;

  Type = (CGContext *)OIAxisGetType(a1);
  TextColor = (CGColor *)OILabelGetTextColor(a2);
  StrokeColor = (CGColor *)OILabelGetStrokeColor(a2);
  StrokeWidth = OILabelGetStrokeWidth(a2);
  v19 = StrokeWidth;
  if (a7 == 0.0 && a8 == 0.0)
  {
    if (TextColor)
    {
      CGContextSetFillColorWithColor(Type, TextColor);
      v50.origin.x = a3;
      v50.origin.y = a4;
      v50.size.width = a5;
      v50.size.height = a6;
      CGContextFillRect(Type, v50);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextSetLineWidth(Type, v19);
      v51.origin.x = a3;
      v51.origin.y = a4;
      v51.size.width = a5;
      v51.size.height = a6;
      CGContextStrokeRect(Type, v51);
    }
  }
  else
  {
    width = StrokeWidth;
    v20 = a3 + a7 * 0.25;
    v21 = a4 + a8 * 0.25;
    Mutable = CGPathCreateMutable();
    v23 = floor(v20) + 0.5;
    v24 = a5;
    v25 = floor(v21) + 0.5;
    CGPathMoveToPoint(Mutable, 0, v23, v25);
    v44 = v21;
    v45 = a6 + v21;
    v26 = floor(a6 + v21) + 0.5;
    v46 = v23;
    v27 = v23;
    v28 = v25;
    v29 = v24;
    CGPathAddLineToPoint(Mutable, 0, v27, v26);
    v47 = v20;
    v30 = v24 + v20;
    v31 = v26;
    v32 = floor(v30) + 0.5;
    y = v31;
    CGPathAddLineToPoint(Mutable, 0, v32, v31);
    CGPathAddLineToPoint(Mutable, 0, v32, v28);
    CGPathCloseSubpath(Mutable);
    if (TextColor)
    {
      CGContextSetFillColorWithColor(Type, TextColor);
      CGContextAddPath(Type, Mutable);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, Mutable);
      CGContextSetLineWidth(Type, width);
      CGContextStrokePath(Type);
    }
    v33 = a7 * 0.5;
    v34 = a8 * 0.5;
    CGPathRelease(Mutable);
    if (v29 >= 0.0)
    {
      v40 = OICreateDimmedColorFromColor(TextColor, 0.5);
      v41 = CGPathCreateMutable();
      CGPathMoveToPoint(v41, 0, v32, v28);
      CGPathAddLineToPoint(v41, 0, v32, y);
      v37 = floor(v33 + v30) + 0.5;
      v36 = floor(v34 + v45) + 0.5;
      CGPathAddLineToPoint(v41, 0, v37, v36);
      CGPathAddLineToPoint(v41, 0, v37, floor(v34 + v44) + 0.5);
      CGPathCloseSubpath(v41);
      if (v40)
      {
        CGContextSetFillColorWithColor(Type, v40);
        CGContextAddPath(Type, v41);
        CGContextFillPath(Type);
      }
      v38 = width;
      v35 = v46;
      v39 = v47;
      if (StrokeColor)
      {
        CGContextSetStrokeColorWithColor(Type, StrokeColor);
        CGContextAddPath(Type, v41);
        CGContextSetLineWidth(Type, width);
        CGContextStrokePath(Type);
      }
      CGPathRelease(v41);
      CGColorRelease(v40);
    }
    else
    {
      v35 = v46;
      v36 = floor(v34 + v45) + 0.5;
      v37 = floor(v33 + v30) + 0.5;
      v38 = width;
      v39 = v47;
    }
    v42 = CGPathCreateMutable();
    v43 = OICreateDimmedColorFromColor(TextColor, 0.8);
    CGPathMoveToPoint(v42, 0, v35, y);
    CGPathAddLineToPoint(v42, 0, floor(v33 + v39) + 0.5, v36);
    CGPathAddLineToPoint(v42, 0, v37, v36);
    CGPathAddLineToPoint(v42, 0, v32, y);
    CGPathCloseSubpath(v42);
    if (v43)
    {
      CGContextSetFillColorWithColor(Type, v43);
      CGContextAddPath(Type, v42);
      CGContextFillPath(Type);
    }
    if (StrokeColor)
    {
      CGContextSetStrokeColorWithColor(Type, StrokeColor);
      CGContextAddPath(Type, v42);
      CGContextSetLineWidth(Type, v38);
      CGContextStrokePath(Type);
    }
    CGPathRelease(v42);
    CGColorRelease(v43);
  }
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB7A8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x24BDBC0B8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x24BDBC0D0](allocator, formatter, numberType, valuePtr);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBC0F8](formatter, formatString);
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
  MEMORY[0x24BDBC100](formatter, key, value);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA90](color, alpha);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA0](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
  MEMORY[0x24BDBDCF8](c, mediaBox);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextEndPage(CGContextRef c)
{
  MEMORY[0x24BDBDE50](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x24BDBDF60](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBDFD0](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetFillPattern(CGContextRef c, CGPatternRef pattern, const CGFloat *components)
{
  MEMORY[0x24BDBDFE0](c, pattern, components);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE060](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur)
{
  MEMORY[0x24BDBE078](c, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
  MEMORY[0x24BDBE0E0](c, *(_QWORD *)&mode);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE88](path);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x24BDBEF58](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x24BDBEF88](pattern);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x24BDC47A8](*(_QWORD *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x24BDC4830](attributes);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
  MEMORY[0x24BDC49C0](frame, context);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x24BDC49F8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x24BDC4A00](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x24BDC4A08](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x24BDC4AC8](line, ascent, descent, leading);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

