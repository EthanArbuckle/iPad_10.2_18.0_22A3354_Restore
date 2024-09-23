@implementation _UIHighlightView

- (_UIHighlightView)initWithFrame:(CGRect)a3
{
  _UIHighlightView *v3;
  _UIHighlightView *v4;
  UIColor *color;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHighlightView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 1);
    color = v4->_color;
    v4->_color = 0;

  }
  return v4;
}

- (void)cleanUp
{
  NSMutableArray *innerBounds;
  NSMutableArray *innerQuads;

  innerBounds = self->_innerBounds;
  self->_innerBounds = 0;

  innerQuads = self->_innerQuads;
  self->_innerQuads = 0;

}

- (void)setColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    v5 = v6;
  }

}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerRadii:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_cornerRadii != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cornerRadii, a3);
    v5 = v6;
  }

}

- (void)setFrames:(id)a3 boundaryRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSMutableArray *v33;
  NSMutableArray *innerBounds;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  NSMutableArray *v40;
  void *v41;
  uint64_t v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v51;
  _BYTE v52[32];
  _QWORD rect[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[_UIHighlightView cleanUp](self, "cleanUp");
  if (v9 && objc_msgSend(v9, "count"))
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[_UIHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "rectValue");
        v24 = v20;
        v25 = v21;
        v26 = v22;
        v27 = v23;
        if ((v17 & 1) != 0)
        {
          v64.origin.x = v10;
          v64.origin.y = v11;
          v64.size.width = v12;
          v64.size.height = v13;
          v28 = v24;
          v65 = CGRectUnion(v64, *(CGRect *)(&v25 - 1));
        }
        else
        {
          v65 = CGRectInset(*(CGRect *)&v20, -self->_cornerRadius, -self->_cornerRadius);
        }
        v10 = v65.origin.x;
        v11 = v65.origin.y;
        v12 = v65.size.width;
        v13 = v65.size.height;
        v17 = 1;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v16);
  }

  if (self->_invertHighlight)
    v29 = height;
  else
    v29 = v13;
  if (self->_invertHighlight)
    v30 = width;
  else
    v30 = v12;
  *(double *)&v52[16] = v30;
  *(double *)&v52[24] = v29;
  if (self->_invertHighlight)
    v31 = y;
  else
    v31 = v11;
  if (self->_invertHighlight)
    v32 = x;
  else
    v32 = v10;
  *(double *)v52 = v32;
  *(double *)&v52[8] = v31;
  v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  innerBounds = self->_innerBounds;
  self->_innerBounds = v33;

  v55 = 0u;
  v56 = 0u;
  *(_OWORD *)&rect[3] = 0u;
  v54 = 0u;
  v35 = v14;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &rect[3], v61, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v54 != v38)
          objc_enumerationMutation(v35);
        v40 = self->_innerBounds;
        v41 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(*(id *)(rect[4] + 8 * j), "rectValue");
        rect[0] = v42;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v49 = -CGRectGetMinX(*(CGRect *)v52);
        v50 = -CGRectGetMinY(*(CGRect *)v52);
        *(_QWORD *)&v66.origin.x = rect[0];
        v66.origin.y = v44;
        v66.size.width = v46;
        v66.size.height = v48;
        v67 = CGRectOffset(v66, v49, v50);
        objc_msgSend(v41, "valueWithCGRect:", v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v40, "addObject:", v51);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &rect[3], v61, 16);
    }
    while (v37);
  }

  rect[1] = self;
  rect[2] = _UIHighlightView;
  objc_msgSendSuper2((objc_super *)&rect[1], sel_setFrame_, *(double *)v52, *(double *)&v52[8], *(double *)&v52[16], *(double *)&v52[24]);
  if (-[UIView needsDisplayOnBoundsChange](self, "needsDisplayOnBoundsChange"))
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setQuads:(id)a3 boundaryRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double MinX;
  double MinY;
  NSMutableArray *v28;
  NSMutableArray *innerQuads;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  double v35;
  double v36;
  NSMutableArray *v37;
  void *v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[_UIHighlightView cleanUp](self, "cleanUp");
  if (!v9 || !objc_msgSend(v9, "count"))
    -[_UIHighlightView setFrame:](self, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v45;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "CGPointValue");
        if ((v13 & 1) != 0)
          v22 = v15;
        else
          v22 = v21;
        if ((v13 & 1) != 0)
          v23 = v16;
        else
          v23 = v21;
        if ((v13 & 1) != 0)
          v24 = v17;
        else
          v24 = v20;
        if ((v13 & 1) != 0)
          v25 = v18;
        else
          v25 = v20;
        if (v20 >= v25)
          v18 = v20;
        else
          v18 = v25;
        if (v20 >= v24)
          v17 = v24;
        else
          v17 = v20;
        if (v21 >= v23)
          v16 = v21;
        else
          v16 = v23;
        if (v21 >= v22)
          v15 = v22;
        else
          v15 = v21;
        v13 = 1;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v12);
  }
  else
  {
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
  }

  if (!self->_invertHighlight)
  {
    v51.size.width = v18 - v17;
    v51.size.height = v16 - v15;
    v51.origin.x = v17;
    v51.origin.y = v15;
    v52 = CGRectInset(v51, self->_cornerRadius * -4.0, self->_cornerRadius * -4.0);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v53 = CGRectIntersection(v52, v56);
    x = v53.origin.x;
    y = v53.origin.y;
    width = v53.size.width;
    height = v53.size.height;
  }
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  MinX = CGRectGetMinX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = width;
  v55.size.height = height;
  MinY = CGRectGetMinY(v55);
  v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  innerQuads = self->_innerQuads;
  self->_innerQuads = v28;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v30 = v10;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v41 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "CGPointValue");
        v37 = self->_innerQuads;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v35 - MinX, v36 - MinY);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v37, "addObject:", v38);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v32);
  }

  v39.receiver = self;
  v39.super_class = (Class)_UIHighlightView;
  -[UIView setFrame:](&v39, sel_setFrame_, x, y, width, height);
  if (-[UIView needsDisplayOnBoundsChange](self, "needsDisplayOnBoundsChange"))
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIHighlightView cleanUp](self, "cleanUp");
  v8.receiver = self;
  v8.super_class = (Class)_UIHighlightView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setInvertHighlight:(BOOL)a3 clipRect:(CGRect)a4
{
  self->_invertHighlight = a3;
  self->_invertedHighlightClipRect = a4;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *innerBounds;
  NSArray *v8;
  void *v9;
  double v10;
  double v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  double v17;
  double v18;
  const CGPath *PathWithShrinkWrappedRects;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  _QWORD *ContextStack;
  CGContext *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  uint64_t v67;
  CGFloat Alpha;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;

  v81 = *MEMORY[0x1E0C80C00];
  if (self->_innerBounds || self->_innerQuads)
  {
    if (self->_invertHighlight)
    {
      +[UIBezierPath bezierPath](UIBezierPath, "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      objc_msgSend(v4, "appendBezierPathWithRect:");
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "set");

      objc_msgSend(v4, "fill");
    }
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    innerBounds = self->_innerBounds;
    if (innerBounds)
    {
      if ((unint64_t)-[NSMutableArray count](innerBounds, "count") < 2)
      {
LABEL_24:
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v45 = self->_innerBounds;
        v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v47; ++i)
            {
              if (*(_QWORD *)v72 != v48)
                objc_enumerationMutation(v45);
              objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "rectValue");
              +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadii:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadii:", -1, self->_cornerRadii);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendBezierPath:", v50);

            }
            v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          }
          while (v47);
        }

      }
      else
      {
        v8 = self->_cornerRadii;
        -[NSArray firstObject](v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "CGSizeValue");
        v11 = v10;

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v12 = v8;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v76;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v76 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * j), "CGSizeValue");
              if (v18 != v11 || v17 != v11)
              {

                goto LABEL_24;
              }
            }
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
          }
          while (v14);
        }

        PathWithShrinkWrappedRects = (const CGPath *)WebKitCreatePathWithShrinkWrappedRects();
        +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", PathWithShrinkWrappedRects);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendBezierPath:", v21);

        CGPathRelease(PathWithShrinkWrappedRects);
      }
    }
    else
    {
      -[NSMutableArray objectEnumerator](self->_innerQuads, "objectEnumerator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "nextObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        do
        {
          objc_msgSend(v24, "CGPointValue");
          v26 = v25;
          v28 = v27;
          objc_msgSend(v22, "nextObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "CGPointValue");
          v31 = v30;
          v33 = v32;
          objc_msgSend(v22, "nextObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "CGPointValue");
          v36 = v35;
          v38 = v37;
          objc_msgSend(v22, "nextObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "CGPointValue");
          v41 = v40;
          v43 = v42;
          +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "moveToPoint:", v26, v28);
          objc_msgSend(v44, "lineToPoint:", v31, v33);
          objc_msgSend(v44, "lineToPoint:", v36, v38);
          objc_msgSend(v44, "lineToPoint:", v41, v43);
          objc_msgSend(v44, "closePath");
          objc_msgSend(v6, "appendBezierPath:", v44);

          objc_msgSend(v22, "nextObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        while (v24);
      }

    }
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v52 = 0;
    else
      v52 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v52);
    if (self->_innerQuads)
      CGContextSetLineWidth(v52, self->_cornerRadius * 4.0);
    CGContextSetLineJoin(v52, kCGLineJoinRound);
    if (self->_invertHighlight)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "set");

      CGContextSetBlendMode(v52, kCGBlendModeClear);
      v54 = *MEMORY[0x1E0C9D538];
      v55 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[UIView _screen](self, "_screen");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "bounds");
      v58 = v57;
      v60 = v59;

      -[UIView window](self, "window");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "statusBarHeight");
      v64 = v63;

      -[UIView window](self, "window");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "windowScene");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "interfaceOrientation");

      switch(v67)
      {
        case 1:
          v55 = v55 + v64;
          goto LABEL_40;
        case 2:
LABEL_40:
          v60 = v60 - v64;
          break;
        case 3:
          goto LABEL_44;
        case 4:
          v54 = v54 + v64;
LABEL_44:
          v58 = v58 - v64;
          break;
        default:
          break;
      }
      v82.origin.x = v54;
      v82.origin.y = v55;
      v82.size.width = v58;
      v82.size.height = v60;
      v83 = CGRectIntersection(v82, self->_invertedHighlightClipRect);
      CGContextClipToRect(v52, v83);
      CGContextAddPath(v52, (CGPathRef)objc_msgSend(v6, "_pathRef"));
      CGContextDrawPath(v52, kCGPathFillStroke);
    }
    else
    {
      Alpha = CGColorGetAlpha(-[UIColor CGColor](self->_color, "CGColor"));
      -[UIColor colorWithAlphaComponent:](self->_color, "colorWithAlphaComponent:", 1.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "set");

      CGContextSetAlpha(v52, Alpha);
      CGContextBeginTransparencyLayer(v52, 0);
      CGContextAddPath(v52, (CGPathRef)objc_msgSend(v6, "_pathRef"));
      CGContextDrawPath(v52, kCGPathFillStroke);
      CGContextEndTransparencyLayer(v52);
    }
    CGContextRestoreGState(v52);

  }
  else
  {
    -[UIColor set](self->_color, "set", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[UIView bounds](self, "bounds");
    +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1);
    v70 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "fill");

  }
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerQuads, 0);
  objc_storeStrong((id *)&self->_innerBounds, 0);
  objc_storeStrong((id *)&self->_cornerRadii, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
