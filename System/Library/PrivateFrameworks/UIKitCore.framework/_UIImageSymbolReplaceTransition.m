@implementation _UIImageSymbolReplaceTransition

+ (id)transition
{
  uint64_t v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIImageSymbolReplaceTransition;
  objc_msgSendSuper2(&v4, sel_transition);
  v2 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  return (id)v2;
}

- (BOOL)_isValidAnimationPreset
{
  return 1;
}

- (id)_nsSymbolContentTransitionRepresentation
{
  int64_t style;
  uint64_t v4;
  void *v5;
  void *v6;

  style = self->_style;
  if (style == 3)
  {
    objc_msgSend(MEMORY[0x1E0CE86F8], "replaceOffUpTransition");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (style == 2)
      objc_msgSend(MEMORY[0x1E0CE86F8], "replaceUpUpTransition");
    else
      objc_msgSend(MEMORY[0x1E0CE86F8], "replaceDownUpTransition");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (-[_UIImageSymbolReplaceTransition byLayer](self, "byLayer"))
    objc_msgSend(v5, "transitionWithByLayer");
  else
    objc_msgSend(v5, "transitionWithWholeSymbol");
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
  v7.super_class = (Class)_UIImageSymbolReplaceTransition;
  v5 = -[_UIImageSymbolTransition isEqual:](&v7, sel_isEqual_, v4)
    && self->_style == v4[3]
    && self->_byLayer == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolReplaceTransition;
  return self->_style ^ -[_UIImageSymbolTransition hash](&v3, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIImageSymbolReplaceTransition;
  result = -[_UIImageSymbolTransition copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_style;
  *((_BYTE *)result + 16) = self->_byLayer;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("style"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_byLayer, CFSTR("byLayer"));

}

- (_UIImageSymbolReplaceTransition)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolReplaceTransition *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = (_UIImageSymbolReplaceTransition *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v5->_byLayer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("byLayer"));
  }

  return v5;
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
