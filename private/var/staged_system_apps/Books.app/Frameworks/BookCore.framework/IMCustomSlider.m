@implementation IMCustomSlider

- (IMCustomSlider)initWithCoder:(id)a3
{
  IMCustomSlider *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMCustomSlider;
  result = -[IMCustomSlider initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    result->_fineScrubbingVerticalRange = 220.0;
  return result;
}

- (IMCustomSlider)initWithFrame:(CGRect)a3
{
  IMCustomSlider *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMCustomSlider;
  result = -[IMCustomSlider initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_fineScrubbingVerticalRange = 220.0;
  return result;
}

- (void)dealloc
{
  UIImage *thumb;
  NSMutableDictionary *perStateContent;
  objc_super v5;

  objc_storeWeak((id *)&self->_delegate, 0);
  thumb = self->_thumb;
  self->_thumb = 0;

  perStateContent = self->_perStateContent;
  self->_perStateContent = 0;

  -[CALayer removeFromSuperlayer](self->_breadcrumbLayer, "removeFromSuperlayer");
  v5.receiver = self;
  v5.super_class = (Class)IMCustomSlider;
  -[IMCustomSlider dealloc](&v5, "dealloc");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  int v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  float v29;
  double v30;
  double v31;
  CGFloat MaxX;
  double v33;
  uint64_t v34;
  double v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36.receiver = self;
  v36.super_class = (Class)IMCustomSlider;
  -[IMCustomSlider layoutSubviews](&v36, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider breadcrumbLayer](self, "breadcrumbLayer"));
  if (v3)
  {
    -[IMCustomSlider bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[IMCustomSlider trackRectForBounds:](self, "trackRectForBounds:");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[IMCustomSlider value](self, "value");
    LODWORD(v34) = v20;
    v35 = v15;
    -[IMCustomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v5, v7, v9, v11, v13, v15, v17, v19, v34);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[IMCustomSlider breadcrumbValue](self, "breadcrumbValue");
    v30 = v13 + v29 * v17;
    v37.origin.x = v22;
    v37.origin.y = v24;
    v37.size.width = v26;
    v37.size.height = v28;
    if (v30 >= CGRectGetMinX(v37))
    {
      v39.origin.x = v22;
      v39.origin.y = v24;
      v39.size.width = v26;
      v39.size.height = v28;
      MaxX = CGRectGetMaxX(v39);
      v40.origin.x = v22;
      v40.origin.y = v24;
      v40.size.width = v26;
      v40.size.height = v28;
      v31 = v30 - CGRectGetMaxX(v40);
      v30 = MaxX;
    }
    else
    {
      v38.origin.x = v22;
      v38.origin.y = v24;
      v38.size.width = v26;
      v38.size.height = v28;
      v31 = CGRectGetMinX(v38) - v30;
    }
    v33 = fmax(v31, 0.0);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    objc_msgSend(v3, "setFrame:", v30, v35, v33, v19);
    +[CATransaction commit](CATransaction, "commit");
  }

}

- (void)setThumb:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_thumb != v5)
  {
    objc_storeStrong((id *)&self->_thumb, a3);
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v5, 0);
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v5, 1);
  }

}

- (id)trackBreadcrumbImageForState:(unint64_t)a3
{
  return -[IMCustomSlider _imageForKey:forState:](self, "_imageForKey:forState:", CFSTR("breadcrumbImage"), a3);
}

- (void)setTrackBreadcrumbImage:(id)a3 forState:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;

  -[IMCustomSlider _setImage:key:forState:](self, "_setImage:key:forState:", a3, CFSTR("breadcrumbImage"), a4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[IMCustomSlider trackBreadcrumbImageForState:](self, "trackBreadcrumbImageForState:", -[IMCustomSlider state](self, "state"))));
  v5 = objc_msgSend(v7, "CGImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider breadcrumbLayer](self, "breadcrumbLayer"));
  objc_msgSend(v6, "setContents:", v5);

}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double v6;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint *p_offset;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v25;
  CGRect result;

  v25.receiver = self;
  v25.super_class = (Class)IMCustomSlider;
  -[IMCustomSlider thumbRectForBounds:trackRect:value:](&v25, "thumbRectForBounds:trackRect:value:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  x = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  p_offset = &self->_offset;
  if (self->_offset.x != 0.0)
  {
    -[IMCustomSlider maximumValue](self, "maximumValue");
    v16 = v15 * 0.5;
    if ((float)(v15 * 0.5) == 0.0)
    {
      x = p_offset->x;
    }
    else
    {
      v17 = v16;
      v18 = a5;
      v19 = p_offset->x;
      if (v16 >= a5)
        x = x - v19 * (1.0 - v18 / v17);
      else
        x = x + (v18 - v17) * v19 / v17;
    }
  }
  v20 = v9 + self->_offset.y;
  v21 = x;
  v22 = v11;
  v23 = v13;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (float)_scaleForIdealValueForVerticalPosition:(double)a3
{
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  float v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;

  v5 = -[IMCustomSlider fineScrubbing](self, "fineScrubbing");
  LODWORD(v6) = 1.0;
  if (v5)
  {
    -[IMCustomSlider fineScrubbingVerticalRange](self, "fineScrubbingVerticalRange", v6);
    v8 = vabdd_f64(a3, self->_beginLocation.y);
    if (v7 >= v8)
      v7 = v8;
    v9 = v7 + -20.0;
    v10 = v7 <= 20.0;
    v11 = 0.0;
    if (!v10)
      v11 = v9;
    v12 = v11;
    v13 = v12;
    -[IMCustomSlider fineScrubbingVerticalRange](self, "fineScrubbingVerticalRange");
    v15 = v13 / (v14 + -20.0);
    if (v15 <= 0.15)
    {
      v15 = v15 / 0.15;
      v16 = 0.33333;
    }
    else
    {
      v16 = 0.025;
    }
    v17 = powf(v15, v16);
    if (v17 <= 0.0)
      v18 = 1.0;
    else
      v18 = 1.0 - v17;
    if (v18 > 1.0)
      v18 = 1.0;
    *(float *)&v6 = fmaxf(v18, 0.0);
  }
  return *(float *)&v6;
}

- (float)_scaleForVerticalPosition:(double)a3
{
  unsigned int v5;
  float result;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;

  v5 = -[IMCustomSlider fineScrubbing](self, "fineScrubbing");
  result = 1.0;
  if (v5)
  {
    if (isPad())
      v7 = 20.0;
    else
      v7 = 0.0;
    -[IMCustomSlider fineScrubbingVerticalRange](self, "fineScrubbingVerticalRange");
    v9 = vabdd_f64(a3, self->_beginLocation.y);
    if (v8 >= v9)
      v8 = v9;
    if (v7 >= v8)
      v10 = v7;
    else
      v10 = v8;
    if (isPad())
      v11 = 20.0;
    else
      v11 = 0.0;
    v12 = v10 - v11;
    v13 = v12;
    -[IMCustomSlider fineScrubbingVerticalRange](self, "fineScrubbingVerticalRange");
    v15 = v14;
    if (isPad())
      v16 = 20.0;
    else
      v16 = 0.0;
    v17 = v13 / (v15 - v16);
    result = 1.0 - v17;
    if (result < 0.09)
      return 0.09;
  }
  return result;
}

- (void)updateFactor:(double)a3
{
  int v4;
  id v5;

  self->_factor = a3;
  if (a3 <= 0.1)
  {
    v4 = 3;
  }
  else if (a3 > 0.35 || a3 <= 0.1)
  {
    v4 = a3 > 0.35 && a3 <= 0.75;
  }
  else
  {
    v4 = 2;
  }
  if (v4 != self->_speed)
  {
    self->_speed = v4;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[IMCustomSlider delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "fineScrubSpeedChanged:") & 1) != 0)
      objc_msgSend(v5, "fineScrubSpeedChanged:", self);

  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMCustomSlider;
  v7 = -[IMCustomSlider beginTrackingWithTouch:withEvent:](&v20, "beginTrackingWithTouch:withEvent:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue(-[IMCustomSlider delegate](self, "delegate"));
  v9 = (void *)v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider trackBreadcrumbImageForState:](self, "trackBreadcrumbImageForState:", -[IMCustomSlider state](self, "state")));
    if (v10)
    {
      -[IMCustomSlider value](self, "value");
      -[IMCustomSlider setBreadcrumbValue:](self, "setBreadcrumbValue:");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      objc_msgSend(v11, "setContents:", objc_msgSend(objc_retainAutorelease(v10), "CGImage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider layer](self, "layer"));
      objc_msgSend(v12, "addSublayer:", v11);

      -[IMCustomSlider setBreadcrumbLayer:](self, "setBreadcrumbLayer:", v11);
    }

  }
  else if ((objc_opt_respondsToSelector(v8, "tapped:atLocation:") & 1) != 0)
  {
    objc_msgSend(v6, "locationInView:", self);
    objc_msgSend(v9, "tapped:atLocation:", self);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider highlightedThumb](self, "highlightedThumb"));
  if (v13)
    v14 = v7;
  else
    v14 = 0;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider highlightedThumb](self, "highlightedThumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v15, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider highlightedThumb](self, "highlightedThumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v16, 1);

  }
  if (v7)
  {
    if (-[IMCustomSlider _controlScrubbing](self, "_controlScrubbing"))
    {
      objc_msgSend(v6, "locationInView:", self);
      self->_previousLocation.x = v17;
      self->_previousLocation.y = v18;
      self->_beginLocation = self->_previousLocation;
      -[IMCustomSlider updateFactor:](self, "updateFactor:", 1.0);
    }
    if ((objc_opt_respondsToSelector(v9, "beginTracking:") & 1) != 0)
      objc_msgSend(v9, "beginTracking:", self);
  }

  return v7;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  UIUserInterfaceLayoutDirection v14;
  double v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  double v24;
  double y;
  double v26;
  _BOOL4 v27;
  _BOOL4 v28;
  double v29;
  float v30;
  float v31;
  float v32;
  float v33;
  IMCustomSlider *v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double x;
  double width;
  void *v42;
  double v43;
  double v44;
  double v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  double v51;
  unsigned __int8 v52;
  BOOL v53;
  double v55;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v6 = a3;
  v7 = a4;
  if (-[IMCustomSlider _controlScrubbing](self, "_controlScrubbing"))
  {
    if (-[IMCustomSlider isTracking](self, "isTracking"))
    {
      objc_msgSend(v6, "locationInView:", self);
      v9 = v8;
      v11 = v10;
      -[IMCustomSlider _scaleForVerticalPosition:](self, "_scaleForVerticalPosition:", v10);
      v13 = v12;
      -[IMCustomSlider updateFactor:](self, "updateFactor:", v12);
      v14 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[IMCustomSlider semanticContentAttribute](self, "semanticContentAttribute"));
      v15 = v9 - self->_previousLocation.x;
      -[IMCustomSlider maximumValue](self, "maximumValue");
      v17 = v16;
      -[IMCustomSlider minimumValue](self, "minimumValue");
      v19 = (float)(v17 - v18);
      -[IMCustomSlider bounds](self, "bounds");
      -[IMCustomSlider trackRectForBounds:](self, "trackRectForBounds:");
      v20 = v15 * (v19 / CGRectGetWidth(v57));
      if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
        v21 = -v20;
      else
        v21 = v20;
      -[IMCustomSlider value](self, "value");
      v23 = v22;
      v24 = v22 + v21 * v13;
      y = self->_previousLocation.y;
      v26 = v11 - y;
      v27 = v11 - y < 0.0;
      v28 = v11 > y;
      v29 = -(v11 - y);
      if (v28 && v27)
        v11 = -v11;
      else
        v29 = v26;
      if (v29 > 0.0)
      {
        v55 = v11;
        -[IMCustomSlider minimumValue](self, "minimumValue");
        v31 = v30;
        -[IMCustomSlider maximumValue](self, "maximumValue");
        v33 = v32;
        v34 = self;
        -[IMCustomSlider bounds](v34, "bounds");
        v35 = v9;
        v37 = v36;
        v39 = v38;
        -[IMCustomSlider trackRectForBounds:](v34, "trackRectForBounds:");
        v58.origin.y = v37;
        v58.size.height = v39;
        v59 = CGRectInset(v58, -2.0, 0.0);
        x = v59.origin.x;
        width = v59.size.width;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider currentThumbImage](v34, "currentThumbImage"));

        objc_msgSend(v42, "size");
        v44 = v43;

        v45 = v35 - x;
        v9 = v35;
        *(float *)&v45 = v45 + v44 * -0.5;
        v46 = (float)((float)(v33 - v31) * *(float *)&v45) / (width - v44) + v31;
        if (v14 == UIUserInterfaceLayoutDirectionRightToLeft)
          v46 = v33 - (float)(v46 - v31);
        if (v46 >= v31)
        {
          v31 = v46;
          if (v46 > v33)
            v31 = v33;
        }
        v11 = v55;
        -[IMCustomSlider _scaleForIdealValueForVerticalPosition:](v34, "_scaleForIdealValueForVerticalPosition:", v55);
        v24 = v24 + (float)((float)(v31 - v23) * v47);
      }
      -[IMCustomSlider minimumValue](self, "minimumValue");
      v49 = v48;
      -[IMCustomSlider maximumValue](self, "maximumValue");
      v51 = v50;
      if (v24 <= v51)
        v51 = v24;
      if (v51 <= v49)
        *(float *)&v51 = v49;
      else
        *(float *)&v51 = v51;
      -[IMCustomSlider setValue:animated:](self, "setValue:animated:", 0, v51);
      -[IMCustomSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
      self->_previousLocation.x = v9;
      self->_previousLocation.y = v11;
    }
    v52 = -[IMCustomSlider isTracking](self, "isTracking");
  }
  else
  {
    v56.receiver = self;
    v56.super_class = (Class)IMCustomSlider;
    v52 = -[IMCustomSlider continueTrackingWithTouch:withEvent:](&v56, "continueTrackingWithTouch:withEvent:", v6, v7);
  }
  v53 = v52;

  return v53;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider highlightedThumb](self, "highlightedThumb"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider thumb](self, "thumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider thumb](self, "thumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v10, 1);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider delegate](self, "delegate"));
  if (-[IMCustomSlider isTracking](self, "isTracking")
    && (objc_opt_respondsToSelector(v11, "endTracking:") & 1) != 0)
  {
    objc_msgSend(v11, "endTracking:", self);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider breadcrumbLayer](self, "breadcrumbLayer"));
  objc_msgSend(v12, "removeFromSuperlayer");

  -[IMCustomSlider setBreadcrumbLayer:](self, "setBreadcrumbLayer:", 0);
  if (!-[IMCustomSlider _controlScrubbing](self, "_controlScrubbing"))
  {
    v13.receiver = self;
    v13.super_class = (Class)IMCustomSlider;
    -[IMCustomSlider endTrackingWithTouch:withEvent:](&v13, "endTrackingWithTouch:withEvent:", v6, v7);
  }

}

- (void)cancelTrackingWithEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider breadcrumbLayer](self, "breadcrumbLayer", a3));
  objc_msgSend(v4, "removeFromSuperlayer");

  -[IMCustomSlider setBreadcrumbLayer:](self, "setBreadcrumbLayer:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider highlightedThumb](self, "highlightedThumb"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider thumb](self, "thumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v6, 0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[IMCustomSlider thumb](self, "thumb"));
    -[IMCustomSlider setThumbImage:forState:](self, "setThumbImage:forState:", v7, 1);

  }
}

- (id)_imageForKey:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider perStateContent](self, "perStateContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider perStateContent](self, "perStateContent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", &off_2AA640));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v6));

  }
  return v12;
}

- (void)_setImage:(id)a3 key:(id)a4 forState:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider perStateContent](self, "perStateContent"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[IMCustomSlider setPerStateContent:](self, "setPerStateContent:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider perStateContent](self, "perStateContent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v12));

  if (!v13)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMCustomSlider perStateContent](self, "perStateContent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v8);

}

- (BOOL)_controlScrubbing
{
  if (-[IMCustomSlider fineScrubbing](self, "fineScrubbing"))
    return 1;
  else
    return -[IMCustomSlider scrubToPointingDevice](self, "scrubToPointingDevice");
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)fineScrubbing
{
  return self->_fineScrubbing;
}

- (void)setFineScrubbing:(BOOL)a3
{
  self->_fineScrubbing = a3;
}

- (BOOL)scrubToPointingDevice
{
  return self->_scrubToPointingDevice;
}

- (void)setScrubToPointingDevice:(BOOL)a3
{
  self->_scrubToPointingDevice = a3;
}

- (IMCustomSliderDelegate)delegate
{
  return (IMCustomSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)speed
{
  return self->_speed;
}

- (void)setSpeed:(int)a3
{
  self->_speed = a3;
}

- (UIImage)highlightedThumb
{
  return self->_highlightedThumb;
}

- (void)setHighlightedThumb:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedThumb, a3);
}

- (UIImage)thumb
{
  return self->_thumb;
}

- (double)fineScrubbingVerticalRange
{
  return self->_fineScrubbingVerticalRange;
}

- (void)setFineScrubbingVerticalRange:(double)a3
{
  self->_fineScrubbingVerticalRange = a3;
}

- (NSMutableDictionary)perStateContent
{
  return self->_perStateContent;
}

- (void)setPerStateContent:(id)a3
{
  objc_storeStrong((id *)&self->_perStateContent, a3);
}

- (CALayer)breadcrumbLayer
{
  return self->_breadcrumbLayer;
}

- (void)setBreadcrumbLayer:(id)a3
{
  objc_storeStrong((id *)&self->_breadcrumbLayer, a3);
}

- (float)breadcrumbValue
{
  return self->_breadcrumbValue;
}

- (void)setBreadcrumbValue:(float)a3
{
  self->_breadcrumbValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbLayer, 0);
  objc_storeStrong((id *)&self->_perStateContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlightedThumb, 0);
  objc_storeStrong((id *)&self->_thumb, 0);
}

@end
