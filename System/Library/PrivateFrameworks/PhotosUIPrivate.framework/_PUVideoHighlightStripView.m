@implementation _PUVideoHighlightStripView

- (_PUVideoHighlightStripView)initWithFrame:(CGRect)a3
{
  _PUVideoHighlightStripView *v3;
  _PUVideoHighlightStripView *v4;
  NSArray *highlightViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PUVideoHighlightStripView;
  v3 = -[_PUVideoHighlightStripView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    highlightViews = v3->_highlightViews;
    v3->_highlightViews = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v4;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setHighlightColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_highlightColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_highlightColor, a3);
      -[_PUVideoHighlightStripView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setVideoDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_videoDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 videoDuration;
  CMTime time1;

  p_videoDuration = &self->_videoDuration;
  time1 = *(CMTime *)a3;
  videoDuration = self->_videoDuration;
  if (CMTimeCompare(&time1, (CMTime *)&videoDuration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_videoDuration->epoch = a3->var3;
    *(_OWORD *)&p_videoDuration->value = v6;
    -[_PUVideoHighlightStripView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCurrentTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 currentTime;
  CMTime time1;

  p_currentTime = &self->_currentTime;
  time1 = *(CMTime *)a3;
  currentTime = self->_currentTime;
  if (CMTimeCompare(&time1, (CMTime *)&currentTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_currentTime->epoch = a3->var3;
    *(_OWORD *)&p_currentTime->value = v6;
    -[_PUVideoHighlightStripView _updateCurrentTimeRangeIndex](self, "_updateCurrentTimeRangeIndex");
  }
}

- (void)setIsPlaying:(BOOL)a3
{
  if (self->_isPlaying != a3)
  {
    self->_isPlaying = a3;
    -[_PUVideoHighlightStripView _updateBarsExpanded](self, "_updateBarsExpanded");
  }
}

- (void)setHighlightTimeRanges:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *highlightTimeRanges;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_highlightTimeRanges;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      highlightTimeRanges = self->_highlightTimeRanges;
      self->_highlightTimeRanges = v6;

      -[_PUVideoHighlightStripView _updateHighlightViews](self, "_updateHighlightViews");
      -[_PUVideoHighlightStripView _updateCurrentTimeRangeIndex](self, "_updateCurrentTimeRangeIndex");
      -[_PUVideoHighlightStripView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_updateCurrentTimeRangeIndex
{
  void *v3;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v11 = 0uLL;
  v12 = 0;
  -[_PUVideoHighlightStripView currentTime](self, "currentTime");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  -[_PUVideoHighlightStripView highlightTimeRanges](self, "highlightTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___PUVideoHighlightStripView__updateCurrentTimeRangeIndex__block_invoke;
  v4[3] = &unk_1E58A8D78;
  v5 = v11;
  v6 = v12;
  v4[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  -[_PUVideoHighlightStripView setCurrentTimeRangeIndex:](self, "setCurrentTimeRangeIndex:", v8[3]);
  _Block_object_dispose(&v7, 8);
}

- (void)setCurrentTimeRangeIndex:(int64_t)a3
{
  if (self->_currentTimeRangeIndex != a3)
  {
    self->_currentTimeRangeIndex = a3;
    -[_PUVideoHighlightStripView _updateBarsExpanded](self, "_updateBarsExpanded");
  }
}

- (void)_updateHighlightViews
{
  void *v3;
  unint64_t v4;
  void *v5;
  _PUVideoHighlightBarView *v6;
  NSArray *v7;
  NSArray *highlightViews;
  NSArray *v9;

  -[_PUVideoHighlightStripView highlightTimeRanges](self, "highlightTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v9 = self->_highlightViews;
  if (-[NSArray count](v9, "count") < v4)
  {
    v5 = (void *)-[NSArray mutableCopy](v9, "mutableCopy");
    while (objc_msgSend(v5, "count") < v4)
    {
      v6 = objc_alloc_init(_PUVideoHighlightBarView);
      -[_PUVideoHighlightBarView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
      -[_PUVideoHighlightStripView addSubview:](self, "addSubview:", v6);
      objc_msgSend(v5, "addObject:", v6);

    }
    v7 = (NSArray *)objc_msgSend(v5, "copy");
    highlightViews = self->_highlightViews;
    self->_highlightViews = v7;

  }
  -[_PUVideoHighlightStripView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Float64 Seconds;
  void *v12;
  void *v13;
  NSArray *highlightViews;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, unint64_t);
  void *v20;
  id v21;
  id v22;
  Float64 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CMTime time;
  CMTime v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_PUVideoHighlightStripView;
  -[_PUVideoHighlightStripView layoutSubviews](&v31, sel_layoutSubviews);
  -[_PUVideoHighlightStripView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v30, 0, sizeof(v30));
  -[_PUVideoHighlightStripView videoDuration](self, "videoDuration");
  time = v30;
  Seconds = CMTimeGetSeconds(&time);
  -[_PUVideoHighlightStripView highlightTimeRanges](self, "highlightTimeRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PUVideoHighlightStripView highlightColor](self, "highlightColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  highlightViews = self->_highlightViews;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __44___PUVideoHighlightStripView_layoutSubviews__block_invoke;
  v20 = &unk_1E58A8DA0;
  v21 = v13;
  v22 = v12;
  v23 = Seconds;
  v24 = v4;
  v25 = v6;
  v26 = v8;
  v27 = v10;
  v28 = v8;
  v15 = v12;
  v16 = v13;
  -[NSArray enumerateObjectsUsingBlock:](highlightViews, "enumerateObjectsUsingBlock:", &v17);
  -[_PUVideoHighlightStripView _updateBarsExpanded](self, "_updateBarsExpanded", v17, v18, v19, v20);

}

- (void)_updateBarsExpanded
{
  int64_t v3;
  BOOL v4;
  NSArray *highlightViews;
  _QWORD v6[5];
  BOOL v7;

  v3 = -[_PUVideoHighlightStripView currentTimeRangeIndex](self, "currentTimeRangeIndex");
  v4 = -[_PUVideoHighlightStripView isPlaying](self, "isPlaying");
  highlightViews = self->_highlightViews;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49___PUVideoHighlightStripView__updateBarsExpanded__block_invoke;
  v6[3] = &__block_descriptor_41_e41_v32__0___PUVideoHighlightBarView_8Q16_B24l;
  v7 = v4;
  v6[4] = v3;
  -[NSArray enumerateObjectsUsingBlock:](highlightViews, "enumerateObjectsUsingBlock:", v6);
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[19];
  return self;
}

- (NSArray)highlightTimeRanges
{
  return self->_highlightTimeRanges;
}

- (int64_t)currentTimeRangeIndex
{
  return self->_currentTimeRangeIndex;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[20];
  return self;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_highlightTimeRanges, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
}

@end
