@implementation DimmingBehaviour

- (DimmingBehaviour)initWithDimming:(id)a3 threshold:(id)a4
{
  id v6;
  id v7;
  DimmingBehaviour *v8;
  id v9;
  id dimming;
  id v11;
  id threshold;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DimmingBehaviour;
  v8 = -[DimmingBehaviour init](&v14, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dimming = v8->_dimming;
    v8->_dimming = v9;

    v11 = objc_msgSend(v7, "copy");
    threshold = v8->_threshold;
    v8->_threshold = v11;

  }
  return v8;
}

- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4
{
  id v6;
  double (**v7)(_QWORD, _QWORD, double);
  double v8;

  v6 = a3;
  v7 = (double (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue(-[DimmingBehaviour dimming](self, "dimming"));
  v8 = ((double (**)(_QWORD, id, double))v7)[2](v7, v6, a4);

  return v8;
}

- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  unint64_t v6;

  v4 = a3;
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DimmingBehaviour threshold](self, "threshold"));
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  return v6;
}

- (id)dimming
{
  return self->_dimming;
}

- (id)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_threshold, 0);
  objc_storeStrong(&self->_dimming, 0);
}

@end
