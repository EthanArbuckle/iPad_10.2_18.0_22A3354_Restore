@implementation PKSpringAnimationFactory

- (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4
{
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a4;
  -[PKSpringAnimationFactory springAnimationWithKeyPath:](self, "springAnimationWithKeyPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighFrameRateReason:", v4 | 0x210000u);
  LODWORD(v6) = 1117782016;
  LODWORD(v7) = 1123024896;
  LODWORD(v8) = 1123024896;
  objc_msgSend(v5, "setPreferredFrameRateRange:", v6, v7, v8);
  return v5;
}

+ (id)springAnimationWithKeyPath:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ECF22330;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECF22330, &__block_literal_global_40);
  objc_msgSend((id)_MergedGlobals_206, "springAnimationWithKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)springAnimationWithKeyPath:(id)a3
{
  id v3;

  v3 = -[PKSpringAnimationFactory _createSpringAnimationWithKeyPath:](self, "_createSpringAnimationWithKeyPath:", a3);
  objc_msgSend(v3, "setAdditive:", 1);
  return v3;
}

- (id)_createSpringAnimationWithKeyPath:(id)a3
{
  void *v4;
  double v5;
  double speed;

  v4 = -[PKSpringAnimationFactory _createReferenceSpringAnimationWithKeyPath:]((double *)self, (uint64_t)a3);
  v5 = -[PKSpringAnimationFactory _durationWithReferenceSpring:]((uint64_t)self, v4);
  speed = self->_speed;
  *(float *)&speed = speed;
  objc_msgSend(v4, "setSpeed:", speed);
  objc_msgSend(v4, "setTimingFunction:", self->_timing);
  objc_msgSend(v4, "setDuration:", v5);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v4, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  return v4;
}

- (double)_durationWithReferenceSpring:(uint64_t)a1
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      *(_BYTE *)(a1 + 56) = 0;
      if (!v3)
        v4 = -[PKSpringAnimationFactory _createReferenceSpringAnimationWithKeyPath:]((double *)a1, 0);
      objc_msgSend(v4, "durationForEpsilon:", 0.001);
      v6 = v5;
      if (*(_QWORD *)(a1 + 72))
      {
        v7 = *(_QWORD *)(a1 + 48);
        if (v7)
          v6 = fmax((*(double (**)(double, double, double, double, double))(v7 + 16))(*(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a1 + 24), *(double *)(a1 + 32), v5), v5);
      }
      *(double *)(a1 + 40) = v6;
    }
    else
    {
      v6 = *(double *)(a1 + 40);
    }
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (void)_createReferenceSpringAnimationWithKeyPath:(double *)a1
{
  void *v3;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", a1[1]);
  objc_msgSend(v3, "setStiffness:", a1[2]);
  objc_msgSend(v3, "setDamping:", a1[3]);
  objc_msgSend(v3, "setVelocity:", a1[4]);
  return v3;
}

- (double)duration
{
  return -[PKSpringAnimationFactory _durationWithReferenceSpring:]((uint64_t)self, 0);
}

+ (id)createDefaultFactory
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMass:stiffness:damping:", 2.0, 300.0, 400.0);
  PKMagicCurve();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTiming:", v3);

  return v2;
}

- (void)setTiming:(id)a3 withDynamicDurationProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id dynamicDurationProvider;
  id v11;

  v7 = a3;
  if (v7)
  {
    v11 = v7;
    objc_storeStrong((id *)&self->_timing, a3);
    v8 = a4;
    v9 = _Block_copy(v8);

    dynamicDurationProvider = self->_dynamicDurationProvider;
    self->_dynamicDurationProvider = v9;

    v7 = v11;
    self->_needsDurationUpdate = 1;
  }

}

- (void)setTiming:(id)a3
{
  CAMediaTimingFunction *timing;
  id dynamicDurationProvider;

  if (a3)
  {
    -[PKSpringAnimationFactory setTiming:withDynamicDurationProvider:](self, "setTiming:withDynamicDurationProvider:", a3, 0);
  }
  else if (self)
  {
    timing = self->_timing;
    if (timing)
    {
      self->_timing = 0;

      dynamicDurationProvider = self->_dynamicDurationProvider;
      self->_dynamicDurationProvider = 0;

      self->_needsDurationUpdate = 1;
    }
  }
}

- (PKSpringAnimationFactory)initWithSpringState:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  PKSpringAnimationFactory *result;
  objc_super v8;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)PKSpringAnimationFactory;
  result = -[PKSpringAnimationFactory init](&v8, sel_init);
  if (result)
  {
    result->_speed = 1.0;
    result->_state.mass = var0;
    result->_state.stiffness = var1;
    result->_state.damping = var2;
    result->_state.velocity = var3;
    result->_needsDurationUpdate = 1;
  }
  return result;
}

- (PKSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  return -[PKSpringAnimationFactory initWithSpringState:](self, "initWithSpringState:", a3, a4, a5, 0.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKSpringAnimationFactory;
  -[PKSpringAnimationFactory dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong(&self->_dynamicDurationProvider, 0);
}

+ (id)highFrameRateSpringAnimationWithKeyPath:(id)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a4;
  v5 = qword_1ECF22330;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&qword_1ECF22330, &__block_literal_global_40);
  objc_msgSend((id)_MergedGlobals_206, "highFrameRateSpringAnimationWithKeyPath:reason:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setVelocity:(double)a3
{
  if (self->_state.velocity != a3)
  {
    self->_state.velocity = a3;
    self->_needsDurationUpdate = 1;
  }
}

+ (id)sharedDefaultFactory
{
  if (qword_1ECF22330 != -1)
    dispatch_once(&qword_1ECF22330, &__block_literal_global_40);
  return (id)_MergedGlobals_206;
}

+ (double)defaultDuration
{
  if (qword_1ECF22330 != -1)
    dispatch_once(&qword_1ECF22330, &__block_literal_global_40);
  return -[PKSpringAnimationFactory _durationWithReferenceSpring:](_MergedGlobals_206, 0);
}

- (PKSpringAnimationFactory)init
{

  return 0;
}

- (id)copy
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpringAnimationFactory;
  return -[PKSpringAnimationFactory copy](&v3, sel_copy);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  CAMediaTimingFunction *timing;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpringState:", self->_state.mass, self->_state.stiffness, self->_state.damping, self->_state.velocity);
  objc_msgSend(v4, "setSpeed:", self->_speed);
  timing = self->_timing;
  if (timing)
    objc_msgSend(v4, "setTiming:withDynamicDurationProvider:", timing, self->_dynamicDurationProvider);
  return v4;
}

- (void)setSpeed:(double)a3
{
  if (self->_speed != a3)
    self->_speed = a3;
}

- (double)mass
{
  return self->_state.mass;
}

- (void)setMass:(double)a3
{
  if (self->_state.mass != a3)
  {
    self->_state.mass = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)stiffness
{
  return self->_state.stiffness;
}

- (void)setStiffness:(double)a3
{
  if (self->_state.stiffness != a3)
  {
    self->_state.stiffness = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)damping
{
  return self->_state.damping;
}

- (void)setDamping:(double)a3
{
  if (self->_state.damping != a3)
  {
    self->_state.damping = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (double)velocity
{
  return self->_state.velocity;
}

- (double)speed
{
  return self->_speed;
}

- (CAMediaTimingFunction)timing
{
  return self->_timing;
}

@end
