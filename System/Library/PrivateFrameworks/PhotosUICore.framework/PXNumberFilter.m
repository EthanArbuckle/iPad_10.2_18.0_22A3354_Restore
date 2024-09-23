@implementation PXNumberFilter

- (PXNumberFilter)initWithInput:(double)a3
{
  PXNumberFilter *v4;
  PXNumberFilter *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXNumberFilter;
  v4 = -[PXNumberFilter init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_input = a3;
    -[PXNumberFilter initialOutputForInput:](v4, "initialOutputForInput:", a3);
    v5->_output = v6;
  }
  return v5;
}

- (PXNumberFilter)init
{
  return -[PXNumberFilter initWithInput:](self, "initWithInput:", 0.0);
}

- (double)updatedOutput
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNumberFilter.m"), 44, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXNumberFilter updatedOutput]", v6);

  abort();
}

- (void)_setOutput:(double)a3
{
  if (self->_output != a3)
  {
    self->_output = a3;
    -[PXNumberFilter signalChange:](self, "signalChange:", 2);
  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXNumberFilter;
  -[PXNumberFilter performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXNumberFilter;
  -[PXNumberFilter didPerformChanges](&v3, sel_didPerformChanges);
  -[PXNumberFilter _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_setLastTime:(double)a3
{
  self->_lastTime = a3;
}

- (void)setInput:(double)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    -[PXNumberFilter signalChange:](self, "signalChange:", 1);
    -[PXNumberFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    -[PXNumberFilter _invalidateOutput](self, "_invalidateOutput");
  }
}

- (double)currentTime
{
  double result;

  -[PXNumberFilter time](self, "time");
  if (result == 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)invalidateOutput
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__PXNumberFilter_invalidateOutput__block_invoke;
  v2[3] = &unk_1E51222D8;
  v2[4] = self;
  -[PXNumberFilter performChanges:](self, "performChanges:", v2);
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)_setNeedsUpdate
{
  -[PXNumberFilter signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXNumberFilter _needsUpdate](self, "_needsUpdate"))
  {
    -[PXNumberFilter _updateOutputIfNeeded](self, "_updateOutputIfNeeded");
    if (-[PXNumberFilter _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNumberFilter.m"), 131, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  -[PXNumberFilter _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateOutputIfNeeded
{
  double v3;
  double v4;

  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    -[PXNumberFilter currentTime](self, "currentTime");
    v4 = v3;
    -[PXNumberFilter updatedOutput](self, "updatedOutput");
    -[PXNumberFilter _setOutput:](self, "_setOutput:");
    -[PXNumberFilter _setLastTime:](self, "_setLastTime:", v4);
  }
}

- (double)input
{
  return self->_input;
}

- (double)time
{
  return self->_time;
}

- (double)output
{
  return self->_output;
}

- (double)lastTime
{
  return self->_lastTime;
}

uint64_t __34__PXNumberFilter_invalidateOutput__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateOutput");
}

@end
