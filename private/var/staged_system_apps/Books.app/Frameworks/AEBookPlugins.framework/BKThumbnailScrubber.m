@implementation BKThumbnailScrubber

- (void)layoutSubviews
{
  void *v3;
  double MaxY;
  double v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  double v10;
  double v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[BKThumbnailScrubber _updateThumbnails](self, "_updateThumbnails");
  v12.receiver = self;
  v12.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber layoutSubviews](&v12, "layoutSubviews");
  if (-[BKThumbnailScrubber orientation](self, "orientation") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
    objc_msgSend(v3, "bounds");
    MaxY = CGRectGetMaxY(v13);
    -[BKThumbnailScrubber bounds](self, "bounds");
    v5 = CGRectGetMaxY(v14);

    if (MaxY != v5)
    {
      -[BKThumbnailScrubber center](self, "center");
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
      objc_msgSend(v8, "frame");
      Height = CGRectGetHeight(v15);

      -[BKThumbnailScrubber frame](self, "frame");
      v11 = v10;
      -[BKThumbnailScrubber frame](self, "frame");
      -[BKThumbnailScrubber setFrame:](self, "setFrame:", v11, v7 + Height * -0.5, floor(CGRectGetWidth(v16)), floor(Height));
      -[BKThumbnailScrubber setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = UILayoutFittingExpandedSize.width;
  height = UILayoutFittingExpandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber beginTrackingWithTouch:withEvent:](&v11, "beginTrackingWithTouch:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  if (v7)
  {
    objc_msgSend(v6, "locationInView:", v7);
    -[BKThumbnailScrubber valueForPoint:](self, "valueForPoint:");
    *(float *)&v8 = v8;
    v9 = *(float *)&v8;
    -[BKThumbnailScrubber setValue:](self, "setValue:", *(float *)&v8);
    -[BKThumbnailScrubber setPageNumber:](self, "setPageNumber:", -[BKThumbnailScrubber pageNumberForValue:](self, "pageNumberForValue:", v9));
  }

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  double y;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[BKThumbnailScrubber pageNumber](self, "pageNumber");
  v18.receiver = self;
  v18.super_class = (Class)BKThumbnailScrubber;
  v9 = -[BKThumbnailScrubber continueTrackingWithTouch:withEvent:](&v18, "continueTrackingWithTouch:withEvent:", v6, v7);

  y = CGPointZero.y;
  v11 = CGPointZero.x == self->_gravitationalPoint.x && y == self->_gravitationalPoint.y;
  if (!v11 && v8 != (void *)-[BKThumbnailScrubber pageNumber](self, "pageNumber", CGPointZero.x, y))
  {
    objc_msgSend(v6, "locationInView:", self);
    v13 = self->_gravitationalPoint.y;
    v14 = v13 + -10.0;
    v15 = v13 + 10.0;
    if (v12 > v14 && v12 < v15)
    {
      -[BKThumbnailScrubber setIsWithinGravitationalPointReach:](self, "setIsWithinGravitationalPointReach:", 1);
      -[BKThumbnailScrubber snapToGravitationalPoint](self, "snapToGravitationalPoint");
      if (!v9)
        goto LABEL_13;
      goto LABEL_12;
    }
    -[BKThumbnailScrubber setIsWithinGravitationalPointReach:](self, "setIsWithinGravitationalPointReach:", 0);
  }
  if (v9)
LABEL_12:
    -[BKThumbnailScrubber _bkAccessibilityValueDidChange](self, "_bkAccessibilityValueDidChange");
LABEL_13:

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber endTrackingWithTouch:withEvent:](&v5, "endTrackingWithTouch:withEvent:", a3, a4);
  -[BKThumbnailScrubber setBkAccessibilityAnnouncementString:](self, "setBkAccessibilityAnnouncementString:", 0);
}

- (double)value
{
  id v3;
  double result;
  double v5;

  v3 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  result = 0.0;
  if ((unint64_t)v3 >= 2)
  {
    v5 = (double)((unint64_t)-[BKThumbnailScrubber pageNumber](self, "pageNumber", 0.0) - 1);
    return (float)(v5 / (double)((unint64_t)-[BKThumbnailScrubber pageCount](self, "pageCount") - 1));
  }
  return result;
}

- (int64_t)pageNumber
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKThumbnailScrubber;
  return (int64_t)-[BKThumbnailScrubber pageRangeForPageNumber:](self, "pageRangeForPageNumber:", -[BKThumbnailScrubber pageNumber](&v3, "pageNumber"));
}

- (void)setPageNumber:(int64_t)a3
{
  objc_super v4;

  if (*(_QWORD *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__pageNumber] != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKThumbnailScrubber;
    -[BKThumbnailScrubber setPageNumber:](&v4, "setPageNumber:");
    -[BKThumbnailScrubber _updateThumb](self, "_updateThumb");
    -[BKThumbnailScrubber _updateCalloutPageView](self, "_updateCalloutPageView");
    if (!-[BKThumbnailScrubber hideThumbView](self, "hideThumbView"))
      -[BKThumbnailScrubber setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPageCount:(unint64_t)a3
{
  objc_super v5;

  if (-[BKThumbnailScrubber pageCount](self, "pageCount") != (id)a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKThumbnailScrubber;
    -[BKThumbnailScrubber setPageCount:](&v5, "setPageCount:", a3);
    -[BKThumbnailScrubber _updateCalloutPageView](self, "_updateCalloutPageView");
  }
}

- (id)track
{
  uint64_t v3;
  void *v4;
  BKThumbnailScrubberTrack *v5;
  BKThumbnailScrubberTrack *v6;
  void *v7;
  unsigned int v8;
  __objc2_class **v9;
  double v10;
  uint64_t v11;
  void *v12;

  v3 = OBJC_IVAR___BKScrubberControl__track;
  v4 = *(void **)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
  if (!v4)
  {
    v5 = [BKThumbnailScrubberTrack alloc];
    -[BKThumbnailScrubber bounds](self, "bounds");
    v6 = -[BKThumbnailScrubberTrack initWithFrame:](v5, "initWithFrame:");
    -[BKThumbnailScrubberTrack setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[BKThumbnailScrubber segmentSize](self, "segmentSize");
    -[BKThumbnailScrubberTrack setSegmentSize:](v6, "setSegmentSize:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber strokeColor](self, "strokeColor"));
    -[BKThumbnailScrubberTrack setSegmentStrokeColor:](v6, "setSegmentStrokeColor:", v7);

    v8 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
    v9 = &off_1BD458;
    if (!v8)
      v9 = off_1BD470;
    *(_QWORD *)&v10 = objc_opt_class(*v9).n128_u64[0];
    -[BKThumbnailScrubberTrack setCellClass:](v6, "setCellClass:", v11, v10);
    v12 = *(void **)&self->BKScrubberControl_opaque[v3];
    *(_QWORD *)&self->BKScrubberControl_opaque[v3] = v6;

    v4 = *(void **)&self->BKScrubberControl_opaque[v3];
  }
  return v4;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  objc_msgSend(v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;

  if (-[BKThumbnailScrubber orientation](self, "orientation") == 1)
  {
    v14 = CGPointZero.x;
    v13 = CGPointZero.y;
  }
  else
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v14 = round((CGRectGetWidth(v18) - v10) * 0.5);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v13 = round((CGRectGetHeight(v19) - v12) * 0.5);
  }
  v15 = v14;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (id)thumb
{
  unsigned int v3;
  __objc2_class **v4;
  Class v5;
  BKThumbnailScrubberCell *v6;
  BKThumbnailScrubberCell *imageThumb;
  void *v8;

  if (!self->_imageThumb && !-[BKThumbnailScrubber hideThumbView](self, "hideThumbView"))
  {
    v3 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
    v4 = &off_1BD458;
    if (!v3)
      v4 = off_1BD470;
    objc_opt_class(*v4);
    v6 = (BKThumbnailScrubberCell *)objc_msgSend([v5 alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    imageThumb = self->_imageThumb;
    self->_imageThumb = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber strokeColor](self, "strokeColor"));
    -[BKThumbnailScrubberCell setStrokeColor:](self->_imageThumb, "setStrokeColor:", v8);

    -[BKThumbnailScrubberCell setAlpha:](self->_imageThumb, "setAlpha:", (double)(-[BKThumbnailScrubber hideThumbView](self, "hideThumbView") ^ 1));
    -[BKThumbnailScrubber _updateThumb](self, "_updateThumb");
  }
  return self->_imageThumb;
}

- (CGRect)hitRectForThumb
{
  void *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  objc_msgSend(v2, "frame");
  v12 = CGRectInset(v11, -20.0, -20.0);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;

  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)thumbRect
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  char *v24;
  double Width;
  double v26;
  unsigned int v27;
  double MinX;
  double MinY;
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
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_inMiniBar)
    v12 = 25.0;
  else
    v12 = 33.0;
  if (self->_inMiniBar)
    v13 = 19.0;
  else
    v13 = 26.0;
  -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
  if (v14 != 0.0)
  {
    -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
    v13 = floor(v12 * v15);
    if (-[BKThumbnailScrubber showSpreads](self, "showSpreads"))
      v13 = v13 + v13;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  objc_msgSend(v16, "segmentSize");
  v18 = v17 * 0.5;
  objc_msgSend(v16, "segmentSize");
  v40 = v19 * 0.5;
  if ((unint64_t)-[BKThumbnailScrubber pageCount](self, "pageCount") >= 2)
  {
    v20 = -[BKThumbnailScrubber pageRangeForPageNumber:](self, "pageRangeForPageNumber:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"));
    v22 = v21;
    if (-[BKThumbnailScrubber orientation](self, "orientation") == 1)
    {
      -[BKThumbnailScrubber value](self, "value");
      -[BKThumbnailScrubber pointForValue:](self, "pointForValue:");
      v40 = v23;
    }
    else
    {
      v24 = (char *)-[BKThumbnailScrubber pageCount](self, "pageCount") - 1;
      if ((unint64_t)v24 <= 1)
        v24 = (_BYTE *)(&dword_0 + 1);
      v39 = (((double)v22 + -1.0) * 0.5 + (double)(unint64_t)v20 + -1.0) / (double)(unint64_t)v24;
      v41.origin.x = v5;
      v41.origin.y = v7;
      v41.size.width = v9;
      v41.size.height = v11;
      Width = CGRectGetWidth(v41);
      objc_msgSend(v16, "segmentSize");
      v18 = v18 + v39 * (Width - v26);
    }
  }
  if (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection", *(_QWORD *)&v39) == (char *)&dword_0 + 1
    && !-[BKThumbnailScrubber orientation](self, "orientation"))
  {
    v42.origin.x = v5;
    v42.origin.y = v7;
    v42.size.width = v9;
    v42.size.height = v11;
    v18 = CGRectGetWidth(v42) - v18;
  }
  v27 = -[BKThumbnailScrubber orientation](self, "orientation");
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  MinY = CGRectGetMinY(v44);
  v30 = round(v18 - v13 * 0.5);
  v31 = round((v9 - v13) * 0.5);
  v32 = v40 - v12 * 0.5;
  if (v27 == 1)
    v30 = v31;
  else
    v32 = (v11 - v12) * 0.5;
  v33 = v30 + MinX;
  v34 = round(v32) + MinY;

  v35 = v33;
  v36 = v34;
  v37 = v13;
  v38 = v12;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)setStrokeColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    objc_msgSend(*(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track], "setSegmentStrokeColor:", v5);
    -[BKThumbnailScrubberCell setStrokeColor:](self->_imageThumb, "setStrokeColor:", v5);
  }

}

- (void)setShowSpreads:(BOOL)a3
{
  id v4;
  unsigned int v5;
  __objc2_class **v6;
  double v7;
  uint64_t v8;
  void *v9;
  BKThumbnailScrubberCell *imageThumb;
  id v11;

  if (self->_showSpreads != a3)
  {
    self->_showSpreads = a3;
    v4 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    v5 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
    v6 = &off_1BD458;
    if (!v5)
      v6 = off_1BD470;
    *(_QWORD *)&v7 = objc_opt_class(*v6).n128_u64[0];
    objc_msgSend(v4, "setCellClass:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    objc_msgSend(v9, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, self->_imageThumb);

    -[BKThumbnailScrubberCell removeFromSuperview](self->_imageThumb, "removeFromSuperview");
    imageThumb = self->_imageThumb;
    self->_imageThumb = 0;

    v11 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber thumb](self, "thumb"));
    -[BKThumbnailScrubber addSubview:](self, "addSubview:", v11);

  }
}

- (void)setCellAspectRatio:(double)a3
{
  id v4;

  if (self->_cellAspectRatio != a3)
  {
    self->_cellAspectRatio = a3;
    v4 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    -[BKThumbnailScrubber segmentSize](self, "segmentSize");
    objc_msgSend(v4, "setSegmentSize:");

  }
}

- (void)setHideThumbView:(BOOL)a3
{
  BKThumbnailScrubberCell *imageThumb;

  if (self->_hideThumbView != a3)
  {
    self->_hideThumbView = a3;
    if (a3)
    {
      -[BKThumbnailScrubberCell removeFromSuperview](self->_imageThumb, "removeFromSuperview");
      imageThumb = self->_imageThumb;
      self->_imageThumb = 0;

    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v8;
  id v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKThumbnailScrubber frame](self, "frame");
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectEqualToRect(v11, v12);
  v10.receiver = self;
  v10.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber setFrame:](&v10, "setFrame:", x, y, width, height);
  if (!v8)
  {
    v9 = *(id *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track];
    -[BKThumbnailScrubber segmentSize](self, "segmentSize");
    objc_msgSend(v9, "setSegmentSize:");
    -[BKThumbnailScrubber _updateThumbnails](self, "_updateThumbnails");

  }
}

- (CGSize)segmentSize
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (*(_QWORD *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track])
    v3 = -[BKThumbnailScrubber orientation](self, "orientation");
  else
    v3 = 0;
  -[BKThumbnailScrubber bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
  -[BKThumbnailScrubber _segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:](self, "_segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:", v3, -[BKThumbnailScrubber showSpreads](self, "showSpreads"), v5, v7, v8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_segmentSizeForMaxScrubberSize:(CGSize)result orientation:(int)a4 cellAspectRatio:(double)a5 spread:(BOOL)a6
{
  double width;
  double v7;
  double v8;

  if (a4 == 1)
  {
    width = result.width * 0.5;
    if (!a6)
      width = result.width;
    v7 = floor(width / a5);
    if (a5 > 0.0)
      result.height = v7;
  }
  else
  {
    result.height = 22.0;
    if (self->_inMiniBar)
      result.height = 16.0;
    result.width = 14.0;
    if (!self->_inMiniBar)
      result.width = 18.0;
    v8 = floor(result.height * a5);
    if (a5 > 0.0)
      result.width = v8;
    if (a6)
      result.width = result.width + result.width;
  }
  return result;
}

- (unint64_t)idealCellCount
{
  unsigned int v3;
  float v4;
  float v5;

  v3 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
  v4 = (float)(unint64_t)-[BKThumbnailScrubber pageCount](self, "pageCount");
  v5 = ceilf((float)(v4 + 1.0) * 0.5);
  if (v3)
    return (unint64_t)v5;
  return (unint64_t)v4;
}

- (_NSRange)_pageRangeForPageNumber:(int64_t)a3 pageCount:(unint64_t)a4 spread:(BOOL)a5
{
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  _NSRange result;

  v5 = a3;
  if (a5)
  {
    if (a3 >= 2 && a3 < a4)
    {
      if ((a3 & 0x8000000000000001) == 1)
        v6 = -1;
      else
        v6 = 0;
      goto LABEL_11;
    }
    v7 = 1;
    if (a3 == a4 && (a3 & 0x8000000000000001) == 1)
    {
      v6 = -1;
LABEL_11:
      v5 = v6 + a3;
      v7 = 2;
    }
  }
  else
  {
    v7 = 1;
  }
  result.length = v7;
  result.location = v5;
  return result;
}

- (_NSRange)pageRangeForPageNumber:(int64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[BKThumbnailScrubber _pageRangeForPageNumber:pageCount:spread:](self, "_pageRangeForPageNumber:pageCount:spread:", a3, -[BKThumbnailScrubber pageCount](self, "pageCount"), -[BKThumbnailScrubber showSpreads](self, "showSpreads"));
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (_NSRange)_pageRangeAtIndex:(unint64_t)a3 segmentCount:(unint64_t)a4 pageCount:(unint64_t)a5 orientation:(int)a6 layoutDirection:(int64_t)a7 spread:(BOOL)a8
{
  float v8;
  unint64_t v10;
  id v11;
  NSUInteger v12;
  _NSRange result;

  if (a4 < 2)
  {
    v11 = &dword_0 + 1;
    v12 = 1;
  }
  else
  {
    v8 = roundf((float)((float)((float)a5 + -1.0) / (float)(a4 - 1)) * (float)a3) + 1.0;
    if (a7 == 1 && a6 == 0)
      v10 = a5 - (unint64_t)v8 + 1;
    else
      v10 = (unint64_t)v8;
    v11 = -[BKThumbnailScrubber _pageRangeForPageNumber:pageCount:spread:](self, "_pageRangeForPageNumber:pageCount:spread:", v10, a5, a8, *(_QWORD *)&a6);
  }
  result.length = v12;
  result.location = (NSUInteger)v11;
  return result;
}

- (_NSRange)pageRangeAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  v6 = -[BKThumbnailScrubber _pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:](self, "_pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:", a3, objc_msgSend(v5, "segmentCount"), -[BKThumbnailScrubber pageCount](self, "pageCount"), -[BKThumbnailScrubber orientation](self, "orientation"), -[BKThumbnailScrubber layoutDirection](self, "layoutDirection"), -[BKThumbnailScrubber showSpreads](self, "showSpreads"));
  v8 = v7;

  v9 = (NSUInteger)v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)segmentIndexForPage:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  char *v8;
  int64_t v9;
  unint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  v6 = objc_msgSend(v5, "segmentCount");
  v7 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  v8 = (char *)-[BKThumbnailScrubber layoutDirection](self, "layoutDirection");
  v9 = a3 - 1;
  if (a3 == 1 || !v7)
  {
    if (v8 == (_BYTE *)&dword_0 + 1)
    {
      if (-[BKThumbnailScrubber orientation](self, "orientation"))
        v10 = 0;
      else
        v10 = (unint64_t)v6 - 1;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (v8 == (_BYTE *)&dword_0 + 1 && !-[BKThumbnailScrubber orientation](self, "orientation"))
      v9 = (int64_t)v7 - a3;
    v10 = llround((double)v9 / (double)((unint64_t)v7 - 1) * (double)((unint64_t)v6 - 1));
  }

  return v10;
}

- (void)configureCell:(id)a3 pageRange:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  char *location;
  BKThumbnailScrubberCell *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  id v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  length = a4.length;
  location = (char *)a4.location;
  v28 = a3;
  v9 = (BKThumbnailScrubberCell *)a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  v11 = v10;
  if (self->_imageThumb == v9)
  {
    -[BKThumbnailScrubberCell bounds](v9, "bounds");
    v13 = v16;
    v15 = v17;
  }
  else
  {
    objc_msgSend(v10, "segmentSize");
    v13 = v12;
    v15 = v14;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  if (-[BKThumbnailScrubber showSpreads](self, "showSpreads"))
  {
    v19 = v13 * 0.5;
    v20 = v28;
    if (length == 2)
    {
      v21 = (char *)objc_msgSend(v18, "pageNumberFromRange:", location, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thumbnailScrubber:thumbnailForPage:size:context:", self, v21, v9, v19, v15));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thumbnailScrubber:thumbnailForPage:size:context:", self, v21 + 1, v9, v19, v15));
      if (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
      {
        objc_msgSend(v20, "setRightImage:", v22);
        objc_msgSend(v20, "setLeftImage:", v23);
      }
      else
      {
        objc_msgSend(v20, "setLeftImage:", v22);
        objc_msgSend(v20, "setRightImage:", v23);
      }
      objc_msgSend(v20, "setShouldHaveRightImage:", 1);
      objc_msgSend(v20, "setShouldHaveLeftImage:", 1);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thumbnailScrubber:thumbnailForPage:size:context:", self, location, v9, v19, v15));
      if (location == (_BYTE *)&dword_0 + 1 && !-[BKThumbnailScrubber layoutDirection](self, "layoutDirection")
        || location == -[BKThumbnailScrubber pageCount](self, "pageCount")
        && -[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
      {
        v24 = 0;
        v25 = 0;
        v26 = 1;
        v27 = v22;
      }
      else
      {
        v27 = 0;
        v26 = 0;
        v25 = 1;
        v24 = v22;
      }
      objc_msgSend(v20, "setLeftImage:", v24);
      objc_msgSend(v20, "setRightImage:", v27);
      objc_msgSend(v20, "setShouldHaveLeftImage:", v25);
      objc_msgSend(v20, "setShouldHaveRightImage:", v26);
    }

  }
  else
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thumbnailScrubber:thumbnailForPage:size:context:", self, location, v9, v13, v15));
    objc_msgSend(v28, "setImage:", v20);
  }

}

- (void)prewarmThumbnailsForScrubberSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  id v13;
  id v14;
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t i;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  height = a3.height;
  width = a3.width;
  v6 = -[BKThumbnailScrubber orientation](self, "orientation");
  -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
  -[BKThumbnailScrubber _segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:](self, "_segmentSizeForMaxScrubberSize:orientation:cellAspectRatio:spread:", v6, -[BKThumbnailScrubber showSpreads](self, "showSpreads"), width, height, v7);
  v9 = v8;
  v11 = v10;
  v12 = -[BKThumbnailScrubber _computeSegmentCountForRect:segmentSize:idealCount:orientation:](self, "_computeSegmentCountForRect:segmentSize:idealCount:orientation:", -[BKThumbnailScrubber idealCellCount](self, "idealCellCount"), -[BKThumbnailScrubber orientation](self, "orientation"), width, height, v8, v10);
  v26 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  v13 = -[BKThumbnailScrubber orientation](self, "orientation");
  v14 = -[BKThumbnailScrubber layoutDirection](self, "layoutDirection");
  v15 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
  if (v12)
  {
    v16 = v15;
    for (i = 0; i != v12; ++i)
    {
      v18 = (char *)-[BKThumbnailScrubber _pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:](self, "_pageRangeAtIndex:segmentCount:pageCount:orientation:layoutDirection:spread:", i, v12, v26, v13, v14, v16);
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
      v22 = OBJC_IVAR___BKScrubberControl__track;
      v23 = objc_msgSend(v21, "thumbnailScrubber:thumbnailForPage:size:context:", self, v18, *(_QWORD *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track], v9, v11);

      if (v20 >= 2)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
        v25 = objc_msgSend(v24, "thumbnailScrubber:thumbnailForPage:size:context:", self, v18 + 1, *(_QWORD *)&self->BKScrubberControl_opaque[v22], v9, v11);

      }
    }
  }
}

- (void)cancelPendingRenderRequests
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  objc_msgSend(v3, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, self->_imageThumb);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  objc_msgSend(v4, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, *(_QWORD *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track]);

}

- (void)setThumbnail:(id)a3 forPage:(int64_t)a4 context:(id)a5
{
  BKThumbnailScrubberCell *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  BKThumbnailScrubberCell *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  BKThumbnailScrubberCell *v26;
  void *v27;
  id v28;
  BKThumbnailScrubberCell *v29;
  BKThumbnailScrubberCell *v30;
  void *v31;
  id v32;
  id v33;

  v33 = a3;
  v8 = (BKThumbnailScrubberCell *)a5;
  if (v33 && a4 && a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_imageThumb == v8)
    {
      v17 = -[BKThumbnailScrubber pageRangeForPageNumber:](self, "pageRangeForPageNumber:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"));
      if (a4 >= (unint64_t)v17 && a4 - (uint64_t)v17 < v18)
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", self->_imageThumb, v17, v18, self->_imageThumb);
    }
    else
    {
      v9 = OBJC_IVAR___BKScrubberControl__track;
      if (*(BKThumbnailScrubberCell **)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track] == v8)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
        v19 = -[BKThumbnailScrubber segmentIndexForPage:](self, "segmentIndexForPage:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellAtIndex:", v19));
        v21 = -[BKThumbnailScrubber pageRangeAtIndex:](self, "pageRangeAtIndex:", v19);
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", v20, v21, v22, *(_QWORD *)&self->BKScrubberControl_opaque[v9]);

        goto LABEL_25;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pageView"));
      objc_opt_class(BKSpreadThumbnailView);
      isKindOfClass = objc_opt_isKindOfClass(v11, v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pageView"));
      if ((isKindOfClass & 1) != 0)
      {

        v16 = (BKThumbnailScrubberCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftPageView"));
        if (v16 == v8)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftPageView"));
          v28 = objc_msgSend(v27, "pageNumber");

          if (v28 == (id)a4)
          {
            v29 = (BKThumbnailScrubberCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftPageView"));
LABEL_23:
            v30 = v29;
            -[BKThumbnailScrubberCell setImage:](v29, "setImage:", v33);
            goto LABEL_24;
          }
        }
        else
        {

        }
        v30 = (BKThumbnailScrubberCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rightPageView"));
        if (v30 != v8)
        {
LABEL_24:

          goto LABEL_25;
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rightPageView"));
        v32 = objc_msgSend(v31, "pageNumber");

        if (v32 == (id)a4)
        {
          v29 = (BKThumbnailScrubberCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rightPageView"));
          goto LABEL_23;
        }
LABEL_25:

        goto LABEL_26;
      }
      objc_opt_class(BKPageThumbnailView);
      v24 = objc_opt_isKindOfClass(v15, v23);

      if ((v24 & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
        v26 = (BKThumbnailScrubberCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pageView"));

        if (v26 == v8 && -[BKThumbnailScrubberCell pageNumber](v8, "pageNumber") == (id)a4)
          -[BKThumbnailScrubberCell setImage:](v8, "setImage:", v33);

      }
    }
  }
LABEL_26:

}

- (unint64_t)_computeSegmentCountForRect:(CGSize)a3 segmentSize:(CGSize)a4 idealCount:(unint64_t)a5 orientation:(int)a6
{
  double v6;
  unint64_t v7;

  if (!a6)
  {
    v6 = a3.width / (a4.width + 2.0);
    goto LABEL_5;
  }
  if (a4.height > 0.0)
  {
    v6 = a3.height / a4.height;
LABEL_5:
    v7 = (uint64_t)v6;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  if (v7 >= a5)
    return a5;
  else
    return v7;
}

- (void)_updateThumbnails
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;

  if (-[BKThumbnailScrubber pageCount](self, "pageCount") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    objc_msgSend(v3, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, v29);

    objc_msgSend(v29, "segmentSize");
    v5 = v4;
    v7 = v6;
    -[BKThumbnailScrubber bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[BKThumbnailScrubber orientation](self, "orientation");
    v17 = v9;
    v18 = v11;
    v19 = v13;
    v20 = v15;
    if (v16)
      v21 = CGRectGetHeight(*(CGRect *)&v17) / v7;
    else
      v21 = CGRectGetWidth(*(CGRect *)&v17) / (v5 + 2.0);
    v22 = (uint64_t)v21;
    v23 = -[BKThumbnailScrubber idealCellCount](self, "idealCellCount");
    if (v23 < v22)
      v22 = v23;
    objc_msgSend(v29, "setSegmentCount:", v22);
    objc_msgSend(v29, "sizeToFit");
    objc_msgSend(v29, "layoutIfNeeded");
    if (v22 >= 1)
    {
      for (i = 0; i != v22; ++i)
      {
        v25 = i;
        if (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
        {
          if (-[BKThumbnailScrubber orientation](self, "orientation"))
            v25 = i;
          else
            v25 = v22 + ~i;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cellAtIndex:", v25));
        v27 = -[BKThumbnailScrubber pageRangeAtIndex:](self, "pageRangeAtIndex:", v25);
        -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", v26, v27, v28, *(_QWORD *)&self->BKScrubberControl_opaque[OBJC_IVAR___BKScrubberControl__track]);

      }
    }

  }
}

- (void)_updateThumb
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  objc_msgSend(v3, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, self->_imageThumb);

  if (!-[BKThumbnailScrubber hideThumbView](self, "hideThumbView"))
  {
    v4 = -[BKThumbnailScrubber pageRangeForPageNumber:](self, "pageRangeForPageNumber:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"));
    -[BKThumbnailScrubber configureCell:pageRange:context:](self, "configureCell:pageRange:context:", self->_imageThumb, v4, v5, self->_imageThumb);
  }
}

- (void)setIsWithinGravitationalPointReach:(BOOL)a3
{
  id v3;

  if (self->_isWithinGravitationalPointReach != a3)
  {
    self->_isWithinGravitationalPointReach = a3;
    if (a3)
    {
      v3 = objc_msgSend(objc_alloc((Class)UIImpactFeedbackGenerator), "initWithStyle:", 0);
      objc_msgSend(v3, "impactOccurred");

    }
  }
}

- (void)snapToGravitationalPoint
{
  double v3;
  double v4;

  -[BKThumbnailScrubber valueForPoint:](self, "valueForPoint:", self->_gravitationalPoint.x, self->_gravitationalPoint.y);
  v4 = v3;
  -[BKThumbnailScrubber setValue:](self, "setValue:");
  -[BKThumbnailScrubber setPageNumber:](self, "setPageNumber:", -[BKThumbnailScrubber pageNumberForValue:](self, "pageNumberForValue:", v4));
}

- (void)setCallout:(id)a3
{
  BKScrubberCalloutView *v5;
  BKScrubberCalloutView **p_callout;
  BKScrubberCalloutView *v7;

  v5 = (BKScrubberCalloutView *)a3;
  p_callout = &self->_callout;
  if (*p_callout != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_callout, a3);
    -[BKScrubberCalloutView setUsesMonospacedDigitFontForSubtitle:](*p_callout, "setUsesMonospacedDigitFontForSubtitle:", 1);
    v5 = v7;
  }

}

- (CGSize)calloutImageSize
{
  void *v3;
  void *v4;
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
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
    -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
    objc_msgSend(v4, "thumbnailSizeForAspectRatio:showSpreads:", -[BKThumbnailScrubber showSpreads](self, "showSpreads"), v5);
    v7 = v6;
    v9 = v8;

    v10 = v7;
    v11 = v9;
  }
  else
  {
    if (-[BKThumbnailScrubber im_isCompactWidth](self, "im_isCompactWidth"))
      v12 = 75.0;
    else
      v12 = 184.0;
    -[BKThumbnailScrubber cellAspectRatio](self, "cellAspectRatio");
    v14 = v12 / v13;
    v10 = ceil(v12);
    v11 = ceil(v14);
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)leftCalloutPageNumber
{
  int64_t v3;
  int64_t v4;
  id v5;

  v3 = -[BKThumbnailScrubber pageNumber](self, "pageNumber");
  v4 = v3 & 0xFFFFFFFFFFFFFFFELL | (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") != 0);
  v5 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  if (v4 < 1 || v4 > (unint64_t)v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v4;
}

- (int64_t)rightCalloutPageNumber
{
  int64_t v3;
  int64_t v4;
  id v5;

  v3 = -[BKThumbnailScrubber pageNumber](self, "pageNumber");
  v4 = v3 & 0xFFFFFFFFFFFFFFFELL | (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == 0);
  v5 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  if (v4 < 1 || v4 > (unint64_t)v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v4;
}

- (void)_updateCalloutPageView
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  BKSpreadThumbnailView *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  int64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  __CFString *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  __CFString *v101;
  id v102;
  void *v103;
  void *v104;
  __CFString *v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  __CFString *v119;
  int64_t v120;
  void *v121;
  void *v122;
  id v123;

  v123 = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "pageView"));
  v4 = -[BKThumbnailScrubber showSpreads](self, "showSpreads");
  -[BKThumbnailScrubber calloutImageSize](self, "calloutImageSize");
  v6 = v5;
  v8 = v7;
  if (v4)
  {
    objc_opt_class(BKSpreadThumbnailView);
    v121 = v3;
    if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0)
    {
      v10 = v3;
      -[BKSpreadThumbnailView setFrame:](v10, "setFrame:", 0.0, 0.0, v6 + v6, v8);
    }
    else
    {
      v10 = -[BKSpreadThumbnailView initWithFrame:]([BKSpreadThumbnailView alloc], "initWithFrame:", 0.0, 0.0, v6 + v6, v8);
      objc_msgSend(v123, "setPageView:", v10);
    }
    -[BKSpreadThumbnailView setPageSize:](v10, "setPageSize:", v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    objc_msgSend(v12, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    objc_msgSend(v14, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, v15);

    v16 = -[BKThumbnailScrubber leftCalloutPageNumber](self, "leftCalloutPageNumber");
    v17 = -[BKThumbnailScrubber rightCalloutPageNumber](self, "rightCalloutPageNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "thumbnailScrubber:pageTitleForPageNumber:", self, v16));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "thumbnailScrubber:pageTitleForPageNumber:", self, v17));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    objc_msgSend(v22, "setPageNumber:", v16);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    v24 = v19;
    objc_msgSend(v23, "setPageTitle:", v19);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "thumbnailScrubber:thumbnailForPage:size:context:", self, v16, v26, v6, v8));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    objc_msgSend(v28, "setImage:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView leftPageView](v10, "leftPageView"));
    objc_msgSend(v29, "setShowsPageNumber:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    objc_msgSend(v30, "setPageNumber:", v17);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    objc_msgSend(v31, "setPageTitle:", v21);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    v120 = v17;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "thumbnailScrubber:thumbnailForPage:size:context:", self, v17, v33, v6, v8));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    objc_msgSend(v35, "setImage:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKSpreadThumbnailView rightPageView](v10, "rightPageView"));
    objc_msgSend(v36, "setShowsPageNumber:", 0);

    v37 = (__CFString *)v21;
    v122 = (void *)v24;
    if (v24 | v21)
    {
      if (objc_msgSend((id)v24, "length") && objc_msgSend((id)v21, "length"))
      {
        if (v16 > v17)
        {
          v38 = (__CFString *)v24;
        }
        else
        {
          v21 = v24;
          v38 = v37;
        }
        v39 = v37;
        v40 = v38;
        v41 = (id)v21;
        v42 = objc_alloc((Class)NSString);
        v43 = AEBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Pages %@-%@"), &stru_1C3088, 0));
        v46 = v40;
        v47 = (__CFString *)objc_msgSend(v42, "initWithFormat:", v45, v41, v40);

        v48 = objc_alloc((Class)NSString);
        v49 = AEBundle();
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("%@-%@"), &stru_1C3088, 0));
        v52 = v48;
        v37 = v39;
        v53 = (__CFString *)objc_msgSend(v52, "initWithFormat:", v51, v41, v46);

      }
      else
      {
        if (!objc_msgSend((id)v24, "length"))
        {
          v3 = v121;
          if (objc_msgSend((id)v21, "length"))
          {
            v114 = objc_alloc((Class)NSString);
            v115 = AEBundle();
            v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
            v118 = v114;
            v37 = (__CFString *)v21;
            v47 = (__CFString *)objc_msgSend(v118, "initWithFormat:", v117, v21);

            v53 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v21);
            v80 = 0;
            v76 = 0;
          }
          else
          {
            v80 = 0;
            v76 = 0;
            v53 = &stru_1C3088;
            v47 = &stru_1C3088;
          }
          v113 = v123;
          goto LABEL_35;
        }
        v81 = objc_alloc((Class)NSString);
        v82 = AEBundle();
        v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v85 = v81;
        v37 = (__CFString *)v21;
        v47 = (__CFString *)objc_msgSend(v85, "initWithFormat:", v84, v24);

        v53 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v24);
      }
    }
    else
    {
      v63 = v16;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && v120 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v119 = (__CFString *)v21;
        v64 = objc_alloc((Class)NSString);
        v65 = AEBundle();
        v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v16, 0));
        v47 = (__CFString *)objc_msgSend(v64, "initWithFormat:", v67, v68);

        v69 = objc_alloc((Class)NSString);
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v16, 0));
        v53 = (__CFString *)objc_msgSend(v69, "initWithFormat:", CFSTR("%@"), v70);

        v71 = objc_alloc((Class)NSString);
        v72 = AEBundle();
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v120, 0));
        v76 = objc_msgSend(v71, "initWithFormat:", v74, v75);

        v77 = objc_alloc((Class)NSString);
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v120, 0));
        v79 = v77;
        v37 = v119;
        v80 = objc_msgSend(v79, "initWithFormat:", CFSTR("%@"), v78);

LABEL_34:
        v113 = v123;
        v3 = v121;
LABEL_35:
        objc_msgSend(v113, "setLeftPageText:shortenString:", v47, v53);
        objc_msgSend(v123, "setRightPageText:shortenString:", v76, v80);
        -[BKSpreadThumbnailView setHidesSpine:](v10, "setHidesSpine:", -[BKThumbnailScrubber hidesSpine](self, "hidesSpine"));
        -[BKSpreadThumbnailView setNeedsLayout](v10, "setNeedsLayout");

        v56 = v122;
        goto LABEL_36;
      }
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v120 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v53 = 0;
          v80 = 0;
          v76 = 0;
          v47 = 0;
          goto LABEL_34;
        }
        v105 = (__CFString *)v21;
        v106 = objc_alloc((Class)NSString);
        v107 = AEBundle();
        v108 = (void *)objc_claimAutoreleasedReturnValue(v107);
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v120, 0));
        v47 = (__CFString *)objc_msgSend(v106, "initWithFormat:", v109, v110);

        v111 = objc_alloc((Class)NSString);
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v120, 0));
        v112 = v111;
        v37 = v105;
        v95 = (__CFString *)objc_msgSend(v112, "initWithFormat:", CFSTR("%@"), v93);
      }
      else
      {
        v86 = (__CFString *)v21;
        v87 = objc_alloc((Class)NSString);
        v88 = AEBundle();
        v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v16, 0));
        v47 = (__CFString *)objc_msgSend(v87, "initWithFormat:", v90, v91);

        v92 = objc_alloc((Class)NSString);
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", v63, 0));
        v94 = v92;
        v37 = v86;
        v95 = (__CFString *)objc_msgSend(v94, "initWithFormat:", CFSTR("%@"), v93);
      }
      v53 = v95;

    }
    v80 = 0;
    v76 = 0;
    goto LABEL_34;
  }
  objc_opt_class(BKPageThumbnailView);
  if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
  {
    v10 = v3;
    -[BKSpreadThumbnailView setFrame:](v10, "setFrame:", 0.0, 0.0, v6, v8);
  }
  else
  {
    v10 = -[BKPageThumbnailView initWithFrame:]([BKPageThumbnailView alloc], "initWithFrame:", 0.0, 0.0, v6, v8);
    objc_msgSend(v123, "setPageView:", v10);
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  objc_msgSend(v54, "thumbnailScrubber:cancelPreviousRenderRequestsWithContext:", self, v10);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "thumbnailScrubber:pageTitleForPageNumber:", self, -[BKThumbnailScrubber pageNumber](self, "pageNumber")));

  -[BKSpreadThumbnailView setPageNumber:](v10, "setPageNumber:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"));
  -[BKSpreadThumbnailView setPageTitle:](v10, "setPageTitle:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber delegate](self, "delegate"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "thumbnailScrubber:thumbnailForPage:size:context:", self, -[BKThumbnailScrubber pageNumber](self, "pageNumber"), v10, v6, v8));
  -[BKSpreadThumbnailView setImage:](v10, "setImage:", v58);

  if (v56)
  {
    if (objc_msgSend(v56, "length"))
    {
      v59 = objc_alloc((Class)NSString);
      v60 = AEBundle();
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
      v37 = (__CFString *)objc_msgSend(v59, "initWithFormat:", v62, v56);

      v47 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v56);
    }
    else
    {
      v37 = &stru_1C3088;
      v47 = &stru_1C3088;
    }
  }
  else if (-[BKThumbnailScrubber pageNumber](self, "pageNumber") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = 0;
    v47 = 0;
  }
  else
  {
    v96 = objc_alloc((Class)NSString);
    v97 = AEBundle();
    v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_1C3088, 0));
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"), 0));
    v101 = (__CFString *)objc_msgSend(v96, "initWithFormat:", v99, v100);

    v102 = objc_alloc((Class)NSString);
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", -[BKThumbnailScrubber pageNumber](self, "pageNumber"), 0));
    v104 = v102;
    v37 = v101;
    v47 = (__CFString *)objc_msgSend(v104, "initWithFormat:", CFSTR("%@"), v103);

  }
  objc_msgSend(v123, "setLeftPageText:shortenString:", v37, v47);
  -[BKSpreadThumbnailView setNeedsLayout](v10, "setNeedsLayout");
LABEL_36:

}

- (double)valueForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  char *v10;
  double v11;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  if (-[BKThumbnailScrubber orientation](self, "orientation"))
  {
    if (-[BKThumbnailScrubber orientation](self, "orientation") == 1)
    {
      objc_msgSend(v6, "frame");
      v7 = y / CGRectGetHeight(v13);
    }
    else
    {
      v7 = NAN;
    }
  }
  else
  {
    objc_msgSend(v6, "frame");
    v8 = x / CGRectGetWidth(v14);
    if (v8 > 1.0)
      v8 = 1.0;
    v9 = fmax(v8, 0.0);
    v10 = (char *)-[BKThumbnailScrubber layoutDirection](self, "layoutDirection");
    v7 = 1.0 - v9;
    if (v10 != (_BYTE *)&dword_0 + 1)
      v7 = v9;
  }
  if (v7 > 1.0)
    v7 = 1.0;
  v11 = fmax(v7, 0.0);

  return v11;
}

- (CGPoint)pointForValue:(double)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  objc_msgSend(v4, "frame");
  v5 = CGRectGetWidth(v10) * a3;
  objc_msgSend(v4, "frame");
  v6 = CGRectGetHeight(v11) * a3;

  v7 = v5;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (int64_t)pageNumberForValue:(double)a3
{
  id v5;
  double v6;

  v5 = -[BKThumbnailScrubber pageCount](self, "pageCount");
  v6 = a3 * (double)(unint64_t)-[BKThumbnailScrubber pageCount](self, "pageCount") + 1.0;
  if (v6 > (double)(unint64_t)v5)
    v6 = (double)(unint64_t)v5;
  return (uint64_t)fmax(v6, 1.0);
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber track](self, "track"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellAtIndex:", (char *)-[BKThumbnailScrubber pageNumber](self, "pageNumber") - 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  objc_msgSend(v4, "center");
  objc_msgSend(v5, "convertPoint:toView:", 0);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (void)_bkAccessibilityValueDidChange
{
  -[BKThumbnailScrubber _bkAccessibilityAnnounceValue](self, "_bkAccessibilityAnnounceValue");
}

- (void)_bkAccessibilityAnnounceValue
{
  void *v3;
  unsigned __int8 v4;
  id argument;

  argument = (id)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber accessibilityValue](self, "accessibilityValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber bkAccessibilityAnnouncementString](self, "bkAccessibilityAnnouncementString"));
  v4 = objc_msgSend(argument, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
  {
    -[BKThumbnailScrubber setBkAccessibilityAnnouncementString:](self, "setBkAccessibilityAnnouncementString:", argument);
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, argument);
  }

}

- (void)accessibilityIncrement
{
  char **v3;
  BKThumbnailScrubber **v4;
  void *v5;
  BKThumbnailScrubber *v6;
  BKThumbnailScrubber *v7;

  if (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
  {
    v7 = self;
    v3 = &selRef_accessibilityDecrement;
    v4 = &v7;
  }
  else
  {
    v6 = self;
    v3 = &selRef_accessibilityIncrement;
    v4 = &v6;
  }
  v4[1] = (BKThumbnailScrubber *)BKThumbnailScrubber;
  objc_msgSendSuper2((objc_super *)v4, *v3, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
  objc_msgSend(v5, "setAlpha:", 0.0);

}

- (void)accessibilityDecrement
{
  char **v3;
  BKThumbnailScrubber **v4;
  void *v5;
  BKThumbnailScrubber *v6;
  BKThumbnailScrubber *v7;

  if (-[BKThumbnailScrubber layoutDirection](self, "layoutDirection") == (char *)&dword_0 + 1)
  {
    v7 = self;
    v3 = &selRef_accessibilityIncrement;
    v4 = &v7;
  }
  else
  {
    v6 = self;
    v3 = &selRef_accessibilityDecrement;
    v4 = &v6;
  }
  v4[1] = (BKThumbnailScrubber *)BKThumbnailScrubber;
  objc_msgSendSuper2((objc_super *)v4, *v3, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
  objc_msgSend(v5, "setAlpha:", 0.0);

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKThumbnailScrubber;
  -[BKThumbnailScrubber accessibilityElementDidLoseFocus](&v4, "accessibilityElementDidLoseFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubber callout](self, "callout"));
  objc_msgSend(v3, "setAlpha:", 0.0);

}

- (BKScrubberCalloutView)callout
{
  return self->_callout;
}

- (BKThumbnailScrubberDelegate)delegate
{
  return (BKThumbnailScrubberDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (BOOL)showSpreads
{
  return self->_showSpreads;
}

- (double)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (BOOL)hideThumbView
{
  return self->_hideThumbView;
}

- (BOOL)hidesSpine
{
  return self->_hidesSpine;
}

- (void)setHidesSpine:(BOOL)a3
{
  self->_hidesSpine = a3;
}

- (CGPoint)gravitationalPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_gravitationalPoint.x;
  y = self->_gravitationalPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGravitationalPoint:(CGPoint)a3
{
  self->_gravitationalPoint = a3;
}

- (NSString)bkAccessibilityAnnouncementString
{
  return self->_bkAccessibilityAnnouncementString;
}

- (void)setBkAccessibilityAnnouncementString:(id)a3
{
  objc_storeStrong((id *)&self->_bkAccessibilityAnnouncementString, a3);
}

- (BOOL)isWithinGravitationalPointReach
{
  return self->_isWithinGravitationalPointReach;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bkAccessibilityAnnouncementString, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_callout, 0);
  objc_storeStrong((id *)&self->_imageThumb, 0);
}

@end
