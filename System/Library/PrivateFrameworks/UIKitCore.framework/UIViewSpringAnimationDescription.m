@implementation UIViewSpringAnimationDescription

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parameters
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self->var9;
  *(_OWORD *)&retstr->var7 = v3;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[1].var2;
  v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (BOOL)usesDampingRatioAndResponse
{
  return self->_usesDampingRatioAndResponse;
}

+ (id)descriptionWithSpringAnimationParameters:(id *)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];

  v4 = (void *)objc_opt_new();
  v5 = *(_OWORD *)&a3->var7;
  v8[2] = *(_OWORD *)&a3->var5;
  v8[3] = v5;
  v8[4] = *(_OWORD *)&a3->var9;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v6;
  objc_msgSend(v4, "setParameters:", v8);
  objc_msgSend(v4, "setUsesDampingRatioAndResponse:", 1);
  return v4;
}

- (void)setUsesDampingRatioAndResponse:(BOOL)a3
{
  self->_usesDampingRatioAndResponse = a3;
}

- (void)setParameters:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_parameters.dampingRatio = *(_OWORD *)&a3->var0;
  v3 = *(_OWORD *)&a3->var2;
  v4 = *(_OWORD *)&a3->var5;
  v5 = *(_OWORD *)&a3->var9;
  *(_OWORD *)&self->_parameters.responseSmoothing = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_parameters.projectionDeceleration = v5;
  *(_OWORD *)&self->_parameters.initialDampingRatioSpecified = v3;
  *(_OWORD *)&self->_parameters.initialResponse = v4;
}

- (double)tension
{
  return self->_tension;
}

- (double)friction
{
  return self->_friction;
}

+ (id)descriptionWithTension:(double)a3 friction:(double)a4
{
  void *v6;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTension:", a3);
  objc_msgSend(v6, "setFriction:", a4);
  return v6;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

@end
