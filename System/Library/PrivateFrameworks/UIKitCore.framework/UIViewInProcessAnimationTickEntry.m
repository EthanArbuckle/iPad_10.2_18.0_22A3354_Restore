@implementation UIViewInProcessAnimationTickEntry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

- (id)callback
{
  return self->_callback;
}

- (UIViewInProcessAnimationTickEntry)initWithPreferredFrameRateRange:(CAFrameRateRange)a3 updateReason:(unsigned int)a4 velocityUsableForVFD:(BOOL)a5 callback:(id)a6
{
  float preferred;
  float maximum;
  float minimum;
  id v12;
  UIViewInProcessAnimationTickEntry *v13;
  UIViewInProcessAnimationTickEntry *v14;
  void *v15;
  id callback;
  objc_super v18;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UIViewInProcessAnimationTickEntry;
  v13 = -[UIViewInProcessAnimationTickEntry init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_preferredFrameRateRange.minimum = minimum;
    v13->_preferredFrameRateRange.maximum = maximum;
    v13->_preferredFrameRateRange.preferred = preferred;
    v13->_updateReason = a4;
    v13->_velocityUsableForVFD = a5;
    v15 = _Block_copy(v12);
    callback = v14->_callback;
    v14->_callback = v15;

  }
  return v14;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  preferred = self->_preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)updateReason
{
  return self->_updateReason;
}

- (BOOL)allowsVFD
{
  return self->_velocityUsableForVFD
      || self->_preferredFrameRateRange.preferred == *(float *)(MEMORY[0x1E0CD23C0] + 8);
}

- (BOOL)isvelocityUsableForVFD
{
  return self->_velocityUsableForVFD;
}

@end
