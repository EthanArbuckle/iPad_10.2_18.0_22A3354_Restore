@implementation _UIImageSymbolScaleEffect

+ (id)effect
{
  uint64_t v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolScaleEffect;
  objc_msgSendSuper2(&v4, sel_effect);
  v2 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  return (id)v2;
}

+ (id)effectWithScale:(int64_t)a3
{
  id result;

  result = (id)objc_msgSend(a1, "effect");
  *((_QWORD *)result + 3) = a3;
  return result;
}

+ (id)scaleUpEffect
{
  return (id)objc_msgSend(a1, "effectWithScale:", 2);
}

+ (id)scaleDownEffect
{
  return (id)objc_msgSend(a1, "effectWithScale:", 3);
}

+ (id)scaleDefaultEffect
{
  return (id)objc_msgSend(a1, "effectWithScale:", 1);
}

- (BOOL)_isValidAnimationPreset
{
  objc_super v3;

  if ((unint64_t)(self->_scale - 1) < 3)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolScaleEffect;
  return -[_UIImageSymbolEffect _isValidAnimationPreset](&v3, sel__isValidAnimationPreset);
}

- (int64_t)_stateUpdateType
{
  objc_super v4;

  if (-[_UIImageSymbolScaleEffect _isValidAnimationPreset](self, "_isValidAnimationPreset"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolScaleEffect;
  return -[_UIImageSymbolEffect _stateUpdateType](&v4, sel__stateUpdateType);
}

- (int64_t)_desiredScale
{
  objc_super v4;

  if (-[_UIImageSymbolScaleEffect _isValidAnimationPreset](self, "_isValidAnimationPreset"))
    return self->_scale;
  v4.receiver = self;
  v4.super_class = (Class)_UIImageSymbolScaleEffect;
  return -[_UIImageSymbolEffect _desiredScale](&v4, sel__desiredScale);
}

- (id)_nsSymbolEffectRepresentation
{
  void *v3;
  void *v4;

  if (self->_scale == 3)
    objc_msgSend(MEMORY[0x1E0CE8700], "scaleDownEffect");
  else
    objc_msgSend(MEMORY[0x1E0CE8700], "scaleUpEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIImageSymbolScaleEffect byLayer](self, "byLayer"))
    objc_msgSend(v3, "effectWithByLayer");
  else
    objc_msgSend(v3, "effectWithWholeSymbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolScaleEffect;
  v5 = -[_UIImageSymbolEffect isEqual:](&v7, sel_isEqual_, v4)
    && self->_scale == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolScaleEffect;
  return self->_scale ^ -[_UIImageSymbolEffect hash](&v3, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolScaleEffect;
  result = -[_UIImageSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_scale;
  *((_BYTE *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t scale;
  id v5;

  scale = self->_scale;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", scale, CFSTR("scale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_byLayer, CFSTR("byLayer"));

}

- (_UIImageSymbolScaleEffect)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolScaleEffect *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = (_UIImageSymbolScaleEffect *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5->_scale = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scale"));
    v5->_byLayer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("byLayer"));
  }

  return v5;
}

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
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
