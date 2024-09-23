@implementation _SUICCheckGlyphSpringAnimationFactory

+ (double)defaultDuration
{
  if (_SUICInitializeStaticVariables_onceToken != -1)
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_164);
  return *(double *)&_SUICDefaultSpringAnimationDuration;
}

+ (id)springAnimationWithKeyPath:(id)a3
{
  return (id)objc_msgSend(a1, "springAnimationWithKeyPath:velocity:", a3, 0.0);
}

+ (id)springAnimationWithKeyPath:(id)a3 velocity:(double)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  if (_SUICInitializeStaticVariables_onceToken != -1)
    dispatch_once(&_SUICInitializeStaticVariables_onceToken, &__block_literal_global_164);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v6 = _SUICDefaultSpringAnimationFactoryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___SUICCheckGlyphSpringAnimationFactory_springAnimationWithKeyPath_velocity___block_invoke;
  block[3] = &unk_1E4A54C40;
  v13 = a4;
  v11 = v5;
  v12 = &v14;
  v7 = v5;
  dispatch_sync(v6, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (_SUICCheckGlyphSpringAnimationFactory)init
{
  return -[_SUICCheckGlyphSpringAnimationFactory initWithVelocity:](self, "initWithVelocity:", 0.0);
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3
{
  void *v5;
  _SUICCheckGlyphSpringAnimationFactory *v6;

  objc_msgSend((id)objc_opt_class(), "defaultTimingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SUICCheckGlyphSpringAnimationFactory initWithVelocity:timing:](self, "initWithVelocity:timing:", v5, a3);

  return v6;
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithVelocity:(double)a3 timing:(id)a4
{
  return -[_SUICCheckGlyphSpringAnimationFactory initWithMass:stiffness:damping:velocity:timing:](self, "initWithMass:stiffness:damping:velocity:timing:", a4, 2.0, 300.0, 400.0, a3);
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6
{
  void *v11;
  _SUICCheckGlyphSpringAnimationFactory *v12;

  objc_msgSend((id)objc_opt_class(), "defaultTimingFunction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_SUICCheckGlyphSpringAnimationFactory initWithMass:stiffness:damping:velocity:timing:](self, "initWithMass:stiffness:damping:velocity:timing:", v11, a3, a4, a5, a6);

  return v12;
}

- (_SUICCheckGlyphSpringAnimationFactory)initWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 velocity:(double)a6 timing:(id)a7
{
  id v13;
  _SUICCheckGlyphSpringAnimationFactory *v14;
  _SUICCheckGlyphSpringAnimationFactory *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)_SUICCheckGlyphSpringAnimationFactory;
  v14 = -[_SUICCheckGlyphSpringAnimationFactory init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_mass = a3;
    v14->_stiffness = a4;
    v14->_damping = a5;
    v14->_velocity = a6;
    objc_storeStrong((id *)&v14->_timing, a7);
    v15->_needsDurationUpdate = 1;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_SUICCheckGlyphSpringAnimationFactory;
  -[_SUICCheckGlyphSpringAnimationFactory dealloc](&v2, sel_dealloc);
}

- (id)springAnimationWithKeyPath:(id)a3
{
  void *v3;

  -[_SUICCheckGlyphSpringAnimationFactory _springAnimationWithKeyPath:](self, "_springAnimationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdditive:", 1);
  return v3;
}

- (id)_springAnimationWithKeyPath:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", self->_mass);
  objc_msgSend(v4, "setStiffness:", self->_stiffness);
  objc_msgSend(v4, "setDamping:", self->_damping);
  objc_msgSend(v4, "setVelocity:", self->_velocity);
  objc_msgSend(v4, "setTimingFunction:", self->_timing);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v4, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  -[_SUICCheckGlyphSpringAnimationFactory duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  return v4;
}

- (id)_timingFunctionForAnimation
{
  return self->_timing;
}

- (void)_updateDurationIfNecessary
{
  double v3;
  id v4;

  if (self->_needsDurationUpdate)
  {
    self->_needsDurationUpdate = 0;
    -[_SUICCheckGlyphSpringAnimationFactory _springAnimationWithKeyPath:](self, "_springAnimationWithKeyPath:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "durationForEpsilon:", 0.001);
    self->_duration = v3;

  }
}

- (double)duration
{
  -[_SUICCheckGlyphSpringAnimationFactory _updateDurationIfNecessary](self, "_updateDurationIfNecessary");
  return self->_duration;
}

- (void)setMass:(double)a3
{
  if (self->_mass != a3)
  {
    self->_mass = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setStiffness:(double)a3
{
  if (self->_stiffness != a3)
  {
    self->_stiffness = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setDamping:(double)a3
{
  if (self->_damping != a3)
  {
    self->_damping = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setVelocity:(double)a3
{
  if (self->_velocity != a3)
  {
    self->_velocity = a3;
    self->_needsDurationUpdate = 1;
  }
}

- (void)setTiming:(id)a3
{
  objc_storeStrong((id *)&self->_timing, a3);
  self->_needsDurationUpdate = 1;
}

- (double)mass
{
  return self->_mass;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (double)damping
{
  return self->_damping;
}

- (double)velocity
{
  return self->_velocity;
}

- (CAMediaTimingFunction)timing
{
  return self->_timing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timing, 0);
}

@end
