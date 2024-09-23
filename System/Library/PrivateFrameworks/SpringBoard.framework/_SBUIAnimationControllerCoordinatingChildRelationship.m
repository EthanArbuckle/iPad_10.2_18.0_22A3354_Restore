@implementation _SBUIAnimationControllerCoordinatingChildRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatingChildTransaction, 0);
}

- (unint64_t)schedulingPolicy
{
  return self->_schedulingPolicy;
}

- (SBUIAnimationControllerCoordinating)coordinatingChildTransaction
{
  return self->_coordinatingChildTransaction;
}

- (_SBUIAnimationControllerCoordinatingChildRelationship)initWithCoordinatingChildTransaction:(id)a3 schedulingPolicy:(unint64_t)a4
{
  id v8;
  _SBUIAnimationControllerCoordinatingChildRelationship *v9;
  _SBUIAnimationControllerCoordinatingChildRelationship *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinatingChildTransaction"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_SBUIAnimationControllerCoordinatingChildRelationship;
  v9 = -[_SBUIAnimationControllerCoordinatingChildRelationship init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinatingChildTransaction, a3);
    v10->_schedulingPolicy = a4;
  }

  return v10;
}

@end
