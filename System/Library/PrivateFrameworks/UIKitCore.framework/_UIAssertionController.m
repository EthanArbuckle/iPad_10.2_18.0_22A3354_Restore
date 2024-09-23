@implementation _UIAssertionController

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5 requiresExplicitInvalidation:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;

  v6 = a6;
  v7 = a4;
  v10 = a5;
  v11 = -[_UIAssertionBase _initWithType:initialState:reason:requiresExplicitInvalidation:]([_UIAssertionBase alloc], "_initWithType:initialState:reason:requiresExplicitInvalidation:", a3, v7, v10, v6);

  objc_msgSend(v11, "setParentController:", self);
  -[_UIAssertionController _beginTrackingAssertion:](self, "_beginTrackingAssertion:", v11);
  return v11;
}

- (void)_beginTrackingAssertion:(id)a3
{
  id v5;
  NSMutableDictionary *activeAssertionRecords;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  activeAssertionRecords = self->_activeAssertionRecords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeAssertionRecords, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "initialState");
    if (v9 != objc_msgSend(v5, "initialState"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAssertionController.m"), 153, CFSTR("Assertion controller contains existing assertion with a different initial state. This is not allowed."));

    }
    objc_msgSend(v8, "setActiveAssertionCount:", objc_msgSend(v8, "activeAssertionCount") + 1);
    _SharedAssertionLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v16 = 134218240;
      v17 = objc_msgSend(v8, "type");
      v18 = 2048;
      v19 = objc_msgSend(v8, "activeAssertionCount");
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_INFO, "Incrementing existing assertion record of type %lu. New active count: %ld", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    _SharedAssertionLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      v17 = objc_msgSend(v5, "type");
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_INFO, "Started tracking new assertion of type: %lu", (uint8_t *)&v16, 0xCu);
    }

    v10 = objc_opt_new();
    -[NSObject setActiveAssertionCount:](v10, "setActiveAssertionCount:", 1);
    -[NSObject setInitialState:](v10, "setInitialState:", objc_msgSend(v5, "initialState"));
    -[NSObject setType:](v10, "setType:", objc_msgSend(v5, "type"));
    objc_msgSend(v5, "reason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setReason:](v10, "setReason:", v12);

    v13 = self->_activeAssertionRecords;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v10, v14);

  }
  -[_UIAssertionController _enforceSubjectAwarenessOfAssertionState:forAssertionType:](self, "_enforceSubjectAwarenessOfAssertionState:forAssertionType:", objc_msgSend(v5, "initialState"), objc_msgSend(v5, "type"));

}

- (void)_endTrackingAssertion:(id)a3
{
  id v5;
  NSMutableDictionary *activeAssertionRecords;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  activeAssertionRecords = self->_activeAssertionRecords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeAssertionRecords, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAssertionController.m"), 180, CFSTR("Releasing an assertion that this controller is not aware of."));

  }
  if (objc_msgSend(v8, "activeAssertionCount") <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAssertionController.m"), 183, CFSTR("Active assertion count reached below zero."));

  }
  objc_msgSend(v8, "setActiveAssertionCount:", objc_msgSend(v8, "activeAssertionCount") - 1);
  _SharedAssertionLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 134218240;
    v17 = objc_msgSend(v8, "type");
    v18 = 2048;
    v19 = objc_msgSend(v8, "activeAssertionCount");
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_INFO, "Decrementing assertion of type %lu. New active count: %ld", (uint8_t *)&v16, 0x16u);
  }

  if (!objc_msgSend(v8, "activeAssertionCount"))
  {
    _SharedAssertionLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v8, "type");
      v16 = 134217984;
      v17 = v11;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_INFO, "Releasing assertion of type %lu", (uint8_t *)&v16, 0xCu);
    }

    -[_UIAssertionController _enforceSubjectAwarenessOfAssertionState:forAssertionType:](self, "_enforceSubjectAwarenessOfAssertionState:forAssertionType:", objc_msgSend(v8, "initialState") ^ 1, objc_msgSend(v5, "type"));
    v12 = self->_activeAssertionRecords;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

  }
}

- (void)_enforceSubjectAwarenessOfAssertionState:(BOOL)a3 forAssertionType:(unint64_t)a4
{
  _BOOL8 v5;
  _UIAssertionControllerSubject **p_subject;
  id WeakRetained;
  int v8;
  id v9;

  v5 = a3;
  p_subject = &self->_subject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_subject);
  v8 = objc_msgSend(WeakRetained, "assertionActivationStateForType:", a4);

  if (v8 != v5)
  {
    v9 = objc_loadWeakRetained((id *)p_subject);
    objc_msgSend(v9, "assertionActivationStateChangedToState:forType:", v5, a4);

  }
}

- (_UIAssertionController)initWithAssertionSubject:(id)a3
{
  id v4;
  _UIAssertionController *v5;
  _UIAssertionController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *activeAssertionRecords;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIAssertionController;
  v5 = -[_UIAssertionController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_subject, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeAssertionRecords = v6->_activeAssertionRecords;
    v6->_activeAssertionRecords = v7;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subject);
  objc_storeStrong((id *)&self->_activeAssertionRecords, 0);
}

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self, "vendAssertionOfType:initialState:reason:", a3, a4, 0);
}

- (id)vendAssertionOfType:(unint64_t)a3 initialState:(BOOL)a4 reason:(id)a5
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", a3, a4, a5, 1);
}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  NSMutableDictionary *activeAssertionRecords;
  void *v4;
  void *v5;

  activeAssertionRecords = self->_activeAssertionRecords;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeAssertionRecords, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "activeAssertionCount") > 0;
  return (char)v4;
}

- (BOOL)hasAssertionsForReason:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_activeAssertionRecords;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](v5, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "reason");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_activeAssertionRecords, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UIAssertionControllerSubject)subject
{
  return (_UIAssertionControllerSubject *)objc_loadWeakRetained((id *)&self->_subject);
}

@end
