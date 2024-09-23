@implementation OIPieChartRenderer

- (OIPieChartRenderer)initWithChart:(__OIChart *)a3 sliceRenderer:(id)a4
{
  id v6;
  OIPieChartRenderer *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)OIPieChartRenderer;
  v7 = -[OIPieChartRenderer init](&v9, sel_init);
  if (v7)
  {
    -[OIPieChartRenderer setChart:](v7, "setChart:", OILabelRetain(a3));
    -[OIPieChartRenderer setSliceRenderer:](v7, "setSliceRenderer:", v6);
  }

  return v7;
}

- (OIPieChartRenderer)initWithChart:(__OIChart *)a3
{
  OIPieSliceCGRenderer *v5;
  OIPieChartRenderer *v6;

  v5 = -[OIPieSliceCGRenderer initWithChart:]([OIPieSliceCGRenderer alloc], "initWithChart:", a3);
  v6 = -[OIPieChartRenderer initWithChart:sliceRenderer:](self, "initWithChart:sliceRenderer:", a3, v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  OIChartRelease(self->_chart);
  -[OIPieChartRenderer setSliceRenderer:](self, "setSliceRenderer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)OIPieChartRenderer;
  -[OIPieChartRenderer dealloc](&v3, sel_dealloc);
}

- (void)renderThreeDimensional:(BOOL)a3 pieFromSeriesArray:(__CFArray *)a4
{
  _BOOL4 v5;
  CGContext *Type;
  double PlotArea;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex v19;
  double v20;
  const void *ValueAtIndex;
  const __CFArray *Values;
  const __CFNumber *v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CFIndex v28;
  CFIndex v29;
  double v30;
  const void *v31;
  double Offset;
  const __CFArray *v33;
  const __CFNumber *v34;
  double v35;
  int v36;
  __double2 v37;
  double v38;
  const void *v39;
  double v40;
  const __CFArray *v41;
  const __CFNumber *v42;
  double v43;
  __double2 v44;
  int v45;
  const void *v46;
  double v47;
  __double2 v48;
  double v49;
  double v50;
  double v51;
  double valuePtr;
  CGSize v53;

  v5 = a3;
  Type = (CGContext *)OIAxisGetType((uint64_t)self->_chart);
  PlotArea = OIChartGetPlotArea((uint64_t)self->_chart);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = OIAxisAreLabelsCentered((uint64_t)self->_chart);
  if (a4)
  {
    v16 = v15;
    Count = CFArrayGetCount(a4);
    if (Count >= 1)
    {
      v18 = Count;
      v19 = 0;
      v20 = 0.0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, v19);
        Values = (const __CFArray *)OISeriesGetValues((uint64_t)ValueAtIndex);
        if (Values)
        {
          v23 = (const __CFNumber *)CFArrayGetValueAtIndex(Values, 0);
          valuePtr = 0.0;
          CFNumberGetValue(v23, kCFNumberCGFloatType, &valuePtr);
          v20 = v20 + fabs(valuePtr);
        }
        ++v19;
      }
      while (v18 != v19);
      if (v20 != 0.0)
      {
        CGContextSaveGState(Type);
        v24 = v10 + v14 * 0.5;
        if (v12 >= v14)
          v25 = v14;
        else
          v25 = v12;
        CGContextTranslateCTM(Type, PlotArea + v12 * 0.5, v24);
        v51 = 0.0;
        if (v5)
        {
          v26 = (90.0 - OIChartGetElevation((uint64_t)self->_chart)) / 90.0 * -0.8 + 1.0;
          CGContextScaleCTM(Type, 1.0, v26);
          v51 = v14 * ((1.0 - v26) * 0.2) / v26;
        }
        if (v16)
        {
          v53.width = 0.0;
          v53.height = -4.0;
          CGContextSetShadow(Type, v53, 6.0);
        }
        v27 = v25 * 0.9 * 0.5;
        v28 = 0;
        v29 = CFArrayGetCount(a4) - 1;
        v30 = 1.57079633;
        v49 = 1.57079633;
        v50 = 1.57079633;
        do
        {
          if (v28 >= v18)
            break;
          v31 = CFArrayGetValueAtIndex(a4, v28);
          Offset = OISeriesGetOffset((uint64_t)v31);
          v33 = (const __CFArray *)OISeriesGetValues((uint64_t)v31);
          if (v33)
          {
            v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v33, 0);
            valuePtr = 0.0;
            CFNumberGetValue(v34, kCFNumberCGFloatType, &valuePtr);
            v35 = fabs(valuePtr);
            valuePtr = v35;
            if (cos(v30 + v35 / v20 * -6.28318531) >= 0.0)
            {
              v37 = __sincos_stret(v30 + v35 * -3.14159265 / v20);
              -[OIPieSliceRenderer renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:](self->_sliceRenderer, "renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:", v31, v27, v30, v30 + v35 / v20 * -6.28318531, Offset * v37.__cosval, Offset * v37.__sinval, v51);
              v36 = 0;
              ++v28;
              v30 = v30 + v35 / v20 * -6.28318531;
            }
            else
            {
              v36 = 8;
              v49 = v30 + v35 / v20 * -6.28318531;
              v50 = v30;
            }
          }
          else
          {
            v36 = 7;
          }
        }
        while (v36 != 8);
        v38 = -4.71238898;
        do
        {
          if (v29 < 1)
            break;
          v39 = CFArrayGetValueAtIndex(a4, v29);
          v40 = OISeriesGetOffset((uint64_t)v39);
          v41 = (const __CFArray *)OISeriesGetValues((uint64_t)v39);
          if (v41)
          {
            v42 = (const __CFNumber *)CFArrayGetValueAtIndex(v41, 0);
            valuePtr = 0.0;
            CFNumberGetValue(v42, kCFNumberCGFloatType, &valuePtr);
            v43 = fabs(valuePtr);
            valuePtr = v43;
            if (cos(v38 + v43 / v20 * 6.28318531) >= 0.0)
            {
              v45 = 10;
            }
            else
            {
              v44 = __sincos_stret(v38 + v43 * 3.14159265 / v20);
              -[OIPieSliceRenderer renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:](self->_sliceRenderer, "renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:", v39, v27, v38 + v43 / v20 * 6.28318531, v38, v40 * v44.__cosval, v40 * v44.__sinval, v51);
              v45 = 0;
              --v29;
              v38 = v38 + v43 / v20 * 6.28318531;
            }
          }
          else
          {
            v45 = 9;
          }
        }
        while (v45 != 10);
        if (v28 == v29 && v50 != v49)
        {
          v46 = CFArrayGetValueAtIndex(a4, v28);
          v47 = OISeriesGetOffset((uint64_t)v46);
          v48 = __sincos_stret((v50 + v49) * 0.5);
          -[OIPieSliceRenderer renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:](self->_sliceRenderer, "renderPieSliceFromSeries:radius:angle:newAngle:xOffset:yOffset:thickness:", v46, v27, v50, v49, v48.__cosval * v47, v48.__sinval * v47, v51);
        }
        CGContextRestoreGState(Type);
      }
    }
  }
}

- (OIPieSliceRenderer)sliceRenderer
{
  return (OIPieSliceRenderer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSliceRenderer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (__OIChart)chart
{
  return self->_chart;
}

- (void)setChart:(__OIChart *)a3
{
  self->_chart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliceRenderer, 0);
}

@end
