@implementation UIMovieScrubberTrackView

- (UIMovieScrubberTrackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  UIMovieScrubberTrackView *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *thumbnailViews;
  UIView *v9;
  uint64_t v10;
  UIView *maskContainerView;
  UIMovieScrubberTrackOverlayView *v12;
  UIMovieScrubberTrackOverlayView *overlayView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  v15.receiver = self;
  v15.super_class = (Class)UIMovieScrubberTrackView;
  v5 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    -[UIView setContentMode:](v5, "setContentMode:", 3);
    v5->_zoomAnimationDuration = 0.5;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailViews = v5->_thumbnailViews;
    v5->_thumbnailViews = v7;

    v9 = [UIView alloc];
    -[UIView bounds](v5, "bounds");
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    maskContainerView = v5->_maskContainerView;
    v5->_maskContainerView = (UIView *)v10;

    -[UIView setAutoresizingMask:](v5->_maskContainerView, "setAutoresizingMask:", 2);
    -[UIView setUserInteractionEnabled:](v5->_maskContainerView, "setUserInteractionEnabled:", 0);
    -[UIView setOpaque:](v5->_maskContainerView, "setOpaque:", 0);
    v12 = -[UIMovieScrubberTrackOverlayView initWithFrame:]([UIMovieScrubberTrackOverlayView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    overlayView = v5->_overlayView;
    v5->_overlayView = v12;

    -[UIView setAutoresizingMask:](v5->_overlayView, "setAutoresizingMask:", 2);
    -[UIView addSubview:](v5->_maskContainerView, "addSubview:", v5->_overlayView);
    -[UIView addSubview:](v5, "addSubview:", v5->_maskContainerView);
  }
  return v5;
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  char v11;
  __int16 v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFEF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFDF | v10;
    v11 = objc_opt_respondsToSelector();
    v5 = obj;
    if ((v11 & 1) != 0)
      v12 = 64;
    else
      v12 = 0;
    *(_WORD *)&self->_trackFlags = *(_WORD *)&self->_trackFlags & 0xFFBF | v12;
  }

}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
      self->_trackFlags.editingHandle = 0;
    else
      -[UIMovieScrubberTrackOverlayView setValue:](self->_overlayView, "setValue:");
  }
}

- (void)setEditing:(BOOL)a3
{
  __int16 trackFlags;
  __int16 v5;
  int *v6;

  trackFlags = (__int16)self->_trackFlags;
  if (((((trackFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 256;
    else
      v5 = 0;
    *(_WORD *)&self->_trackFlags = trackFlags & 0xFEFF | v5;
    -[UIMovieScrubberTrackOverlayView setEditing:](self->_overlayView, "setEditing:");
    if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
      v6 = &OBJC_IVAR___UIMovieScrubberTrackView__startValue;
    else
      v6 = &OBJC_IVAR___UIMovieScrubberTrackView__value;
    -[UIMovieScrubberTrackOverlayView setValue:](self->_overlayView, "setValue:", *(double *)((char *)&self->super.super.super.isa + *v6));
  }
}

- (void)animateFillFramesAway
{
  *(_WORD *)&self->_trackFlags &= ~0x100u;
  -[UIMovieScrubberTrackOverlayView animateFillFramesAway](self->_overlayView, "animateFillFramesAway");
}

- (void)setStartValue:(double)a3
{
  if (self->_startValue != a3)
  {
    self->_startValue = a3;
    -[UIMovieScrubberTrackOverlayView setStartValue:](self->_overlayView, "setStartValue:");
  }
  if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
  {
    self->_trackFlags.editingHandle = 1;
    -[UIMovieScrubberTrackOverlayView setEditingHandle:](self->_overlayView, "setEditingHandle:", 1);
  }
}

- (void)setEndValue:(double)a3
{
  if (self->_endValue != a3)
  {
    self->_endValue = a3;
    -[UIMovieScrubberTrackOverlayView setEndValue:](self->_overlayView, "setEndValue:");
  }
  if ((*(_WORD *)&self->_trackFlags & 0x100) != 0)
  {
    self->_trackFlags.editingHandle = 2;
    -[UIMovieScrubberTrackOverlayView setEditingHandle:](self->_overlayView, "setEditingHandle:", 2);
  }
}

- (void)setThumbnailImage:(CGImage *)a3 forTimestamp:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  UIImage *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  UIImage *v42;
  void *v43;
  uint64_t v44;
  UIMovieScrubberTrackView *v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v45 = self;
  -[NSMutableDictionary objectForKey:](self->_thumbnailViews, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (a3 && v8)
  {
    v9 = -[UIImage initWithCGImage:]([UIImage alloc], "initWithCGImage:", a3);
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIImage size](v9, "size");
    v13 = v12;
    v15 = v14;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v12, v14, 1.0);
    v42 = v9;
    -[UIImage drawInRect:](v9, "drawInRect:", v10, v11, v13, v15);
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");

    v64.origin.x = v13 + -1.0;
    v64.origin.y = 0.0;
    v64.size.width = 1.0;
    v64.size.height = v15;
    UIRectFillUsingBlendMode(v64, kCGBlendModeNormal);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v43 = v7;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v57 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v23, "setImage:", v17);
          objc_msgSend(v23, "setHasPlaceholderImage:", 0);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v20);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[NSMutableDictionary allKeys](v45->_thumbnailViews, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
      v44 = *(_QWORD *)v53;
      do
      {
        v27 = 0;
        v46 = v25;
        do
        {
          if (*(_QWORD *)v53 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v27);
          objc_msgSend(v28, "doubleValue");
          v30 = v29;
          objc_msgSend(v6, "doubleValue");
          if (v30 >= v31)
          {
            v32 = v6;
            -[NSMutableDictionary objectForKey:](v45->_thumbnailViews, "objectForKey:", v28);
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            v35 = v18;
            if (v33 != v18)
            {
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
              if (v36)
              {
                v37 = v36;
                v38 = *(_QWORD *)v49;
                do
                {
                  for (j = 0; j != v37; ++j)
                  {
                    if (*(_QWORD *)v49 != v38)
                      objc_enumerationMutation(v34);
                    v40 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                    objc_msgSend(v40, "image");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v41)
                    {
                      objc_msgSend(v40, "setImage:", v17);
                      objc_msgSend(v40, "setHasPlaceholderImage:", 1);
                    }
                  }
                  v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
                }
                while (v37);
              }
            }

            v6 = v32;
            v18 = v35;
            v26 = v44;
            v25 = v46;
          }
          ++v27;
        }
        while (v27 != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v25);
    }

    v7 = v43;
  }

}

- (id)_createImageViewForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UIMovieScrubberThumbnailView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v4 = a4;
  v6 = a3;
  v7 = -[UIImageView initWithFrame:]([UIMovieScrubberThumbnailView alloc], "initWithFrame:", 0.0, 0.0, self->_thumbnailSize.width, self->_thumbnailSize.height);
  -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 1);
  -[NSMutableDictionary objectForKey:](self->_thumbnailViews, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[UIImageView setImage:](v7, "setImage:", v11);

      }
    }
    objc_msgSend(v9, "addObject:", v7);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
    -[NSMutableDictionary setObject:forKey:](self->_thumbnailViews, "setObject:forKey:", v9, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "movieScrubberTrackView:requestThumbnailImageForTimestamp:isSummaryThumbnail:", self, v6, v4);

  }
  return v7;
}

- (void)clear
{
  void *v3;
  NSDictionary *thumbnailStartXValues;
  NSDictionary *childThumbnailViews;
  NSArray *summaryThumbnailViews;
  NSArray *summaryThumbnailTimestamps;
  NSArray *summaryThumbnailChildTimestamps;
  NSArray *timestamps;

  -[NSMutableDictionary allValues](self->_thumbnailViews, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeViewsFromSuperview);

  -[NSMutableDictionary removeAllObjects](self->_thumbnailViews, "removeAllObjects");
  thumbnailStartXValues = self->_thumbnailStartXValues;
  self->_thumbnailStartXValues = 0;

  childThumbnailViews = self->_childThumbnailViews;
  self->_childThumbnailViews = 0;

  summaryThumbnailViews = self->_summaryThumbnailViews;
  self->_summaryThumbnailViews = 0;

  summaryThumbnailTimestamps = self->_summaryThumbnailTimestamps;
  self->_summaryThumbnailTimestamps = 0;

  summaryThumbnailChildTimestamps = self->_summaryThumbnailChildTimestamps;
  self->_summaryThumbnailChildTimestamps = 0;

  timestamps = self->_timestamps;
  self->_timestamps = 0;

}

- (void)_reallyReloadData
{
  uint64_t v2;
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  float v8;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *v16;
  int v17;
  int v18;
  BOOL v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  NSArray *v24;
  double width;
  double height;
  uint64_t v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  float v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  int v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  NSArray *summaryThumbnailViews;
  NSArray *v49;
  NSArray *summaryThumbnailTimestamps;
  NSArray *v51;
  NSArray *summaryThumbnailChildTimestamps;
  NSArray *v53;
  NSArray *timestamps;
  NSArray *v55;
  id v56;
  NSArray *v57;
  id v58;
  $B9F516C9B844D20AFDB58FC80DA94BDB *p_trackFlags;
  NSArray *v60;
  NSArray *v61;

  -[UIMovieScrubberTrackView clear](self, "clear");
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "movieScrubberTrackViewThumbnailAspectRatio:", self);
  v7 = v6;

  self->_thumbnailSize.height = 32.0;
  v8 = v7 * 32.0;
  self->_thumbnailSize.width = rintf(v8);
  v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v9, "movieScrubberTrackViewDuration:", self);
  v11 = v10;

  -[UIView bounds](self, "bounds");
  LODWORD(v2) = vcvtpd_s64_f64(v12 / self->_thumbnailSize.width);
  v13 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "movieScrubberTrackView:evenlySpacedTimestamps:startingAt:endingAt:", self, v2, v14, v15);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v17 = -[NSArray count](v16, "count");
  v18 = v17;
  p_trackFlags = &self->_trackFlags;
  *((_BYTE *)&self->_trackFlags + 8) = *((_BYTE *)&self->_trackFlags + 8) & 0xFE | (v17 < (int)v2);
  v19 = v17 >= (int)v2 || v17 < 1;
  v56 = v4;
  if (!v19)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v20, "count") < (unint64_t)(int)v2)
    {
      v21 = v18 - 1;
      do
      {
        if (v21 >= v18)
          v22 = 0;
        else
          v22 = v21;
        -[NSArray objectAtIndex:](v16, "objectAtIndex:", v22, v56);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v23);

        v21 = v22 + 1;
      }
      while (objc_msgSend(v20, "count") < (unint64_t)(int)v2);
    }
    objc_msgSend(v20, "sortUsingSelector:", sel_compare_, v56);
    v24 = (NSArray *)v20;

    v18 = -[NSArray count](v24, "count");
    v16 = v24;
    v4 = v56;
  }
  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  v58 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((*(_WORD *)p_trackFlags & 8) != 0)
    objc_msgSend(v58, "movieScrubberTrackViewWillBeginRequestingThumbnails:", self);
  if (v18 >= 1)
  {
    v27 = 0;
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v29 = v18;
    do
    {
      -[NSArray objectAtIndex:](v16, "objectAtIndex:", v27, v56);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[UIMovieScrubberTrackView _createImageViewForTimestamp:isSummaryThumbnail:](self, "_createImageViewForTimestamp:isSummaryThumbnail:", v30, 1);
      -[UIView addSubview:](self->_maskContainerView, "addSubview:", v31);
      v32 = width * (double)(int)v27;
      objc_msgSend(v31, "setFrame:", rintf(v32) + 0.0, v28, width, height);
      objc_msgSend(v4, "addObject:", v31);

      ++v27;
    }
    while (v29 != v27);
  }
  if ((*(_WORD *)p_trackFlags & 0x10) != 0)
    objc_msgSend(v58, "movieScrubberTrackViewDidFinishRequestingThumbnails:", self);
  v33 = -[NSArray count](v16, "count", v56);
  if ((*((_BYTE *)&self->_trackFlags + 8) & 1) == 0 && v33 >= 1)
  {
    v34 = 0;
    v35 = (v33 - 1);
    v36 = v33;
    do
    {
      -[NSArray objectAtIndex:](v16, "objectAtIndex:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35 == v34)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      else
        -[NSArray objectAtIndex:](v16, "objectAtIndex:", v34 + 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v39, "movieScrubberTrackView:evenlySpacedTimestamps:startingAt:endingAt:", self, 5, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_msgSend(v40, "count");
      if (v41)
      {
        objc_msgSend(v40, "objectAtIndex:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v44 = v43;
        objc_msgSend(v37, "doubleValue");
        v46 = v45;

        if (v44 == v46)
        {
          objc_msgSend(v40, "subarrayWithRange:", 1, v41 - 1);
          v47 = objc_claimAutoreleasedReturnValue();

          v40 = (void *)v47;
        }
      }
      -[NSArray addObject:](v60, "addObject:", v40);
      -[NSArray addObject:](v61, "addObject:", v37);
      -[NSArray addObjectsFromArray:](v61, "addObjectsFromArray:", v40);

      ++v34;
    }
    while (v36 != v34);
  }
  summaryThumbnailViews = self->_summaryThumbnailViews;
  self->_summaryThumbnailViews = v57;
  v49 = v57;

  summaryThumbnailTimestamps = self->_summaryThumbnailTimestamps;
  self->_summaryThumbnailTimestamps = v16;
  v51 = v16;

  summaryThumbnailChildTimestamps = self->_summaryThumbnailChildTimestamps;
  self->_summaryThumbnailChildTimestamps = v60;
  v53 = v60;

  timestamps = self->_timestamps;
  self->_timestamps = v61;
  v55 = v61;

  -[UIMovieScrubberTrackOverlayView setMinimumValue:](self->_overlayView, "setMinimumValue:", 0.0);
  -[UIMovieScrubberTrackOverlayView setMaximumValue:](self->_overlayView, "setMaximumValue:", v11);
  -[UIView layoutIfNeeded](self->_overlayView, "layoutIfNeeded");
  self->_duration = v11;
  -[UIView bringSubviewToFront:](self->_maskContainerView, "bringSubviewToFront:", self->_overlayView);

  *(_WORD *)p_trackFlags &= ~0x80u;
}

- (void)reloadData
{
  *(_WORD *)&self->_trackFlags |= 0x80u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  if ((*(_WORD *)&self->_trackFlags & 0x80) != 0)
    -[UIMovieScrubberTrackView _reallyReloadData](self, "_reallyReloadData");
  v3.receiver = self;
  v3.super_class = (Class)UIMovieScrubberTrackView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setZoomAnimationDuration:(double)a3
{
  float v3;

  v3 = a3;
  self->_zoomAnimationDuration = v3;
}

- (double)zoomAnimationDuration
{
  return self->_zoomAnimationDuration;
}

- (BOOL)zoomAtPoint:(CGPoint)a3
{
  $B9F516C9B844D20AFDB58FC80DA94BDB *p_trackFlags;
  double y;
  double x;
  int v7;
  int v8;
  uint64_t v9;
  double v10;
  void *v11;
  int v12;
  int v13;
  _BOOL4 v15;
  NSDictionary *childThumbnailViews;
  NSDictionary *thumbnailStartXValues;
  uint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double width;
  float v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  int *v39;
  unsigned int editingHandle;
  float v41;
  double v42;
  float v43;
  float v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat MaxX;
  float64x2_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double duration;
  float v60;
  double v61;
  float v62;
  float v63;
  double v64;
  float v65;
  BOOL v66;
  float v67;
  double zoomOriginXDelta;
  id WeakRetained;
  id v70;
  uint64_t v71;
  int v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  int v80;
  double v81;
  uint64_t v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  int v87;
  unint64_t v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat height;
  double v93;
  void *v94;
  id v95;
  void *v96;
  double v97;
  uint64_t v98;
  void *v99;
  void *v100;
  double zoomAnimationDuration;
  uint64_t v102;
  id v103;
  NSDictionary *v104;
  NSDictionary *v105;
  NSDictionary *v106;
  NSDictionary *v107;
  double v108;
  id v109;
  double v111;
  float32x2_t v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  $B9F516C9B844D20AFDB58FC80DA94BDB *v119;
  void *v120;
  int v121;
  uint64_t v122;
  void *v123;
  int v124;
  int v125;
  uint64_t v126;
  NSDictionary *v127;
  void *v128;
  id v129;
  NSDictionary *v130;
  void *v131;
  void *v132;
  CGFloat v133;
  double v134;
  CGFloat v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  double v139;
  float v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  CGFloat v146;
  double MinX;
  CGFloat v148;
  float64x2_t v149;
  double v150;
  _QWORD v151[5];
  id v152;
  float32x2_t v153;
  _QWORD v154[5];
  _QWORD v155[4];
  id v156;
  UIMovieScrubberTrackView *v157;
  double v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;

  p_trackFlags = &self->_trackFlags;
  if ((*((_BYTE *)&self->_trackFlags + 8) & 1) != 0)
  {
    LOBYTE(v15) = 0;
  }
  else
  {
    y = a3.y;
    x = a3.x;
    v7 = -[NSArray count](self->_summaryThumbnailViews, "count");
    v8 = v7;
    v9 = 488;
    v10 = 0.0;
    if (x >= self->_thumbnailSize.width * (double)v7 + 0.0 + -1.0)
      x = self->_thumbnailSize.width * (double)v7 + 0.0 + -1.0;
    -[UIView setUserInteractionEnabled:](self->_maskContainerView, "setUserInteractionEnabled:", 1);
    -[UIView hitTest:withEvent:](self->_maskContainerView, "hitTest:withEvent:", 0, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setUserInteractionEnabled:](self->_maskContainerView, "setUserInteractionEnabled:", 0);
    v12 = -[NSArray indexOfObject:](self->_summaryThumbnailViews, "indexOfObject:", v11);
    v13 = v12;
    v15 = v12 >= 0 && v12 < v8;
    if (v15)
    {
      v120 = v11;
      childThumbnailViews = self->_childThumbnailViews;
      self->_childThumbnailViews = 0;

      thumbnailStartXValues = self->_thumbnailStartXValues;
      self->_thumbnailStartXValues = 0;

      v129 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v130 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v127 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v121 = v13;
      if (v13)
      {
        v18 = 0;
        v19 = v13;
        v20 = 0;
        v21 = v19;
        do
        {
          -[NSArray objectAtIndex:](self->_summaryThumbnailChildTimestamps, "objectAtIndex:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 += objc_msgSend(v22, "count");

          ++v18;
        }
        while (v21 != v18);
        v10 = (double)v20;
        v9 = 488;
      }
      -[UIView superview](self, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isInsideNavigationBar"))
        EnclosingNavigationBar(v23);
      else
        objc_msgSend(v23, "superview");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v135 = v26;
      v136 = v25;
      v133 = v28;
      v134 = v27;
      -[UIView bounds](self, "bounds");
      v128 = v24;
      objc_msgSend(v24, "convertRect:fromView:", self);
      v142 = v29;
      v144 = v30;
      v31 = -[NSArray count](self->_timestamps, "count");
      width = self->_thumbnailSize.width;
      v33 = width * (double)(v31 - v8);
      v140 = rintf(v33);
      v34 = v140;
      v35 = -(width * v10);
      v36 = v140 - width * v10;
      self->_unclampedZoomWidthDelta = v36;
      -[UIView bounds](self, "bounds");
      v39 = &OBJC_IVAR___UIMovieScrubberTrackView__value;
      if ((*(_WORD *)p_trackFlags & 0x100) != 0)
      {
        editingHandle = p_trackFlags->editingHandle;
        if (editingHandle == 2)
          v39 = &OBJC_IVAR___UIMovieScrubberTrackView__endValue;
        if (editingHandle == 1)
          v39 = &OBJC_IVAR___UIMovieScrubberTrackView__startValue;
      }
      v41 = *(double *)((char *)&self->super.super.super.isa + *v39);
      v42 = v38 + v34;
      v43 = v35 - (v35 + v37 + (v38 + v34) * (v41 / self->_duration) - (v37 + v38 * (v41 / self->_duration)));
      v44 = rintf(v43);
      v45 = v44;
      -[UIView bounds](self, "bounds");
      v46 = v24;
      objc_msgSend(v24, "convertRect:fromView:", self);
      v48 = v47;
      v50 = v49;
      v146 = v51 + v44;
      v148 = v52 + v34;
      v159.origin.y = v135;
      v159.origin.x = v136;
      v159.size.height = v133;
      v159.size.width = v134;
      v160 = CGRectInset(v159, -0.0, 0.0);
      v166.origin.x = v146;
      v166.size.width = v148;
      v166.origin.y = v48;
      v166.size.height = v50;
      v161 = CGRectIntersection(v160, v166);
      v138 = v161.origin.x;
      MaxX = CGRectGetMaxX(v161);
      v54.f64[0] = v138;
      v54.f64[1] = MaxX;
      v149 = vmulq_n_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v54, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v146, 0)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v148, 0)))), self->_duration);
      objc_msgSend(v23, "frame");
      v116 = v56;
      v117 = v55;
      v114 = v58;
      v115 = v57;
      v118 = v23;
      objc_msgSend(v23, "setFrame:", v55 + v44);
      duration = self->_duration;
      v60 = duration / v42;
      *(float *)&duration = duration;
      if (vabds_f32(v41, *(float *)&duration) >= v60)
        v61 = -v142;
      else
        v61 = v142 * -2.0;
      if (v61 >= v45)
      {
        v62 = v61;
        v63 = v62;
      }
      else
      {
        v63 = v44;
      }
      self->_zoomOriginXDelta = v63;
      v64 = v134 - v144 + 0.0;
      v65 = v64;
      v66 = v64 < v34;
      v67 = v140;
      if (v66)
        v67 = v65;
      self->_zoomWidthDelta = v67;
      zoomOriginXDelta = self->_zoomOriginXDelta;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v70 = WeakRetained;
      v119 = p_trackFlags;
      if ((*(_WORD *)p_trackFlags & 8) != 0)
        objc_msgSend(WeakRetained, "movieScrubberTrackViewWillBeginRequestingThumbnails:", self);
      v113 = v70;
      v71 = 0;
      v72 = 0;
      v111 = zoomOriginXDelta - v45;
      v112 = vcvt_f32_f64(v149);
      v122 = v8;
      do
      {
        -[NSArray objectAtIndex:](self->_summaryThumbnailViews, "objectAtIndex:", v71, *(_QWORD *)&v111);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "superview");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "frame");
        v76 = v75;
        v141 = v77;
        v143 = v78;
        v139 = v79;
        v126 = v71;
        -[NSArray objectAtIndex:](self->_summaryThumbnailChildTimestamps, "objectAtIndex:", v71);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v131, "count");
        v124 = v72;
        v81 = v76 + *(double *)((char *)&self->super.super.super.isa + v9) * (double)v72;
        v132 = v73;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v73);
        v82 = objc_claimAutoreleasedReturnValue();
        *(float *)&v83 = v76;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v130, "setObject:forKey:", v84, v82);
        *(float *)&v85 = v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)v82;
        objc_msgSend(v129, "setObject:forKey:", v86, v82);

        v125 = v80;
        if (v80 >= 1)
        {
          v87 = v126 - v121;
          if ((int)v126 - v121 < 0)
            v87 = v121 - v126;
          v150 = v143 / (double)v87;
          v88 = v80 + 1;
          do
          {
            v137 = v81 + *(double *)((char *)&self->super.super.super.isa + v9) * (double)v80;
            objc_msgSend(v46, "convertRect:fromView:", v74);
            v89 = v162.origin.x;
            v90 = v162.origin.y;
            v91 = v162.size.width;
            height = v162.size.height;
            MinX = CGRectGetMinX(v162);
            v163.origin.x = v136;
            v163.origin.y = v135;
            v163.size.width = v134;
            v163.size.height = v133;
            v145 = CGRectGetMaxX(v163);
            v164.origin.x = v136;
            v164.origin.y = v135;
            v164.size.width = v134;
            v164.size.height = v133;
            v93 = CGRectGetMinX(v164);
            v165.origin.x = v89;
            v165.origin.y = v90;
            v165.size.width = v91;
            v165.size.height = height;
            if (v93 - CGRectGetMaxX(v165) - v150 <= 0.0 && MinX - v145 - v150 <= 0.0)
            {
              objc_msgSend(v131, "objectAtIndex:", (v88 - 2));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = -[UIMovieScrubberTrackView _createImageViewForTimestamp:isSummaryThumbnail:](self, "_createImageViewForTimestamp:isSummaryThumbnail:", v94, 0);
              -[NSDictionary setObject:forKey:](v127, "setObject:forKey:", v95, v94);
              -[UIView insertSubview:below:](self->_maskContainerView, "insertSubview:below:", v95, v132);
              objc_msgSend(v95, "setFrame:", v76, v141, v143, v139);
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v95);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKey:](v130, "setObject:forKey:", v84, v96);
              HIDWORD(v97) = HIDWORD(v137);
              *(float *)&v97 = v137;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
              v98 = v9;
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "setObject:forKey:", v99, v96);

              v9 = v98;
              v46 = v128;
            }
            --v88;
            --v80;
          }
          while (v88 > 1);
        }
        v72 = v124 + v125;

        v71 = v126 + 1;
      }
      while (v126 + 1 != v122);
      if ((*(_WORD *)v119 & 0x10) != 0)
        objc_msgSend(v113, "movieScrubberTrackViewDidFinishRequestingThumbnails:", self);
      -[UIView window](self, "window");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "beginDisablingInterfaceAutorotation");

      zoomAnimationDuration = self->_zoomAnimationDuration;
      v102 = MEMORY[0x1E0C809B0];
      v154[4] = self;
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke;
      v155[3] = &unk_1E16B1C28;
      v156 = v129;
      v157 = self;
      v158 = v111;
      v154[0] = MEMORY[0x1E0C809B0];
      v154[1] = 3221225472;
      v154[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_2;
      v154[3] = &unk_1E16B3FD8;
      v103 = v129;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v155, v154, zoomAnimationDuration, 0.0);
      v104 = self->_childThumbnailViews;
      self->_childThumbnailViews = v127;
      v105 = v127;

      v106 = self->_thumbnailStartXValues;
      self->_thumbnailStartXValues = v130;
      v107 = v130;

      objc_msgSend(v118, "setFrame:", v117, v116, v115, v114);
      v108 = self->_zoomAnimationDuration;
      v151[0] = v102;
      v151[1] = 3221225472;
      v151[2] = __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_3;
      v151[3] = &unk_1E16B1C28;
      v151[4] = self;
      v152 = v113;
      v153 = v112;
      v109 = v113;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v151, 0, v108, 0.0);

      v11 = v120;
      LOBYTE(v15) = 1;
    }

  }
  return v15;
}

void __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = *(double *)(*(_QWORD *)(a1 + 40) + 488);
        v10 = *(double *)(*(_QWORD *)(a1 + 40) + 496);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12 - *(double *)(a1 + 48);

        objc_msgSend(v8, "pointerValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFrame:", v13, v6, v9, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

uint64_t __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_zoomAnimationDidFinish");
}

uint64_t __40__UIMovieScrubberTrackView_zoomAtPoint___block_invoke_3(uint64_t a1, double a2, double a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v4 + 552) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "movieScrubberTrackView:clampedSizeWidthDelta:actualSizeWidthDelta:originXDelta:minimumVisibleValue:maximumVisibleValue:", *(float *)(v4 + 508), *(float *)(v4 + 512), *(float *)(v4 + 504), *(float *)(a1 + 48), *(float *)(a1 + 52));
    v4 = *(_QWORD *)(a1 + 32);
  }
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return objc_msgSend((id)v4, "_setOverlayViewIsZoomed:minValue:maxValue:", 1, a2, a3);
}

- (void)_setOverlayViewIsZoomed:(BOOL)a3 minValue:(float)a4 maxValue:(float)a5
{
  float zoomAnimationDuration;
  id WeakRetained;
  void *v11;
  __int16 trackFlags;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  float v18;
  float v19;
  BOOL v20;

  zoomAnimationDuration = self->_zoomAnimationDuration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  trackFlags = (__int16)self->_trackFlags;
  if ((trackFlags & 0x20) != 0)
  {
    objc_msgSend(WeakRetained, "movieScrubberTrackViewZoomAnimationDuration:", self);
    v13 = v14;
    trackFlags = (__int16)self->_trackFlags;
  }
  else
  {
    v13 = zoomAnimationDuration;
  }
  v15 = 0.0;
  if ((trackFlags & 0x40) != 0)
  {
    objc_msgSend(v11, "movieScrubberTrackViewZoomAnimationDelay:", self);
    v15 = v16;
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__UIMovieScrubberTrackView__setOverlayViewIsZoomed_minValue_maxValue___block_invoke;
  v17[3] = &unk_1E16BFE60;
  v17[4] = self;
  v20 = a3;
  v18 = a4;
  v19 = a5;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v17, 0, v13, v15);

}

uint64_t __70__UIMovieScrubberTrackView__setOverlayViewIsZoomed_minValue_maxValue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setIsZoomed:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setMinimumValue:", *(float *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setMaximumValue:", *(float *)(a1 + 44));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "layoutSubviews");
}

- (void)unzoom
{
  double zoomAnimationDuration;
  _QWORD v3[5];
  _QWORD v4[5];

  zoomAnimationDuration = self->_zoomAnimationDuration;
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__UIMovieScrubberTrackView_unzoom__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__UIMovieScrubberTrackView_unzoom__block_invoke_2;
  v3[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v4, v3, zoomAnimationDuration, 0.0);
}

uint64_t __34__UIMovieScrubberTrackView_unzoom__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  uint64_t v17;
  id WeakRetained;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "pointerValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(double *)(v10 + 488);
        v12 = *(double *)(v10 + 496);
        objc_msgSend(*(id *)(v10 + 440), "objectForKey:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;

        objc_msgSend(v9, "setFrame:", v15, v6, v11, v12);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

  v17 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v17 + 552) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v17 + 576));
    objc_msgSend(WeakRetained, "movieScrubberTrackView:clampedSizeWidthDelta:actualSizeWidthDelta:originXDelta:minimumVisibleValue:maximumVisibleValue:", (float)-*(float *)(*(_QWORD *)(a1 + 32) + 508), (float)-*(float *)(*(_QWORD *)(a1 + 32) + 512), (float)-*(float *)(*(_QWORD *)(a1 + 32) + 504), 0.0, *(double *)(*(_QWORD *)(a1 + 32) + 520));

    v17 = *(_QWORD *)(a1 + 32);
  }
  v19 = *(double *)(v17 + 520);
  *(float *)&v16 = v19;
  LODWORD(v19) = 0;
  return objc_msgSend((id)v17, "_setOverlayViewIsZoomed:minValue:maxValue:", 0, v19, v16);
}

uint64_t __34__UIMovieScrubberTrackView_unzoom__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unzoomAnimationDidFinish");
}

- (void)_zoomAnimationDidFinish
{
  id WeakRetained;

  if ((*(_WORD *)&self->_trackFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "movieScrubberTrackViewDidExpand:", self);

  }
}

- (void)_unzoomAnimationDidFinish
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSDictionary *childThumbnailViews;
  NSDictionary *thumbnailStartXValues;
  void *v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSDictionary allKeys](self->_childThumbnailViews, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary removeObjectForKey:](self->_thumbnailViews, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  -[NSDictionary allValues](self->_childThumbnailViews, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  childThumbnailViews = self->_childThumbnailViews;
  self->_childThumbnailViews = 0;

  thumbnailStartXValues = self->_thumbnailStartXValues;
  self->_thumbnailStartXValues = 0;

  -[UIView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDisablingInterfaceAutorotation");

  if ((*(_WORD *)&self->_trackFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "movieScrubberTrackViewDidCollapse:", self);

  }
}

- (UIMovieScrubberTrackViewDataSource)dataSource
{
  return (UIMovieScrubberTrackViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UIMovieScrubberTrackViewDelegate)delegate
{
  return (UIMovieScrubberTrackViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maskContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_thumbnailViews, 0);
  objc_storeStrong((id *)&self->_childThumbnailViews, 0);
  objc_storeStrong((id *)&self->_thumbnailStartXValues, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailChildTimestamps, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailTimestamps, 0);
  objc_storeStrong((id *)&self->_summaryThumbnailViews, 0);
}

@end
