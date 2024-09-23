@implementation _PBFPosterRoleProcessorTransaction

+ (_PBFPosterRoleProcessorTransaction)transactionWithReason:(id)a3 context:(id)a4 userInfo:(id)a5 observers:(id)a6 processor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _PBFPosterRoleProcessorTransaction *v17;
  uint64_t v18;
  NSString *reason;
  uint64_t v20;
  NSDictionary *userInfo;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *shortIdentifier;
  uint64_t v26;
  NSArray *observers;
  void *v28;

  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = objc_alloc_init(_PBFPosterRoleProcessorTransaction);
  objc_storeWeak((id *)&v17->_processor, v13);

  v18 = objc_msgSend(v16, "copy");
  reason = v17->_reason;
  v17->_reason = (NSString *)v18;

  objc_storeStrong((id *)&v17->_context, a4);
  v20 = objc_msgSend(v15, "copy");

  userInfo = v17->_userInfo;
  v17->_userInfo = (NSDictionary *)v20;

  objc_msgSend(v12, "pbf_transitionContextIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "substringToIndex:", 7);
  v24 = objc_claimAutoreleasedReturnValue();
  shortIdentifier = v17->_shortIdentifier;
  v17->_shortIdentifier = (NSString *)v24;

  v26 = objc_msgSend(v14, "copy");
  observers = v17->_observers;
  v17->_observers = (NSArray *)v26;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "pbf_transitionAffectedRoles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
      objc_storeStrong((id *)&v17->_affectedRoles, v28);

  }
  return v17;
}

- (_PBFPosterRoleProcessorTransaction)init
{
  _PBFPosterRoleProcessorTransaction *v2;
  uint64_t v3;
  BSAtomicFlag *cancelFlag;
  uint64_t v5;
  BSAtomicFlag *invalidationFlag;
  uint64_t v7;
  NSMutableArray *executedChanges;
  uint64_t v9;
  NSMutableArray *emittedEvents;
  uint64_t v11;
  NSCountedSet *affectedRoles;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_PBFPosterRoleProcessorTransaction;
  v2 = -[_PBFPosterRoleProcessorTransaction init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    cancelFlag = v2->_cancelFlag;
    v2->_cancelFlag = (BSAtomicFlag *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v5;

    v7 = objc_opt_new();
    executedChanges = v2->_executedChanges;
    v2->_executedChanges = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    emittedEvents = v2->_emittedEvents;
    v2->_emittedEvents = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    affectedRoles = v2->_affectedRoles;
    v2->_affectedRoles = (NSCountedSet *)v11;

  }
  return v2;
}

- (void)appendEmittedEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (v4
    && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0
    && (-[BSAtomicFlag getFlag](self->_cancelFlag, "getFlag") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_emittedEvents, "addObject:", v4);
  }

}

- (NSArray)emittedEvents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_emittedEvents, "copy");
}

- (void)appendExecutedChange:(id)a3
{
  id v4;

  v4 = a3;
  if (v4
    && (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) == 0
    && (-[BSAtomicFlag getFlag](self->_cancelFlag, "getFlag") & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_executedChanges, "addObject:", v4);
  }

}

- (NSArray)executedChanges
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_executedChanges, "copy");
}

- (void)cancel
{
  if (-[BSAtomicFlag setFlag:](self->_cancelFlag, "setFlag:", 1))
  {
    -[NSMutableArray removeAllObjects](self->_executedChanges, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_emittedEvents, "removeAllObjects");
    objc_storeWeak((id *)&self->_processor, 0);
  }
}

- (BOOL)isInvalidated
{
  return -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag");
}

- (void)invalidate
{
  id WeakRetained;

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "noteTransactionWasInvalidated:", self);

  }
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"), CFSTR("isInvalidated"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicFlag getFlag](self->_cancelFlag, "getFlag"), CFSTR("isCancelled"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_context, CFSTR("context"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_executedChanges, CFSTR("executedChanges"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_emittedEvents, CFSTR("emittedEvents"), 1);
  objc_msgSend(v3, "appendString:withName:", self->_reason, CFSTR("reason"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v10 = (id)objc_msgSend(v3, "appendPointer:withName:", WeakRetained, CFSTR("owner"));

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBFPosterRoleCoordinatorTransitionContext)context
{
  return self->_context;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (PBFPosterRoleProcessor)processor
{
  return (PBFPosterRoleProcessor *)objc_loadWeakRetained((id *)&self->_processor);
}

- (NSCountedSet)affectedRoles
{
  return (NSCountedSet *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (PBFPosterRoleProcessorResult)results
{
  return (PBFPosterRoleProcessorResult *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_destroyWeak((id *)&self->_processor);
  objc_storeStrong((id *)&self->_shortIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_cancelFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_executedChanges, 0);
  objc_storeStrong((id *)&self->_emittedEvents, 0);
}

@end
