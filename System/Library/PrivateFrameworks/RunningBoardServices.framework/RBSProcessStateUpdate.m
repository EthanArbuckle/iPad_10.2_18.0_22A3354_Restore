@implementation RBSProcessStateUpdate

- (RBSProcessState)state
{
  return self->_state;
}

+ (id)updateWithState:(id)a3 previousState:(id)a4 exitEvent:(id)a5
{
  RBSProcessState *v9;
  RBSProcessState *v10;
  RBSProcessExitEvent *v11;
  RBSProcessExitEvent *v12;
  RBSProcessStateUpdate *v13;
  void *v14;
  void *v15;
  RBSProcessHandle *v16;
  RBSProcessHandle *process;
  RBSProcessHandle *v18;
  RBSProcessHandle *v19;
  RBSProcessHandle *v20;
  RBSProcessState *state;
  RBSProcessState *v22;
  RBSProcessState *previousState;
  RBSProcessState *v24;
  RBSProcessExitEvent *exitEvent;
  void *v27;

  v9 = (RBSProcessState *)a3;
  v10 = (RBSProcessState *)a4;
  v11 = (RBSProcessExitEvent *)a5;
  v12 = v11;
  if (!v9 && !v10 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSProcessStateUpdate.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state || prevState || exitEvent"));

  }
  v13 = objc_alloc_init(RBSProcessStateUpdate);
  -[RBSProcessState process](v9, "process");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    process = v13->_process;
    v13->_process = v16;
  }
  else
  {
    -[RBSProcessState process](v10, "process");
    v18 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
    process = v18;
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      -[RBSProcessExitEvent process](v12, "process");
      v19 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v13->_process;
    v13->_process = v19;

  }
  state = v13->_state;
  v13->_state = v9;
  v22 = v9;

  previousState = v13->_previousState;
  v13->_previousState = v10;
  v24 = v10;

  exitEvent = v13->_exitEvent;
  v13->_exitEvent = v12;

  return v13;
}

- (RBSProcessState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEvent, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (RBSProcessExitEvent)exitEvent
{
  return self->_exitEvent;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| process:%@ oldState:%@ newState:%@ exitEvent:%@>"), v4, self->_process, self->_previousState, self->_state, self->_exitEvent);

  return v5;
}

@end
