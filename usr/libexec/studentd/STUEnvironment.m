@implementation STUEnvironment

- (STUEnvironment)initWithRootPrimitives:(id)a3
{
  id v5;
  STUEnvironment *v6;
  STUEnvironment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUEnvironment;
  v6 = -[STUEnvironment init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootPrimitives, a3);

  return v7;
}

+ (void)setUpWithPrimitives:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithRootPrimitives:", v4);

  v6 = (void *)qword_1000FC4E0;
  qword_1000FC4E0 = (uint64_t)v5;

}

+ (STUEnvironment)shared
{
  void *v3;
  void *v6;

  v3 = (void *)qword_1000FC4E0;
  if (!qword_1000FC4E0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STUEnvironment.m"), 45, CFSTR("The environment has not been set up yet. You must call setUpWithPrimitives: before accessing the shared environment for the first time."));

    v3 = (void *)qword_1000FC4E0;
  }
  return (STUEnvironment *)v3;
}

- (STUWhiteboard)whiteboard
{
  STUWhiteboard *whiteboard;
  STUWhiteboard *v4;
  STUWhiteboard *v5;

  whiteboard = self->_whiteboard;
  if (!whiteboard)
  {
    v4 = objc_opt_new(STUWhiteboard);
    v5 = self->_whiteboard;
    self->_whiteboard = v4;

    whiteboard = self->_whiteboard;
  }
  return whiteboard;
}

- (STUSimulations)simulations
{
  STUSimulations *simulations;
  STUSimulations *v4;
  void *v5;
  STUSimulations *v6;
  STUSimulations *v7;

  simulations = self->_simulations;
  if (!simulations)
  {
    v4 = [STUSimulations alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnvironment rootPrimitives](self, "rootPrimitives"));
    v6 = -[STUSimulations initWithPrimitives:](v4, "initWithPrimitives:", v5);
    v7 = self->_simulations;
    self->_simulations = v6;

    simulations = self->_simulations;
  }
  return simulations;
}

- (STUPrimitives)primitives
{
  STUPrimitives *primitives;
  void *v4;
  STUPrimitives *v5;
  STUPrimitives *v6;

  primitives = self->_primitives;
  if (!primitives)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUEnvironment simulations](self, "simulations"));
    v5 = (STUPrimitives *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makeDecoratedPrimitives"));
    v6 = self->_primitives;
    self->_primitives = v5;

    primitives = self->_primitives;
  }
  return primitives;
}

- (STUPrimitives)rootPrimitives
{
  return self->_rootPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPrimitives, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_simulations, 0);
  objc_storeStrong((id *)&self->_whiteboard, 0);
}

@end
