@implementation _UIFocusContainerGuideMapEntry

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  CGSize size;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusContainerGuideMapEntry;
  v4 = -[_UIFocusRegionMapEntry copyWithZone:](&v8, sel_copyWithZone_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusContainerGuide);
  objc_storeWeak(v4 + 12, WeakRetained);

  size = self->_focusContainmentFrame.size;
  *((_OWORD *)v4 + 7) = self->_focusContainmentFrame.origin;
  *((CGSize *)v4 + 8) = size;
  v4[13] = *(id *)&self->_axisAlignedDistanceFromFocusedRect;
  return v4;
}

- (id)visualRepresentationColor
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (qword_1ECD7B768 != -1)
    dispatch_once(&qword_1ECD7B768, &__block_literal_global_290);
  v3 = qword_1ECD7B760;
  -[_UIFocusContainerGuideMapEntry focusContainerGuide](self, "focusContainerGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapEntry _uniqueElementFromArray:forKey:](self, "_uniqueElementFromArray:forKey:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double width;
  double height;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  y = a4.origin.y;
  x = a4.origin.x;
  -[_UIFocusContainerGuideMapEntry focusContainmentFrame](self, "focusContainmentFrame", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v18 = CGRectOffset(v17, -x, -y);
  v8 = v18.origin.x;
  v9 = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  -[_UIFocusContainerGuideMapEntry visualRepresentationColor](self, "visualRepresentationColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.1);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v13, "CGColor"));

  v19.origin.x = v8;
  v19.origin.y = v9;
  v19.size.width = width;
  v19.size.height = height;
  CGContextFillRect(a3, v19);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v8, v9, width, height, 12.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLineDash:count:phase:", &drawVisualRepresentationInContext_imageFrame__dashedLineLength, 1, 0.0);
  objc_msgSend(v16, "setLineWidth:", 4.0);
  -[_UIFocusContainerGuideMapEntry visualRepresentationColor](self, "visualRepresentationColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.5);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v15, "CGColor"));

  objc_msgSend(v16, "stroke");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusRegionMapEntry frame](self, "frame");
  NSStringFromCGRect(v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusContainerGuideMapEntry focusContainerGuide](self, "focusContainerGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusContainerGuideMapEntry focusContainerGuide](self, "focusContainerGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p frame=%@, container=%@: %p>"), v5, self, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIFocusContainerGuide)focusContainerGuide
{
  return (UIFocusContainerGuide *)objc_loadWeakRetained((id *)&self->_focusContainerGuide);
}

- (void)setFocusContainerGuide:(id)a3
{
  objc_storeWeak((id *)&self->_focusContainerGuide, a3);
}

- (CGRect)focusContainmentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_focusContainmentFrame.origin.x;
  y = self->_focusContainmentFrame.origin.y;
  width = self->_focusContainmentFrame.size.width;
  height = self->_focusContainmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFocusContainmentFrame:(CGRect)a3
{
  self->_focusContainmentFrame = a3;
}

- (double)axisAlignedDistanceFromFocusedRect
{
  return self->_axisAlignedDistanceFromFocusedRect;
}

- (void)setAxisAlignedDistanceFromFocusedRect:(double)a3
{
  self->_axisAlignedDistanceFromFocusedRect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusContainerGuide);
}

@end
