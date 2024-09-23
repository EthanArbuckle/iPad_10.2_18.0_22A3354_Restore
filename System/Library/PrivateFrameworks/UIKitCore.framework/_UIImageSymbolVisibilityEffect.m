@implementation _UIImageSymbolVisibilityEffect

+ (id)effect
{
  uint64_t v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolVisibilityEffect;
  objc_msgSendSuper2(&v4, sel_effect);
  v2 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  return (id)v2;
}

+ (id)effectWithVisibility:(int64_t)a3
{
  id result;

  result = (id)objc_msgSend(a1, "effect");
  *((_QWORD *)result + 3) = a3;
  return result;
}

+ (id)appearEffect
{
  return (id)objc_msgSend(a1, "effectWithVisibility:", 1);
}

+ (id)disappearEffect
{
  return (id)objc_msgSend(a1, "effectWithVisibility:", 2);
}

- (BOOL)_isValidAnimationPreset
{
  objc_super v3;

  if ((unint64_t)(self->_visibility - 1) < 2)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return -[_UIImageSymbolEffect _isValidAnimationPreset](&v3, sel__isValidAnimationPreset);
}

- (int64_t)_stateUpdateType
{
  objc_super v4;

  if (-[_UIImageSymbolVisibilityEffect _isValidAnimationPreset](self, "_isValidAnimationPreset"))
    return 2;
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return -[_UIImageSymbolEffect _stateUpdateType](&v4, sel__stateUpdateType);
}

- (int64_t)_desiredVisibility
{
  objc_super v4;

  if (-[_UIImageSymbolVisibilityEffect _isValidAnimationPreset](self, "_isValidAnimationPreset"))
    return self->_visibility;
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return -[_UIImageSymbolEffect _desiredVisibility](&v4, sel__desiredVisibility);
}

- (id)_nsSymbolEffectRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_visibility == 2)
  {
    if (self->_style == 2)
      objc_msgSend(MEMORY[0x1E0CE86D8], "disappearUpEffect");
    else
      objc_msgSend(MEMORY[0x1E0CE86D8], "disappearDownEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CE86B8], "effect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_style == 2)
      objc_msgSend(MEMORY[0x1E0CE86B8], "appearDownEffect");
    else
      objc_msgSend(MEMORY[0x1E0CE86B8], "appearUpEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[_UIImageSymbolVisibilityEffect byLayer](self, "byLayer"))
    objc_msgSend(v4, "effectWithByLayer");
  else
    objc_msgSend(v4, "effectWithWholeSymbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVisibilityEffect;
  v5 = -[_UIImageSymbolEffect isEqual:](&v7, sel_isEqual_, v4)
    && self->_visibility == v4[3]
    && self->_style == v4[4]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolVisibilityEffect;
  return self->_visibility ^ -[_UIImageSymbolEffect hash](&v3, sel_hash) ^ self->_style;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolVisibilityEffect;
  result = -[_UIImageSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_visibility;
  *((_QWORD *)result + 4) = self->_style;
  *((_BYTE *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t visibility;
  id v5;

  visibility = self->_visibility;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", visibility, CFSTR("visibility"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_byLayer, CFSTR("byLayer"));

}

- (_UIImageSymbolVisibilityEffect)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolVisibilityEffect *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = (_UIImageSymbolVisibilityEffect *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5->_visibility = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("visibility"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_byLayer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("byLayer"));
  }

  return v5;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)byLayer
{
  return self->_byLayer;
}

- (void)setByLayer:(BOOL)a3
{
  self->_byLayer = a3;
}

@end
