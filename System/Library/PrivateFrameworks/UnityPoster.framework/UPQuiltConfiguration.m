@implementation UPQuiltConfiguration

- (UPQuiltConfiguration)initWithRandomizationSeedValue:(unint64_t)a3 viewport:(CGRect)a4 timeBounds:(CGRect)a5 lineVariance:(double)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  UPQuiltConfiguration *v15;
  UPQuiltConfiguration *v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)UPQuiltConfiguration;
  v15 = -[UPQuiltConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[UPQuiltConfiguration setRandomizationSeedValue:](v15, "setRandomizationSeedValue:", a3);
    -[UPQuiltConfiguration setViewport:](v16, "setViewport:", v13, v12, v11, v10);
    -[UPQuiltConfiguration setTimeBounds:](v16, "setTimeBounds:", x, y, width, height);
    -[UPQuiltConfiguration setLineVariance:](v16, "setLineVariance:", a6);
    -[UPQuiltConfiguration initRandomizer](v16);
  }
  return v16;
}

- (void)initRandomizer
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "randomizer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "randomizer");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "reset");
    }
    else
    {
      +[UPSeededRandomizer randomizerWithSeedValue:](UPSeededRandomizer, "randomizerWithSeedValue:", objc_msgSend(a1, "randomizationSeedValue"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setRandomizer:");
    }

  }
}

- (unint64_t)randomizationSeedValue
{
  return self->_randomizationSeedValue;
}

- (void)setRandomizationSeedValue:(unint64_t)a3
{
  self->_randomizationSeedValue = a3;
}

- (UPSeededRandomizer)randomizer
{
  return self->_randomizer;
}

- (void)setRandomizer:(id)a3
{
  objc_storeStrong((id *)&self->_randomizer, a3);
}

- (CGRect)viewport
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewport.origin.x;
  y = self->_viewport.origin.y;
  width = self->_viewport.size.width;
  height = self->_viewport.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setViewport:(CGRect)a3
{
  self->_viewport = a3;
}

- (CGRect)timeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeBounds.origin.x;
  y = self->_timeBounds.origin.y;
  width = self->_timeBounds.size.width;
  height = self->_timeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTimeBounds:(CGRect)a3
{
  self->_timeBounds = a3;
}

- (double)lineVariance
{
  return self->_lineVariance;
}

- (void)setLineVariance:(double)a3
{
  self->_lineVariance = a3;
}

- (BOOL)isSnapshotConfiguration
{
  return self->_isSnapshotConfiguration;
}

- (void)setIsSnapshotConfiguration:(BOOL)a3
{
  self->_isSnapshotConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomizer, 0);
}

@end
