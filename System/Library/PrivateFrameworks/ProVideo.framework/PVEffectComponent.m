@implementation PVEffectComponent

- (PVEffectComponent)initWithEffect:(id)a3
{
  id v4;
  PVEffectComponent *v5;
  PVEffectComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVEffectComponent;
  v5 = -[PVEffectComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PVEffectComponent setEffect:](v5, "setEffect:", v4);

  return v6;
}

- (PVEffect)effect
{
  return (PVEffect *)objc_loadWeakRetained((id *)&self->_effect);
}

- (void)setEffect:(id)a3
{
  objc_storeWeak((id *)&self->_effect, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_effect);
}

@end
