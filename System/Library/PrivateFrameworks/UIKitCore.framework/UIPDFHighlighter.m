@implementation UIPDFHighlighter

- (UIPDFHighlighter)init
{
  UIPDFHighlighter *v2;
  CGColorSpace *DeviceRGB;
  objc_super v5;
  CGFloat v6[2];
  __int128 v7;
  CGFloat v8[2];
  __int128 v9;
  CGFloat components[2];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)UIPDFHighlighter;
  v2 = -[UIPDFHighlighter init](&v5, sel_init);
  if (v2)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)components = xmmword_1866830F8;
    v11 = unk_186683108;
    *(_OWORD *)v8 = xmmword_186683118;
    v9 = unk_186683128;
    *(_OWORD *)v6 = xmmword_186683138;
    v7 = unk_186683148;
    v2->_highlightColor = CGColorCreate(DeviceRGB, components);
    v2->_borderColor = CGColorCreate(DeviceRGB, v8);
    v2->_whiteColor = CGColorCreate(DeviceRGB, v6);
    CGColorSpaceRelease(DeviceRGB);
    -[UIPDFHighlighter setInset:](v2, "setInset:", 6.0);
    v2->_highLightLayers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFHighlighter;
  -[UIPDFHighlighter dealloc](&v3, sel_dealloc);
  -[NSMutableArray removeAllObjects](self->_highLightLayers, "removeAllObjects");

  CGPDFPageRelease(self->_page);
}

- (void)unhide
{
  NSMutableArray *highLightLayers;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  highLightLayers = self->_highLightLayers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(highLightLayers);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setHidden:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)addRectPath:(CGPath *)a3 toView:(id)a4 layer:(id)a5 rectangle:(id *)a6 upright:(BOOL)a7
{
  _BOOL4 v7;
  double v11;
  double y;
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
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double x;
  double v50;
  double v51;
  CGFloat v52;

  v7 = a7;
  v11 = a6->var1.x;
  y = a6->var1.y;
  v13 = a6->var2.x;
  v14 = a6->var2.y;
  v15 = a6->var3.x;
  v16 = a6->var3.y;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", a6->var0.x, a6->var0.y);
  v18 = v17;
  v20 = v19;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v11, y);
  v22 = v21;
  v24 = v23;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v13, v14);
  v26 = v25;
  v28 = v27;
  objc_msgSend(a4, "convertPointFromPDFPageSpace:", v15, v16);
  v30 = v29;
  v51 = v31;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v18, v20);
  v33 = v32;
  v35 = v34;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v22, v24);
  v37 = v36;
  v39 = v38;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v26, v28);
  x = v40;
  v42 = v41;
  objc_msgSend(a5, "convertPoint:fromLayer:", objc_msgSend(a4, "layer"), v30, v51);
  v44 = v43;
  v50 = v45;
  if (v7)
    v46 = 2.0;
  else
    v46 = 0.0;
  v52 = v35;
  v47 = v46 + v35;
  CGPathMoveToPoint(a3, 0, v33, v47);
  v48 = v39 - v46;
  CGPathAddLineToPoint(a3, 0, v37, v48);
  if (v7)
  {
    CGPathAddArc(a3, 0, v37 + 2.0, v48, 2.0, -3.14159265, 1.57079633, 1);
    CGPathAddLineToPoint(a3, 0, x + -2.0, v42);
    CGPathAddArc(a3, 0, x + -2.0, v42 + -2.0, 2.0, 1.57079633, 0.0, 1);
    CGPathAddLineToPoint(a3, 0, v44, v50 + 2.0);
    CGPathAddArc(a3, 0, v44 + -2.0, v50 + 2.0, 2.0, 0.0, -1.14159265, 1);
    CGPathAddLineToPoint(a3, 0, v33 + 2.0, v52);
    CGPathAddArc(a3, 0, v33 + 2.0, v47, 2.0, -1.57079633, -3.14159265, 1);
  }
  else
  {
    CGPathAddLineToPoint(a3, 0, x, v42);
    CGPathAddLineToPoint(a3, 0, v44, v50 + 0.0);
    CGPathAddLineToPoint(a3, 0, v33 + 0.0, v52);
  }
}

- (void)makeTheClipPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6
{
  _BOOL8 v6;
  const CGPath *Mutable;
  CGPoint var1;
  CGPoint var3;
  _OWORD v14[4];

  v6 = a6;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a4, "setClipPath:", Mutable);
  var1 = a5->var1;
  v14[0] = a5->var0;
  v14[1] = var1;
  var3 = a5->var3;
  v14[2] = a5->var2;
  v14[3] = var3;
  -[UIPDFHighlighter addRectPath:toView:layer:rectangle:upright:](self, "addRectPath:toView:layer:rectangle:upright:", Mutable, a3, a4, v14, v6);
  CGPathRelease(Mutable);
}

- (void)makeTheBorderPath:(id)a3 layer:(id)a4 rectangle:(id *)a5 upright:(BOOL)a6
{
  _BOOL8 v6;
  const CGPath *Mutable;
  CGPoint var1;
  CGPoint var3;
  _OWORD v14[4];

  v6 = a6;
  Mutable = CGPathCreateMutable();
  objc_msgSend(a4, "setBorderPath:", Mutable);
  var1 = a5->var1;
  v14[0] = a5->var0;
  v14[1] = var1;
  var3 = a5->var3;
  v14[2] = a5->var2;
  v14[3] = var3;
  -[UIPDFHighlighter addRectPath:toView:layer:rectangle:upright:](self, "addRectPath:toView:layer:rectangle:upright:", Mutable, a3, a4, v14, v6);
  CGPathRelease(Mutable);
}

- (void)addAnimation:(id)a3
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

- (void)addHighlightLayerFor:(id)a3 atIndex:(unint64_t)a4 to:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  double v11;
  double v12;
  UIPDFHighlightLayer *v13;
  double y;
  double width;
  double height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MidX;
  double MidY;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  _BOOL8 IsIdentity;
  _BOOL8 v28;
  const CGPath *MutableCopyByTransformingPath;
  CGFloat v30;
  double x;
  CGAffineTransform v32;
  __int128 v33;
  CGAffineTransform v34;
  CGRect v35;
  CATransform3D v36;
  CATransform3D v37;
  CGAffineTransform v38;
  __int128 v39;
  CGAffineTransform v40;
  __int128 v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v6 = a6;
  v41 = 0u;
  memset(&v40, 0, sizeof(v40));
  -[UIPDFHighlighter inset](self, "inset");
  if (a3)
  {
    objc_msgSend(a3, "rectangleAtIndex:scale:inset:", a4, 1.0, -v11);
    v39 = 0u;
    memset(&v38, 0, sizeof(v38));
    -[UIPDFHighlighter inset](self, "inset");
    objc_msgSend(a3, "rectangleAtIndex:scale:inset:", a4, 1.0, -(v12 + -1.0));
  }
  else
  {
    v41 = 0u;
    memset(&v40, 0, sizeof(v40));
    -[UIPDFHighlighter inset](self, "inset");
    memset(&v38, 0, sizeof(v38));
    v39 = 0u;
  }
  self->_enlargeFactor = 1.08;
  v13 = objc_alloc_init(UIPDFHighlightLayer);
  -[NSMutableArray addObject:](self->_highLightLayers, "addObject:", v13);
  CATransform3DMakeScale(&v37, 1.0, -1.0, 1.0);
  v36 = v37;
  -[UIPDFHighlightLayer setTransform:](v13, "setTransform:", &v36);
  memset(&v35, 0, sizeof(v35));
  memset(&v34, 0, sizeof(v34));
  objc_msgSend(a3, "getBounds:transform:index:", &v35, &v34, a4);
  v32 = v34;
  v42 = CGRectApplyAffineTransform(v35, &v32);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  objc_msgSend(a5, "convertRectFromPDFPageSpace:");
  v17 = v43.origin.x;
  v18 = v43.origin.y;
  v19 = v43.size.width;
  v20 = v43.size.height;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = v17;
  v44.origin.y = v18;
  v44.size.width = v19;
  v44.size.height = v20;
  MidY = CGRectGetMidY(v44);
  -[UIPDFHighlighter inset](self, "inset");
  v24 = -v23;
  -[UIPDFHighlighter inset](self, "inset");
  v45 = CGRectInset(v35, v24, -v25);
  v32 = v34;
  v46 = CGRectApplyAffineTransform(v45, &v32);
  objc_msgSend(a5, "convertRectFromPDFPageSpace:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
  v48 = CGRectIntegral(v47);
  -[UIPDFHighlightLayer setBounds:](v13, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v48.size.width, v48.size.height);
  -[UIPDFHighlightLayer setPosition:](v13, "setPosition:", MidX, MidY);
  -[UIPDFHighlightLayer setShadowColor:](v13, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
  -[UIPDFHighlightLayer setShadowOffset:](v13, "setShadowOffset:", 4.0, -4.0);
  LODWORD(v26) = 1061997773;
  -[UIPDFHighlightLayer setShadowOpacity:](v13, "setShadowOpacity:", v26);
  -[UIPDFHighlightLayer setShadowRadius:](v13, "setShadowRadius:", 3.0);
  -[UIPDFHighlightLayer setBackgroundColor:](v13, "setBackgroundColor:", -[UIColor CGColor](+[UIColor clearColor](UIColor, "clearColor"), "CGColor"));
  -[UIPDFHighlightLayer setDelegate:](v13, "setDelegate:", self);
  objc_msgSend((id)objc_msgSend(a5, "layer"), "addSublayer:", v13);
  -[UIPDFHighlightLayer setNeedsDisplay](v13, "setNeedsDisplay");
  v32 = v34;
  IsIdentity = CGAffineTransformIsIdentity(&v32);
  v32 = v40;
  v33 = v41;
  -[UIPDFHighlighter makeTheClipPath:layer:rectangle:upright:](self, "makeTheClipPath:layer:rectangle:upright:", a5, v13, &v32, IsIdentity);
  v32 = v34;
  v28 = CGAffineTransformIsIdentity(&v32);
  v32 = v38;
  v33 = v39;
  -[UIPDFHighlighter makeTheBorderPath:layer:rectangle:upright:](self, "makeTheBorderPath:layer:rectangle:upright:", a5, v13, &v32, v28);
  MutableCopyByTransformingPath = CGPathCreateMutableCopyByTransformingPath(-[UIPDFHighlightLayer clipPath](v13, "clipPath"), 0);
  -[UIPDFHighlightLayer setShadowPath:](v13, "setShadowPath:", MutableCopyByTransformingPath);
  CGPathRelease(MutableCopyByTransformingPath);
  -[UIPDFHighlightLayer bounds](v13, "bounds");
  v30 = (CGRectGetWidth(v49) / self->_pdfToViewScale - width * self->_enlargeFactor) * 0.5;
  -[UIPDFHighlightLayer bounds](v13, "bounds");
  -[UIPDFHighlightLayer setOffset:](v13, "setOffset:", v30 - x, (CGRectGetHeight(v50) / self->_pdfToViewScale - height * self->_enlargeFactor) * 0.5 - y);
  if (v6)
    -[UIPDFHighlighter addAnimation:](self, "addAnimation:", v13);
}

- (void)addHighlightFor:(id)a3 to:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  uint64_t v10;
  CGPDFPage *v11;
  uint64_t v12;
  double v13;

  v5 = a5;
  v9 = objc_msgSend(a3, "numberOfRectangles");
  if (v9)
  {
    v10 = v9;
    v11 = (CGPDFPage *)objc_msgSend((id)objc_msgSend(a4, "page"), "CGPage");
    self->_page = v11;
    CGPDFPageRetain(v11);
    objc_msgSend(a4, "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
    v12 = 0;
    self->_pdfToViewScale = v13;
    do
      -[UIPDFHighlighter addHighlightLayerFor:atIndex:to:animated:](self, "addHighlightLayerFor:atIndex:to:animated:", a3, v12++, a4, v5);
    while (v10 != v12);
  }
}

- (void)setNeedsDisplay
{
  NSMutableArray *highLightLayers;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  highLightLayers = self->_highLightLayers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(highLightLayers);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "setNeedsDisplay");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  CGContextSaveGState(a4);
  CGContextAddPath(a4, (CGPathRef)objc_msgSend(a3, "clipPath"));
  CGContextClip(a4);
  CGContextSetFillColorWithColor(a4, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
  objc_msgSend(a3, "bounds");
  CGContextFillRect(a4, v10);
  CGContextSaveGState(a4);
  CGContextScaleCTM(a4, self->_pdfToViewScale * self->_enlargeFactor, self->_pdfToViewScale * self->_enlargeFactor);
  objc_msgSend(a3, "offset");
  v8 = v7;
  objc_msgSend(a3, "offset");
  CGContextTranslateCTM(a4, v8, v9);
  CGContextDrawPDFPage(a4, self->_page);
  CGContextRestoreGState(a4);
  CGContextSetBlendMode(a4, kCGBlendModeMultiply);
  CGContextSetFillColorWithColor(a4, self->_highlightColor);
  objc_msgSend(a3, "bounds");
  v12 = CGRectInset(v11, 2.0, 2.0);
  CGContextFillRect(a4, v12);
  CGContextSetStrokeColorWithColor(a4, self->_borderColor);
  CGContextSetBlendMode(a4, kCGBlendModeNormal);
  CGContextAddPath(a4, (CGPathRef)objc_msgSend(a3, "borderPath"));
  CGContextSetLineWidth(a4, 1.0);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)clear
{
  NSMutableArray *highLightLayers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  highLightLayers = self->_highLightLayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(highLightLayers);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highLightLayers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_highLightLayers, "removeAllObjects");
}

- (double)inset
{
  return self->inset;
}

- (void)setInset:(double)a3
{
  self->inset = a3;
}

@end
