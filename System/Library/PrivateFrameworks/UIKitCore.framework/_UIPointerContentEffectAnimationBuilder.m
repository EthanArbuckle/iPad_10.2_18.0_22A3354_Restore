@implementation _UIPointerContentEffectAnimationBuilder

- (_UIPointerContentEffectAnimationBuilder)initWithCreationHandler:(id)a3
{
  id v4;
  _UIPointerContentEffectAnimationBuilder *v5;
  void *v6;
  id creationHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIPointerContentEffectAnimationBuilder;
  v5 = -[_UIPointerContentEffectAnimationBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    creationHandler = v5->_creationHandler;
    v5->_creationHandler = v6;

  }
  return v5;
}

- (id)createAnimation
{
  void (**creationHandler)(_QWORD, _QWORD);
  void *v6;

  creationHandler = (void (**)(_QWORD, _QWORD))self->_creationHandler;
  if (creationHandler
    || (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerArbiter.m"), 97, CFSTR("creationHandler must be non-nil")), v6, (creationHandler = (void (**)(_QWORD, _QWORD))self->_creationHandler) != 0))
  {
    ((void (**)(_QWORD, SEL))creationHandler)[2](creationHandler, a2);
    creationHandler = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return creationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationHandler, 0);
}

@end
