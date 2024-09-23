@implementation _UIProgressView

- (_UIProgressView)init
{
  return -[_UIProgressView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 65.0, 65.0);
}

- (void)dealloc
{
  NSProgress *trackedProgress;
  objc_super v4;

  trackedProgress = self->_trackedProgress;
  if (trackedProgress)
    -[NSProgress removeObserver:forKeyPath:](trackedProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
  v4.receiver = self;
  v4.super_class = (Class)_UIProgressView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (_UIProgressView)initWithFrame:(CGRect)a3
{
  _UIProgressView *v3;
  _UICircleProgressView *v4;
  uint64_t v5;
  _UICircleProgressView *progressView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIProgressView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, 65.0, 65.0);
  if (v3)
  {
    v4 = [_UICircleProgressView alloc];
    -[UIView frame](v3, "frame");
    v5 = -[_UICircleProgressView initWithFrame:](v4, "initWithFrame:");
    progressView = v3->_progressView;
    v3->_progressView = (_UICircleProgressView *)v5;

    -[_UICircleProgressView setShowProgressTray:](v3->_progressView, "setShowProgressTray:", 1);
    -[_UICircleProgressView setProgressLineWidth:](v3->_progressView, "setProgressLineWidth:", 3.0);
    -[UIView addSubview:](v3, "addSubview:", v3->_progressView);
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 65.0;
  v3 = 65.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTrackedProgress:(id)a3
{
  NSProgress *v4;
  NSProgress *trackedProgress;
  NSProgress *v6;
  NSProgress *v7;

  v4 = (NSProgress *)a3;
  trackedProgress = self->_trackedProgress;
  if (trackedProgress)
  {
    -[NSProgress removeObserver:forKeyPath:](trackedProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    v6 = self->_trackedProgress;
  }
  else
  {
    v6 = 0;
  }
  self->_trackedProgress = v4;
  v7 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](self->_trackedProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, 0);
  -[_UIProgressView _updateProgressValue](self, "_updateProgressValue");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___UIProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateProgressValue
{
  -[NSProgress fractionCompleted](self->_trackedProgress, "fractionCompleted");
  -[_UICircleProgressView setProgress:animated:completion:](self->_progressView, "setProgress:animated:completion:", 1, 0);
}

- (NSProgress)trackedProgress
{
  return self->_trackedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
