@implementation _UIImageSymbolTransition

+ (id)transition
{
  return (id)objc_opt_new();
}

- (_UIImageSymbolTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageSymbolTransition;
  return -[_UIImageSymbolTransition init](&v3, sel_init);
}

- (BOOL)_isValidAnimationPreset
{
  return 0;
}

- (BOOL)_isSymbolEffect
{
  return 0;
}

- (BOOL)_isSymbolTransition
{
  return 1;
}

- (id)_nsSymbolContentTransitionRepresentation
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageSymbolEffect.m"), 792, CFSTR("Should never be called in abstract superclass"));

  return 0;
}

- (void)_performCompletionHandler
{
  void (**completionHandler)(id, _UIImageSymbolTransition *);

  completionHandler = (void (**)(id, _UIImageSymbolTransition *))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, self);
}

- (BOOL)isEqual:(id)a3
{
  _UIImageSymbolTransition *v4;
  _UIImageSymbolTransition *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (_UIImageSymbolTransition *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_UIImageSymbolTransition completionHandler](self, "completionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIImageSymbolTransition completionHandler](v5, "completionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
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

  objc_msgSend((id)objc_opt_class(), "transition");
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

- (_UIImageSymbolTransition)initWithCoder:(id)a3
{
  _UIImageSymbolTransition *v4;

  objc_msgSend((id)objc_opt_class(), "effect");
  v4 = (_UIImageSymbolTransition *)objc_claimAutoreleasedReturnValue();

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
