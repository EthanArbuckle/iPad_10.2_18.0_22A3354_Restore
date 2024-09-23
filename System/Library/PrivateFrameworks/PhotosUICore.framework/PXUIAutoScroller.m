@implementation PXUIAutoScroller

- (CGRect)visibleRectForScrollView:(id)a3
{
  id v3;
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
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v5 + v15;
  v21 = v7 + v13;
  v22 = v9 - (v15 + v19);
  v23 = v11 - (v13 + v17);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)startRepeating
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXUIAutoScroller displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIAutoScroller.m"), 36, CFSTR("display link already exists"));

  }
  objc_msgSend(MEMORY[0x1E0CD2730], "px_displayLinkWithWeakTarget:selector:", self, sel__handleDisplayLink_);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(off_1E50B2330, "highFramerateRequiresReasonAndRange"))
  {
    objc_msgSend(v7, "setHighFrameRateReason:", 2228225);
    PXFrameRateRangeTypeGetCAFrameRateRange();
    objc_msgSend(v7, "setPreferredFrameRateRange:");
  }
  objc_msgSend(v7, "setPaused:", 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addToRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);

  -[PXUIAutoScroller setDisplayLink:](self, "setDisplayLink:", v7);
}

- (void)_handleDisplayLink:(id)a3
{
  objc_msgSend(a3, "timestamp");
  -[PXAutoScroller updateWithTimestamp:](self, "updateWithTimestamp:");
}

- (void)stopRepeating
{
  id v3;

  -[PXUIAutoScroller displayLink](self, "displayLink");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", 1);
  objc_msgSend(v3, "invalidate");
  -[PXUIAutoScroller setDisplayLink:](self, "setDisplayLink:", 0);

}

- (BOOL)autoscrollWithOffset:(CGPoint)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;

  -[PXAutoScroller scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  PXPointAdd();
  objc_msgSend(v3, "px_constrainedContentOffset:");
  v10 = v9 != v7 || v8 != v5;
  if (v10)
    objc_msgSend(v3, "setContentOffset:");

  return v10;
}

- (void)updateWithGestureRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v6 = v5;
  v8 = v7;

  -[PXAutoScroller updateWithUserInteractionLocation:inCoordinateSpace:](self, "updateWithUserInteractionLocation:inCoordinateSpace:", v9, v6, v8);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
