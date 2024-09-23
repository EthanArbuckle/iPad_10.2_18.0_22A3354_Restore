@implementation BKThumbnailScrubberTrack

- (BKThumbnailScrubberTrack)initWithFrame:(CGRect)a3
{
  BKThumbnailScrubberTrack *v3;
  double v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKThumbnailScrubberTrack;
  v3 = -[BKThumbnailScrubberTrack initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    *(_QWORD *)&v4 = objc_opt_class(BKThumbnailScrubberCell).n128_u64[0];
    -[BKThumbnailScrubberTrack setCellClass:](v3, "setCellClass:", v5, v4);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  if (-[BKThumbnailScrubberTrack trackOrientation](self, "trackOrientation", a3.width, a3.height))
  {
    v5 = (double)-[BKThumbnailScrubberTrack segmentCount](self, "segmentCount");
    -[BKThumbnailScrubberTrack segmentSize](self, "segmentSize");
    v7 = v6 * v5;
  }
  else
  {
    v8 = (double)-[BKThumbnailScrubberTrack segmentCount](self, "segmentCount");
    -[BKThumbnailScrubberTrack segmentSize](self, "segmentSize");
    width = v8 * (v9 + 2.0) + -2.0;
    -[BKThumbnailScrubberTrack segmentSize](self, "segmentSize");
  }
  v10 = width;
  result.height = v7;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKThumbnailScrubberTrack;
  -[BKThumbnailScrubberTrack layoutSubviews](&v10, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v5));

      -[BKThumbnailScrubberTrack frameForSegmentAtIndex:](self, "frameForSegmentAtIndex:", v5);
      objc_msgSend(v7, "setFrame:");

      ++v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
      v9 = objc_msgSend(v8, "count");

    }
    while (v5 < (unint64_t)v9);
  }
}

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[BKThumbnailScrubberTrack bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[BKThumbnailScrubberTrack segmentSize](self, "segmentSize");
  v14 = v13;
  v16 = v15;
  v27.origin.x = v6;
  v27.origin.y = v8;
  v27.size.width = v10;
  v27.size.height = v12;
  Width = CGRectGetWidth(v27);
  v18 = -[BKThumbnailScrubberTrack segmentCount](self, "segmentCount");
  v19 = 0.0;
  if (-[BKThumbnailScrubberTrack trackOrientation](self, "trackOrientation") != 1)
  {
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    v19 = round((CGRectGetHeight(v28) - v16) * 0.5);
  }
  v20 = round((Width - (double)v18 * (v14 + 2.0)) * 0.5);
  if (v20 >= 0.0)
    v21 = v20;
  else
    v21 = 0.0;
  v22 = -[BKThumbnailScrubberTrack trackOrientation](self, "trackOrientation");
  v23 = v19 + (double)a3 * v16;
  v24 = v21 + (double)a3 * (v14 + 2.0);
  if (v22 == 1)
    v24 = v21;
  else
    v23 = v19;
  v25 = v14;
  v26 = v16;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (id)cellAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  }
  return v8;
}

- (void)deleteAllCells
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "removeFromSuperview");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setCellClass:(Class)a3
{
  if (self->_cellClass != a3)
  {
    self->_cellClass = a3;
    -[BKThumbnailScrubberTrack deleteAllCells](self, "deleteAllCells");
  }
}

- (void)setSegmentSize:(CGSize)a3
{
  if (self->_segmentSize.width != a3.width || self->_segmentSize.height != a3.height)
    self->_segmentSize = a3;
}

- (void)setSegmentCount:(int64_t)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  void *v25;

  if (self->_segmentCount != a3
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 != (id)a3))
  {
    self->_segmentCount = a3;
    -[BKThumbnailScrubberTrack segmentSize](self, "segmentSize");
    v8 = v7;
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
    v12 = objc_msgSend(v11, "count");

    if ((unint64_t)v12 > a3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
      v14 = objc_msgSend(v13, "count");

      for (i = (int64_t)v14 - 1; i >= a3; --i)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", i));

        objc_msgSend(v17, "removeFromSuperview");
      }
      -[BKThumbnailScrubberTrack setNeedsLayout](self, "setNeedsLayout");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
    v19 = objc_msgSend(v18, "count");

    if ((unint64_t)v19 < a3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack subviews](self, "subviews"));
      v21 = objc_msgSend(v20, "count");

      v22 = __OFSUB__(a3, v21);
      v23 = a3 - (_QWORD)v21;
      if (!((v23 < 0) ^ v22 | (v23 == 0)))
      {
        do
        {
          v24 = objc_msgSend(objc_alloc(-[BKThumbnailScrubberTrack cellClass](self, "cellClass")), "initWithFrame:", 0.0, 0.0, v8, v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKThumbnailScrubberTrack segmentStrokeColor](self, "segmentStrokeColor"));
          objc_msgSend(v24, "setStrokeColor:", v25);

          -[BKThumbnailScrubberTrack addSubview:](self, "addSubview:", v24);
          --v23;
        }
        while (v23);
      }
      -[BKThumbnailScrubberTrack setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (int64_t)segmentCount
{
  return self->_segmentCount;
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (CGSize)segmentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_segmentSize.width;
  height = self->_segmentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIColor)segmentStrokeColor
{
  return self->_segmentStrokeColor;
}

- (void)setSegmentStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_segmentStrokeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentStrokeColor, 0);
}

@end
