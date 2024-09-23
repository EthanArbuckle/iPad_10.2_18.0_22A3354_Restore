@implementation PRPosterAmbientEnvironmentImpl

- (PRPosterAmbientEnvironmentImpl)initWithTraitCollection:(id)a3
{
  id v5;
  PRPosterAmbientEnvironmentImpl *v6;
  PRPosterAmbientEnvironmentImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterAmbientEnvironmentImpl;
  v6 = -[PRPosterAmbientEnvironmentImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_traitCollection, a3);

  return v7;
}

- (BOOL)isAmbientPresented
{
  return -[UITraitCollection isAmbientPresented](self->_traitCollection, "isAmbientPresented");
}

- (BOOL)isDisplayStyleRedMode
{
  -[UITraitCollection ambientDisplayStyle](self->_traitCollection, "ambientDisplayStyle");
  return AMUIAmbientDisplayStyleIsRedMode();
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
