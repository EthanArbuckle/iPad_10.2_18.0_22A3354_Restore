@implementation MusicDownloadProgressView

- (MusicDownloadProgressView)initWithFrame:(CGRect)a3
{
  MusicDownloadProgressView *v3;
  id v4;
  UIView *v5;
  UIView *outerRingView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MusicDownloadProgressView;
  v3 = -[MusicDownloadProgressView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIView);
    -[MusicDownloadProgressView bounds](v3, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    outerRingView = v3->_outerRingView;
    v3->_outerRingView = v5;

    -[UIView setClipsToBounds:](v3->_outerRingView, "setClipsToBounds:", 1);
    -[MusicDownloadProgressView addSubview:](v3, "addSubview:", v3->_outerRingView);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double SafeScaleForValue;
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
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
  void *v29;
  double v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  v32.receiver = self;
  v32.super_class = (Class)MusicDownloadProgressView;
  -[MusicDownloadProgressView layoutSubviews](&v32, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MusicDownloadProgressView traitCollection](self, "traitCollection"));
  SafeScaleForValue = MTMPUFloatGetSafeScaleForValue(objc_msgSend(v3, "displayScale"));
  v30 = SafeScaleForValue;

  -[MusicDownloadProgressView bounds](self, "bounds");
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v9 = CGRectGetWidth(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v10 = CGRectGetHeight(v34);
  if (v9 < v10)
    v10 = v9;
  v31 = v10 * 0.5;
  -[_MusicDownloadProgressRingView setFrame:](self->_progressView, "setFrame:", x, y, width, height);
  -[UIImageView frame](self->_centerImageView, "frame");
  v12 = v11;
  v14 = v13;
  v15 = -[UIImageView sizeThatFits:](self->_centerImageView, "sizeThatFits:", width, height);
  v18 = UIRectCenteredIntegralRectScale(v15, v12, v14, v16, v17, x, y, width, height, SafeScaleForValue);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UIImage alignmentRectInsets](self->_centerImage, "alignmentRectInsets");
  -[UIImageView setFrame:](self->_centerImageView, "setFrame:", v18 + v28, v20 + v25, v22 - (v28 + v26), v24 - (v25 + v27));
  -[UIView setFrame:](self->_outerRingView, "setFrame:", x, y, width, height);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outerRingView, "layer"));
  objc_msgSend(v29, "setCornerRadius:", v31);
  objc_msgSend(v29, "setBorderWidth:", 1.0 / v30 + 2.0);
  -[MusicDownloadProgressView updateOuterRingColor](self, "updateOuterRingColor");

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MusicDownloadProgressView;
  -[MusicDownloadProgressView tintColorDidChange](&v3, "tintColorDidChange");
  -[MusicDownloadProgressView updateOuterRingColor](self, "updateOuterRingColor");
}

- (void)setCenterImage:(id)a3
{
  UIImage *v5;
  UIImage **p_centerImage;
  UIImageView *centerImageView;
  UIImageView *v8;
  UIImageView *v9;
  UIImage *v10;

  v5 = (UIImage *)a3;
  p_centerImage = &self->_centerImage;
  if (self->_centerImage != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    centerImageView = self->_centerImageView;
    if (*p_centerImage)
    {
      if (!centerImageView)
      {
        v8 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v9 = self->_centerImageView;
        self->_centerImageView = v8;

        -[MusicDownloadProgressView addSubview:](self, "addSubview:", self->_centerImageView);
        centerImageView = self->_centerImageView;
      }
      -[UIImageView setHidden:](centerImageView, "setHidden:", 0);
      -[UIImageView setImage:](self->_centerImageView, "setImage:", *p_centerImage);
    }
    else
    {
      -[UIImageView setHidden:](centerImageView, "setHidden:", 1);
    }
    -[MusicDownloadProgressView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setDownloadProgress:(double)a3
{
  int v5;
  _MusicDownloadProgressRingView *progressView;
  _MusicDownloadProgressRingView *v7;
  _QWORD v8[5];

  if ((MTMPUFloatEqualToFloat(self->_downloadProgress, a3) & 1) == 0)
  {
    self->_downloadProgress = a3;
    v5 = MTMPUFloatLessThanOrEqualToFloat(a3, 0.0);
    progressView = self->_progressView;
    if (v5)
    {
      -[_MusicDownloadProgressRingView removeFromSuperview](progressView, "removeFromSuperview");
      v7 = self->_progressView;
      self->_progressView = 0;

    }
    else
    {
      if (!progressView)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = __49__MusicDownloadProgressView_setDownloadProgress___block_invoke;
        v8[3] = &unk_3796A0;
        v8[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
        progressView = self->_progressView;
      }
      -[_MusicDownloadProgressRingView setProgress:](progressView, "setProgress:", self->_downloadProgress);
    }
  }
}

void __49__MusicDownloadProgressView_setDownloadProgress___block_invoke(uint64_t a1)
{
  _MusicDownloadProgressRingView *v2;
  _MusicDownloadProgressRingView *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = [_MusicDownloadProgressRingView alloc];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = -[_MusicDownloadProgressRingView initWithFrame:](v2, "initWithFrame:");
  objc_msgSend(*(id *)(a1 + 32), "setProgressView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "progressView"));
  objc_msgSend(v4, "setProgress:", 0.0);

  v5 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progressView"));
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)updateOuterRingColor
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  -[MusicDownloadProgressView setOuterRingColor:](self, "setOuterRingColor:", v3);

}

- (void)setOuterRingColor:(id)a3
{
  UIView *outerRingView;
  id v4;
  id v5;
  id v6;
  id v7;

  outerRingView = self->_outerRingView;
  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](outerRingView, "layer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setBorderColor:", v6);
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIImageView)centerImageView
{
  return self->_centerImageView;
}

- (void)setCenterImageView:(id)a3
{
  objc_storeStrong((id *)&self->_centerImageView, a3);
}

- (UIView)outerRingView
{
  return self->_outerRingView;
}

- (void)setOuterRingView:(id)a3
{
  objc_storeStrong((id *)&self->_outerRingView, a3);
}

- (_MusicDownloadProgressRingView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);
  objc_storeStrong((id *)&self->_centerImageView, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
}

@end
