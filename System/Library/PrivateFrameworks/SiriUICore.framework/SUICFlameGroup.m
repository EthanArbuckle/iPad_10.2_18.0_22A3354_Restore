@implementation SUICFlameGroup

- (SUICFlameGroup)init
{
  char *v2;
  SUICFlameGroup *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUICFlameGroup;
  v2 = -[SUICFlameGroup init](&v6, sel_init);
  v3 = (SUICFlameGroup *)v2;
  if (v2)
  {
    *((_OWORD *)v2 + 3) = xmmword_1A377E0B0;
    *((_QWORD *)v2 + 4) = v2 + 24;
    *((_QWORD *)v2 + 5) = v2 + 48;
    *(_OWORD *)(v2 + 12) = xmmword_1A377E090;
    *((_WORD *)v2 + 4) = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  double stateTime;
  double zTime;
  double transitionPhase;
  double v7;
  double v8;
  double v9;
  double v10;
  double globalAlpha;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  stateTime = self->_stateTime;
  zTime = self->_zTime;
  transitionPhase = self->_transitionPhase;
  v7 = *(float *)self->_stateModifiers;
  v8 = *(float *)&self->_stateModifiers[4];
  v9 = *(float *)&self->_stateModifiers[8];
  v10 = *(float *)&self->_stateModifiers[12];
  globalAlpha = self->_globalAlpha;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAura);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDyingOff);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("stateTime: %f  zTime: %f  transitionPhase: %f  stateModifiers: %f, %f, %f, %f  globalAlpha: %f  isAura: %@  isDyingOff: %@"), *(_QWORD *)&stateTime, *(_QWORD *)&zTime, *(_QWORD *)&transitionPhase, *(_QWORD *)&v7, *(_QWORD *)&v8, *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&globalAlpha, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (float)stateTime
{
  return self->_stateTime;
}

- (void)setStateTime:(float)a3
{
  self->_stateTime = a3;
}

- (float)zTime
{
  return self->_zTime;
}

- (void)setZTime:(float)a3
{
  self->_zTime = a3;
}

- (float)globalAlpha
{
  return self->_globalAlpha;
}

- (void)setGlobalAlpha:(float)a3
{
  self->_globalAlpha = a3;
}

- (float)transitionPhase
{
  return self->_transitionPhase;
}

- (void)setTransitionPhase:(float)a3
{
  self->_transitionPhase = a3;
}

- (float)transitionPhasePtr
{
  return self->_transitionPhasePtr;
}

- (void)setTransitionPhasePtr:(float *)a3
{
  self->_transitionPhasePtr = a3;
}

- (__n128)stateModifiers
{
  return a1[3];
}

- (void)setStateModifiers:(SUICFlameGroup *)self
{
  __int128 v2;

  *(_OWORD *)self->_stateModifiers = v2;
}

- (uint64_t)stateModifiersPtr
{
  return *(_QWORD *)(a1 + 40);
}

- (void)setStateModifiersPtr:(SUICFlameGroup *)self
{
  uint64_t v2;

  *(_QWORD *)self->_stateModifiersPtr = v2;
}

- (BOOL)isAura
{
  return self->_isAura;
}

- (void)setIsAura:(BOOL)a3
{
  self->_isAura = a3;
}

- (BOOL)isDyingOff
{
  return self->_isDyingOff;
}

- (void)setIsDyingOff:(BOOL)a3
{
  self->_isDyingOff = a3;
}

@end
