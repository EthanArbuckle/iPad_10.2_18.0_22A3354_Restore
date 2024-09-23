@implementation _UIImageSymbolEffect

+ (id)effect
{
  return (id)objc_opt_new();
}

- (_UIImageSymbolEffect)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolEffect;
  return -[_UIImageSymbolEffect init](&v3, sel_init);
}

- (BOOL)_isValidAnimationPreset
{
  return 0;
}

- (BOOL)_isSymbolEffect
{
  return 1;
}

- (BOOL)_isSymbolTransition
{
  return 0;
}

- (int64_t)_stateUpdateType
{
  return 0;
}

- (int64_t)_desiredScale
{
  return 0;
}

- (int64_t)_desiredVisibility
{
  return 0;
}

- (id)_nsSymbolEffectRepresentation
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageSymbolEffect.m"), 166, CFSTR("Should never be called in abstract superclass"));

  return 0;
}

- (void)_performCompletionHandler
{
  void (**completionHandler)(id, _UIImageSymbolEffect *);

  completionHandler = (void (**)(id, _UIImageSymbolEffect *))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, self);
}

- (BOOL)isEqual:(id)a3
{
  _UIImageSymbolEffect *v4;
  id *p_isa;
  BOOL v6;

  v4 = (_UIImageSymbolEffect *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_completionHandler == p_isa[1];

  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_completionHandler, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "effect");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = _Block_copy(self->_completionHandler);
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIImageSymbolEffect)initWithCoder:(id)a3
{
  _UIImageSymbolEffect *v4;

  objc_msgSend((id)objc_opt_class(), "effect");
  v4 = (_UIImageSymbolEffect *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
