@implementation UIPDFSearchHighlightsController

- (UIPDFSearchHighlightsController)initWithPageView:(id)a3
{
  UIPDFSearchHighlightsController *v4;
  UIPDFSearchHighlightsController *v5;
  CGColorSpace *DeviceRGB;
  objc_super v8;
  CGFloat v9[2];
  __int128 v10;
  CGFloat v11[2];
  __int128 v12;
  CGFloat components[2];
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)UIPDFSearchHighlightsController;
  v4 = -[UIPDFSearchHighlightsController init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pageView = (UIPDFPageView *)a3;
    v4->_searchHighlightLayers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1866830D8;
    v14 = unk_1866830E8;
    v5->_highlightColor = CGColorCreate(DeviceRGB, components);
    *(_OWORD *)v11 = xmmword_186683118;
    v12 = unk_186683128;
    v5->_borderColor = CGColorCreate(DeviceRGB, v11);
    *(_OWORD *)v9 = xmmword_186683118;
    v10 = unk_186683128;
    v5->_shadowColor = CGColorCreate(DeviceRGB, v9);
    CGColorSpaceRelease(DeviceRGB);
    v5->_pageRendered = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v5, sel_pageDidRender_, CFSTR("kUIPDFContentLayerAdded"), 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPDFSearchHighlightsController clearSearchHighlights](self, "clearSearchHighlights");

  CGColorRelease(self->_highlightColor);
  CGColorRelease(self->_shadowColor);
  CGColorRelease(self->_borderColor);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFSearchHighlightsController;
  -[UIPDFSearchHighlightsController dealloc](&v3, sel_dealloc);
}

- (void)pageDidRender:(id)a3
{
  UIPDFPageView *v4;
  NSMutableArray *searchHighlightLayers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (UIPDFPageView *)objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4 == self->_pageView)
  {
    self->_pageRendered = 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    searchHighlightLayers = self->_searchHighlightLayers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(searchHighlightLayers);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHidden:", 0);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)clearSearchHighlights
{
  NSMutableArray *searchHighlightLayers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  searchHighlightLayers = self->_searchHighlightLayers;
  if (searchHighlightLayers)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(searchHighlightLayers);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer");
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
    -[NSMutableArray removeAllObjects](self->_searchHighlightLayers, "removeAllObjects");
  }
}

- (BOOL)hasSearchHighlights
{
  NSMutableArray *searchHighlightLayers;

  searchHighlightLayers = self->_searchHighlightLayers;
  if (searchHighlightLayers)
    LOBYTE(searchHighlightLayers) = -[NSMutableArray count](searchHighlightLayers, "count") != 0;
  return (char)searchHighlightLayers;
}

- (id)hitTest:(CGPoint)a3
{
  return (id)-[CALayer valueForKey:](-[CALayer hitTest:](-[UIView layer](self->_pageView, "layer"), "hitTest:", a3.x, a3.y), "valueForKey:", CFSTR("selection"));
}

- (void)_addAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CGRect v7;
  CGRect v8;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
  v5 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a3, "bounds");
  v8 = CGRectInset(v7, -10.0, -10.0);
  objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "valueWithCGRect:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height));
  v6 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a3, "bounds");
  objc_msgSend(v4, "setToValue:", objc_msgSend(v6, "valueWithCGRect:"));
  objc_msgSend(v4, "setDuration:", 0.5);
  objc_msgSend(a3, "addAnimation:forKey:", v4, 0);
}

- (void)_addAnimation2:(id)a3
{
  void *v4;
  __int128 v5;
  CATransform3D v6;
  CATransform3D v7;
  CATransform3D v8;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v5 = 0uLL;
  memset(&v8, 0, sizeof(v8));
  if (a3)
  {
    objc_msgSend(a3, "transform");
    v5 = 0uLL;
  }
  *(_OWORD *)&v7.m41 = v5;
  *(_OWORD *)&v7.m43 = v5;
  *(_OWORD *)&v7.m31 = v5;
  *(_OWORD *)&v7.m33 = v5;
  *(_OWORD *)&v7.m21 = v5;
  *(_OWORD *)&v7.m23 = v5;
  *(_OWORD *)&v7.m11 = v5;
  *(_OWORD *)&v7.m13 = v5;
  v6 = v8;
  CATransform3DScale(&v7, &v6, 1.08, 1.08, 1.0);
  v6 = v7;
  objc_msgSend(v4, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v6));
  v6 = v8;
  objc_msgSend(v4, "setToValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v6));
  objc_msgSend(v4, "setDuration:", 0.4);
  objc_msgSend(a3, "addAnimation:forKey:", v4, 0);
}

- (void)addSearchHighlightForRotatedSelection:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  double MidX;
  double MidY;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CATransform3D v25;
  CATransform3D v26;
  CGAffineTransform v27;
  CGRect v28;
  CGAffineTransform v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v4 = a4;
  v7 = objc_msgSend(a3, "numberOfRectangles");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0.5;
    do
    {
      memset(&v29, 0, sizeof(v29));
      memset(&v28, 0, sizeof(v28));
      objc_msgSend(a3, "getBounds:transform:index:", &v28, &v29, v9);
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
      v31 = CGRectInset(v30, -2.0, -2.0);
      x = v31.origin.x;
      y = v31.origin.y;
      width = v31.size.width;
      height = v31.size.height;
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      objc_msgSend(v15, "setBounds:", x, y, width, height);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      MidX = CGRectGetMidX(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      MidY = CGRectGetMidY(v33);
      v27 = v29;
      if (!CGAffineTransformIsIdentity(&v27))
      {
        v27 = v29;
        CPRotationDegreesFromTransform(&v27.a);
        v27 = v29;
        v19 = v18 * -3.14159265 / 180.0;
        v34 = CGRectApplyAffineTransform(v28, &v27);
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
        v20 = v35.origin.x;
        v21 = v35.origin.y;
        v22 = v35.size.width;
        v23 = v35.size.height;
        MidX = CGRectGetMidX(v35);
        v36.origin.x = v20;
        v36.origin.y = v21;
        v36.size.width = v22;
        v36.size.height = v23;
        v10 = 0.5;
        MidY = CGRectGetMidY(v36);
        CATransform3DMakeRotation(&v26, v19, 0.0, 0.0, 1.0);
        v25 = v26;
        objc_msgSend(v15, "setTransform:", &v25);
      }
      objc_msgSend(v15, "setPosition:", MidX, MidY + v10);
      objc_msgSend(v15, "setBackgroundColor:", self->_highlightColor);
      LODWORD(v24) = 1.0;
      objc_msgSend(v15, "setOpacity:", v24);
      objc_msgSend(v15, "setCornerRadius:", 3.0);
      objc_msgSend(v15, "setBorderWidth:", 0.0);
      objc_msgSend(v15, "setHidden:", !self->_pageRendered);
      objc_msgSend(v15, "setValue:forKey:", a3, CFSTR("selection"));
      objc_msgSend(v15, "setDelegate:", self);
      objc_msgSend(v15, "setNeedsLayout");
      objc_msgSend(v15, "setNeedsDisplay");
      -[NSMutableArray addObject:](self->_searchHighlightLayers, "addObject:", v15);
      -[CALayer addSublayer:](-[UIView layer](self->_pageView, "layer"), "addSublayer:", v15);
      if (v4)
        -[UIPDFSearchHighlightsController _addAnimation:](self, "_addAnimation:", v15);
      ++v9;
    }
    while (v8 != v9);
  }
}

- (void)addLayer:(CGRect)a3 path:(CGPath *)a4 shadowPath:(CGPath *)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  void *v14;
  double MidX;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  objc_msgSend(v14, "setBounds:", x, y, width, height);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  objc_msgSend(v14, "setPosition:", MidX, CGRectGetMidY(v19));
  objc_msgSend(v14, "setFillColor:", self->_highlightColor);
  LODWORD(v16) = 0.25;
  objc_msgSend(v14, "setOpacity:", v16);
  objc_msgSend(v14, "setStrokeColor:", self->_borderColor);
  objc_msgSend(v14, "setValue:forKey:", self->_selection, CFSTR("selection"));
  objc_msgSend(v14, "setPath:", a4);
  objc_msgSend(v14, "setHidden:", !self->_pageRendered);
  if (a5)
  {
    objc_msgSend(v14, "setShadowPath:", a5);
    objc_msgSend(v14, "setShadowOffset:", 5.0, 5.0);
    LODWORD(v17) = 1.0;
    objc_msgSend(v14, "setShadowOpacity:", v17);
    objc_msgSend(v14, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  }
  if (v6)
    -[UIPDFSearchHighlightsController _addAnimation2:](self, "_addAnimation2:", v14);
  -[CALayer addSublayer:](-[UIView layer](self->_pageView, "layer"), "addSublayer:", v14);
  -[NSMutableArray addObject:](self->_searchHighlightLayers, "addObject:", v14);
}

- (unint64_t)indexOfColumnBreakStartingAt:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double MinY;
  unint64_t v9;
  CGFloat v10;
  BOOL v11;
  CGRect v13;
  CGRect v14;

  v5 = -[NSMutableArray count](self->_rectangles, "count");
  v6 = v5;
  if (v5 - 1 > a3)
  {
    v7 = v5;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a3), "CGRectValue");
    MinY = CGRectGetMinY(v13);
    v9 = a3 + 1;
    do
    {
      v6 = v9;
      if (v9 >= v7)
        break;
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v9), "CGRectValue");
      v10 = CGRectGetMinY(v14);
      v9 = v6 + 1;
      v11 = v10 < MinY;
      MinY = v10;
    }
    while (!v11);
  }
  return v6;
}

- (CGRect)unionFrom:(unint64_t)a3 to:(unint64_t)a4
{
  unint64_t v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v7 = -[NSMutableArray count](self->_rectangles, "count");
  if (v7 > a3 && v7 > a4 && a3 <= a4)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a3), "CGRectValue");
    x = v16;
    y = v17;
    width = v18;
    height = v19;
    if (a3 < a4)
    {
      v20 = a3 + 1;
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v20), "CGRectValue");
        v28.origin.x = v21;
        v28.origin.y = v22;
        v28.size.width = v23;
        v28.size.height = v24;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v20;
      }
      while (v20 <= a4);
    }
  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)makeType1Shadow:(CGPath *)a3 rect:(CGRect)a4 inset:(CGPoint)a5
{
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v9;
  CGFloat MinX;
  double MaxY;
  double MaxX;
  CGFloat MinY;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v9 = a4.origin.x;
  MinX = CGRectGetMinX(a4);
  v16.origin.x = v9;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxY = CGRectGetMaxY(v16);
  v17.origin.x = v9;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxX = CGRectGetMaxX(v17);
  v18.origin.x = v9;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MinY = CGRectGetMinY(v18);
  CGPathMoveToPoint(a3, 0, MinX, MaxY);
  CGPathAddLineToPoint(a3, 0, MinX, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, x + -5.0, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, x + -5.0, a5.y + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, a5.y + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, a5.y);
  CGPathAddLineToPoint(a3, 0, a5.x, a5.y);
  CGPathAddLineToPoint(a3, 0, a5.x, MaxY);
  CGPathCloseSubpath(a3);
}

- (void)makeType2Shadow:(CGPath *)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  double MaxY;
  double MaxX;
  CGFloat MinY;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MinX = CGRectGetMinX(a4);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MaxY = CGRectGetMaxY(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxX = CGRectGetMaxX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinY = CGRectGetMinY(v15);
  CGPathMoveToPoint(a3, 0, MinX, MaxY);
  CGPathAddLineToPoint(a3, 0, MinX, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MaxY + -5.0);
  CGPathAddLineToPoint(a3, 0, MaxX + -5.0, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MinY);
  CGPathAddLineToPoint(a3, 0, MaxX, MaxY);
  CGPathCloseSubpath(a3);
}

- (void)makeType1Path:(CGPath *)a3 shadowPath:(CGPath *)a4
{
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double x;
  double y;
  double width;
  double height;
  double MaxY;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat recta;
  double rect;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double MinY;
  double MaxX;
  double MinX;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v7 = -[NSMutableArray count](self->_rectangles, "count");
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", 0), "CGRectValue");
  v9 = v8;
  v46 = v8;
  v11 = v10;
  recta = v10;
  v13 = v12;
  v33 = v14;
  v35 = v12;
  v15 = v14;
  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", v7 - 1), "CGRectValue");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIPDFSearchHighlightsController unionFrom:to:](self, "unionFrom:to:", 1, v7 - 2);
  v60.origin.x = v24;
  v42 = v25;
  v44 = v24;
  v60.origin.y = v25;
  v60.size.width = v26;
  v37 = v27;
  v38 = v26;
  v60.size.height = v27;
  v50.origin.x = v9;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  v51 = CGRectUnion(v50, v60);
  v61.origin.x = v17;
  v61.origin.y = v19;
  v61.size.width = v21;
  v61.size.height = v23;
  v52 = CGRectUnion(v51, v61);
  x = v52.origin.x;
  y = v52.origin.y;
  width = v52.size.width;
  height = v52.size.height;
  MinX = CGRectGetMinX(v52);
  v53.origin.x = v17;
  v53.origin.y = v19;
  v53.size.width = v21;
  v53.size.height = v23;
  MaxX = CGRectGetMaxX(v53);
  v54.origin.x = v46;
  v54.origin.y = recta;
  v54.size.height = v33;
  v54.size.width = v35;
  v36 = CGRectGetMinX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  v34 = CGRectGetMaxX(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  rect = CGRectGetMinY(v56);
  v57.origin.x = v44;
  v57.origin.y = v42;
  v57.size.width = v38;
  v57.size.height = v37;
  MinY = CGRectGetMinY(v57);
  v58.origin.x = v44;
  v58.origin.y = v42;
  v58.size.width = v38;
  v58.size.height = v37;
  MaxY = CGRectGetMaxY(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v43 = CGRectGetMaxY(v59);
  -[UIPDFSearchHighlightsController makeType1Shadow:rect:inset:](self, "makeType1Shadow:rect:inset:", a4, x, y, width, height, MaxX, MaxY);
  v39 = vabdd_f64(v34, MaxX);
  v45 = vabdd_f64(MinX, v36);
  if (v45 <= 4.0)
  {
    CGPathMoveToPoint(a3, 0, MinX, MinY);
  }
  else
  {
    CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
    CGPathAddArc(a3, 0, v36 + -4.0, MinY + -4.0, 4.0, 1.57079633, 0.0, 1);
  }
  CGPathAddArc(a3, 0, v36 + 4.0, rect + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathAddArc(a3, 0, v34 + -4.0, rect + 4.0, 4.0, -1.57079633, 0.0, 0);
  if (v39 > 4.0)
  {
    CGPathAddArc(a3, 0, v34 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
    CGPathAddArc(a3, 0, MaxX + 4.0, MaxY + 4.0, 4.0, -1.57079633, 3.14159265, 1);
  }
  CGPathAddArc(a3, 0, MaxX + -4.0, v43 + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, MinX + 4.0, v43 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  if (v45 > 4.0)
    CGPathAddArc(a3, 0, MinX + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathCloseSubpath(a3);
}

- (void)makeType2Path:(CGPath *)a3 to:(unint64_t)a4 shadowPath:(CGPath *)a5
{
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double MinY;
  CGFloat recta;
  double rect;
  CGFloat rect_8a;
  double rect_8;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", 0), "CGRectValue");
  v10 = v9;
  rect_8a = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIPDFSearchHighlightsController unionFrom:to:](self, "unionFrom:to:", 1, a4);
  v46.origin.x = v17;
  recta = v17;
  v46.origin.y = v18;
  v31 = v19;
  v32 = v18;
  v46.size.width = v19;
  v46.size.height = v20;
  v30 = v20;
  v38.origin.x = v10;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v16;
  v39 = CGRectUnion(v38, v46);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  -[UIPDFSearchHighlightsController makeType2Shadow:rect:](self, "makeType2Shadow:rect:", a5);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MinX = CGRectGetMinX(v40);
  v41.origin.x = rect_8a;
  v41.origin.y = v12;
  v41.size.width = v14;
  v41.size.height = v16;
  v26 = CGRectGetMinX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  rect_8 = CGRectGetMaxX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MinY = CGRectGetMinY(v43);
  v44.origin.x = recta;
  v44.size.width = v31;
  v44.origin.y = v32;
  v44.size.height = v30;
  v27 = CGRectGetMinY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  rect = CGRectGetMaxY(v45);
  v28 = vabdd_f64(MinX, v26);
  if (v28 <= 4.0)
  {
    CGPathMoveToPoint(a3, 0, MinX, v27);
    v29 = MinX + 4.0;
  }
  else
  {
    v29 = MinX + 4.0;
    CGPathMoveToPoint(a3, 0, v29, v27);
    CGPathAddArc(a3, 0, v26 + -4.0, v27 + -4.0, 4.0, 1.57079633, 0.0, 1);
  }
  CGPathAddArc(a3, 0, v26 + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathAddArc(a3, 0, rect_8 + -4.0, MinY + 4.0, 4.0, -1.57079633, 0.0, 0);
  CGPathAddArc(a3, 0, rect_8 + -4.0, rect + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, v29, rect + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  if (v28 > 4.0)
    CGPathAddArc(a3, 0, v29, v27 + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathCloseSubpath(a3);
}

- (void)makeType3Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6
{
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double MaxY;
  double v19;
  double MinY;
  double v21;
  double MaxX;
  double v23;
  double MinX;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[UIPDFSearchHighlightsController unionFrom:to:](self, "unionFrom:to:", a4, a5);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIPDFSearchHighlightsController makeType2Shadow:rect:](self, "makeType2Shadow:rect:", a6);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  MinY = CGRectGetMinY(v26);
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v17 = CGRectGetMinY(v28);
  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  v23 = CGRectGetMaxX(v29);
  v30.origin.x = v10;
  v30.origin.y = v12;
  v30.size.width = v14;
  v30.size.height = v16;
  MaxY = CGRectGetMaxY(v30);
  v31.origin.x = v10;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v16;
  v21 = CGRectGetMinX(v31);
  v32.origin.x = v10;
  v32.origin.y = v12;
  v32.size.width = v14;
  v32.size.height = v16;
  v19 = CGRectGetMaxY(v32);
  CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
  CGPathAddArc(a3, 0, MaxX + -4.0, v17 + 4.0, 4.0, -1.57079633, 0.0, 0);
  CGPathAddArc(a3, 0, v23 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
  CGPathAddArc(a3, 0, v21 + 4.0, v19 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
  CGPathAddArc(a3, 0, MinX + 4.0, MinY + 4.0, 4.0, 3.14159265, -1.57079633, 0);
  CGPathCloseSubpath(a3);
}

- (void)makeType4Path:(CGPath *)a3 from:(unint64_t)a4 to:(unint64_t)a5 shadowPath:(CGPath *)a6
{
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double x;
  double y;
  double width;
  double height;
  double MaxX;
  double v32;
  double MinY;
  double MaxY;
  CGFloat v35;
  double MinX;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_rectangles, "objectAtIndex:", a5), "CGRectValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIPDFSearchHighlightsController unionFrom:to:](self, "unionFrom:to:", a4, a5 - 1);
  v39 = v20;
  v40 = v19;
  v37 = v22;
  v38 = v21;
  v23 = *MEMORY[0x1E0C9D628];
  v24 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  v51.origin.x = *(CGFloat *)MEMORY[0x1E0C9D628];
  v51.origin.y = v24;
  v51.size.width = v25;
  v51.size.height = v26;
  if (!CGRectEqualToRect(v42, v51))
  {
    v43.origin.y = v39;
    v43.origin.x = v40;
    v43.size.height = v37;
    v43.size.width = v38;
    v52.origin.x = v23;
    v52.origin.y = v24;
    v52.size.width = v25;
    v52.size.height = v26;
    if (!CGRectEqualToRect(v43, v52))
    {
      v44.origin.x = v12;
      v44.origin.y = v14;
      v44.size.width = v16;
      v44.size.height = v18;
      v53.origin.y = v39;
      v53.origin.x = v40;
      v53.size.height = v37;
      v53.size.width = v38;
      v45 = CGRectUnion(v44, v53);
      x = v45.origin.x;
      y = v45.origin.y;
      width = v45.size.width;
      height = v45.size.height;
      MinX = CGRectGetMinX(v45);
      v46.origin.x = v12;
      v46.origin.y = v14;
      v46.size.width = v16;
      v46.size.height = v18;
      MaxX = CGRectGetMaxX(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v32 = CGRectGetMaxX(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MinY = CGRectGetMinY(v48);
      v49.origin.y = v39;
      v49.origin.x = v40;
      v49.size.height = v37;
      v49.size.width = v38;
      MaxY = CGRectGetMaxY(v49);
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v41 = CGRectGetMaxY(v50);
      -[UIPDFSearchHighlightsController makeType1Shadow:rect:inset:](self, "makeType1Shadow:rect:inset:", a6, x, y, width, height, MaxX, MaxY);
      CGPathMoveToPoint(a3, 0, MinX + 4.0, MinY);
      v35 = MinY + 4.0;
      CGPathAddArc(a3, 0, v32 + -4.0, v35, 4.0, -1.57079633, 0.0, 0);
      CGPathAddArc(a3, 0, v32 + -4.0, MaxY + -4.0, 4.0, 0.0, 1.57079633, 0);
      CGPathAddArc(a3, 0, MaxX + 4.0, MaxY + 4.0, 4.0, -1.57079633, 3.14159265, 1);
      CGPathAddArc(a3, 0, MaxX + -4.0, v41 + -4.0, 4.0, 0.0, 1.57079633, 0);
      CGPathAddArc(a3, 0, MinX + 4.0, v41 + -4.0, 4.0, 1.57079633, -3.14159265, 0);
      CGPathAddArc(a3, 0, MinX + 4.0, v35, 4.0, 3.14159265, -1.57079633, 0);
      CGPathCloseSubpath(a3);
    }
  }
}

- (void)addSearchHighlightForSelection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  const CGPath *Mutable;
  const CGPath *v24;
  const CGPath *v25;
  unint64_t v26;
  unint64_t v27;
  const CGPath *v28;
  const CGPath *v29;
  const CGPath *v30;
  CGMutablePathRef v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  __int128 v34;
  __int128 v35;
  CGRect v36;
  CGRect v37;

  v4 = a4;
  v7 = objc_msgSend(a3, "numberOfRectangles");
  if (v7)
  {
    v8 = v7;
    v34 = 0u;
    v35 = 0u;
    memset(&v33, 0, sizeof(v33));
    objc_msgSend(a3, "getBounds:transform:index:", &v34, &v33, 0);
    if (v8 >= 3 && (v32 = v33, CGAffineTransformIsIdentity(&v32)))
    {
      self->_rectangles = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34, v35);
      *(_QWORD *)&v34 = v9;
      *((_QWORD *)&v34 + 1) = v10;
      *(_QWORD *)&v35 = v11;
      *((_QWORD *)&v35 + 1) = v12;
      -[NSMutableArray addObject:](self->_rectangles, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:"));
      self->_selection = (UIPDFSelection *)a3;
      for (i = 1; i != v8; ++i)
      {
        objc_msgSend(a3, "getBounds:transform:index:", &v34, &v33, i);
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v34, v35);
        *(CGFloat *)&v34 = v36.origin.x;
        *((_QWORD *)&v34 + 1) = *(_QWORD *)&v36.origin.y;
        *(CGFloat *)&v35 = v36.size.width;
        *((_QWORD *)&v35 + 1) = *(_QWORD *)&v36.size.height;
        v37 = CGRectInset(v36, -2.0, -2.0);
        *(CGFloat *)&v34 = v37.origin.x;
        *((_QWORD *)&v34 + 1) = *(_QWORD *)&v37.origin.y;
        *(CGFloat *)&v35 = v37.size.width;
        *((_QWORD *)&v35 + 1) = *(_QWORD *)&v37.size.height;
        -[NSMutableArray addObject:](self->_rectangles, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:"));
      }
      objc_msgSend(a3, "bounds");
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = -[UIPDFSearchHighlightsController indexOfColumnBreakStartingAt:](self, "indexOfColumnBreakStartingAt:", 0);
      Mutable = CGPathCreateMutable();
      v24 = CGPathCreateMutable();
      if (v22 == v8)
      {
        -[UIPDFSearchHighlightsController makeType1Path:shadowPath:](self, "makeType1Path:shadowPath:", Mutable, v24);
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", Mutable, v24, v4, v15, v17, v19, v21);
        CGPathRelease(Mutable);
        v25 = v24;
      }
      else
      {
        -[UIPDFSearchHighlightsController makeType2Path:to:shadowPath:](self, "makeType2Path:to:shadowPath:", Mutable, v22 - 1, v24);
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", Mutable, v24, v4, v15, v17, v19, v21);
        CGPathRelease(Mutable);
        CGPathRelease(v24);
        v26 = -[UIPDFSearchHighlightsController indexOfColumnBreakStartingAt:](self, "indexOfColumnBreakStartingAt:", v22);
        if (v26 >= v8)
        {
          v27 = v22;
        }
        else
        {
          do
          {
            v27 = v26;
            v28 = CGPathCreateMutable();
            v29 = CGPathCreateMutable();
            -[UIPDFSearchHighlightsController makeType3Path:from:to:shadowPath:](self, "makeType3Path:from:to:shadowPath:", v28, v22, v27 - 1, v29);
            -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", v28, v29, v4, v15, v17, v19, v21);
            CGPathRelease(v28);
            CGPathRelease(v29);
            v26 = -[UIPDFSearchHighlightsController indexOfColumnBreakStartingAt:](self, "indexOfColumnBreakStartingAt:", v27);
            v22 = v27;
          }
          while (v26 < v8);
        }
        v30 = CGPathCreateMutable();
        v31 = CGPathCreateMutable();
        -[UIPDFSearchHighlightsController makeType4Path:from:to:shadowPath:](self, "makeType4Path:from:to:shadowPath:", v30, v27, v8 - 1, v31);
        -[UIPDFSearchHighlightsController addLayer:path:shadowPath:animated:](self, "addLayer:path:shadowPath:animated:", v30, v31, v4, v15, v17, v19, v21);
        CGPathRelease(v30);
        v25 = v31;
      }
      CGPathRelease(v25);
      -[NSMutableArray removeAllObjects](self->_rectangles, "removeAllObjects");

    }
    else
    {
      -[UIPDFSearchHighlightsController addSearchHighlightForRotatedSelection:animated:](self, "addSearchHighlightForRotatedSelection:animated:", a3, v4);
    }
  }
}

- (void)setNeedsDisplay
{
  NSMutableArray *searchHighlightLayers;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  searchHighlightLayers = self->_searchHighlightLayers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(searchHighlightLayers);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setNeedsLayout");
        objc_msgSend(v7, "setNeedsDisplay");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](searchHighlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  UIView *v4;
  CALayer *v5;
  double v6;
  double v7;

  v4 = -[UIView superview](self->_pageView, "superview");
  if (v4)
  {
    v5 = -[UIView layer](v4, "layer");
    if (v5)
    {
      -[CALayer transform](v5, "transform");
      -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
      objc_msgSend(a3, "setContentsScale:", v7 * v6);
    }
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t Length;
  uint64_t v9;
  uint64_t i;
  CGFont *CGFontAtIndex;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGGlyph glyphs[25];

  v6 = objc_msgSend(a3, "valueForKey:", CFSTR("selection"));
  if (v6)
  {
    v7 = (void *)v6;
    CGContextSetFillColorWithColor(a4, self->_borderColor);
    if (objc_msgSend(v7, "CGSelection"))
    {
      Length = CGPDFSelectionGetLength();
      if (Length >= 1)
      {
        v9 = Length;
        for (i = 0; i != v9; ++i)
        {
          memset(&glyphs[1], 0, 48);
          CGPDFSelectionGetTextMatrixAtIndex();
          CGFontAtIndex = (CGFont *)CGPDFSelectionGetCGFontAtIndex();
          if (CGFontAtIndex)
          {
            CGContextSetFont(a4, CGFontAtIndex);
            CGContextSetFontSize(a4, 1.0);
            glyphs[0] = 0;
            glyphs[0] = CGPDFSelectionGetGlyphAtIndex();
            -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", *(double *)&glyphs[17] + *(double *)&glyphs[1] * 0.0 + *(double *)&glyphs[9] * 0.0, *(double *)&glyphs[21] + *(double *)&glyphs[5] * 0.0 + *(double *)&glyphs[13] * 0.0, 1.0, 1.0);
            v13 = v12;
            v15 = v14;
            v18 = *(CGAffineTransform *)&glyphs[1];
            CGAffineTransformScale(&v19, &v18, v17, -v16);
            *(CGAffineTransform *)&glyphs[1] = v19;
            CGContextSetTextMatrix(a4, &v19);
            if (glyphs[0])
              CGContextShowGlyphsAtPoint(a4, v13, v15, glyphs, 1uLL);
          }
        }
      }
    }
  }
}

@end
