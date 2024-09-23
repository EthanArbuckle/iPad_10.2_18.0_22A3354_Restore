@implementation SXComponentExposureTracking

+ (id)exposureTrackingWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  SXComponentExposureTracking *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[SXComponentExposureTracking initWithComponent:traits:exposureStateChangeBlock:conditionBlock:]([SXComponentExposureTracking alloc], "initWithComponent:traits:exposureStateChangeBlock:conditionBlock:", v11, a4, v10, v9);

  return v12;
}

- (SXComponentExposureTracking)initWithComponent:(id)a3 traits:(unint64_t)a4 exposureStateChangeBlock:(id)a5 conditionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  SXComponentExposureTracking *v13;
  SXComponentExposureTracking *v14;
  uint64_t v15;
  id exposureStateChangeBlock;
  uint64_t v17;
  id conditionBlock;
  uint64_t v19;
  NSDate *lastStateChange;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SXComponentExposureTracking;
  v13 = -[SXComponentExposureTracking init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_componentView, v10);
    v14->_traits = a4;
    v15 = objc_msgSend(v11, "copy");
    exposureStateChangeBlock = v14->_exposureStateChangeBlock;
    v14->_exposureStateChangeBlock = (id)v15;

    v14->_lastObservedVisibilityState = 0;
    v17 = MEMORY[0x219A070A8](v12);
    conditionBlock = v14->_conditionBlock;
    v14->_conditionBlock = (id)v17;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    lastStateChange = v14->_lastStateChange;
    v14->_lastStateChange = (NSDate *)v19;

  }
  return v14;
}

- (void)setMinimumVisibleY:(double)a3
{
  self->_minimumVisibleY = a3;
  -[SXComponentExposureTracking calculateVisibilityFactor](self, "calculateVisibilityFactor");
}

- (void)setMaximumVisibleY:(double)a3
{
  self->_maximumVisibleY = a3;
  -[SXComponentExposureTracking calculateVisibilityFactor](self, "calculateVisibilityFactor");
}

- (void)setLastObservedVisibilityState:(int64_t)a3
{
  NSDate *v4;
  NSDate *lastStateChange;

  self->_lastObservedVisibilityState = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastStateChange = self->_lastStateChange;
  self->_lastStateChange = v4;

}

- (void)calculateVisibilityFactor
{
  void *v3;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;
  CGRect v11;

  -[SXComponentExposureTracking componentView](self, "componentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v10);

  if (Height <= 0.0)
  {
    self->_visibilityFactor = 0.0;
  }
  else
  {
    -[SXComponentExposureTracking maximumVisibleY](self, "maximumVisibleY");
    v6 = v5;
    -[SXComponentExposureTracking minimumVisibleY](self, "minimumVisibleY");
    v8 = v6 - v7;
    -[SXComponentExposureTracking componentView](self, "componentView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    self->_visibilityFactor = v8 / CGRectGetHeight(v11);

  }
}

- (SXComponentView)componentView
{
  return (SXComponentView *)objc_loadWeakRetained((id *)&self->_componentView);
}

- (unint64_t)traits
{
  return self->_traits;
}

- (id)exposureStateChangeBlock
{
  return self->_exposureStateChangeBlock;
}

- (id)conditionBlock
{
  return self->_conditionBlock;
}

- (double)visibilityFactor
{
  return self->_visibilityFactor;
}

- (double)minimumVisibleY
{
  return self->_minimumVisibleY;
}

- (double)maximumVisibleY
{
  return self->_maximumVisibleY;
}

- (int64_t)lastObservedVisibilityState
{
  return self->_lastObservedVisibilityState;
}

- (NSDate)lastStateChange
{
  return self->_lastStateChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastStateChange, 0);
  objc_storeStrong(&self->_conditionBlock, 0);
  objc_storeStrong(&self->_exposureStateChangeBlock, 0);
  objc_destroyWeak((id *)&self->_componentView);
}

@end
