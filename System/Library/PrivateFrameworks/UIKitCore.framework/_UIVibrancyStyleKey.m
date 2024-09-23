@implementation _UIVibrancyStyleKey

- (unint64_t)hash
{
  return self->_vibrancyStyle ^ (int64_t)self->_materialRecipe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialRecipe, 0);
}

- (_UIVibrancyStyleKey)initWithRecipe:(id)a3 vibrancyStyle:(int64_t)a4 category:(id)a5
{
  id v8;
  _UIVibrancyStyleKey *v9;
  _UIVibrancyStyleKey *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIVibrancyStyleKey;
  v9 = -[_UIVibrancyStyleKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_materialRecipe, a3);
    v10->_vibrancyStyle = a4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _UIVibrancyStyleKey *v4;
  BOOL v5;

  v4 = (_UIVibrancyStyleKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_UIVibrancyStyleKey isEqualToKey:](self, "isEqualToKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToKey:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4 && self->_materialRecipe == (NSString *)v4[1] && self->_vibrancyStyle == v4[2];

  return v5;
}

@end
