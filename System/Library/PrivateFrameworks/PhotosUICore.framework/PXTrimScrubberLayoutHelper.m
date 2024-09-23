@implementation PXTrimScrubberLayoutHelper

- (PXTrimScrubberLayoutHelper)init
{
  PXTrimScrubberLayoutHelper *result;
  __int128 v3;
  CGPoint v4;
  CGSize v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTrimScrubberLayoutHelper;
  result = -[PXTrimScrubberLayoutHelper init](&v6, sel_init);
  if (result)
  {
    v3 = *MEMORY[0x1E0CA2E68];
    result->_duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v4 = (CGPoint)*MEMORY[0x1E0C9D648];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_viewportFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_viewportFrame.size = v5;
    *(_OWORD *)&result->_filmstripScale = xmmword_1A7BA71C0;
    *(_OWORD *)&result->_duration.value = v3;
    result->_filmstripFrame.origin = v4;
    result->_filmstripFrame.size = v5;
  }
  return result;
}

- (void)setDuration:(id *)a3
{
  __int128 v5;
  CMTime v6;
  CMTime time1;

  if ((a3->var2 & 0x1D) == 1)
  {
    time1 = (CMTime)self->_duration;
    v6 = *(CMTime *)a3;
    if (CMTimeCompare(&time1, &v6))
    {
      time1 = (CMTime)*a3;
      v6 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if ((CMTimeCompare(&time1, &v6) & 0x80000000) == 0)
      {
        v5 = *(_OWORD *)&a3->var0;
        self->_duration.epoch = a3->var3;
        *(_OWORD *)&self->_duration.value = v5;
        -[PXTrimScrubberLayoutHelper setNeedsUpdate:](self, "setNeedsUpdate:", 1);
      }
    }
  }
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_viewportFrame, a3))
  {
    self->_viewportFrame.origin.x = x;
    self->_viewportFrame.origin.y = y;
    self->_viewportFrame.size.width = width;
    self->_viewportFrame.size.height = height;
    -[PXTrimScrubberLayoutHelper setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  }
}

- (void)setFilmstripScale:(double)a3
{
  if (self->_filmstripScale != a3)
  {
    self->_filmstripScale = a3;
    -[PXTrimScrubberLayoutHelper setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  }
}

- (void)setPivotAnchor:(double)a3
{
  if (self->_pivotAnchor != a3)
  {
    self->_pivotAnchor = a3;
    -[PXTrimScrubberLayoutHelper setNeedsUpdate:](self, "setNeedsUpdate:", 1);
  }
}

- (CGRect)filmstripFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[PXTrimScrubberLayoutHelper _updateIfNeeded](self, "_updateIfNeeded");
  x = self->_filmstripFrame.origin.x;
  y = self->_filmstripFrame.origin.y;
  width = self->_filmstripFrame.size.width;
  height = self->_filmstripFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)filmstripFrameInScrubberSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[PXTrimScrubberLayoutHelper _updateIfNeeded](self, "_updateIfNeeded");
  x = self->_filmstripFrameInScrubberSpace.origin.x;
  y = self->_filmstripFrameInScrubberSpace.origin.y;
  width = self->_filmstripFrameInScrubberSpace.size.width;
  height = self->_filmstripFrameInScrubberSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleFrameInFilmstripSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[PXTrimScrubberLayoutHelper _updateIfNeeded](self, "_updateIfNeeded");
  x = self->_visibleFrameInFilmstripSpace.origin.x;
  y = self->_visibleFrameInFilmstripSpace.origin.y;
  width = self->_visibleFrameInFilmstripSpace.size.width;
  height = self->_visibleFrameInFilmstripSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)offsetInScrubberSpaceForTime:(id *)a3
{
  double result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PXTrimScrubberLayoutHelper offsetInScrubberSpaceForTime:fallbackAnchor:](self, "offsetInScrubberSpaceForTime:fallbackAnchor:", &v4, 0.0);
  return result;
}

- (double)offsetInScrubberSpaceForTime:(id *)a3 fallbackAnchor:(double)a4
{
  double v5;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  CGRect v9;

  v8 = *a3;
  -[PXTrimScrubberLayoutHelper offsetInViewportSpaceForTime:fallbackAnchor:](self, "offsetInViewportSpaceForTime:fallbackAnchor:", &v8, a4);
  v6 = v5;
  -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
  return v6 + CGRectGetMinX(v9);
}

- (double)offsetInViewportSpaceForTime:(id *)a3
{
  double result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a3;
  -[PXTrimScrubberLayoutHelper offsetInViewportSpaceForTime:fallbackAnchor:](self, "offsetInViewportSpaceForTime:fallbackAnchor:", &v4, 0.0);
  return result;
}

- (double)offsetInViewportSpaceForTime:(id *)a3 fallbackAnchor:(double)a4
{
  double v7;
  double v8;
  CMTime time;
  CMTime time2;
  CMTime time1;
  int v13;
  CGRect v14;
  CGRect v15;

  if ((a3->var2 & 0x1D) == 1)
  {
    -[PXTrimScrubberLayoutHelper duration](self, "duration");
    if ((v13 & 0x1D) == 1)
    {
      -[PXTrimScrubberLayoutHelper duration](self, "duration");
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time2 = (CMTime)*a3;
        CMTimeGetSeconds(&time2);
        -[PXTrimScrubberLayoutHelper duration](self, "duration");
        CMTimeGetSeconds(&time);
        PXClamp();
        a4 = v7;
      }
    }
  }
  -[PXTrimScrubberLayoutHelper durationInsetFilmstripFrame](self, "durationInsetFilmstripFrame");
  v8 = a4 * CGRectGetWidth(v14);
  -[PXTrimScrubberLayoutHelper durationInsetFilmstripFrame](self, "durationInsetFilmstripFrame");
  return v8 + CGRectGetMinX(v15);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForOffsetInScrubberSpace:(SEL)a3
{
  CMTime *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  Float64 v16;
  CMTimeEpoch epoch;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  CMTime v19;
  CMTime v20;
  CMTime rhs;
  CMTime lhs;
  CMTime v23;
  int32_t preferredTimescale;
  CMTime time;
  CMTime time2;
  CMTime time1;
  int v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v7 = (CMTime *)MEMORY[0x1E0CA2E68];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  result = -[PXTrimScrubberLayoutHelper duration](self, "duration");
  if ((v28 & 0x1D) == 1)
  {
    -[PXTrimScrubberLayoutHelper duration](self, "duration");
    time2 = *v7;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((int)result >= 1)
    {
      -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
      v9 = a4 - CGRectGetMinX(v29);
      -[PXTrimScrubberLayoutHelper durationInsetFilmstripFrame](self, "durationInsetFilmstripFrame");
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
      if (v9 <= CGRectGetMinX(v30))
      {
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&v7->value;
        epoch = v7->epoch;
      }
      else
      {
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        if (v9 >= CGRectGetMaxX(v31))
        {
          result = -[PXTrimScrubberLayoutHelper duration](self, "duration");
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&time2.value;
          epoch = time2.epoch;
        }
        else
        {
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v14 = v9 - CGRectGetMinX(v32);
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v15 = v14 / CGRectGetWidth(v33);
          -[PXTrimScrubberLayoutHelper duration](self, "duration");
          v16 = v15 * CMTimeGetSeconds(&time);
          -[PXTrimScrubberLayoutHelper duration](self, "duration");
          CMTimeMakeWithSeconds(&time2, v16, preferredTimescale);
          *(CMTime *)retstr = time2;
          memset(&time2, 0, sizeof(time2));
          -[PXTrimScrubberLayoutHelper duration](self, "duration");
          CMTimeMake(&rhs, 1, 60);
          CMTimeSubtract(&v23, &lhs, &rhs);
          v20 = *v7;
          CMTimeMaximum(&time2, &v20, &v23);
          v19 = *v7;
          v18 = *retstr;
          CMTimeMaximum(&v20, &v19, (CMTime *)&v18);
          *(CMTime *)retstr = v20;
          v19 = time2;
          v18 = *retstr;
          result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum(&v20, &v19, (CMTime *)&v18);
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&v20.value;
          epoch = v20.epoch;
        }
      }
      retstr->var3 = epoch;
    }
  }
  return result;
}

- (void)_updateIfNeeded
{
  double Width;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinX;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  if (-[PXTrimScrubberLayoutHelper needsUpdate](self, "needsUpdate"))
  {
    -[PXTrimScrubberLayoutHelper setNeedsUpdate:](self, "setNeedsUpdate:", 0);
    -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
    Width = CGRectGetWidth(v14);
    -[PXTrimScrubberLayoutHelper filmstripScale](self, "filmstripScale");
    v5 = Width * v4;
    -[PXTrimScrubberLayoutHelper pivotAnchor](self, "pivotAnchor");
    PXMapValueFromRangeToNewRange();
    PXClamp();
    v7 = v6;
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
    v10 = v9;
    -[PXTrimScrubberLayoutHelper setFilmstripFrame:](self, "setFilmstripFrame:", v7, v8, v5);
    -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
    v11 = v7 + CGRectGetMinX(v15);
    -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
    -[PXTrimScrubberLayoutHelper setFilmstripFrameInScrubberSpace:](self, "setFilmstripFrameInScrubberSpace:", v11, v8 + CGRectGetMinY(v16), v5, v10);
    v17.origin.x = v7;
    v17.origin.y = v8;
    v17.size.width = v5;
    v17.size.height = v10;
    MinX = CGRectGetMinX(v17);
    if (MinX >= 0.0)
      v13 = MinX;
    else
      v13 = -MinX;
    -[PXTrimScrubberLayoutHelper viewportFrame](self, "viewportFrame");
    -[PXTrimScrubberLayoutHelper setVisibleFrameInFilmstripSpace:](self, "setVisibleFrameInFilmstripSpace:", v13, 0.0);
  }
}

- (CGRect)durationInsetFilmstripFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[PXTrimScrubberLayoutHelper horizontalTimelineInset](self, "horizontalTimelineInset");
  v4 = v3;
  v6 = v5;
  -[PXTrimScrubberLayoutHelper filmstripFrame](self, "filmstripFrame");
  v9 = v4 + v8;
  v11 = v10 + 0.0;
  v13 = v12 - (v4 + v6);
  result.size.height = v7;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (CGRect)viewportFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewportFrame.origin.x;
  y = self->_viewportFrame.origin.y;
  width = self->_viewportFrame.size.width;
  height = self->_viewportFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)filmstripScale
{
  return self->_filmstripScale;
}

- (double)pivotAnchor
{
  return self->_pivotAnchor;
}

- (void)setFilmstripFrame:(CGRect)a3
{
  self->_filmstripFrame = a3;
}

- (void)setFilmstripFrameInScrubberSpace:(CGRect)a3
{
  self->_filmstripFrameInScrubberSpace = a3;
}

- (void)setVisibleFrameInFilmstripSpace:(CGRect)a3
{
  self->_visibleFrameInFilmstripSpace = a3;
}

- (UIEdgeInsets)horizontalTimelineInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_horizontalTimelineInset.top;
  left = self->_horizontalTimelineInset.left;
  bottom = self->_horizontalTimelineInset.bottom;
  right = self->_horizontalTimelineInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHorizontalTimelineInset:(UIEdgeInsets)a3
{
  self->_horizontalTimelineInset = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

@end
