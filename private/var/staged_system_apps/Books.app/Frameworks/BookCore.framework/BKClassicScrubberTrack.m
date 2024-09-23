@implementation BKClassicScrubberTrack

- (void)dealloc
{
  UIView *progressView;
  UIView *trackBackgroundView;
  objc_super v5;

  progressView = self->_progressView;
  self->_progressView = 0;

  trackBackgroundView = self->_trackBackgroundView;
  self->_trackBackgroundView = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKClassicScrubberTrack;
  -[BKClassicScrubberTrack dealloc](&v5, "dealloc");
}

- (void)tintColorDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKClassicScrubberTrack tintColor](self, "tintColor"));
  -[UIView setBackgroundColor:](self->_progressView, "setBackgroundColor:", v3);

}

- (void)_updateTrackForSize:(CGSize)a3
{
  double height;
  double width;
  double y;
  double v7;
  CGFloat v8;
  BKClassicScrubberTrack *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double x;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  UIView *v36;
  UIView *trackBackgroundView;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;
  UIView *progressView;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  UIView **p_trackBackgroundView;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  float v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  int64_t v67;
  double v68;
  float v69;
  double v70;
  float v71;
  float v72;
  double v73;
  float v74;
  float v75;
  float v76;
  double v77;
  double v78;
  double v79;
  double v80;
  objc_super v81;
  objc_super v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  height = a3.height;
  width = a3.width;
  y = CGRectZero.origin.y;
  v8 = CGRectZero.size.width;
  v7 = CGRectZero.size.height;
  v79 = v7;
  v80 = v8;
  if (self->super._modern)
  {
    if (-[BKScrubberTrack trackOrientation](self, "trackOrientation"))
    {
      if (-[BKScrubberTrack trackOrientation](self, "trackOrientation") != 1)
      {
LABEL_12:
        v13 = y;
        x = CGRectZero.origin.x;
        goto LABEL_15;
      }
      v9 = self;
      v10 = width;
    }
    else
    {
      v9 = self;
      v10 = height;
    }
    -[BKClassicScrubberTrack setThickness:](v9, "setThickness:", v10);
    goto LABEL_12;
  }
  -[BKScrubberTrack thickness](self, "thickness");
  if (v11 == 0.0)
    -[BKClassicScrubberTrack setThickness:](self, "setThickness:", 2.0);
  if (-[BKScrubberTrack trackOrientation](self, "trackOrientation"))
  {
    width = v8;
    if (-[BKScrubberTrack trackOrientation](self, "trackOrientation") == 1)
    {
      -[BKScrubberTrack thickness](self, "thickness");
      width = v12;
      v7 = height;
    }
  }
  else
  {
    -[BKScrubberTrack thickness](self, "thickness");
    v7 = v15;
  }
  v16 = -[BKClassicScrubberTrack bounds](self, "bounds");
  x = CGRectCenterRectInRect(v16, CGRectZero.origin.x, y, width, v7, v17, v18, v19, v20);
  v13 = v21;
  width = v22;
  height = v23;
LABEL_15:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v24, "scale");
  v26 = v25;

  v27 = x * v26;
  v28 = floorf(v27) / v26;
  v29 = v13 * v26;
  v30 = floorf(v29) / v26;
  if (v26 > 0.0)
  {
    v13 = v30;
    x = v28;
  }
  -[BKScrubberTrack readingProgress](self, "readingProgress");
  v32 = fmax(v31, 0.0);
  v33 = 1.0;
  if (v32 > 1.0)
    v32 = 1.0;
  v78 = v32;
  -[BKScrubberTrack loadingProgress](self, "loadingProgress");
  v35 = fmax(v34, 0.0);
  if (v35 <= 1.0)
    v33 = v35;
  if (!self->super._modern && !self->_trackBackgroundView)
  {
    v36 = (UIView *)objc_alloc_init((Class)UIView);
    trackBackgroundView = self->_trackBackgroundView;
    self->_trackBackgroundView = v36;

    -[BKClassicScrubberTrack addSubview:](self, "addSubview:", self->_trackBackgroundView);
  }
  if (self->super._roundEndCaps)
  {
    v82.receiver = self;
    v82.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack thickness](&v82, "thickness");
    v39 = v38 * 0.5;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v40, "setCornerRadius:", v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v41, "setMasksToBounds:", 1);

  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v42, "setCornerRadius:", 0.0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_trackBackgroundView, "layer"));
    objc_msgSend(v43, "setMasksToBounds:", 0);

  }
  if (!self->_progressView)
  {
    v44 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, v80, v79);
    progressView = self->_progressView;
    self->_progressView = v44;

    -[BKClassicScrubberTrack addSubview:](self, "addSubview:", self->_progressView);
  }
  if (self->super._roundEndCaps)
  {
    v81.receiver = self;
    v81.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack thickness](&v81, "thickness");
    v47 = v46 * 0.5;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_progressView, "layer"));
    objc_msgSend(v48, "setCornerRadius:", v47);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_progressView, "layer"));
    v50 = v49;
    v51 = 1;
  }
  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_progressView, "layer"));
    objc_msgSend(v52, "setCornerRadius:", 0.0);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_progressView, "layer"));
    v50 = v49;
    v51 = 0;
  }
  objc_msgSend(v49, "setMasksToBounds:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BKClassicScrubberTrack setBackgroundColor:](self, "setBackgroundColor:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberTrack trackBackgroundColor](self, "trackBackgroundColor"));
  if (v54)
  {
    p_trackBackgroundView = &self->_trackBackgroundView;
    -[UIView setBackgroundColor:](self->_trackBackgroundView, "setBackgroundColor:", v54);
  }
  else
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.7, 1.0));
    p_trackBackgroundView = &self->_trackBackgroundView;
    -[UIView setBackgroundColor:](self->_trackBackgroundView, "setBackgroundColor:", v56);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberTrack trackForegroundColor](self, "trackForegroundColor"));
  if (v57)
  {
    -[UIView setBackgroundColor:](self->_progressView, "setBackgroundColor:", v57);
  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKClassicScrubberTrack tintColor](self, "tintColor"));
    -[UIView setBackgroundColor:](self->_progressView, "setBackgroundColor:", v58);

  }
  if (self->super._modern)
  {
    v59 = 0.0;
    if (self->super._loadingProgress < 1.0)
      v59 = 1.0;
    -[UIView setAlpha:](self->_progressView, "setAlpha:", v59);
  }
  if (!-[BKScrubberTrack trackOrientation](self, "trackOrientation"))
  {
    v67 = -[BKScrubberTrack layoutDirection](self, "layoutDirection");
    if (v67 == 1)
    {
      if (v33 == 1.0)
      {
        v91.origin.x = x;
        v91.origin.y = v13;
        v91.size.width = width;
        v91.size.height = height;
        v71 = (1.0 - v78) * CGRectGetWidth(v91);
        v72 = roundf(v71);
        v66 = v72;
        if (self->super._roundEndCaps)
          v73 = width;
        else
          v73 = v72;
        v92.origin.x = x;
        v92.origin.y = v13;
        v92.size.width = width;
        v92.size.height = height;
        v65 = CGRectGetWidth(v92) - v66;
      }
      else
      {
        v93.origin.x = x;
        v93.origin.y = v13;
        v93.size.width = width;
        v93.size.height = height;
        v76 = v33 * CGRectGetWidth(v93);
        v73 = roundf(v76);
        v94.origin.x = x;
        v94.origin.y = v13;
        v94.size.width = width;
        v94.size.height = height;
        v77 = CGRectGetWidth(v94);
        v95.origin.x = x;
        v95.origin.y = v13;
        v95.size.width = v73;
        v95.size.height = height;
        v66 = x;
        x = v77 - CGRectGetWidth(v95);
        v65 = 0.0;
      }
      v62 = height;
      width = v73;
      goto LABEL_61;
    }
    if (!v67)
    {
      v87.origin.x = x;
      v87.origin.y = v13;
      v87.size.width = width;
      v87.size.height = height;
      v68 = CGRectGetWidth(v87);
      if (v33 == 1.0)
      {
        v69 = v78 * v68;
        v65 = roundf(v69);
        if (!self->super._roundEndCaps)
        {
          v88.origin.x = x;
          v88.origin.y = v13;
          v88.size.width = width;
          v88.size.height = height;
          v70 = CGRectGetWidth(v88);
          v89.origin.x = x;
          v89.origin.y = v13;
          v89.size.width = v65;
          v89.size.height = height;
          width = v70 - CGRectGetWidth(v89);
          v90.origin.x = x;
          v90.origin.y = v13;
          v90.size.width = v65;
          v90.size.height = height;
          v66 = x;
          v62 = height;
          v64 = v13;
          x = CGRectGetWidth(v90);
          goto LABEL_62;
        }
      }
      else
      {
        v75 = v33 * v68;
        width = roundf(v75);
        v65 = 0.0;
      }
      v62 = height;
      goto LABEL_60;
    }
    goto LABEL_52;
  }
  if (-[BKScrubberTrack trackOrientation](self, "trackOrientation") != 1)
  {
LABEL_52:
    v62 = height;
    goto LABEL_59;
  }
  v83.origin.x = x;
  v83.origin.y = v13;
  v83.size.width = width;
  v83.size.height = height;
  v60 = CGRectGetHeight(v83);
  if (v33 != 1.0)
  {
    v74 = v33 * v60;
    height = roundf(v74);
    v62 = 0.0;
    goto LABEL_59;
  }
  v61 = v78 * v60;
  v62 = roundf(v61);
  if (self->super._roundEndCaps)
  {
LABEL_59:
    v65 = width;
LABEL_60:
    v66 = x;
LABEL_61:
    v64 = v13;
    goto LABEL_62;
  }
  v84.origin.x = x;
  v84.origin.y = v13;
  v84.size.width = width;
  v84.size.height = height;
  v63 = CGRectGetHeight(v84);
  v85.origin.x = x;
  v85.origin.y = v13;
  v85.size.width = width;
  v85.size.height = v62;
  height = v63 - CGRectGetHeight(v85);
  v86.origin.x = x;
  v86.origin.y = v13;
  v86.size.width = width;
  v86.size.height = v62;
  v64 = CGRectGetHeight(v86);
  v65 = width;
  v66 = x;
LABEL_62:
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[UIView setFrame:](*p_trackBackgroundView, "setFrame:", x, v64, width, height);
  -[UIView setFrame:](self->_progressView, "setFrame:", v66, v13, v65, v62);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)layoutSubviews
{
  double v3;
  double v4;

  -[BKClassicScrubberTrack bounds](self, "bounds");
  -[BKClassicScrubberTrack _updateTrackForSize:](self, "_updateTrackForSize:", v3, v4);
}

- (void)setTrackBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKClassicScrubberTrack;
  -[BKScrubberTrack setTrackBackgroundColor:](&v4, "setTrackBackgroundColor:", a3);
  -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTrackForegroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKClassicScrubberTrack;
  -[BKScrubberTrack setTrackForegroundColor:](&v4, "setTrackForegroundColor:", a3);
  -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLayoutDirection:(int64_t)a3
{
  objc_super v5;

  if (-[BKScrubberTrack layoutDirection](self, "layoutDirection") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setLayoutDirection:](&v5, "setLayoutDirection:", a3);
    -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLoadingProgress:(double)a3
{
  objc_super v4;

  if (self->super._loadingProgress != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setLoadingProgress:](&v4, "setLoadingProgress:");
    -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setReadingProgress:(double)a3
{
  objc_super v4;

  if (self->super._readingProgress != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setReadingProgress:](&v4, "setReadingProgress:");
    -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setThickness:(double)a3
{
  objc_super v4;

  if (self->super._thickness != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setThickness:](&v4, "setThickness:");
    -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRoundEndCaps:(BOOL)a3
{
  objc_super v4;

  if (self->super._roundEndCaps != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)BKClassicScrubberTrack;
    -[BKScrubberTrack setRoundEndCaps:](&v4, "setRoundEndCaps:");
    -[BKClassicScrubberTrack setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (UIView)trackBackgroundView
{
  return self->_trackBackgroundView;
}

- (void)setTrackBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_trackBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
