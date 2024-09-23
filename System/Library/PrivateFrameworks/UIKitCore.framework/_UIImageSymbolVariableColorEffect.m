@implementation _UIImageSymbolVariableColorEffect

+ (id)effect
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____UIImageSymbolVariableColorEffect;
  objc_msgSendSuper2(&v6, sel_effect);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  +[_UIImageSymbolEffectRepeatBehavior defaultRepeatBehavior](_UIImageSymbolEffectRepeatBehavior, "defaultRepeatBehavior");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[3];
  v2[3] = v3;

  return v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolEffectRepresentation
{
  void *v3;
  void *v4;
  int64_t styleOptions;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CE8708], "effect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  styleOptions = self->_styleOptions;
  if ((styleOptions & 1) == 0)
  {
    if ((styleOptions & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "effectWithHideInactiveLayers");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
    if ((self->_styleOptions & 4) == 0)
      return v4;
    goto LABEL_4;
  }
  objc_msgSend(v3, "effectWithIterative");
  v8 = objc_claimAutoreleasedReturnValue();

  styleOptions = self->_styleOptions;
  v4 = (void *)v8;
  if ((styleOptions & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((styleOptions & 4) != 0)
  {
LABEL_4:
    objc_msgSend(v4, "effectWithReversing");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVariableColorEffect;
  v5 = -[_UIImageSymbolEffect isEqual:](&v7, sel_isEqual_, v4)
    && self->_styleOptions == v4[2]
    && -[_UIImageSymbolEffectRepeatBehavior isEqual:](self->_repeatBehavior, "isEqual:", v4[3]);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolVariableColorEffect;
  v3 = self->_styleOptions ^ -[_UIImageSymbolEffect hash](&v5, sel_hash);
  return v3 ^ -[_UIImageSymbolEffectRepeatBehavior hash](self->_repeatBehavior, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIImageSymbolVariableColorEffect;
  v4 = -[_UIImageSymbolEffect copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 2) = self->_styleOptions;
  objc_storeStrong((id *)v4 + 3, self->_repeatBehavior);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t styleOptions;
  id v5;

  styleOptions = self->_styleOptions;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", styleOptions, CFSTR("styleOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_repeatBehavior, CFSTR("repeatBehavior"));

}

- (_UIImageSymbolVariableColorEffect)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolVariableColorEffect *v5;
  void *v6;
  uint64_t v7;
  _UIImageSymbolEffectRepeatBehavior *repeatBehavior;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = (_UIImageSymbolVariableColorEffect *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5->_styleOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("styleOptions"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("repeatBehavior"));
    v7 = objc_claimAutoreleasedReturnValue();
    repeatBehavior = v5->_repeatBehavior;
    v5->_repeatBehavior = (_UIImageSymbolEffectRepeatBehavior *)v7;

  }
  return v5;
}

- (int64_t)styleOptions
{
  return self->_styleOptions;
}

- (void)setStyleOptions:(int64_t)a3
{
  self->_styleOptions = a3;
}

- (_UIImageSymbolEffectRepeatBehavior)repeatBehavior
{
  return self->_repeatBehavior;
}

- (void)setRepeatBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_repeatBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatBehavior, 0);
}

@end
