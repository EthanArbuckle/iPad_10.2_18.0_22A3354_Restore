@implementation GraphRenderOperation

- (void)cancel
{
  self->_cancelled = 1;
}

- (void)render
{
  StockGraphImageSet *v3;
  StockGraphImageSet *graphImageSet;
  void *v5;
  BOOL v6;
  _QWORD block[5];

  v3 = objc_alloc_init(StockGraphImageSet);
  graphImageSet = self->_graphImageSet;
  self->_graphImageSet = v3;

  -[GraphRenderOperation renderLineGraph](self, "renderLineGraph");
  -[GraphRenderOperation displayMode](self, "displayMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "showsVolume"))
  {
    v6 = -[GraphRenderOperation isCancelled](self, "isCancelled");

    if (!v6)
      -[GraphRenderOperation renderVolumeGraph](self, "renderVolumeGraph");
  }
  else
  {

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__GraphRenderOperation_render__block_invoke;
  block[3] = &unk_24D74B7C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __30__GraphRenderOperation_render__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "graphRenderOperationDidFinish:", *(_QWORD *)(a1 + 32));

}

- (CGSize)lineGraphSize
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vsubq_f64(vsubq_f64((float64x2_t)vextq_s8((int8x16_t)self->_graphSize, (int8x16_t)self->_graphSize, 8uLL), *(float64x2_t *)&self->_graphInsets.top), *(float64x2_t *)&self->_graphInsets.bottom);
  v3 = v2.f64[1];
  result.height = v2.f64[0];
  result.width = v3;
  return result;
}

- (void)renderGraphLineInContext:(CGContext *)a3 withColor:(id)a4 offset:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  id v12;
  CGFloat v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  CGPoint *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a5.y;
  x = a5.x;
  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  -[GraphRenderOperation lineGraphSize](self, "lineGraphSize");
  v11 = v10;
  v12 = objc_retainAutorelease(v9);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v12, "CGColor"));
  -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
  CGContextSetLineWidth(a3, v13);
  CGContextSetLineJoin(a3, kCGLineJoinRound);
  CGContextSetLineCap(a3, (CGLineCap)self->_roundLineCaps);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = self->_linePointCounts;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v27;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v14);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v19), "intValue", (_QWORD)v26);
        CGContextBeginPath(a3);
        v21 = &self->_points[v17];
        CGContextMoveToPoint(a3, x + v21->x, y + self->_graphInsets.bottom + v21->y * v11);
        v22 = v20 + v17;
        if (v17 < v22)
        {
          v23 = v17;
          v24 = v17;
          v25 = v22 - v23;
          do
          {
            CGContextAddLineToPoint(a3, x + self->_points[v24].x, y + self->_graphInsets.bottom + self->_points[v24].y * v11);
            ++v24;
            --v25;
          }
          while (v25);
          v17 = v22;
        }
        CGContextStrokePath(a3);
        ++v19;
      }
      while (v19 != v16);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

}

- (void)renderLineGraph
{
  double v3;
  double v4;
  double width;
  double height;
  double top;
  double left;
  double bottom;
  double right;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  NSObject *v16;
  CGContext *CurrentContext;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t i;
  int v24;
  int v25;
  CGPoint *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  const CGPath *v32;
  CGGradient *v33;
  CGPoint *v34;
  CGGradient *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGContext *v40;
  id v41;
  void *v42;
  double v43;
  void *v44;
  CGContext *v45;
  void *v46;
  double v47;
  double v48;
  CGColorSpace *DeviceRGB;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  const __CFArray *v54;
  CGGradient *v55;
  id v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  id v64;
  NSArray *dottedLinePositions;
  NSArray *v66;
  double v67;
  CGPoint *points;
  NSUInteger v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  NSArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  double v80;
  double v81;
  void *v82;
  double v83;
  CGFloat v84;
  CGContext *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  CGFloat lengths[2];
  uint8_t v102[128];
  uint8_t buf[4];
  CGPoint *v104;
  __int16 v105;
  NSUInteger v106;
  __int16 v107;
  void *v108;
  uint64_t v109;
  CGSize v110;
  CGPoint v111;
  CGPoint v112;
  CGPoint v113;
  CGRect v114;
  CGRect ClipBoundingBox;

  v109 = *MEMORY[0x24BDAC8D0];
  -[GraphRenderOperation lineGraphSize](self, "lineGraphSize");
  v4 = v3;
  width = self->_graphSize.width;
  height = self->_graphSize.height;
  top = self->_graphInsets.top;
  left = self->_graphInsets.left;
  bottom = self->_graphInsets.bottom;
  right = self->_graphInsets.right;
  -[GraphRenderOperation displayMode](self, "displayMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gutterHeight");
  v13 = v12;

  if (self->_points && -[NSArray count](self->_linePointCounts, "count"))
  {
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v15 = *MEMORY[0x24BDBF148] == self->_graphSize.width && v14 == self->_graphSize.height;
    if (!v15 && !-[GraphRenderOperation isCancelled](self, "isCancelled", *MEMORY[0x24BDBF148], v14))
    {
      UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      CGContextTranslateCTM(CurrentContext, 0.0, -self->_graphSize.height);
      CGContextBeginPath(CurrentContext);
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v18 = self->_linePointCounts;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v97 != v22)
              objc_enumerationMutation(v18);
            v24 = objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "intValue");
            if (v24)
            {
              v25 = v24;
              v26 = &self->_points[v21];
              CGContextMoveToPoint(CurrentContext, v26->x, self->_graphInsets.bottom + v26->y * v4);
              v27 = v25 + v21;
              if (v21 < v27)
              {
                v28 = v21;
                v29 = v21;
                v30 = v27 - v28;
                do
                {
                  CGContextAddLineToPoint(CurrentContext, self->_points[v29].x, self->_graphInsets.bottom + self->_points[v29].y * v4);
                  ++v29;
                  --v30;
                }
                while (v30);
                v21 = v27;
              }
              CGContextAddLineToPoint(CurrentContext, self->_points[v21 - 1].x, 0.0);
              CGContextAddLineToPoint(CurrentContext, self->_points[v21 - v25].x, 0.0);
              CGContextClosePath(CurrentContext);
            }
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v96, v102, 16);
        }
        while (v20);
      }

      v31 = -[StockChartDisplayMode HUDEnabled](self->_displayMode, "HUDEnabled");
      if (v31)
        v32 = CGContextCopyPath(CurrentContext);
      else
        v32 = 0;
      CGContextClip(CurrentContext);
      CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
      v33 = -[StockChartDisplayMode backgroundGradient](self->_displayMode, "backgroundGradient");
      v34 = (CGPoint *)MEMORY[0x24BDBEFB0];
      if (v33)
      {
        v35 = -[StockChartDisplayMode backgroundGradient](self->_displayMode, "backgroundGradient");
        v112.y = self->_graphSize.height;
        v112.x = 0.0;
        CGContextDrawLinearGradient(CurrentContext, v35, *v34, v112, 0);
      }
      v36 = height - top;
      if (v31)
      {
        v37 = width - left;
        -[GraphRenderOperation displayMode](self, "displayMode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "gutterHeight");
        v91 = v39;

        v110.width = 2.5;
        v110.height = 2.5;
        UIGraphicsBeginImageContextWithOptions(v110, 0, 0.0);
        v40 = UIGraphicsGetCurrentContext();
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.258823529, 0.439215686, 1.0);
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(v40, (CGColorRef)objc_msgSend(v41, "CGColor"));

        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "scale");
        CGContextSetLineWidth(v40, 1.0 / v43);

        CGContextSetShouldAntialias(v40, 0);
        CGContextMoveToPoint(v40, 0.0, 2.5);
        CGContextAddLineToPoint(v40, 2.5, 0.0);
        CGContextStrokePath(v40);
        UIGraphicsGetImageFromCurrentImageContext();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
        v45 = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(v45, 1.0, -1.0);
        CGContextTranslateCTM(v45, 0.0, -self->_graphSize.height);
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.584313725, 1.0, 1.0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[GraphRenderOperation renderGraphLineInContext:withColor:offset:](self, "renderGraphLineInContext:withColor:offset:", v45, v46, v34->x, v34->y);

        if (v32)
        {
          CGContextAddPath(v45, v32);
          CGContextClip(v45);
          CFRelease(v32);
        }
        v47 = v37 - right;
        v48 = v36 - v13;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v50 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.258823529, 0.447058824, 0.5);
        v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v52 = objc_msgSend(v51, "CGColor");
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.57254902, 0.980392157, 0.5);
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = (const __CFArray *)objc_msgSend(v50, "arrayWithObjects:", v52, objc_msgSend(v53, "CGColor"), 0);

        v55 = CGGradientCreateWithColors(DeviceRGB, v54, 0);
        CGColorSpaceRelease(DeviceRGB);
        if (v55)
        {
          v113.y = v48 + v91;
          v111.x = 0.0;
          v113.x = 0.0;
          v111.y = v91;
          CGContextDrawLinearGradient(v45, v55, v111, v113, 0);
          CFRelease(v55);
        }
        CGContextSetBlendMode(v45, kCGBlendModePlusLighter);
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithPatternImage:", v44);
        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v45, (CGColorRef)objc_msgSend(v56, "CGColor"));

        v114.origin.x = -v48;
        v114.size.width = v47 + v48;
        v114.origin.y = v91;
        v114.size.height = v48;
        CGContextFillRect(v45, v114);
        UIGraphicsGetImageFromCurrentImageContext();
        v16 = objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();

        v34 = (CGPoint *)MEMORY[0x24BDBEFB0];
      }
      else
      {
        v16 = 0;
      }
      CGContextRestoreGState(CurrentContext);
      if (-[GraphRenderOperation isCancelled](self, "isCancelled"))
        goto LABEL_60;
      if (!-[NSArray count](self->_dottedLinePositions, "count")
        && !-[NSArray count](self->_dottedLinePositionsForStyleOnly, "count"))
      {
LABEL_55:
        v85 = CurrentContext;
        if (-[StockChartDisplayMode HUDEnabled](self->_displayMode, "HUDEnabled"))
        {
          UIGraphicsBeginImageContextWithOptions(self->_graphSize, 0, 0.0);
          v85 = UIGraphicsGetCurrentContext();
        }
        CGContextSaveGState(v85);
        CGContextScaleCTM(v85, 1.0, -1.0);
        -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
        CGContextTranslateCTM(v85, 0.0, v86 * 0.5 - self->_graphSize.height);
        -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
        self->_graphSize.height = self->_graphSize.height - v87;
        -[StockChartDisplayMode lineColor](self->_displayMode, "lineColor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[GraphRenderOperation renderGraphLineInContext:withColor:offset:](self, "renderGraphLineInContext:withColor:offset:", v85, v88, v34->x, v34->y);

        CGContextRestoreGState(v85);
        if (-[StockChartDisplayMode HUDEnabled](self->_displayMode, "HUDEnabled"))
        {
          UIGraphicsGetImageFromCurrentImageContext();
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          UIGraphicsEndImageContext();
          -[StockGraphImageSet setHighlightOverlayImage:](self->_graphImageSet, "setHighlightOverlayImage:", v16);
          ClipBoundingBox = CGContextGetClipBoundingBox(CurrentContext);
          objc_msgSend(v89, "drawInRect:", ClipBoundingBox.origin.x, ClipBoundingBox.origin.y, ClipBoundingBox.size.width, ClipBoundingBox.size.height);

        }
        UIGraphicsGetImageFromCurrentImageContext();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[StockGraphImageSet setLineGraphImage:](self->_graphImageSet, "setLineGraphImage:", v90);

LABEL_60:
        UIGraphicsEndImageContext();
        goto LABEL_11;
      }
      CGContextSaveGState(CurrentContext);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "scale");
      CGContextSetLineWidth(CurrentContext, 1.0 / v58);

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "scale");
      lengths[0] = 1.0 / v60;
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "scale");
      lengths[1] = 1.0 / v62;
      CGContextSetLineDash(CurrentContext, 0.0, lengths, 2uLL);

      -[GraphRenderOperation displayMode](self, "displayMode");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "backgroundLinesColor");
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v64, "CGColor"));

      dottedLinePositions = self->_dottedLinePositions;
      if (!dottedLinePositions)
        dottedLinePositions = self->_dottedLinePositionsForStyleOnly;
      v66 = dottedLinePositions;
      if (self->_dottedLinePositions)
      {
        v67 = v36 - bottom;
      }
      else
      {
        v71 = self->_graphSize.height;
        -[GraphRenderOperation displayMode](self, "displayMode");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "gutterHeight");
        v67 = v71 - v73;

        if (!self->_dottedLinePositions)
        {
          v74 = 0.0;
          goto LABEL_47;
        }
      }
      v74 = self->_graphInsets.top;
LABEL_47:
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v75 = v66;
      v76 = -[NSArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v77; ++j)
          {
            if (*(_QWORD *)v93 != v78)
              objc_enumerationMutation(v75);
            objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "doubleValue");
            v81 = RoundToPixel(v74 + v80 * v67);
            objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "scale");
            v84 = v81 + -1.0 / v83 * 0.5;

            CGContextBeginPath(CurrentContext);
            CGContextMoveToPoint(CurrentContext, 0.0, v84);
            CGContextAddLineToPoint(CurrentContext, width, v84);
            CGContextStrokePath(CurrentContext);
          }
          v77 = -[NSArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
        }
        while (v77);
      }

      CGContextRestoreGState(CurrentContext);
      goto LABEL_55;
    }
  }
  if (-[GraphRenderOperation isCancelled](self, "isCancelled"))
    return;
  StocksLogForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    points = self->_points;
    v69 = -[NSArray count](self->_linePointCounts, "count");
    NSStringFromCGSize(self->_graphSize);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v104 = points;
    v105 = 2048;
    v106 = v69;
    v107 = 2112;
    v108 = v70;
    _os_log_error_impl(&dword_21736B000, v16, OS_LOG_TYPE_ERROR, "Render early exit: _points = %p, _linePointCounts.count = %llu, _graphSize = %@", buf, 0x20u);

  }
LABEL_11:

}

- (void)renderVolumeGraph
{
  CGContext *CurrentContext;
  double volumeBarWidth;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  CGRect v9;

  if (self->_volumeGraphSize.width * self->_volumeGraphSize.height != 0.0
    && !-[GraphRenderOperation isCancelled](self, "isCancelled"))
  {
    UIGraphicsBeginImageContextWithOptions(self->_volumeGraphSize, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    volumeBarWidth = self->_volumeBarWidth;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.28627451, 1.0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v5, "CGColor"));

    if (self->_volumeCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v9.origin.x = RoundRectToPixel(self->_volumeBars[v6].var0 - volumeBarWidth * 0.5);
        CGContextFillRect(CurrentContext, v9);
        ++v7;
        ++v6;
      }
      while (v7 < self->_volumeCount);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockGraphImageSet setVolumeGraphImage:](self->_graphImageSet, "setVolumeGraphImage:", v8);

    UIGraphicsEndImageContext();
  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (CGPoint)points
{
  return self->_points;
}

- (void)setPoints:(CGPoint *)a3
{
  self->_points = a3;
}

- (NSArray)linePointCounts
{
  return self->_linePointCounts;
}

- (void)setLinePointCounts:(id)a3
{
  objc_storeStrong((id *)&self->_linePointCounts, a3);
}

- (NSArray)dottedLinePositions
{
  return self->_dottedLinePositions;
}

- (void)setDottedLinePositions:(id)a3
{
  objc_storeStrong((id *)&self->_dottedLinePositions, a3);
}

- (NSArray)dottedLinePositionsForStyleOnly
{
  return self->_dottedLinePositionsForStyleOnly;
}

- (void)setDottedLinePositionsForStyleOnly:(id)a3
{
  objc_storeStrong((id *)&self->_dottedLinePositionsForStyleOnly, a3);
}

- ($175F2685EF764341F5DD80B75CC65478)volumeBars
{
  return self->_volumeBars;
}

- (void)setVolumeBars:(id *)a3
{
  self->_volumeBars = a3;
}

- (double)volumeBarWidth
{
  return self->_volumeBarWidth;
}

- (void)setVolumeBarWidth:(double)a3
{
  self->_volumeBarWidth = a3;
}

- (unint64_t)maxVolume
{
  return self->_maxVolume;
}

- (void)setMaxVolume:(unint64_t)a3
{
  self->_maxVolume = a3;
}

- (unsigned)volumeCount
{
  return self->_volumeCount;
}

- (void)setVolumeCount:(unsigned int)a3
{
  self->_volumeCount = a3;
}

- (GraphRenderOperationDelegate)delegate
{
  return (GraphRenderOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)graphSize
{
  double width;
  double height;
  CGSize result;

  width = self->_graphSize.width;
  height = self->_graphSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setGraphSize:(CGSize)a3
{
  self->_graphSize = a3;
}

- (CGSize)volumeGraphSize
{
  double width;
  double height;
  CGSize result;

  width = self->_volumeGraphSize.width;
  height = self->_volumeGraphSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVolumeGraphSize:(CGSize)a3
{
  self->_volumeGraphSize = a3;
}

- (UIEdgeInsets)graphInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_graphInsets.top;
  left = self->_graphInsets.left;
  bottom = self->_graphInsets.bottom;
  right = self->_graphInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGraphInsets:(UIEdgeInsets)a3
{
  self->_graphInsets = a3;
}

- (StockGraphImageSet)graphImageSet
{
  return self->_graphImageSet;
}

- (void)setGraphImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_graphImageSet, a3);
}

- (BOOL)roundLineCaps
{
  return self->_roundLineCaps;
}

- (void)setRoundLineCaps:(BOOL)a3
{
  self->_roundLineCaps = a3;
}

- (StockChartDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
  objc_storeStrong((id *)&self->_displayMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMode, 0);
  objc_storeStrong((id *)&self->_graphImageSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dottedLinePositionsForStyleOnly, 0);
  objc_storeStrong((id *)&self->_dottedLinePositions, 0);
  objc_storeStrong((id *)&self->_linePointCounts, 0);
}

@end
