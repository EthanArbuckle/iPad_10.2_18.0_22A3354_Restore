@implementation _TUIStyledBoxStyler

- (_TUIStyledBoxStyler)initWithLayout:(id)a3 contentsScale:(double)a4
{
  id v6;
  _TUIStyledBoxStyler *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t v13;
  UIColor *backgroundColor;
  double v15;
  char v16;
  uint64_t v17;
  UIColor *shadowColor;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  uint64_t v23;
  UIColor *borderColor;
  double v25;
  char v26;
  void *v27;
  NSString *v28;
  NSString *blendMode;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_TUIStyledBoxStyler;
  v7 = -[_TUIStyledBoxStyler init](&v31, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "box"));
    objc_msgSend(v6, "computedBounds");
    v7->_bounds.origin.x = v9;
    v7->_bounds.origin.y = v10;
    v7->_bounds.size.width = v11;
    v7->_bounds.size.height = v12;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundColor"));
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v13;

    objc_msgSend(v8, "cornerRadius");
    v7->_cornerRadius = v15;
    if (objc_msgSend(v8, "continuousCorners"))
      v16 = 4;
    else
      v16 = 0;
    *((_BYTE *)v7 + 120) = *((_BYTE *)v7 + 120) & 0xFB | v16;
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shadowColor"));
    shadowColor = v7->_shadowColor;
    v7->_shadowColor = (UIColor *)v17;

    objc_msgSend(v8, "shadowOffset");
    v7->_shadowOffset.width = v19;
    v7->_shadowOffset.height = v20;
    objc_msgSend(v8, "shadowRadius");
    v7->_shadowRadius = v21;
    objc_msgSend(v8, "shadowOpacity");
    v7->_shadowOpacity = v22;
    *((_BYTE *)v7 + 120) = *((_BYTE *)v7 + 120) & 0xE7 | (8 * ((unint64_t)a4 & 3));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "borderColor"));
    borderColor = v7->_borderColor;
    v7->_borderColor = (UIColor *)v23;

    objc_msgSend(v8, "borderWidth");
    v7->_borderWidth = v25;
    *((_BYTE *)v7 + 120) = *((_BYTE *)v7 + 120) & 0xFE | objc_msgSend(v8, "clipsToBounds");
    if (objc_msgSend(v8, "allowsGroupBlending"))
      v26 = 2;
    else
      v26 = 0;
    *((_BYTE *)v7 + 120) = *((_BYTE *)v7 + 120) & 0xFD | v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blendMode"));
    v28 = (NSString *)objc_msgSend(v27, "copy");
    blendMode = v7->_blendMode;
    v7->_blendMode = v28;

  }
  return v7;
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TUIStyledBoxStyler *v9;
  _TUIStyledBoxStyler *v10;
  UIColor *backgroundColor;
  UIColor *shadowColor;
  unsigned __int8 v14;
  UIColor *borderColor;
  NSString *blendMode;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(self, v7))
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9 == self)
    goto LABEL_28;
  if (v9)
  {
    if (CGRectEqualToRect(self->_bounds, v9->_bounds))
    {
      backgroundColor = self->_backgroundColor;
      if ((backgroundColor == v10->_backgroundColor || -[UIColor isEqual:](backgroundColor, "isEqual:"))
        && self->_cornerRadius == v10->_cornerRadius
        && ((*((unsigned __int8 *)v10 + 120) ^ *((unsigned __int8 *)self + 120)) & 4) == 0)
      {
        shadowColor = self->_shadowColor;
        if ((shadowColor == v10->_shadowColor || -[UIColor isEqual:](shadowColor, "isEqual:"))
          && self->_shadowOffset.width == v10->_shadowOffset.width
          && self->_shadowOffset.height == v10->_shadowOffset.height
          && self->_shadowRadius == v10->_shadowRadius
          && self->_shadowOpacity == v10->_shadowOpacity
          && ((*((unsigned __int8 *)v10 + 120) ^ *((unsigned __int8 *)self + 120)) & 0x18) == 0)
        {
          borderColor = self->_borderColor;
          if ((borderColor == v10->_borderColor || -[UIColor isEqual:](borderColor, "isEqual:"))
            && self->_borderWidth == v10->_borderWidth
            && ((*((unsigned __int8 *)v10 + 120) ^ *((unsigned __int8 *)self + 120)) & 3) == 0)
          {
            blendMode = self->_blendMode;
            if (blendMode != v10->_blendMode)
            {
              v14 = -[NSString isEqualToString:](blendMode, "isEqualToString:");
              goto LABEL_29;
            }
LABEL_28:
            v14 = 1;
            goto LABEL_29;
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_29:

  return v14;
}

- (void)applyStylingToLayer:(id)a3
{
  const CALayerCornerCurve *v4;
  double shadowOpacity;
  double y;
  double x;
  CGFloat width;
  CGFloat height;
  double cornerRadius;
  CGPath *Mutable;
  CGPath *v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MinY;
  void *v19;
  CGFloat v20;
  double MaxX;
  double MaxY;
  double MinX;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v24 = a3;
  objc_msgSend(v24, "setBackgroundColor:", -[UIColor CGColor](self->_backgroundColor, "CGColor"));
  objc_msgSend(v24, "setCornerRadius:", self->_cornerRadius);
  v4 = &kCACornerCurveCircular;
  if ((*((_BYTE *)self + 120) & 4) != 0)
    v4 = &kCACornerCurveContinuous;
  objc_msgSend(v24, "setCornerCurve:", *v4);
  objc_msgSend(v24, "setShadowColor:", -[UIColor CGColor](self->_shadowColor, "CGColor"));
  objc_msgSend(v24, "setShadowOffset:", self->_shadowOffset.width, self->_shadowOffset.height);
  objc_msgSend(v24, "setShadowRadius:", self->_shadowRadius);
  shadowOpacity = self->_shadowOpacity;
  *(float *)&shadowOpacity = shadowOpacity;
  objc_msgSend(v24, "setShadowOpacity:", shadowOpacity);
  if (self->_shadowColor && self->_backgroundColor)
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
    cornerRadius = self->_cornerRadius;
    Mutable = CGPathCreateMutable();
    v12 = Mutable;
    v13 = x;
    v14 = y;
    v15 = width;
    v16 = height;
    if (cornerRadius == 0.0)
    {
      CGPathAddRect(Mutable, 0, *(CGRect *)&v13);
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v13);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      MaxY = CGRectGetMaxY(v25);
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      MaxX = CGRectGetMaxX(v26);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v20 = CGRectGetMaxY(v27);
      v28.origin.x = x;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v17 = CGRectGetMaxX(v28);
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      MinY = CGRectGetMinY(v29);
      CGPathMoveToPoint(v12, 0, MinX + 0.0, MaxY - cornerRadius);
      CGPathAddArcToPoint(v12, 0, x, y, x + cornerRadius, y + 0.0, cornerRadius);
      CGPathAddArcToPoint(v12, 0, v17, MinY, v17, cornerRadius + MinY, cornerRadius);
      CGPathAddArcToPoint(v12, 0, MaxX, v20, MaxX - cornerRadius, v20, cornerRadius);
      CGPathAddArcToPoint(v12, 0, MinX, MaxY, MinX + 0.0, MaxY - cornerRadius, cornerRadius);
      CGPathCloseSubpath(v12);
    }
    objc_msgSend(v24, "setShadowPath:", v12);
    CGPathRelease(v12);
  }
  objc_msgSend(v24, "setBorderColor:", -[UIColor CGColor](self->_borderColor, "CGColor"));
  objc_msgSend(v24, "setBorderWidth:", self->_borderWidth);
  objc_msgSend(v24, "setMasksToBounds:", *((_BYTE *)self + 120) & 1);
  objc_msgSend(v24, "setAllowsGroupBlending:", (*((unsigned __int8 *)self + 120) >> 1) & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIStyledBoxStyler compositingFilter](self, "compositingFilter"));
  objc_msgSend(v24, "setCompositingFilter:", v19);

  objc_msgSend(v24, "setContentsScale:", (double)((*((unsigned __int8 *)self + 120) >> 3) & 3));
}

- (void)applyStylingToView:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layer"));
  -[_TUIStyledBoxStyler applyStylingToLayer:](self, "applyStylingToLayer:");

}

- (CAFilter)compositingFilter
{
  void *v2;

  if (self->_blendMode)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:"));
  else
    v2 = 0;
  return (CAFilter *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
