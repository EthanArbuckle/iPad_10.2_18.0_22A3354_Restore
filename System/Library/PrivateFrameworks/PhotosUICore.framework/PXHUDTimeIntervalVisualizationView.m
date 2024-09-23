@implementation PXHUDTimeIntervalVisualizationView

- (PXHUDTimeIntervalVisualizationView)initWithFrame:(CGRect)a3
{
  PXHUDTimeIntervalVisualizationView *v3;
  UILabel *v4;
  UILabel *titleAndTimeLabel;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHUDTimeIntervalVisualizationView;
  v3 = -[PXHUDTimeIntervalVisualizationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleAndTimeLabel = v3->_titleAndTimeLabel;
    v3->_titleAndTimeLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleAndTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1438]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleAndTimeLabel, "setFont:", v6);

    -[PXHUDTimeIntervalVisualizationView addSubview:](v3, "addSubview:", v3->_titleAndTimeLabel);
    PXHUDCenterViewInSuperview(v3->_titleAndTimeLabel);
  }
  return v3;
}

- (void)visualizationDidUpdate
{
  -[PXHUDTimeIntervalVisualizationView _updateTimer](self, "_updateTimer");
  -[PXHUDTimeIntervalVisualizationView _updateTitleAndTimeLabel](self, "_updateTitleAndTimeLabel");
}

- (void)dealloc
{
  NSTimer *timer;
  objc_super v4;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXHUDTimeIntervalVisualizationView;
  -[PXHUDTimeIntervalVisualizationView dealloc](&v4, sel_dealloc);
}

- (void)_updateTimer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!self->_timer)
    goto LABEL_4;
  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 != 1)
  {
    -[PXHUDTimeIntervalVisualizationView _cleanupTimer](self, "_cleanupTimer");
    return;
  }
  if (!self->_timer)
  {
LABEL_4:
    -[PXHUDAbstractVisualizationView visualization](self, "visualization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeInterval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 1)
      -[PXHUDTimeIntervalVisualizationView _setupTimer](self, "_setupTimer");
  }
}

- (void)_setupTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *timer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_timer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__PXHUDTimeIntervalVisualizationView__setupTimer__block_invoke;
    v6[3] = &unk_1E5141230;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 0.1);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanupTimer
{
  NSTimer *timer;
  NSTimer *v4;

  timer = self->_timer;
  if (timer)
  {
    -[NSTimer invalidate](timer, "invalidate");
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_updateTitleAndTimeLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %.2f"), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleAndTimeLabel, "setText:", v9);

  -[PXHUDAbstractVisualizationView visualization](self, "visualization");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleAndTimeLabel, "setTextColor:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_titleAndTimeLabel, 0);
}

void __49__PXHUDTimeIntervalVisualizationView__setupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerTick");

}

@end
