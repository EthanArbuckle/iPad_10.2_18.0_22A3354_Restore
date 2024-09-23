@implementation _REContextRegistration

- (_REContextRegistration)initWithQuery:(id)a3
{
  id v5;
  _REContextRegistration *v6;
  _REContextRegistration *v7;
  NSArray *registrations;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_REContextRegistration;
  v6 = -[_REContextRegistration init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    registrations = v7->_registrations;
    v7->_registrations = (NSArray *)MEMORY[0x24BDBD1A8];

    v7->_registered = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[_REContextRegistration deregisterWithContext](self, "deregisterWithContext");
  v3.receiver = self;
  v3.super_class = (Class)_REContextRegistration;
  -[_REContextRegistration dealloc](&v3, sel_dealloc);
}

- (NSUUID)uuid
{
  return -[REDuetContextQuery uuid](self->_query, "uuid");
}

- (void)registerWithContext
{
  REDuetContextQuery *query;
  NSArray *v4;
  NSArray *registrations;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  id location;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_context)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    if (!self->_registered)
    {
      self->_registered = 1;
      objc_initWeak(&location, self);
      query = self->_query;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __45___REContextRegistration_registerWithContext__block_invoke;
      v14[3] = &unk_24CF8AAC8;
      objc_copyWeak(&v15, &location);
      -[REDuetContextQuery createRegistrationsWithCallback:](query, "createRegistrationsWithCallback:", v14);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      registrations = self->_registrations;
      self->_registrations = v4;

      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = self->_registrations;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v6);
            -[_CDUserContext registerCallback:](self->_context, "registerCallback:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
        }
        while (v7);
      }

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
  }
}

- (void)deregisterWithContext
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *registrations;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_context)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&REContextRegistrationLock);
    if (self->_registered)
    {
      self->_registered = 0;
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v3 = self->_registrations;
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v10;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v3);
            -[_CDUserContext deregisterCallback:](self->_context, "deregisterCallback:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
          }
          while (v5 != v7);
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v5);
      }

      registrations = self->_registrations;
      self->_registrations = (NSArray *)MEMORY[0x24BDBD1A8];

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REContextRegistrationLock);
  }
}

- (void)evaluateQuery
{
  -[_REContextRegistration _evaluateQueryWithRegistration:](self, "_evaluateQueryWithRegistration:", 0);
}

- (void)_evaluateQueryWithRegistration:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_callback)
  {
    v3 = a3;
    if (self->_context)
    {
      -[REDuetContextQuery valueFromUserContext:](self->_query, "valueFromUserContext:");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))self->_callback + 2))();
      if (v3)
      {
        -[_REContextRegistration deregisterWithContext](self, "deregisterWithContext");
        -[_REContextRegistration registerWithContext](self, "registerWithContext");
      }

    }
  }
}

- (REDuetContextQuery)query
{
  return self->_query;
}

- (_CDUserContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end
