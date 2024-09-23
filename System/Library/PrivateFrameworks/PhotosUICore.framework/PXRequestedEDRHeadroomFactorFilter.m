@implementation PXRequestedEDRHeadroomFactorFilter

- (PXRequestedEDRHeadroomFactorFilter)initWithInput:(double)a3
{
  PXRequestedEDRHeadroomFactorFilter *v4;
  PXRequestedEDRHeadroomFactorFilter *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXRequestedEDRHeadroomFactorFilter;
  v4 = -[PXNumberFilter initWithInput:](&v9, sel_initWithInput_);
  v5 = v4;
  if (v4)
  {
    v4->_highValue = a3;
    v4->_lastDecreaseTime = -1.79769313e308;
    +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "EDRHeadroomRequestSustainDuration");
    v5->_sustainDuration = v7;

  }
  return v5;
}

- (void)setInput:(double)a3
{
  double v5;
  double v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXRequestedEDRHeadroomFactorFilter;
  -[PXNumberFilter setInput:](&v11, sel_setInput_);
  -[PXRequestedEDRHeadroomFactorFilter highValue](self, "highValue");
  if (v5 <= a3)
  {
    -[PXRequestedEDRHeadroomFactorFilter setHighValue:](self, "setHighValue:", a3);
    -[PXRequestedEDRHeadroomFactorFilter setLastDecreaseTime:](self, "setLastDecreaseTime:", -1.79769313e308);
  }
  else if (!-[PXRequestedEDRHeadroomFactorFilter isPaused](self, "isPaused"))
  {
    -[PXNumberFilter currentTime](self, "currentTime");
    -[PXRequestedEDRHeadroomFactorFilter setLastDecreaseTime:](self, "setLastDecreaseTime:");
    objc_initWeak(&location, self);
    -[PXRequestedEDRHeadroomFactorFilter sustainDuration](self, "sustainDuration");
    v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PXRequestedEDRHeadroomFactorFilter_setInput___block_invoke;
    v8[3] = &unk_1E5148D30;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (double)updatedOutput
{
  double v3;
  double v4;
  double result;

  -[PXNumberFilter output](self, "output");
  v4 = v3;
  if (-[PXRequestedEDRHeadroomFactorFilter isPaused](self, "isPaused"))
    return v4;
  -[PXNumberFilter input](self, "input");
  return result;
}

- (BOOL)isPaused
{
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;

  -[PXRequestedEDRHeadroomFactorFilter lastDecreaseTime](self, "lastDecreaseTime");
  v4 = v3;
  if (v3 == -1.79769313e308)
    return 0;
  -[PXNumberFilter currentTime](self, "currentTime");
  if (v5 < v4)
    return 0;
  v7 = v5;
  -[PXRequestedEDRHeadroomFactorFilter sustainDuration](self, "sustainDuration");
  return v7 < v4 + v8;
}

- (double)sustainDuration
{
  return self->_sustainDuration;
}

- (void)setSustainDuration:(double)a3
{
  self->_sustainDuration = a3;
}

- (double)highValue
{
  return self->_highValue;
}

- (void)setHighValue:(double)a3
{
  self->_highValue = a3;
}

- (double)lastDecreaseTime
{
  return self->_lastDecreaseTime;
}

- (void)setLastDecreaseTime:(double)a3
{
  self->_lastDecreaseTime = a3;
}

void __47__PXRequestedEDRHeadroomFactorFilter_setInput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateOutput");

}

@end
