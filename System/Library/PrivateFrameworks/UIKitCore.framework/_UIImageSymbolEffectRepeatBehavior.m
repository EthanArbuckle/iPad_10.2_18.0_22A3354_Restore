@implementation _UIImageSymbolEffectRepeatBehavior

+ (id)_repeatBehaviorWithRepeats:(double)a3
{
  double *v4;

  v4 = (double *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

+ (id)defaultRepeatBehavior
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___UIImageSymbolEffectRepeatBehavior_defaultRepeatBehavior__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD79EC0 != -1)
    dispatch_once(&qword_1ECD79EC0, block);
  return (id)_MergedGlobals_1_18;
}

+ (id)fixedRepeatBehavior:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "_repeatBehaviorWithRepeats:", (double)a3);
}

+ (id)indefiniteRepeatBehavior
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___UIImageSymbolEffectRepeatBehavior_indefiniteRepeatBehavior__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD79ED0 != -1)
    dispatch_once(&qword_1ECD79ED0, block);
  return (id)qword_1ECD79EC8;
}

- (BOOL)_hasCustomRepeatBehavior
{
  return self->_numberOfRepeats > 0.0;
}

- (BOOL)isEqual:(id)a3
{
  _UIImageSymbolEffectRepeatBehavior *v4;
  double *v5;
  BOOL v6;

  v4 = (_UIImageSymbolEffectRepeatBehavior *)a3;
  v5 = (double *)v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_numberOfRepeats == v5[1];

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)self->_numberOfRepeats;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("numberOfRepeats"), self->_numberOfRepeats);
}

- (_UIImageSymbolEffectRepeatBehavior)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "effect");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("numberOfRepeats"));
    *(_QWORD *)(v5 + 8) = v6;
  }

  return (_UIImageSymbolEffectRepeatBehavior *)v5;
}

- (double)_numberOfRepeats
{
  return self->_numberOfRepeats;
}

@end
