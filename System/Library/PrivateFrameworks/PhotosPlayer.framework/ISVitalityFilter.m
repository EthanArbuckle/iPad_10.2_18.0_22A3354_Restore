@implementation ISVitalityFilter

- (ISVitalityFilter)init
{
  return -[ISVitalityFilter initWithSettings:](self, "initWithSettings:", 0);
}

- (ISVitalityFilter)initWithSettings:(id)a3
{
  id v5;
  ISVitalityFilter *v6;
  ISVitalityFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISVitalityFilter;
  v6 = -[ISVitalityFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (void)performInputChanges:(id)a3
{
  _BOOL8 v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = -[ISVitalityFilter _isPerformingInputChanges](self, "_isPerformingInputChanges");
  -[ISVitalityFilter _setPerformingInputChanges:](self, "_setPerformingInputChanges:", 1);
  if (v5)
    v5[2](v5);
  -[ISVitalityFilter _setPerformingInputChanges:](self, "_setPerformingInputChanges:", v4);
  if (!v4)
    -[ISVitalityFilter inputDidChange](self, "inputDidChange");

}

- (void)performOutputChanges:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);

  v7 = (void (**)(_QWORD))a3;
  v4 = -[ISVitalityFilter _isPerformingOutputChanges](self, "_isPerformingOutputChanges");
  -[ISVitalityFilter _setPerformingOutputChanges:](self, "_setPerformingOutputChanges:", 1);
  if (v7)
    v7[2](v7);
  -[ISVitalityFilter _setPerformingOutputChanges:](self, "_setPerformingOutputChanges:", v4);
  if (!v4 && -[ISVitalityFilter _outputDidChange](self, "_outputDidChange"))
  {
    -[ISVitalityFilter _setOutputDidChange:](self, "_setOutputDidChange:", 0);
    -[ISVitalityFilter outputChangeHandler](self, "outputChangeHandler");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, ISVitalityFilter *))(v5 + 16))(v5, self);

  }
}

- (void)_invalidateOutput
{
  -[ISVitalityFilter _setOutputDidChange:](self, "_setOutputDidChange:", 1);
}

- (void)setVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
    self->_isVisible = a3;
}

- (void)setVisibilityOffset:(double)a3
{
  if (self->_visibilityOffset != a3)
    self->_visibilityOffset = a3;
}

- (void)setHasTargetVisibilityOffset:(BOOL)a3
{
  if (self->_hasTargetVisibilityOffset != a3)
    self->_hasTargetVisibilityOffset = a3;
}

- (void)setTargetVisibilityOffset:(double)a3
{
  if (self->_targetVisibilityOffset != a3)
    self->_targetVisibilityOffset = a3;
}

- (void)setEstimatedScrollEndDate:(id)a3
{
  NSDate *v5;
  NSDate **p_estimatedScrollEndDate;
  NSDate *estimatedScrollEndDate;
  NSDate *v8;

  v5 = (NSDate *)a3;
  estimatedScrollEndDate = self->_estimatedScrollEndDate;
  p_estimatedScrollEndDate = &self->_estimatedScrollEndDate;
  if (estimatedScrollEndDate != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_estimatedScrollEndDate, a3);
    v5 = v8;
  }

}

- (void)setScrolling:(BOOL)a3
{
  if (self->_isScrolling != a3)
    self->_isScrolling = a3;
}

- (void)setDecelerating:(BOOL)a3
{
  if (self->_isDecelerating != a3)
    self->_isDecelerating = a3;
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    self->_scrubbing = a3;
    -[ISVitalityFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (void)setScrubOffset:(double)a3
{
  if (self->_scrubOffset != a3)
  {
    self->_scrubOffset = a3;
    -[ISVitalityFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (void)setPlayRate:(double)a3
{
  if (self->_playRate != a3)
  {
    self->_playRate = a3;
    -[ISVitalityFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (ISVitalitySettings)settings
{
  return self->_settings;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (double)visibilityOffset
{
  return self->_visibilityOffset;
}

- (BOOL)hasTargetVisibilityOffset
{
  return self->_hasTargetVisibilityOffset;
}

- (double)targetVisibilityOffset
{
  return self->_targetVisibilityOffset;
}

- (NSDate)estimatedScrollEndDate
{
  return self->_estimatedScrollEndDate;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)isDecelerating
{
  return self->_isDecelerating;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (double)scrubOffset
{
  return self->_scrubOffset;
}

- (double)playRate
{
  return self->_playRate;
}

- (id)outputChangeHandler
{
  return self->_outputChangeHandler;
}

- (void)setOutputChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_isPerformingInputChanges
{
  return self->__isPerformingInputChanges;
}

- (void)_setPerformingInputChanges:(BOOL)a3
{
  self->__isPerformingInputChanges = a3;
}

- (BOOL)_isPerformingOutputChanges
{
  return self->__isPerformingOutputChanges;
}

- (void)_setPerformingOutputChanges:(BOOL)a3
{
  self->__isPerformingOutputChanges = a3;
}

- (BOOL)_outputDidChange
{
  return self->__outputDidChange;
}

- (void)_setOutputDidChange:(BOOL)a3
{
  self->__outputDidChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputChangeHandler, 0);
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
