@implementation MTDownloadOfferButton

- (MTDownloadOfferButton)initWithFrame:(CGRect)a3
{
  MTDownloadOfferButton *v3;
  MTDownloadOfferButton *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTDownloadOfferButton;
  v3 = -[MTDownloadOfferButton initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_progress = 0.0;
    v3->_progressType = 0;
    -[MTDownloadOfferButton setDisplayStyle:](v3, "setDisplayStyle:", 0);
    -[MTDownloadOfferButton setDownloadingCenterIconType:](v4, "setDownloadingCenterIconType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTDownloadOfferButton setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[MTDownloadOfferButton setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    -[MTDownloadOfferButton setControlHitOutsets:](v4, "setControlHitOutsets:", 8.0);
    -[MTDownloadOfferButton _updateUI](v4, "_updateUI");
    -[MTDownloadOfferButton sizeToFit](v4, "sizeToFit");
  }
  return v4;
}

- (void)setProgress:(double)a3
{
  int64_t progressType;
  id v6;
  uint64_t v7;

  if (vabdd_f64(self->_progress, a3) > 2.22044605e-16)
  {
    progressType = self->_progressType;
    v6 = -[MTDownloadOfferButton _currentStatus](self, "_currentStatus");
    self->_progress = a3;
    -[MTDownloadOfferButton _logStateChange:oldButtonType:oldStatus:](self, "_logStateChange:oldButtonType:oldStatus:", CFSTR("progress"), progressType, v6, v7);
    -[MTDownloadOfferButton _updateUI](self, "_updateUI");
  }
}

- (void)setProgressType:(int64_t)a3 animated:(BOOL)a4
{
  unsigned __int8 v6;
  int64_t progressType;
  id v8;
  uint64_t v9;
  _QWORD v10[5];

  if (a4)
    v6 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  else
    v6 = 0;
  progressType = self->_progressType;
  if (progressType != a3)
  {
    v8 = -[MTDownloadOfferButton _currentStatus](self, "_currentStatus");
    self->_progressType = a3;
    -[MTDownloadOfferButton _logStateChange:oldButtonType:oldStatus:](self, "_logStateChange:oldButtonType:oldStatus:", CFSTR("buttonType"), progressType, v8, v9);
    if ((v6 & 1) != 0)
    {
      -[MTDownloadOfferButton _updateUI](self, "_updateUI");
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DEC9C;
      v10[3] = &unk_1004A6200;
      v10[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
    }
  }
}

- (void)_updateUI
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;

  v3 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v4 = -[MTDownloadOfferButton _currentStatus](self, "_currentStatus");
  -[MTDownloadOfferButton setControlStatus:animated:](self, "setControlStatus:animated:", v4, v5, v3);
}

- (MusicLibraryAddKeepLocalControlStatus)_currentStatus
{
  int64_t progressType;
  int64_t v4;
  double progress;
  MusicLibraryAddKeepLocalControlStatus result;

  progressType = self->_progressType;
  if ((unint64_t)(progressType - 1) > 3)
  {
    progress = 0.0;
    v4 = 2;
  }
  else
  {
    v4 = progressType + 2;
    progress = self->_progress;
  }
  result.var1 = progress;
  result.var0 = v4;
  return result;
}

- (double)progress
{
  return self->_progress;
}

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

@end
