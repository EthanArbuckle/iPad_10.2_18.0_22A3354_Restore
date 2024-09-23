@implementation _UIPageControlInteractor

- (void)updateScrubLowerBound:(double)a3 upperBound:(double)a4
{
  self->_lowerBound = a3;
  self->_upperBound = a4;
}

- (void)setUnconstrainedPosition:(double)a3 offset:(double)a4
{
  void *v6;
  double v7;

  v7 = a3;
  -[_UIPageControlInteractor interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_copyUnconstrainedPoint:", &v7);

  self->_scrubbingOffset = a4;
}

- (double)joggingDistance
{
  void *v3;
  double v4;
  void *v5;
  double v6;

  -[_UIPageControlInteractor interactor](self, "interactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)objc_msgSend(v3, "_constrainedPoint");
  -[_UIPageControlInteractor interactor](self, "interactor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 - *(double *)objc_msgSend(v5, "_closestPoint");

  return v6;
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (void)updateRubberbandLowerBound:(double)a3 upperBound:(double)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[_UIPageControlInteractor interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_region");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66___UIPageControlInteractor_updateRubberbandLowerBound_upperBound___block_invoke;
  v10[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v10[4] = a3;
  objc_msgSend(v8, "_mutateMinimumPoint:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66___UIPageControlInteractor_updateRubberbandLowerBound_upperBound___block_invoke_2;
  v9[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v9[4] = a4;
  objc_msgSend(v8, "_mutateMaximumPoint:", v9);

}

- (_UIPageControlInteractor)initWithMaximumDistance:(double)a3
{
  _UIPageControlInteractor *v4;
  _UIHyperConstantExtender *v5;
  _UIHyperInteractor *v6;
  _UIHyperrectangle *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIPageControlInteractor;
  v4 = -[_UIPageControlInteractor init](&v11, sel_init);
  if (v4)
  {
    v5 = -[_UIHyperConstantExtender initWithDimensions:]([_UIHyperConstantExtender alloc], "initWithDimensions:", 1);
    -[_UIHyperConstantExtender _setMaximumDistance:](v5, "_setMaximumDistance:", a3);
    v6 = -[_UIHyperInteractor initWithDimensions:]([_UIHyperInteractor alloc], "initWithDimensions:", 1);
    -[_UIPageControlInteractor setInteractor:](v4, "setInteractor:", v6);

    v7 = -[_UIHyperrectangle initWithDimensions:]([_UIHyperrectangle alloc], "initWithDimensions:", 1);
    -[_UIPageControlInteractor interactor](v4, "interactor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setRegion:", v7);

    -[_UIPageControlInteractor interactor](v4, "interactor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setExtender:", v5);

  }
  return v4;
}

- (void)setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_interactor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactor, 0);
}

- (double)unconstrainedPosition
{
  void *v2;
  double v3;

  -[_UIPageControlInteractor interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)objc_msgSend(v2, "_translatedUnconstrainedPoint");

  return v3;
}

- (double)hyperConstrainedPosition
{
  void *v2;
  double v3;

  -[_UIPageControlInteractor interactor](self, "interactor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)objc_msgSend(v2, "_constrainedPoint");

  return v3;
}

- (double)boundedScrubPosition
{
  double lowerBound;
  double v4;

  lowerBound = self->_lowerBound;
  -[_UIPageControlInteractor unboundedScrubPosition](self, "unboundedScrubPosition");
  return fmax(lowerBound, fmin(v4, self->_upperBound));
}

- (double)unboundedScrubPosition
{
  double v3;

  -[_UIPageControlInteractor unconstrainedPosition](self, "unconstrainedPosition");
  return v3 + self->_scrubbingOffset;
}

- (void)setTranslation:(double)a3 velocity:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double scrubbingOffset;
  double v9;
  double v10;
  double upperBound;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  -[_UIPageControlInteractor interactor](self, "interactor", *(_QWORD *)&a4, *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_copyTranslation:", &v15);

  -[_UIPageControlInteractor interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_copyVelocity:", &v14);

  -[_UIPageControlInteractor unboundedScrubPosition](self, "unboundedScrubPosition");
  scrubbingOffset = self->_scrubbingOffset;
  if (scrubbingOffset < 0.0 && v7 < self->_lowerBound)
  {
    -[_UIPageControlInteractor unconstrainedPosition](self, "unconstrainedPosition");
    v10 = self->_scrubbingOffset - (scrubbingOffset + v9 - self->_lowerBound);
    self->_scrubbingOffset = v10;
    if (v10 <= 0.0)
      return;
LABEL_8:
    self->_scrubbingOffset = 0.0;
    return;
  }
  if (scrubbingOffset > 0.0)
  {
    upperBound = self->_upperBound;
    if (v7 > upperBound)
    {
      -[_UIPageControlInteractor unconstrainedPosition](self, "unconstrainedPosition");
      v13 = self->_scrubbingOffset - (scrubbingOffset - (upperBound - v12));
      self->_scrubbingOffset = v13;
      if (v13 < 0.0)
        goto LABEL_8;
    }
  }
}

- (void)commitTranslation
{
  id v2;

  -[_UIPageControlInteractor interactor](self, "interactor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_commitTranslation");

}

- (void)reduceScrubOffsetByRatio:(double)a3
{
  self->_scrubbingOffset = self->_scrubbingOffset / a3;
}

- (void)reduceScrubOffsetByOffset:(double)a3
{
  double scrubbingOffset;
  double v4;

  scrubbingOffset = self->_scrubbingOffset;
  if (scrubbingOffset >= 0.0)
  {
    if (scrubbingOffset <= 0.0)
      return;
    v4 = fmax(scrubbingOffset - a3, 0.0);
  }
  else
  {
    v4 = fmin(scrubbingOffset + a3, 0.0);
  }
  self->_scrubbingOffset = v4;
}

@end
