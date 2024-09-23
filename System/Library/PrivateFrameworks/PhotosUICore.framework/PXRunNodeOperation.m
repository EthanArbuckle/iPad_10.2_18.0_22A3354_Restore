@implementation PXRunNodeOperation

- (PXRunNodeOperation)init
{
  return -[PXRunNodeOperation initWithRunNode:](self, "initWithRunNode:", 0);
}

- (PXRunNodeOperation)initWithRunNode:(id)a3
{
  id v6;
  PXRunNodeOperation *v7;
  NSLock *v8;
  NSLock *stateLock;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXRunNodeOperation;
  v7 = -[PXRunNodeOperation init](&v12, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXRunNodeOperation.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runNode"));

    }
    objc_storeStrong((id *)&v7->_runNode, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    stateLock = v7->__stateLock;
    v7->__stateLock = v8;

  }
  return v7;
}

- (void)start
{
  void *v3;
  id v4;

  -[PXRunNodeOperation runNode](self, "runNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXRunNodeOperation _transitionToState:](self, "_transitionToState:", 1))
  {
    objc_msgSend(v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "runNodeWillStartRunning:", v4);
    objc_msgSend(v4, "run");

  }
}

- (BOOL)isReady
{
  unint64_t v3;
  BOOL result;
  objc_super v5;

  v3 = -[PXRunNodeOperation state](self, "state");
  v5.receiver = self;
  v5.super_class = (Class)PXRunNodeOperation;
  result = -[PXRunNodeOperation isReady](&v5, sel_isReady);
  if (v3)
    return 0;
  return result;
}

- (BOOL)isExecuting
{
  return -[PXRunNodeOperation state](self, "state") == 1;
}

- (BOOL)isFinished
{
  return (-[PXRunNodeOperation state](self, "state") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (unint64_t)state
{
  void *v3;
  unint64_t state;
  void *v5;

  -[PXRunNodeOperation _stateLock](self, "_stateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  state = self->_state;
  -[PXRunNodeOperation _stateLock](self, "_stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return state;
}

- (BOOL)_transitionToState:(unint64_t)a3
{
  void *v5;
  unint64_t state;
  BOOL v7;
  void *v8;

  -[PXRunNodeOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  -[PXRunNodeOperation _stateLock](self, "_stateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  state = self->_state;
  if (a3 == 3)
  {
    if (state == 1)
      goto LABEL_7;
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 != 1 || state)
        goto LABEL_5;
LABEL_7:
      self->_state = a3;
      v7 = 1;
      goto LABEL_8;
    }
    if ((state & 0xFFFFFFFFFFFFFFFELL) != 2)
      goto LABEL_7;
  }
LABEL_5:
  v7 = 0;
LABEL_8:
  -[PXRunNodeOperation _stateLock](self, "_stateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[PXRunNodeOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  return v7;
}

- (BOOL)cancelIfAble
{
  -[PXRunNodeOperation cancel](self, "cancel");
  return -[PXRunNodeOperation _transitionToState:](self, "_transitionToState:", 2);
}

- (BOOL)completeIfAble
{
  return -[PXRunNodeOperation _transitionToState:](self, "_transitionToState:", 3);
}

- (PXRunNode)runNode
{
  return self->_runNode;
}

- (NSLock)_stateLock
{
  return self->__stateLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stateLock, 0);
  objc_storeStrong((id *)&self->_runNode, 0);
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("state"));
}

@end
