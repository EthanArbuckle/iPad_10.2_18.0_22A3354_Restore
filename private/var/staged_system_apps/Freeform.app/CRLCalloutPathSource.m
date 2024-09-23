@implementation CRLCalloutPathSource

- (CRLCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  CRLCalloutPathSource *v14;
  CRLCalloutPathSource *v15;
  objc_super v17;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  y = a4.y;
  x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)CRLCalloutPathSource;
  v14 = -[CRLCalloutPathSource init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    -[CRLCalloutPathSource p_setNaturalSize:](v14, "p_setNaturalSize:", width, height);
    -[CRLCalloutPathSource p_setCornerRadius:](v15, "p_setCornerRadius:", a3);
    -[CRLCalloutPathSource p_setTailPosition:](v15, "p_setTailPosition:", x, y);
    -[CRLCalloutPathSource p_setTailSize:](v15, "p_setTailSize:", a5);
    -[CRLCalloutPathSource p_setTailAtCenter:](v15, "p_setTailAtCenter:", v7);
  }
  return v15;
}

- (CRLCalloutPathSource)init
{
  return -[CRLCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](self, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, 10.0, -50.0, 50.0, 10.0, 100.0, 100.0);
}

+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, a3, a4.x, a4.y, a5, a6.width, a6.height);
}

+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 1, a5.width + 10.0, a3.x, a3.y, a4, a5.width, a5.height);
}

- (id)copy
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCalloutPathSource;
  v3 = -[CRLCalloutPathSource copy](&v5, "copy");
  objc_msgSend(v3, "p_setNaturalSize:", self->_naturalSize.width, self->_naturalSize.height);
  objc_msgSend(v3, "p_setCornerRadius:", self->_cornerRadius);
  objc_msgSend(v3, "p_setTailPosition:", self->_tailPosition.x, self->_tailPosition.y);
  objc_msgSend(v3, "p_setTailSize:", self->_tailSize);
  objc_msgSend(v3, "p_setTailAtCenter:", self->_isTailAtCenter);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CRLCalloutPathSource *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double cornerRadius;
  double v13;
  double v14;
  double v15;
  double tailSize;
  double v17;
  BOOL v18;
  objc_super v20;

  v4 = (CRLCalloutPathSource *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLCalloutPathSource;
    if (-[CRLPathSource isEqual:](&v20, "isEqual:", v4))
    {
      objc_opt_class(CRLCalloutPathSource, v5);
      v7 = sub_100221D0C(v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      if (v8
        && (objc_msgSend(v8, "naturalSize"), sub_10005FDF0(self->_naturalSize.width, self->_naturalSize.height, v10, v11))&& ((cornerRadius = self->_cornerRadius, objc_msgSend(v9, "cornerRadius"), cornerRadius == v13)|| vabdd_f64(cornerRadius, v13) < 0.00999999978)&& (objc_msgSend(v9, "p_tailPosition"), sub_10005FDF0(self->_tailPosition.x, self->_tailPosition.y, v14, v15)))
      {
        tailSize = self->_tailSize;
        objc_msgSend(v9, "tailSize");
        v18 = vabdd_f64(tailSize, v17) < 0.00999999978 || tailSize == v17;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  Class v2;
  NSString *v3;
  void *v4;
  id v5;

  objc_opt_class(self, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "hash");

  return (unint64_t)v5;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  double cornerRadius;
  NSString *v7;
  void *v8;
  double tailSize;
  NSString *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLCalloutPathSource;
  v3 = -[CRLCalloutPathSource description](&v14, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  cornerRadius = self->_cornerRadius;
  v7 = NSStringFromCGPoint(self->_tailPosition);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  tailSize = self->_tailSize;
  v10 = NSStringFromCGSize(self->_naturalSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("; corner radius=%f; tail position=%@, tail size=%f natural size=%@"),
                    *(_QWORD *)&cornerRadius,
                    v8,
                    *(_QWORD *)&tailSize,
                    v11));
  objc_msgSend(v5, "appendString:", v12);

  return v5;
}

- (unint64_t)numberOfControlKnobs
{
  return 3;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double x;
  double y;
  CGPoint result;

  switch(a3)
  {
    case 0xEuLL:
      -[CRLCalloutPathSource tailSizeKnobPosition](self, "tailSizeKnobPosition");
      break;
    case 0xDuLL:
      -[CRLCalloutPathSource p_getControlKnobPointForRoundedRect](self, "p_getControlKnobPointForRoundedRect");
      break;
    case 0xCuLL:
      -[CRLCalloutPathSource tailKnobPosition](self, "tailKnobPosition");
      break;
    default:
      x = CGPointZero.x;
      y = CGPointZero.y;
      break;
  }
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  switch(a3)
  {
    case 0xEuLL:
      -[CRLCalloutPathSource setTailSizeKnobPosition:](self, "setTailSizeKnobPosition:", a4.x, a4.y);
      break;
    case 0xDuLL:
      -[CRLCalloutPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", a4.x, a4.y);
      break;
    case 0xCuLL:
      -[CRLCalloutPathSource setTailKnobPosition:](self, "setTailKnobPosition:", a4.x, a4.y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  __CFString *v9;

  if (a3 == 13)
  {
    -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
    v5 = v4;
    -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
    if (v5 >= v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Oval"), 0, 0));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Radius: %d pt"), 0, 0));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, (int)self->_cornerRadius));

    }
  }
  else
  {
    v9 = &stru_1012A72B0;
  }
  return v9;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (void)setCornerRadius:(double)a3
{
  double cornerRadius;
  double v5;
  double v6;
  double v7;

  -[CRLCalloutPathSource p_setCornerRadius:](self, "p_setCornerRadius:", a3);
  cornerRadius = self->_cornerRadius;
  v5 = 0.0;
  if (cornerRadius >= 0.0)
  {
    -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius", 0.0);
    if (cornerRadius < v6)
      return;
    -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
    v5 = v7 + 1.0;
  }
  self->_cornerRadius = v5;
}

- (BOOL)isOval
{
  double cornerRadius;
  double v3;

  cornerRadius = self->_cornerRadius;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  return cornerRadius >= v3;
}

- (double)clampedCornerRadius
{
  double v3;
  double v4;
  double v5;

  -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
  v4 = v3;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  return fmin(v4, v5);
}

- (double)maxCornerRadius
{
  return fmin(self->_naturalSize.height, self->_naturalSize.width) * 0.5;
}

- (double)minCornerRadius
{
  return 0.0;
}

- (void)setTailSize:(double)a3
{
  CGFloat height;
  double tailSize;

  -[CRLCalloutPathSource p_setTailSize:](self, "p_setTailSize:", a3);
  height = self->_naturalSize.height;
  if (height < self->_naturalSize.width)
    height = self->_naturalSize.width;
  tailSize = self->_tailSize;
  if (tailSize > height || (height = -height, tailSize < height))
    self->_tailSize = height;
}

- (CGPoint)tailSizeKnobPosition
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCalloutPathSource p_basePath](self, "p_basePath"));
  -[CRLCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", v7, 0, 0, &v14);
  if (v14 + v15 >= v16 + v17)
    v8 = v17;
  else
    v8 = v15;
  if (v14 + v15 >= v16 + v17)
    v9 = v16;
  else
    v9 = v14;
  if (-[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    v10 = v4 - v9;
  else
    v10 = v9;
  if (-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v11 = v6 - v8;
  else
    v11 = v8;

  v12 = v10;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (double)minTailSize
{
  return 5.0;
}

- (double)maxTailSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t i;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  double v32;
  double v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39[4];

  -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCalloutPathSource p_basePath](self, "p_basePath"));
  -[CRLCalloutPathSource p_adjustedCenterForPath:](self, "p_adjustedCenterForPath:", v7);
  v9 = v8;
  v11 = v10;
  v12 = sub_10006108C(v4, v6, v8, v10);
  v39[0] = v4;
  v39[1] = v6;
  v39[2] = v9;
  v39[3] = v11;
  v32 = 0.0;
  v33 = 0.0;
  v13 = (uint64_t)objc_msgSend(v7, "elementCount");
  if (v13 < 1)
  {
    v25 = 0.0;
    v26 = 0.0;
    goto LABEL_11;
  }
  v15 = v13;
  v16 = sub_1000603B8(v9, v11, v4);
  v18 = sub_100060398(v16, v17);
  v20 = v19;
  for (i = 0; i != v15; ++i)
  {
    v22 = objc_msgSend(v7, "elementAtIndex:allPoints:", i, &v34);
    if (v22 == (id)2)
    {
      sub_100226AB4(v39, &v33, &v32, v34.f64[0], v34.f64[1], v18, v20, v4, v6, v12);
      sub_100226AB4(v39, &v33, &v32, v37, v38, v18, v20, v4, v6, v12);
      v23 = sub_1000602A8(&v34, 0.5);
    }
    else
    {
      if (v22 != (id)1)
        continue;
      sub_100226AB4(v39, &v33, &v32, v34.f64[0], v34.f64[1], v18, v20, v4, v6, v12);
      v23 = v35;
      v24 = v36;
    }
    v14 = sub_100226AB4(v39, &v33, &v32, v23, v24, v18, v20, v4, v6, v12);
  }
  v25 = v32;
  v26 = v33;
LABEL_11:
  -[CRLCalloutPathSource minTailSize](self, "minTailSize", v14);
  v28 = v27;

  v29 = fmin(v26, -v25) * 0.899999976;
  v30 = v28;
  return fmaxf(v29, v30);
}

- (double)clampedCalloutTailSize
{
  double v3;
  double v4;
  double v5;

  -[CRLCalloutPathSource tailSize](self, "tailSize");
  v4 = v3;
  -[CRLCalloutPathSource maxTailSize](self, "maxTailSize");
  return fmin(v4, v5);
}

- (void)setTailSizeKnobPosition:(CGPoint)a3
{
  double x;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BYTE v31[32];

  x = a3.x;
  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  if (-[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    x = v6 - x;
  -[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v29 = 0.0;
  v30 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCalloutPathSource p_basePath](self, "p_basePath"));
  -[CRLCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", v7, &v29, 0, v31);
  -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v9 = v8;
  v11 = v10;
  v12 = sub_1000603B8(v8, v10, x);
  v14 = sub_100060398(v12, v13);
  v16 = v15;
  v17 = v29;
  v18 = v30;
  v19 = sub_1000603B8(v9, v11, v29);
  v21 = sub_100060398(v19, v20);
  v23 = v22;
  v28 = sub_1000603C4(v14, v16, v21, v22);
  v24 = sub_10006200C(1, v21, v23);
  v26 = fabs(sub_1000603C4(v14, v16, v24, v25));
  v27 = v26 * (sub_10006108C(v9, v11, v17, v18) / v28);
  if (fabs(v27) < 1.0)
    v27 = 1.0;
  self->_tailSize = v27;

}

- (void)setTailKnobPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    x = v7 - x;
  if (-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  -[CRLCalloutPathSource p_setTailPosition:](self, "p_setTailPosition:", x, v10);
}

- (CGPoint)tailKnobPosition
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  x = self->_tailPosition.x;
  y = self->_tailPosition.y;
  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  if (-[CRLPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    v9 = v6 - x;
  else
    v9 = x;
  if (-[CRLPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v8 - y;
  else
    v10 = y;
  v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  CGPoint *p_tailPosition;
  double x;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;

  height = a3.height;
  width = a3.width;
  -[CRLPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:");
  v7 = v6;
  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v9 = v8;
  v10 = -[CRLCalloutPathSource isOval](self, "isOval");
  p_tailPosition = &self->_tailPosition;
  x = CGPointZero.x;
  if (self->_tailPosition.x > v9 * 0.5)
  {
    v13 = width / v9 + -1.0;
    if (fabs(v13) > 0.001)
      x = (width - v9) * ((width / v9 - v7) / v13);
  }
  self->_tailSize = v7 * self->_tailSize;
  v14 = sub_1000603DC(p_tailPosition->x, self->_tailPosition.y, v7);
  p_tailPosition->x = sub_1000603D0(v14, v15, x);
  self->_tailPosition.y = v16;
  -[CRLCalloutPathSource p_setNaturalSize:](self, "p_setNaturalSize:", width, height);
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  if (v10)
    v18 = v17 + 1.0;
  else
    v18 = fmin(v17 + -0.001, v7 * self->_cornerRadius);
  self->_cornerRadius = v18;
}

- (CGPoint)p_tailCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  CGPoint result;

  if (self->_isTailAtCenter)
  {
    v3 = self->_naturalSize.width * 0.5;
    v4 = self->_naturalSize.height * 0.5;
  }
  else
  {
    -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
    v3 = v6;
    v8 = v7;
    -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
    v4 = v9;
    if (v3 <= v9 || v3 >= self->_naturalSize.width - v9)
    {
      if (v8 <= v9 || v8 >= self->_naturalSize.height - v9)
      {
        v10 = v3 > v9;
        v3 = v9;
        if (v10)
          v3 = self->_naturalSize.width - v9;
        if (v8 > v9)
          v4 = self->_naturalSize.height - v9;
      }
      else
      {
        v3 = self->_naturalSize.width * 0.5;
        v4 = v8;
      }
    }
    else
    {
      v4 = self->_naturalSize.height * 0.5;
    }
  }
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (id)bezierPathWithoutFlips
{
  return -[CRLCalloutPathSource p_buildPath](self, "p_buildPath");
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (id)name
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLCalloutPathSource isTailAtCenter](self, "isTailAtCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Quote Bubble");
  else
    v5 = CFSTR("Callout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (void)p_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)p_setTailPosition:(CGPoint)a3
{
  self->_tailPosition = a3;
}

- (CGPoint)p_tailPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_tailPosition.x;
  y = self->_tailPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)p_setTailSize:(double)a3
{
  self->_tailSize = a3;
}

- (void)p_setNaturalSize:(CGSize)a3
{
  self->_naturalSize = a3;
}

- (void)p_setTailAtCenter:(BOOL)a3
{
  self->_isTailAtCenter = a3;
}

- (CGPoint)p_adjustedCenterForPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[4];
  CGPoint result;

  v4 = a3;
  -[CRLCalloutPathSource p_tailCenter](self, "p_tailCenter");
  v6 = v5;
  v8 = v7;
  -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v17[0] = v9;
  v17[1] = v10;
  *(double *)&v17[2] = v6;
  *(double *)&v17[3] = v8;
  v11 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v4, "addIntersectionsWithLine:to:", v17, v11);

  if (objc_msgSend(v11, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
    objc_msgSend(v12, "point");
    v6 = v13;
    v8 = v14;

  }
  v15 = v6;
  v16 = v8;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)p_getTailPath:(id)a3 center:(CGPoint *)a4 tailSize:(double *)a5 intersections:(CGPoint)a6[2]
{
  id v10;
  double v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  BOOL v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  double v88[4];
  double v89[4];

  v10 = a3;
  -[CRLCalloutPathSource tailSize](self, "tailSize");
  v12 = v11;
  -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v14 = v13;
  v16 = v15;
  -[CRLCalloutPathSource p_adjustedCenterForPath:](self, "p_adjustedCenterForPath:", v10);
  v18 = v17;
  v20 = v19;
  -[CRLCalloutPathSource maxTailSize](self, "maxTailSize");
  v22 = fmin(fabs(v12), v21);
  v23 = sub_1000603B8(v14, v16, v18);
  v25 = sub_100060398(v23, v24);
  v86 = v22;
  v27 = sub_1000603DC(v25, v26, v22);
  v29 = sub_10006200C(1, v27, v28);
  v89[0] = v14;
  v89[1] = v16;
  v30 = sub_1000603D0(v18, v20, v29);
  v32 = sub_1000603B8(v30, v31, v14);
  v34 = sub_1000603DC(v32, v33, 20.0);
  v89[2] = sub_1000603D0(v14, v16, v34);
  v89[3] = v35;
  v88[0] = v14;
  v88[1] = v16;
  v87 = v20;
  v36 = sub_1000603B8(v18, v20, v29);
  v38 = sub_1000603B8(v36, v37, v14);
  v40 = sub_1000603DC(v38, v39, 20.0);
  v88[2] = sub_1000603D0(v14, v16, v40);
  v88[3] = v41;
  v42 = objc_alloc_init((Class)NSMutableArray);
  v43 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v10, "addIntersectionsWithLine:to:", v89, v42);
  objc_msgSend(v10, "addIntersectionsWithLine:to:", v88, v43);
  if (objc_msgSend(v42, "count"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v44, "point");
    v46 = v45;
    v48 = v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastObject"));
    objc_msgSend(v49, "point");
    v51 = v50;
    v53 = v52;

    v54 = sub_10006108C(v46, v48, v14, v16);
    v55 = sub_10006108C(v51, v53, v14, v16);
    v56 = v54 < v55;
    if (v54 >= v55)
      v57 = v53;
    else
      v57 = v48;
    if (v56)
      v58 = v46;
    else
      v58 = v51;
    v59 = sub_1000603B8(v58, v57, v14);
    v61 = sub_100060398(v59, v60);
    v62 = sub_1000603D0(v58, v57, v61);
  }
  else
  {
    v62 = sub_100317AA0((const CGPath *)objc_msgSend(objc_retainAutorelease(v10), "CGPath"), v89);
  }
  v64 = v62;
  v65 = v63;
  if (objc_msgSend(v43, "count"))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v66, "point");
    v85 = v64;
    v68 = v67;
    v70 = v69;

    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lastObject"));
    objc_msgSend(v71, "point");
    v73 = v72;
    v84 = v18;
    v75 = v74;

    v76 = sub_10006108C(v68, v70, v14, v16);
    if (v76 >= sub_10006108C(v73, v75, v14, v16))
      v68 = v73;
    else
      v75 = v70;
    v77 = sub_1000603B8(v68, v75, v14);
    v79 = sub_100060398(v77, v78);
    v80 = v68;
    v81 = v75;
    v18 = v84;
    v64 = v85;
    v82 = sub_1000603D0(v80, v81, v79);
  }
  else
  {
    v82 = sub_100317AA0((const CGPath *)objc_msgSend(objc_retainAutorelease(v10), "CGPath"), v88);
  }
  a6->x = v64;
  a6->y = v65;
  a6[1].x = v82;
  a6[1].y = v83;
  if (a4)
  {
    a4->x = v18;
    a4->y = v87;
  }
  if (a5)
    *a5 = v86;

}

- (id)p_basePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double y;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;

  -[CRLCalloutPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
  v8 = v7;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
  v13 = v12;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  if (v13 >= v14)
  {
    objc_msgSend(v11, "appendBezierPathWithOvalInRect:", -0.5, -0.5, 1.0, 1.0);
    objc_msgSend(v11, "closePath");
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeScale(&v29, self->_naturalSize.width, self->_naturalSize.height);
    v27 = v29;
    CGAffineTransformTranslate(&v28, &v27, 0.5, 0.5);
    v29 = v28;
    v27 = v28;
    CGAffineTransformRotate(&v28, &v27, 0.785398163);
    v29 = v28;
    objc_msgSend(v11, "transformUsingAffineTransform:", &v28);
  }
  else
  {
    y = CGPointZero.y;
    v16 = fmin(v8, v10);
    v17 = sub_1000603D0(0.0, v6, 0.0);
    v19 = v18;
    objc_msgSend(v11, "moveToPoint:");
    v20 = sub_1000603D0(CGPointZero.x, y, v16);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", CGPointZero.x, y, v20, v21, v16);
    v22 = sub_1000603B8(v4, 0.0, 0.0);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, 0.0, v22, v23, v16);
    v24 = sub_1000603B8(v4, v6, v16);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, v6, v24, v25, v16);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", 0.0, v6, v17, v19, v16);
    objc_msgSend(v11, "closePath");
  }
  return v11;
}

- (id)p_buildPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v14[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCalloutPathSource p_basePath](self, "p_basePath"));
  -[CRLCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v5 = v4;
  v7 = v6;
  if (objc_msgSend(v3, "containsPoint:"))
  {
    v8 = v3;
  }
  else
  {
    -[CRLCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", v3, 0, 0, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v9, "moveToPoint:", v14[0], v14[1]);
    objc_msgSend(v9, "lineToPoint:", v5, v7);
    objc_msgSend(v9, "lineToPoint:", v14[2], v14[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v9, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v10));

    if (objc_msgSend(v11, "elementCount"))
      v12 = v11;
    else
      v12 = v3;
    v8 = v12;

  }
  return v8;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  double x;
  double v5;

  x = a3.x;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius", a3.x, a3.y);
  -[CRLCalloutPathSource setCornerRadius:](self, "setCornerRadius:", sub_1003C65EC(x, 0.0, v5));
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  double cornerRadius;
  double v3;
  float v4;
  double v5;
  double v6;
  CGPoint result;

  cornerRadius = self->_cornerRadius;
  -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  v4 = sub_1003C65EC(cornerRadius, 0.0, v3);
  v5 = v4;
  v6 = 0.0;
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)inferredAccessibilityDescriptionNoShapeNames
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathSource userDefinedName](self, "userDefinedName"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CRLCalloutPathSource inferredAccessibilityDescription](self, "inferredAccessibilityDescription"));

    v3 = (void *)v4;
  }
  return v3;
}

- (id)inferredAccessibilityDescription
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLCalloutPathSource isTailAtCenter](self, "isTailAtCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Quote bubble");
  else
    v5 = CFSTR("Callout");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)inferredLocalizedAccessibilityDescriptionPlaceholder
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLCalloutPathSource isTailAtCenter](self, "isTailAtCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("Describe the selected quote bubble.");
  else
    v5 = CFSTR("Describe the selected callout.");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)crlaxLabelComponentForKnobTag:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0xEuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Tail width");
      break;
    case 0xDuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Corner radius");
      break;
    case 0xCuLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Tail position");
      break;
    default:
      v6 = 0;
      return v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (id)crlaxValueForKnobTag:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t cornerRadius;
  float tailSize;
  void *v11;

  if (a3 == 14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%d points"), 0, 0));
    tailSize = self->_tailSize;
    cornerRadius = llroundf(tailSize);
    goto LABEL_6;
  }
  if (a3 == 13)
  {
    -[CRLCalloutPathSource cornerRadius](self, "cornerRadius");
    v5 = v4;
    -[CRLCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
    if (v5 >= v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Oval"), 0, 0));
      goto LABEL_9;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%d points"), 0, 0));
    cornerRadius = (int)self->_cornerRadius;
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, cornerRadius));

LABEL_9:
    return v11;
  }
  v11 = 0;
  return v11;
}

- (BOOL)crlaxIsAdjustableForKnobTag:(unint64_t)a3
{
  return a3 - 13 < 2;
}

- (BOOL)crlaxOffersMoveActionsForKnobTag:(unint64_t)a3
{
  return a3 == 12;
}

- (CGPoint)rawTailPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_tailPosition.x;
  y = self->_tailPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRawTailPosition:(CGPoint)a3
{
  self->_tailPosition = a3;
}

- (double)tailSize
{
  return self->_tailSize;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isTailAtCenter
{
  return self->_isTailAtCenter;
}

@end
