@implementation TypistKeyboardLushootseed

- (id)init:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TypistKeyboardLushootseed;
  v4 = -[TypistKeyboard init:options:locale:](&v7, sel_init_options_locale_, a3, a4, CFSTR("lut"));
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setMultiCharacterKeys:", &unk_251A99380);
  return v5;
}

- (id)_multiCharacterTrailForGrapheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[TypistKeyboardLushootseed multiCharacterKeys](self, "multiCharacterKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)multiCharacterKeys
{
  return self->_multiCharacterKeys;
}

- (void)setMultiCharacterKeys:(id)a3
{
  objc_storeStrong((id *)&self->_multiCharacterKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiCharacterKeys, 0);
}

@end
