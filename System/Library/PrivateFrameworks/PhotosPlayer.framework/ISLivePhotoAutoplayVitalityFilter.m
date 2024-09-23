@implementation ISLivePhotoAutoplayVitalityFilter

- (void)setScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setEstimatedScrollEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, a3);
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setDecelerating:(BOOL)a3
{
  self->_isDecelerating = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setTargetVisibilityOffset:(double)a3
{
  self->_targetVisibilityOffset = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setHasTargetVisibilityOffset:(BOOL)a3
{
  self->_hasTargetVisibilityOffset = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setVisibilityOffset:(double)a3
{
  self->_visibilityOffset = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)setVisible:(BOOL)a3
{
  self->_isVisible = a3;
  -[ISLivePhotoVitalityFilter invalidateOutput](self, "invalidateOutput");
}

- (void)updateOutput
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ISLivePhotoAutoplayVitalityFilter;
  -[ISLivePhotoVitalityFilter updateOutput](&v15, sel_updateOutput);
  v3 = -[ISLivePhotoAutoplayVitalityFilter isScrolling](self, "isScrolling");
  v4 = -[ISLivePhotoAutoplayVitalityFilter isVisible](self, "isVisible");
  v5 = v4;
  if (!v3 && v4)
    -[ISLivePhotoAutoplayVitalityFilter _setState:](self, "_setState:", 0);
  if (!v5)
  {
    v9 = 1;
LABEL_19:
    -[ISLivePhotoAutoplayVitalityFilter _setState:](self, "_setState:", v9);
    return;
  }
  v6 = -[ISLivePhotoAutoplayVitalityFilter isDecelerating](self, "isDecelerating");
  v7 = v3 && !v6;
  if (-[ISLivePhotoAutoplayVitalityFilter _state](self, "_state") == 1 && (v7 & 1) == 0)
  {
    if (v6 && -[ISLivePhotoAutoplayVitalityFilter hasTargetVisibilityOffset](self, "hasTargetVisibilityOffset"))
      -[ISLivePhotoAutoplayVitalityFilter targetVisibilityOffset](self, "targetVisibilityOffset");
    else
      -[ISLivePhotoAutoplayVitalityFilter visibilityOffset](self, "visibilityOffset");
    v10 = fmin(fabs(v8), 1.0);
    -[ISLivePhotoVitalityFilter settings](self, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minimumVisibilityFactor");
    v13 = 1.0 - v12;

    if (v10 < v13)
      -[ISLivePhotoAutoplayVitalityFilter _setState:](self, "_setState:", 2);
  }
  if (-[ISLivePhotoAutoplayVitalityFilter _state](self, "_state"))
    v14 = 1;
  else
    v14 = v3;
  if (((v14 | v6 | v7) & 1) == 0)
  {
    v9 = 2;
    goto LABEL_19;
  }
}

- (void)_setState:(int64_t)a3
{
  int64_t state;

  state = self->__state;
  if (state != a3)
  {
    self->__state = a3;
    if ((unint64_t)a3 >= 2)
    {
      if (a3 != 2 || state != 1)
        return;
      a3 = 2;
    }
    -[ISLivePhotoVitalityFilter setState:](self, "setState:", a3);
  }
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

- (int64_t)_state
{
  return self->__state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedScrollEndDate, 0);
}

@end
