@implementation PLBackgroundJobStatusRegistrationEvent

- (id)statusDump
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[PLBackgroundJobStatusRegistrationEvent registeredActivity](self, "registeredActivity"))
  {
    -[PLBackgroundJobStatusRegistrationEvent registeredPriorities](self, "registeredPriorities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@ activity registered by "), v4);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PLBackgroundJobStatusRegistrationEvent workersResponsible](self, "workersResponsible");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("All workers reported no work to do"));
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobStatusRegistrationEvent;
  -[PLBackgroundJobStatusEvent statusDump](&v14, sel_statusDump);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %@\n"), v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)registeredActivity
{
  return self->_registeredActivity;
}

- (void)setRegisteredActivity:(BOOL)a3
{
  self->_registeredActivity = a3;
}

- (NSString)registeredPriorities
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegisteredPriorities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)workersResponsible
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkersResponsible:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workersResponsible, 0);
  objc_storeStrong((id *)&self->_registeredPriorities, 0);
}

@end
