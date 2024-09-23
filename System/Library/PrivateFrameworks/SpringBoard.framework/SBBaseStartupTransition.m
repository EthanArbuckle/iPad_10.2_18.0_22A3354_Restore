@implementation SBBaseStartupTransition

- (SBBaseStartupTransition)initWithDestination:(unint64_t)a3 context:(id)a4
{
  id v7;
  SBBaseStartupTransition *v8;
  uint64_t v9;
  SBMainWorkspace *mainWorkspace;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBaseStartupTransition;
  v8 = -[SBTransaction init](&v12, sel_init);
  if (v8)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v9 = objc_claimAutoreleasedReturnValue();
    mainWorkspace = v8->_mainWorkspace;
    v8->_mainWorkspace = (SBMainWorkspace *)v9;

    v8->_destination = a3;
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (void)performTransitionWithCompletionBlock:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)_begin
{
  objc_class *v3;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD v7[5];
  id v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBaseStartupTransition addMilestone:](self, "addMilestone:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SBBaseStartupTransition__begin__block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  -[SBBaseStartupTransition performTransitionWithCompletionBlock:](self, "performTransitionWithCompletionBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)SBBaseStartupTransition;
  -[SBBaseStartupTransition _begin](&v6, sel__begin);

}

uint64_t __33__SBBaseStartupTransition__begin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", *(_QWORD *)(a1 + 40));
}

- (SBMainWorkspace)mainWorkspace
{
  return self->_mainWorkspace;
}

- (SBStartupTransitionContext)context
{
  return self->_context;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
