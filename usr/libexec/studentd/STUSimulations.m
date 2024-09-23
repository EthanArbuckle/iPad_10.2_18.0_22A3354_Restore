@implementation STUSimulations

- (STUSimulations)initWithPrimitives:(id)a3
{
  id v5;
  STUSimulations *v6;
  STUSimulations *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUSimulations;
  v6 = -[STUSimulations init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rootPrimitives, a3);

  return v7;
}

- (id)makeDecoratedPrimitives
{
  return -[STUSimulationDecoratedPrimitives initWithSimulations:]([STUSimulationDecoratedPrimitives alloc], "initWithSimulations:", self);
}

- (STUIDSLocalSimulation)IDSLocalSimulation
{
  STUIDSLocalSimulation *IDSLocalSimulation;
  STUIDSLocalSimulation *v4;
  void *v5;
  void *v6;
  STUIDSLocalSimulation *v7;
  STUIDSLocalSimulation *v8;

  IDSLocalSimulation = self->_IDSLocalSimulation;
  if (!IDSLocalSimulation)
  {
    v4 = [STUIDSLocalSimulation alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUSimulations rootPrimitives](self, "rootPrimitives"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "IDSLocalPrimitives"));
    v7 = -[STUIDSLocalSimulation initWithPrimitives:](v4, "initWithPrimitives:", v6);
    v8 = self->_IDSLocalSimulation;
    self->_IDSLocalSimulation = v7;

    IDSLocalSimulation = self->_IDSLocalSimulation;
  }
  return IDSLocalSimulation;
}

- (STUPrimitives)rootPrimitives
{
  return self->_rootPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPrimitives, 0);
  objc_storeStrong((id *)&self->_IDSLocalSimulation, 0);
}

@end
