@implementation RBSProcessMonitorConfiguration

- (BOOL)matchesProcess:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  RBSProcessHandle **p_lastMatch;
  id WeakRetained;
  char v8;
  BOOL v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_lastMatch = &self->_lastMatch;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastMatch);
  v8 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_predicates;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "matchesProcess:", v4, (_QWORD)v16))
          {
            objc_storeWeak((id *)p_lastMatch, v4);
            v9 = 1;
            goto LABEL_13;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_13:

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessMonitorConfiguration)initWithRBSXPCCoder:(id)a3
{
  id v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  RBSProcessMonitorConfiguration *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("_identifier")) & 1) == 0)
  {
    rbs_monitor_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBSProcessMonitorConfiguration initWithRBSXPCCoder:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("_clientPid")) & 1) == 0)
  {
    rbs_monitor_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBSProcessMonitorConfiguration initWithRBSXPCCoder:].cold.1(v13, v21, v22, v23, v24, v25, v26, v27);
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  v5 = -[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](self, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_identifier")), objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_clientPid")));
  v6 = (uint64_t)v5;
  if (v5)
  {
    v5[4] = 0;
    *((_QWORD *)v5 + 8) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_events"));
    *(_DWORD *)(v6 + 36) = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_serviceClass"));
    v7 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("_predicates"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stateDescriptor"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v10;

    -[RBSProcessMonitorConfiguration _validate](v6);
  }
  self = (RBSProcessMonitorConfiguration *)(id)v6;
  v12 = self;
LABEL_11:

  return v12;
}

- (RBSProcessStateDescriptor)stateDescriptor
{
  os_unfair_lock_s *p_lock;
  RBSProcessStateDescriptor *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_stateDescriptor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unsigned)serviceClass
{
  RBSProcessMonitorConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_serviceClass;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (id)updateHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x194018FEC](self->_updateHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x194018FEC](v4);

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  uint64_t clientPid;
  void *v6;
  id v7;

  v4 = a3;
  -[RBSProcessMonitorConfiguration _validate]((uint64_t)self);
  if (self)
    clientPid = self->_clientPid;
  else
    clientPid = 0;
  objc_msgSend(v4, "encodeInt64:forKey:", clientPid, CFSTR("_clientPid"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration identifier](self, "identifier"), CFSTR("_identifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration events](self, "events"), CFSTR("_events"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[RBSProcessMonitorConfiguration serviceClass](self, "serviceClass"), CFSTR("_serviceClass"));
  -[RBSProcessMonitorConfiguration predicates](self, "predicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_predicates"));

  -[RBSProcessMonitorConfiguration stateDescriptor](self, "stateDescriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_stateDescriptor"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSProcessMonitorConfiguration *v4;
  uint64_t v5;
  int clientPid;
  _DWORD *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[RBSProcessMonitorConfiguration allocWithZone:](RBSProcessMonitorConfiguration, "allocWithZone:", a3);
  v5 = -[RBSProcessMonitorConfiguration identifier](self, "identifier");
  if (self)
    clientPid = self->_clientPid;
  else
    clientPid = 0;
  v7 = -[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](v4, v5, clientPid);
  objc_msgSend(v7, "setServiceClass:", -[RBSProcessMonitorConfiguration serviceClass](self, "serviceClass"));
  -[RBSProcessMonitorConfiguration predicates](self, "predicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicates:", v8);

  -[RBSProcessMonitorConfiguration stateDescriptor](self, "stateDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStateDescriptor:", v9);

  objc_msgSend(v7, "setEvents:", -[RBSProcessMonitorConfiguration events](self, "events"));
  -[RBSProcessMonitorConfiguration updateHandler](self, "updateHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUpdateHandler:", v10);

  -[RBSProcessMonitorConfiguration _validate]((uint64_t)v7);
  return v7;
}

- (NSArray)predicates
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_predicates;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)events
{
  os_unfair_lock_s *p_lock;
  unint64_t events;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  events = self->_events;
  os_unfair_lock_unlock(p_lock);
  return events;
}

- (_DWORD)_initWithIdentifier:(int)a3 andPid:
{
  _DWORD *v5;
  _DWORD *v6;
  void *v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)RBSProcessMonitorConfiguration;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[4] = 0;
    *((_QWORD *)v5 + 5) = a2;
    v5[8] = a3;
    v7 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = 0;

    *((_QWORD *)v6 + 8) = 0;
    v6[9] = 17;
  }
  return v6;
}

- (void)setPredicates:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSArray *v6;
  NSArray *predicates;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  predicates = self->_predicates;
  self->_predicates = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setStateDescriptor:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  RBSProcessStateDescriptor *v6;
  RBSProcessStateDescriptor *stateDescriptor;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (RBSProcessStateDescriptor *)objc_msgSend(v5, "copy");

  stateDescriptor = self->_stateDescriptor;
  self->_stateDescriptor = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id updateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  updateHandler = self->_updateHandler;
  self->_updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setServiceClass:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_serviceClass = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setEvents:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_events = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_validate
{
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  BOOL v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 48);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[RBSProcessBKSLegacyPredicate legacyPredicate](RBSProcessBKSLegacyPredicate, "legacyPredicate", (_QWORD)v16);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8 == v9)
          {
            v10 = *(_DWORD *)(a1 + 36);
            if (v10 >= 0x11)
              v10 = 17;
            *(_DWORD *)(a1 + 36) = v10;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

    HIDWORD(v12) = *(_DWORD *)(a1 + 36) - 9;
    LODWORD(v12) = HIDWORD(v12);
    v11 = v12 >> 2;
    v13 = v11 > 6;
    v14 = (1 << v11) & 0x5D;
    if (v13 || v14 == 0)
      *(_DWORD *)(a1 + 36) = 17;
    os_unfair_lock_unlock(v2);
  }
}

- (NSString)debugDescription
{
  void *v3;
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t serviceClass;
  void *v8;
  void *v9;
  void *v10;

  -[RBSProcessMonitorConfiguration description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  serviceClass = self->_serviceClass;
  -[NSArray componentsJoinedByString:](self->_predicates, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessStateDescriptor debugDescription](self->_stateDescriptor, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@| id:%@ qos:%u predicates:[%@] descriptor:%@ events:0x%x>"), v6, v3, serviceClass, v8, v9, self->_events);

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v10;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  NSString *desc;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  desc = self->_desc;
  if (!desc)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("M%d-%llu"), self->_clientPid, self->_identifier);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_desc;
    self->_desc = v5;

    desc = self->_desc;
  }
  v7 = desc;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preventLaunchUpdateHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_stateDescriptor, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_destroyWeak((id *)&self->_lastMatch);
}

- (RBSProcessMonitorConfiguration)init
{
  uint64_t v3;
  pid_t v4;

  objc_opt_self();
  do
    v3 = __ldxr(&_nextIdentifier___count);
  while (__stxr(v3 + 1, &_nextIdentifier___count));
  v4 = getpid();
  return (RBSProcessMonitorConfiguration *)-[RBSProcessMonitorConfiguration _initWithIdentifier:andPid:](self, v3, v4);
}

- (os_unfair_lock_s)preventLaunchUpdateHandler
{
  os_unfair_lock_s *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock(a1 + 4);
    v2 = (void *)MEMORY[0x194018FEC](*(_QWORD *)&v1[20]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v1 + 4);
    v1 = (os_unfair_lock_s *)MEMORY[0x194018FEC](v2);

  }
  return v1;
}

- (void)setPreventLaunchUpdateHandle:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id preventLaunchUpdateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  preventLaunchUpdateHandler = self->_preventLaunchUpdateHandler;
  self->_preventLaunchUpdateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessMonitorConfiguration *v4;
  uint64_t v5;
  unint64_t identifier;
  int clientPid;
  BOOL v8;

  v4 = (RBSProcessMonitorConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (identifier = self->_identifier, identifier == -[RBSProcessMonitorConfiguration identifier](v4, "identifier")))
    {
      if (v4)
        clientPid = v4->_clientPid;
      else
        clientPid = 0;
      v8 = self->_clientPid == clientPid;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)setPreventLaunchUpdateHandler:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "cannot decode RBSProcessMonitorConfiguration object with no cientPid", a5, a6, a7, a8, 0);
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "cannot decode RBSProcessMonitorConfiguration object with no identifier", a5, a6, a7, a8, 0);
}

@end
