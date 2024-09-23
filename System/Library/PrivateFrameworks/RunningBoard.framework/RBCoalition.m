@implementation RBCoalition

- (RBCoalition)initWithCoalitionID:(unint64_t)a3
{
  RBCoalition *v4;
  RBCoalition *v5;
  RBProcessMap *v6;
  RBProcessMap *processes;
  RBProcessMap *v8;
  RBProcessMap *processStates;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RBCoalition;
  v4 = -[RBCoalition init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_coalitionID = a3;
    v4->_level = 0;
    v6 = objc_alloc_init(RBProcessMap);
    processes = v5->_processes;
    v5->_processes = v6;

    v8 = objc_alloc_init(RBProcessMap);
    processStates = v5->_processStates;
    v5->_processStates = v8;

    v5->_previousCoalitionLevel = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v5->_creationTime = v10;
    v5->_lastModificationTime = v10;
  }
  return v5;
}

- (unint64_t)coalitionLevel
{
  return self->_level;
}

- (void)setCoalitionLevel:(unint64_t)a3
{
  double v4;

  self->_previousCoalitionLevel = self->_level;
  self->_level = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_lastModificationTime = v4;
}

- (void)setProcess:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RBProcessMap setValue:forIdentity:](self->_processes, "setValue:forIdentity:", v10, v7);
  if (v6)
    v9 = -[RBProcessMap setValue:forIdentity:](self->_processStates, "setValue:forIdentity:", v6, v7);

}

- (void)removeProcess:(id)a3
{
  id v4;
  id v5;
  id v6;

  objc_msgSend(a3, "identity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[RBProcessMap removeValueForIdentity:](self->_processes, "removeValueForIdentity:", v6);
  v5 = -[RBProcessMap removeValueForIdentity:](self->_processStates, "removeValueForIdentity:", v6);

}

- (void)enumerateProcessesUsingBlock:(id)a3
{
  id v4;
  RBProcessMap *processes;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  processes = self->_processes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__RBCoalition_enumerateProcessesUsingBlock___block_invoke;
  v7[3] = &unk_24DD46788;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[RBProcessMap enumerateWithBlock:](processes, "enumerateWithBlock:", v7);

}

void __44__RBCoalition_enumerateProcessesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  objc_msgSend(v5, "valueForIdentity:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isEmpty
{
  return -[RBProcessMap count](self->_processes, "count") == 0;
}

- (BOOL)isEqual:(id)a3
{
  RBCoalition *v4;
  RBCoalition *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (RBCoalition *)a3;
  v5 = v4;
  if (self == v4)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(), v6 == objc_opt_class())
      && -[RBCoalition coalitionID](v5, "coalitionID") == self->_coalitionID;

  return v7;
}

- (unint64_t)hash
{
  return self->_coalitionID;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| coalitionID:%llu coalitionLevel:%llu previousCoalitionLevel:%llu creationTime:%f lastModificationTime:%f>"), v4, self->_coalitionID, self->_level, self->_previousCoalitionLevel, *(_QWORD *)&self->_creationTime, *(_QWORD *)&self->_lastModificationTime);

  return v5;
}

- (unint64_t)coalitionID
{
  return self->_coalitionID;
}

- (unint64_t)previousCoalitionLevel
{
  return self->_previousCoalitionLevel;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (double)lastModificationTime
{
  return self->_lastModificationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processStates, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

@end
