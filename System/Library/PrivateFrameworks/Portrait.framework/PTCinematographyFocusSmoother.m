@implementation PTCinematographyFocusSmoother

- (PTCinematographyFocusSmoother)init
{
  PTCinematographyFocusSmoother *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTCinematographyFocusSmoother;
  result = -[PTCinematographyFocusSmoother init](&v3, sel_init);
  if (result)
    result->_minSamplesNeeded = 30;
  return result;
}

- (void)addSample:(float)a3
{
  unint64_t v5;
  MutableFloatArray *v6;
  MutableFloatArray *cachedSamples;
  double v8;
  MutableFloatArray *v9;

  if (self->_didEndSamples || (v9 = self->_cachedSamples) == 0)
  {
    v5 = 60 - self->_minSamplesNeeded;
    v6 = -[MutableFloatArray initWithCount:capacity:]([MutableFloatArray alloc], "initWithCount:capacity:", v5, 118);
    cachedSamples = self->_cachedSamples;
    self->_cachedSamples = v6;

    *(float *)&v8 = a3;
    -[MutableFloatArray setFloat:inRange:](self->_cachedSamples, "setFloat:inRange:", 0, v5, v8);
    self->_unprocessedSampleCount = 1;
    self->_didEndSamples = 0;
  }
  else
  {
    -[MutableFloatArray appendFloat:](v9, "appendFloat:", *(double *)&a3);
    ++self->_unprocessedSampleCount;
  }
}

- (void)endSamples
{
  -[PTCinematographyFocusSmoother _padToFill](self, "_padToFill");
  self->_didEndSamples = 1;
}

- (BOOL)isEndOfSmoothedSamples
{
  if (self->_didEndSamples)
    return !-[PTCinematographyFocusSmoother isSmoothedSampleAvailable](self, "isSmoothedSampleAvailable");
  else
    return 0;
}

- (BOOL)isSmoothedSampleAvailable
{
  return self->_unprocessedSampleCount && -[FloatArray count](self->_cachedSamples, "count") > 0x3A;
}

- (float)nextSmoothedSample
{
  float v3;
  float v4;

  if (!-[PTCinematographyFocusSmoother isSmoothedSampleAvailable](self, "isSmoothedSampleAvailable"))
    return 0.0;
  -[PTCinematographyFocusSmoother _getSmoothedSample](self, "_getSmoothedSample");
  v4 = v3;
  -[PTCinematographyFocusSmoother _advanceToNextSmoothedSample](self, "_advanceToNextSmoothedSample");
  return v4;
}

- (PTCinematographyFocusSmoother)lastFocusSmoother
{
  PTCinematographyFocusSmoother *v2;
  void *v3;
  PTCinematographyFocusSmoother *v4;
  void *v5;

  v2 = self;
  -[PTCinematographyFocusSmoother nextFocusSmoother](v2, "nextFocusSmoother");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[PTCinematographyFocusSmoother nextFocusSmoother](v2, "nextFocusSmoother");
      v4 = (PTCinematographyFocusSmoother *)objc_claimAutoreleasedReturnValue();

      -[PTCinematographyFocusSmoother nextFocusSmoother](v4, "nextFocusSmoother");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (float)_getSmoothedSample
{
  float v2;
  float v4;
  float __C;

  v2 = 0.0;
  if (self->_unprocessedSampleCount)
  {
    if (-[FloatArray count](self->_cachedSamples, "count") >= 0x1E)
    {
      -[MutableFloatArray floatAtIndex:](self->_cachedSamples, "floatAtIndex:", 29);
      v2 = v4;
      __C = v4;
      if (-[FloatArray count](self->_cachedSamples, "count") >= 0x3B)
      {
        vDSP_dotpr(kCoefficients, 1, -[MutableFloatArray floats](self->_cachedSamples, "floats"), 1, &__C, 0x3BuLL);
        return __C;
      }
    }
  }
  return v2;
}

- (void)_advanceToNextSmoothedSample
{
  if (self->_unprocessedSampleCount)
  {
    -[MutableFloatArray removeFromStart:](self->_cachedSamples, "removeFromStart:", 1);
    --self->_unprocessedSampleCount;
    if (self->_didEndSamples)
      -[PTCinematographyFocusSmoother _padToFill](self, "_padToFill");
  }
}

- (void)_padToFill
{
  if (-[FloatArray count](self->_cachedSamples, "count") <= 0x3A)
    -[PTCinematographyFocusSmoother _padByCount:](self, "_padByCount:", 59 - -[FloatArray count](self->_cachedSamples, "count"));
}

- (void)_padByCount:(unint64_t)a3
{
  double v5;
  int v6;

  -[PTCinematographyFocusSmoother _lastAddedSample](self, "_lastAddedSample");
  if (a3)
  {
    v6 = LODWORD(v5);
    do
    {
      LODWORD(v5) = v6;
      -[MutableFloatArray appendFloat:](self->_cachedSamples, "appendFloat:", v5);
      --a3;
    }
    while (a3);
  }
}

- (float)_lastAddedSample
{
  float result;

  if (!-[FloatArray count](self->_cachedSamples, "count"))
    return 0.0;
  -[MutableFloatArray floatAtIndex:](self->_cachedSamples, "floatAtIndex:", -[FloatArray count](self->_cachedSamples, "count") - 1);
  return result;
}

- (unint64_t)minSamplesNeeded
{
  return self->_minSamplesNeeded;
}

- (BOOL)didEndSamples
{
  return self->_didEndSamples;
}

- (PTCinematographyFocusSmoother)nextFocusSmoother
{
  return (PTCinematographyFocusSmoother *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNextFocusSmoother:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MutableFloatArray)cachedSamples
{
  return (MutableFloatArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedSamples:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)unprocessedSampleCount
{
  return self->_unprocessedSampleCount;
}

- (void)setUnprocessedSampleCount:(unint64_t)a3
{
  self->_unprocessedSampleCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSamples, 0);
  objc_storeStrong((id *)&self->_nextFocusSmoother, 0);
}

@end
