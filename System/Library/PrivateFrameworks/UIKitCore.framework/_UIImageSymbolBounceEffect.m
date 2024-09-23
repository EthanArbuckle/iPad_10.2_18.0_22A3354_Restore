@implementation _UIImageSymbolBounceEffect

+ (id)effect
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____UIImageSymbolBounceEffect;
  objc_msgSendSuper2(&v6, sel_effect);
  v2 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  +[_UIImageSymbolEffectRepeatBehavior defaultRepeatBehavior](_UIImageSymbolEffectRepeatBehavior, "defaultRepeatBehavior");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = v3;

  return (id)v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolEffectRepresentation
{
  int64_t bounceDirection;
  uint64_t v4;
  void *v5;
  void *v6;

  bounceDirection = self->_bounceDirection;
  if (bounceDirection == 2)
  {
    objc_msgSend(MEMORY[0x1E0CE86C8], "bounceDownEffect");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (bounceDirection == 1)
      objc_msgSend(MEMORY[0x1E0CE86C8], "bounceUpEffect");
    else
      objc_msgSend(MEMORY[0x1E0CE86C8], "effect");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (-[_UIImageSymbolBounceEffect byLayer](self, "byLayer"))
    objc_msgSend(v5, "effectWithByLayer");
  else
    objc_msgSend(v5, "effectWithWholeSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolBounceEffect;
  v5 = -[_UIImageSymbolEffect isEqual:](&v7, sel_isEqual_, v4)
    && self->_bounceDirection == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16)
    && -[_UIImageSymbolEffectRepeatBehavior isEqual:](self->_repeatBehavior, "isEqual:", v4[4]);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolBounceEffect;
  v3 = self->_bounceDirection ^ -[_UIImageSymbolEffect hash](&v5, sel_hash);
  return v3 ^ -[_UIImageSymbolEffectRepeatBehavior hash](self->_repeatBehavior, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIImageSymbolBounceEffect;
  v4 = -[_UIImageSymbolEffect copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 3) = self->_bounceDirection;
  *((_BYTE *)v4 + 16) = self->_byLayer;
  objc_storeStrong((id *)v4 + 4, self->_repeatBehavior);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bounceDirection;
  id v5;

  bounceDirection = self->_bounceDirection;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", bounceDirection, CFSTR("bounceDirection"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_byLayer, CFSTR("byLayer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_repeatBehavior, CFSTR("repeatBehavior"));

}

- (_UIImageSymbolBounceEffect)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolBounceEffect *v5;
  void *v6;
  uint64_t v7;
  _UIImageSymbolEffectRepeatBehavior *repeatBehavior;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = (_UIImageSymbolBounceEffect *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5->_bounceDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bounceDirection"));
    v5->_byLayer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("byLayer"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("repeatBehavior"));
    v7 = objc_claimAutoreleasedReturnValue();
    repeatBehavior = v5->_repeatBehavior;
    v5->_repeatBehavior = (_UIImageSymbolEffectRepeatBehavior *)v7;

  }
  return v5;
}

- (int64_t)bounceDirection
{
  return self->_bounceDirection;
}

- (void)setBounceDirection:(int64_t)a3
{
  self->_bounceDirection = a3;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_byLayer = a3;
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
