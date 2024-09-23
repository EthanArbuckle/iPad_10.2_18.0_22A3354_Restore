@implementation SBPIPCompoundAssertion

- (SBPIPCompoundAssertion)initWithIdentifier:(id)a3 reason:(int64_t)a4
{
  id v6;
  SBPIPCompoundAssertion *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPIPCompoundAssertion;
  v7 = -[SBPIPCompoundAssertion init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v7->_reason = a4;
  }

  return v7;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NSMapTable objectEnumerator](self->_controllerToStashAssertionMap, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPCompoundAssertion.m"), 26, CFSTR("Deallocated with outstanding assertions"));

  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPCompoundAssertion;
  -[SBPIPCompoundAssertion dealloc](&v7, sel_dealloc);
}

- (void)addAssertionForController:(id)a3 windowScene:(id)a4
{
  id v6;
  NSMapTable *v7;
  NSMapTable *controllerToStashAssertionMap;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_controllerToStashAssertionMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    controllerToStashAssertionMap = self->_controllerToStashAssertionMap;
    self->_controllerToStashAssertionMap = v7;

  }
  objc_msgSend(v10, "acquireStashAssertionForWindowScene:withReason:identifier:", v6, self->_reason, self->_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_controllerToStashAssertionMap, "setObject:forKey:", v9, v10);

}

- (void)removeAssertionForController:(id)a3
{
  NSMapTable *controllerToStashAssertionMap;
  id v6;
  void *v7;
  void *v8;
  id v9;

  controllerToStashAssertionMap = self->_controllerToStashAssertionMap;
  v6 = a3;
  -[NSMapTable objectForKey:](controllerToStashAssertionMap, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_controllerToStashAssertionMap, "removeObjectForKey:", v6);

  v7 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPCompoundAssertion.m"), 42, CFSTR("Removing an assertion for a controller which was never registered"));

    v7 = 0;
  }
  objc_msgSend(v7, "invalidate");

}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMapTable objectEnumerator](self->_controllerToStashAssertionMap, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_controllerToStashAssertionMap, "removeAllObjects");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_controllerToStashAssertionMap, 0);
}

@end
