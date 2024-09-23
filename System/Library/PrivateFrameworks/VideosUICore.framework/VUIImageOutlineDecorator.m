@implementation VUIImageOutlineDecorator

- (VUIImageOutlineDecorator)initWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  VUIImageOutlineDecorator *v11;
  VUIImageOutlineDecorator *v12;
  objc_super v14;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIImageOutlineDecorator;
  v11 = -[VUIImageScaleDecorator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outlineColor, a3);
    v12->_outlineWidths.top = top;
    v12->_outlineWidths.left = left;
    v12->_outlineWidths.bottom = bottom;
    v12->_outlineWidths.right = right;
  }

  return v12;
}

- (id)decoratorIdentifier
{
  id v3;
  uint64_t v4;
  void *v5;
  float top;
  float left;
  float bottom;
  float right;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v15.receiver = self;
  v15.super_class = (Class)VUIImageOutlineDecorator;
  -[VUIImageScaleDecorator decoratorIdentifier](&v15, sel_decoratorIdentifier);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR("%@_"), v4);
  top = self->_outlineWidths.top;
  left = self->_outlineWidths.left;
  bottom = self->_outlineWidths.bottom;
  right = self->_outlineWidths.right;
  objc_msgSend(v3, "appendFormat:", CFSTR("_bw(%.f,%.f,%.f,%.f)"), top, left, bottom, right);
  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  -[UIColor getRed:green:blue:alpha:](self->_outlineColor, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("_bc(%.1f,%.1f,%.1f,%.1f)"), v14, v13, v12, v11);

  return v3;
}

+ (id)decoratorWithOutlineColor:(id)a3 outlineWidths:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;
  VUIImageOutlineDecorator *v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v8 = a3;
  v9 = -[VUIImageOutlineDecorator initWithOutlineColor:outlineWidths:]([VUIImageOutlineDecorator alloc], "initWithOutlineColor:outlineWidths:", v8, top, left, bottom, right);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  BOOL v18;
  double v19;
  BOOL v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIImageOutlineDecorator;
  if (-[VUIImageScaleDecorator isEqual:](&v22, sel_isEqual_, v4))
  {
    -[VUIImageOutlineDecorator outlineColor](self, "outlineColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outlineColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[VUIImageOutlineDecorator outlineWidths](self, "outlineWidths");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v4, "outlineWidths");
      v18 = v10 == v17;
      if (v8 != v19)
        v18 = 0;
      if (v14 != v16)
        v18 = 0;
      v20 = v12 == v15 && v18;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIImageOutlineDecorator;
  return -[VUIImageScaleDecorator hash](&v3, sel_hash);
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
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
  BOOL v15;
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
  CGPath *v39;
  double v40;
  double x;
  double y;
  double height;
  double width;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  -[VUIImageOutlineDecorator outlineWidths](self, "outlineWidths", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[VUIImageScaleDecorator _focusedSizeIncreaseFactor](self, "_focusedSizeIncreaseFactor");
  v14 = v13;
  v15 = v13 <= 0.0;
  v16 = v6 * v13;
  v17 = v10 * v14;
  if (v15)
    v18 = v12;
  else
    v18 = v12 * v14;
  if (v15)
    v17 = v10;
  v40 = v17;
  if (v15)
    v19 = v8;
  else
    v19 = v8 * v14;
  if (v15)
    v20 = v6;
  else
    v20 = v16;
  -[UIColor set](self->_outlineColor, "set", v16, v8 * v14);
  -[VUIImageScaleDecorator cornerRadii](self, "cornerRadii");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  if (+[VUICoreUtilities radiiIsZero:](VUICoreUtilities, "radiiIsZero:"))
  {
    if (v20 > 0.00000011920929)
    {
      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = width;
      v46.size.height = v20;
      UIRectFillUsingBlendMode(v46, kCGBlendModeNormal);
    }
    v29 = v18;
    v30 = height - v20;
    if (v18 > 0.00000011920929)
    {
      v31 = x + width - v18;
      v32 = v30 - v40;
      v33 = y + v20;
      UIRectFillUsingBlendMode(*(CGRect *)(&v29 - 2), kCGBlendModeNormal);
    }
    if (v40 > 0.00000011920929)
    {
      v47.origin.y = y + height - v40;
      v47.origin.x = x;
      v47.size.width = width;
      v47.size.height = v40;
      UIRectFillUsingBlendMode(v47, kCGBlendModeNormal);
    }
    v34 = v19;
    if (v19 > 0.00000011920929)
    {
      v35 = v30 - v40;
      v36 = x;
      v37 = y + v20;
      UIRectFillUsingBlendMode(*(CGRect *)(&v34 - 2), kCGBlendModeNormal);
    }
  }
  else
  {
    v38 = fmax(fmax(v20, v18), fmax(v40, v19));
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.height = height;
    v48.size.width = width;
    v49 = CGRectInset(v48, v38 * 0.5, v38 * 0.5);
    v39 = +[VUICoreUtilities createPathForRadii:inRect:isContinuous:](VUICoreUtilities, "createPathForRadii:inRect:isContinuous:", -[VUIImageScaleDecorator cornerContinuous](self, "cornerContinuous"), -(v38 * 0.5 - v22 * v14), -(v38 * 0.5 - v24 * v14), -(v38 * 0.5 - v26 * v14), -(v38 * 0.5 - v28 * v14), v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", v39);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setLineWidth:", v38);
    objc_msgSend(v45, "stroke");
    CGPathRelease(v39);

  }
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (UIEdgeInsets)outlineWidths
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_outlineWidths.top;
  left = self->_outlineWidths.left;
  bottom = self->_outlineWidths.bottom;
  right = self->_outlineWidths.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineColor, 0);
}

@end
