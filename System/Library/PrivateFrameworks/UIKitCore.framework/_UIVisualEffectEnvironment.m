@implementation _UIVisualEffectEnvironment

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setReducedTransperancy:(BOOL)a3
{
  self->_reducedTransperancy = a3;
}

- (void)setAllowsDithering:(BOOL)a3
{
  self->_allowsDithering = a3;
}

- (void)setAllowsBlurring:(BOOL)a3
{
  self->_allowsBlurring = a3;
}

- (_UIVisualEffectEnvironment)initWithHost:(id)a3
{
  _UIVisualEffectEnvironment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIVisualEffectEnvironment;
  result = -[_UIVisualEffectEnvironment init](&v5, sel_init);
  if (result)
    result->_effectView = (UIVisualEffectView *)a3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;

  v4 = (_QWORD *)objc_opt_new();
  v4[2] = self->_effectView;
  objc_msgSend(v4, "setAllowsDithering:", self->_allowsDithering);
  objc_msgSend(v4, "setAllowsBlurring:", self->_allowsBlurring);
  objc_msgSend(v4, "setUseSimpleVibrancy:", self->_useSimpleVibrancy);
  objc_msgSend(v4, "setReducedTransperancy:", self->_reducedTransperancy);
  v5 = (void *)-[UITraitCollection copy](self->_traitCollection, "copy");
  objc_msgSend(v4, "setTraitCollection:", v5);

  return v4;
}

- (void)setUseSimpleVibrancy:(BOOL)a3
{
  self->_useSimpleVibrancy = a3;
}

- (BOOL)allowsBlurring
{
  return self->_allowsBlurring;
}

- (BOOL)reducedTransperancy
{
  return self->_reducedTransperancy;
}

- (BOOL)allowsDithering
{
  return self->_allowsDithering;
}

- (BOOL)useSimpleVibrancy
{
  return self->_useSimpleVibrancy;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_UIVisualEffectEnvironment;
  -[_UIVisualEffectEnvironment description](&v12, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = " allowsDithering";
  v7 = "";
  if (!self->_allowsDithering)
    v6 = "";
  if (self->_allowsBlurring)
    v8 = " allowsBlurring";
  else
    v8 = "";
  if (self->_useSimpleVibrancy)
    v9 = " useSimpleVibrancy";
  else
    v9 = "";
  if (self->_reducedTransperancy)
    v7 = " reducedTransperancy";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ host=%p%@ traitCollection=%p%s%s%s%s"), v4, self->_effectView, &stru_1E16EDF20, self->_traitCollection, v6, v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

@end
