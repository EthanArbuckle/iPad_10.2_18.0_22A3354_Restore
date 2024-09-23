@implementation _UIVisualEffectAlphaEntry

- (_UIVisualEffectAlphaEntry)initWithInitialAlpha:(double)a3 finalAlpha:(double)a4
{
  _UIVisualEffectAlphaEntry *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectAlphaEntry;
  result = -[_UIVisualEffectAlphaEntry init](&v7, sel_init);
  if (result)
  {
    result->_initialAlpha = a3;
    result->_finalAlpha = a4;
  }
  return result;
}

- (void)applyIdentityEffectToView:(id)a3
{
  objc_msgSend(a3, "setAlpha:", self->_initialAlpha);
}

- (void)applyRequestedEffectToView:(id)a3
{
  objc_msgSend(a3, "setAlpha:", self->_finalAlpha);
}

- (void)removeEffectFromView:(id)a3
{
  objc_msgSend(a3, "setAlpha:", 1.0);
}

- (id)copyForTransitionToEffect:(id)a3
{
  double *v4;
  _UIVisualEffectAlphaEntry *v5;
  double finalAlpha;
  double v7;

  v4 = (double *)a3;
  v5 = [_UIVisualEffectAlphaEntry alloc];
  finalAlpha = self->_finalAlpha;
  v7 = v4[3];

  return -[_UIVisualEffectAlphaEntry initWithInitialAlpha:finalAlpha:](v5, "initWithInitialAlpha:finalAlpha:", finalAlpha, v7);
}

- (id)copyForTransitionOut
{
  return -[_UIVisualEffectAlphaEntry initWithInitialAlpha:finalAlpha:]([_UIVisualEffectAlphaEntry alloc], "initWithInitialAlpha:finalAlpha:", self->_finalAlpha, self->_initialAlpha);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectAlphaEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" initialAlpha=%f finalAlpha=%f"), *(_QWORD *)&self->_initialAlpha, *(_QWORD *)&self->_finalAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
