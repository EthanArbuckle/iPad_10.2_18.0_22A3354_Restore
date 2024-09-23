@implementation WAAQIScaleView

- (WAAQIScaleView)initWithFrame:(CGRect)a3
{
  WAAQIScaleView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WAAQIScaleView;
  v3 = -[WAAQIScaleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIScaleView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setScale:(id)a3
{
  WAAQIScale *v5;

  v5 = (WAAQIScale *)a3;
  if (self->_scale != v5)
  {
    objc_storeStrong((id *)&self->_scale, a3);
    -[WAAQIScaleView setAQI:](self, "setAQI:", -[WAAQIScale range](v5, "range"));
    -[WAAQIScaleView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setAQI:(unint64_t)a3
{
  if (self->_AQI != a3)
  {
    self->_AQI = -[WAAQIScaleView sanitizedAQI:](self, "sanitizedAQI:");
    -[WAAQIScaleView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (unint64_t)sanitizedAQI:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;

  -[WAAQIScaleView scale](self, "scale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "range");
  v8 = v7;

  if (a3 < v6 || a3 - v6 >= v8)
  {
    -[WAAQIScaleView scale](self, "scale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "range");
    v12 = v10 + v11;

    -[WAAQIScaleView scale](self, "scale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "range");

    if (v12 <= a3)
      return v12;
    else
      return v14;
  }
  return a3;
}

- (double)aqiPercentageInRange
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double result;

  v3 = -[WAAQIScaleView AQI](self, "AQI");
  -[WAAQIScaleView scale](self, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gradient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "range");
  v8 = (double)(unint64_t)(v6 + v7);

  -[WAAQIScaleView scale](self, "scale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "gradient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (double)(unint64_t)objc_msgSend(v10, "range");

  result = 0.0;
  if (v8 - v11 > 0.0)
    return 1.0 - (v8 - (double)v3) / (v8 - v11);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[WAAQIScaleView bounds](self, "bounds");
  v3 = v2;
  v4 = 9.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  id v35;
  void *v36;
  void *v37;
  CGFloat *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  CGColorSpace *DeviceRGB;
  CGGradient *v47;
  const CGPath *v48;
  id v49;
  id v50;
  CGColor *v51;
  CGRect v52;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat v55;
  CGFloat v56;
  _QWORD v57[4];
  id v58;
  CGFloat *v59;
  double v60;
  CGAffineTransform transform;
  objc_super v62;
  CGSize v63;
  CGPoint v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v62.receiver = self;
  v62.super_class = (Class)WAAQIScaleView;
  -[WAAQIScaleView drawRect:](&v62, sel_drawRect_);
  if (self->_scale)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    if (IsUIRTL())
    {
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = height;
      transform.a = -1.0;
      transform.b = 0.0;
      transform.c = 0.0;
      transform.d = 1.0;
      transform.tx = CGRectGetWidth(v65);
      transform.ty = 0.0;
      CGContextConcatCTM(CurrentContext, &transform);
    }
    CGContextSaveGState(CurrentContext);
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    -[WAAQIScaleView trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[WAAQIScaleView bounds](self, "bounds");
    rect = v10;
    -[WAAQIScaleView thumbRectForBounds:trackRect:](self, "thumbRectForBounds:trackRect:");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66.origin.x = v10;
    v66.origin.y = v12;
    v66.size.width = v14;
    v66.size.height = v16;
    objc_msgSend(v25, "moveToPoint:", 4.5, CGRectGetMinY(v66));
    v67.origin.x = v18;
    v26 = v18;
    v55 = v18;
    v56 = v24;
    v67.origin.y = v20;
    v67.size.width = v22;
    v27 = v22;
    rect_8 = v22;
    v67.size.height = v24;
    v28 = CGRectGetMinX(v67) + -1.5;
    v68.origin.x = rect;
    v68.origin.y = v12;
    v68.size.width = v14;
    v68.size.height = v16;
    objc_msgSend(v25, "addLineToPoint:", v28, CGRectGetMinY(v68));
    v69.origin.x = v26;
    v69.origin.y = v20;
    v69.size.width = v27;
    v69.size.height = v24;
    v29 = CGRectGetMinX(v69) + 3.0;
    v70.origin.x = rect;
    v70.origin.y = v12;
    v70.size.width = v14;
    v70.size.height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v29, CGRectGetMidY(v70), 6.0);
    v71.origin.x = rect;
    v71.origin.y = v12;
    v71.size.width = v14;
    v71.size.height = v16;
    objc_msgSend(v25, "addLineToPoint:", 4.5, CGRectGetMaxY(v71));
    v72.origin.x = rect;
    v72.origin.y = v12;
    v72.size.width = v14;
    v72.size.height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 4.5, CGRectGetMidY(v72), 4.5, 1.57079633, 4.71238898);
    objc_msgSend(v25, "closePath");
    v73.size.height = v56;
    v73.origin.x = v55;
    v73.origin.y = v20;
    v73.size.width = rect_8;
    v30 = CGRectGetMaxX(v73) + 1.5;
    v74.origin.x = rect;
    v74.origin.y = v12;
    v74.size.width = v14;
    v74.size.height = v16;
    objc_msgSend(v25, "moveToPoint:", v30, CGRectGetMinY(v74));
    v75.origin.x = rect;
    v75.origin.y = v12;
    v75.size.width = v14;
    v75.size.height = v16;
    v31 = CGRectGetMaxX(v75) + -4.5;
    v76.origin.x = rect;
    v76.origin.y = v12;
    v76.size.width = v14;
    v76.size.height = v16;
    objc_msgSend(v25, "addLineToPoint:", v31, CGRectGetMinY(v76));
    v77.origin.x = rect;
    v77.origin.y = v12;
    v77.size.width = v14;
    v77.size.height = v16;
    v32 = CGRectGetMaxX(v77) + -4.5;
    v78.origin.x = rect;
    v78.origin.y = v12;
    v78.size.width = v14;
    v78.size.height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v32, CGRectGetMidY(v78), 4.5, 4.71238898, 1.57079633);
    v79.origin.x = v55;
    v79.origin.y = v20;
    v79.size.width = rect_8;
    v79.size.height = v56;
    v33 = CGRectGetMaxX(v79) + 1.5;
    v80.origin.x = rect;
    v80.origin.y = v12;
    v80.size.width = v14;
    v80.size.height = v16;
    objc_msgSend(v25, "addLineToPoint:", v33, CGRectGetMaxY(v80));
    v81.origin.x = v55;
    v81.origin.y = v20;
    v81.size.width = rect_8;
    v81.size.height = v56;
    v34 = CGRectGetMaxX(v81) + -3.0;
    v82.origin.x = rect;
    v82.origin.y = v12;
    v82.size.width = v14;
    v82.size.height = v16;
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v34, CGRectGetMidY(v82), 6.0, 1.57079633, 4.71238898);
    objc_msgSend(v25, "closePath");
    v35 = objc_retainAutorelease(v25);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v35, "CGPath"));
    CGContextClip(CurrentContext);
    -[WAAQIScale gradient](self->_scale, "gradient");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stops");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (CGFloat *)malloc_type_malloc(8 * objc_msgSend(v37, "count"), 0x100004000313F17uLL);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAAQIScale gradient](self->_scale, "gradient");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "range");
    v43 = v41 + v42;

    if (v43)
    {
      -[WAAQIScale gradient](self->_scale, "gradient");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stops");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = __27__WAAQIScaleView_drawRect___block_invoke;
      v57[3] = &unk_24DD9CFE8;
      v58 = v39;
      v59 = v38;
      v60 = (double)v43;
      objc_msgSend(v45, "enumerateObjectsUsingBlock:", v57);

    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v47 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v39, v38);
    v64.x = CGRectGetWidth(v52);
    v64.y = 0.0;
    CGContextDrawLinearGradient(CurrentContext, v47, *MEMORY[0x24BDBEFB0], v64, 0);
    CGGradientRelease(v47);
    CGColorSpaceRelease(DeviceRGB);
    free(v38);
    CGContextRestoreGState(CurrentContext);
    v83.origin.x = v55;
    v83.size.height = v56;
    v83.origin.y = v20;
    v83.size.width = rect_8;
    v48 = CGPathCreateWithEllipseInRect(v83, 0);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v49, "CGColor"));

    CGContextAddPath(CurrentContext, v48);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51 = (CGColor *)objc_msgSend(v50, "CGColor");
    v63.height = 0.33;
    v63.width = 0.0;
    CGContextSetShadowWithColor(CurrentContext, v63, 0.5, v51);

    CGContextFillPath(CurrentContext);
    CGPathRelease(v48);

  }
}

double __27__WAAQIScaleView_drawRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  float v8;
  float v9;
  double result;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "color");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "addObject:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(v6, "location");
  v9 = v8;

  result = v9 / *(double *)(a1 + 48);
  *(double *)(*(_QWORD *)(a1 + 40) + 8 * a3) = result;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat width;
  CGFloat x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  v5 = (CGRectGetHeight(a3) + -9.0) * 0.5;
  v6 = 9.0;
  v7 = x;
  v8 = width;
  result.size.height = v6;
  result.size.width = v8;
  result.origin.y = v5;
  result.origin.x = v7;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  if (self->_scale)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v9 = CGRectGetMaxX(a4) + -12.0 + 3.0 + -6.0 + -6.0;
    -[WAAQIScaleView aqiPercentageInRange](self, "aqiPercentageInRange");
    v11 = v9 * v10 + 6.0;
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v12 = CGRectGetMidY(v16) + -4.5;
    v13 = 9.0;
    v14 = 9.0;
  }
  else
  {
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v15 = v11;
  result.size.height = v13;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (WAAQIScale)scale
{
  return self->_scale;
}

- (unint64_t)AQI
{
  return self->_AQI;
}

- (void)setAqiPercentageInRange:(double)a3
{
  self->_aqiPercentageInRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
}

@end
