@implementation _RWIApplicationInfo

+ (id)identifierForPID:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PID:%lu"), a3);
}

- (_RWIApplicationInfo)initWithPID:(int)a3 bundleId:(id)a4 name:(id)a5 isProxy:(BOOL)a6 connection:(id)a7 debuggerAvailability:(unint64_t)a8
{
  id v14;
  id v15;
  _RWIRelayConnectionToApplication *v16;
  _RWIApplicationInfo *v17;
  _RWIApplicationInfo *v18;
  uint64_t v19;
  NSString *bundleId;
  uint64_t v21;
  NSString *name;
  _RWIApplicationInfo *v23;
  objc_super v25;

  v14 = a4;
  v15 = a5;
  v16 = (_RWIRelayConnectionToApplication *)a7;
  v25.receiver = self;
  v25.super_class = (Class)_RWIApplicationInfo;
  v17 = -[_RWIApplicationInfo init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_pid = a3;
    v19 = objc_msgSend(v14, "copy");
    bundleId = v18->_bundleId;
    v18->_bundleId = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    name = v18->_name;
    v18->_name = (NSString *)v21;

    v18->_proxy = a6;
    v18->_connection = v16;
    v18->_debuggerAvailability = a8;
    v18->_automationAvailability = 2;
    *(_WORD *)&v18->_hasRemoteDebugSession = 0;
    v18->_hostApplicationPID = 0;
    v23 = v18;
  }

  return v18;
}

- (NSString)identifier
{
  return (NSString *)+[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:", self->_pid);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_RWIApplicationInfo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("WIRApplicationIdentifierKey"));

  -[_RWIApplicationInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("WIRApplicationNameKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_debuggerAvailability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("WIRIsApplicationActiveKey"));

  -[_RWIApplicationInfo bundleId](self, "bundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24DE03408;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("WIRApplicationBundleIdentifierKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_RWIApplicationInfo isProxy](self, "isProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("WIRIsApplicationProxyKey"));

  RWINSStringFromAutomationAvailability(-[_RWIApplicationInfo automationAvailability](self, "automationAvailability"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("WIRAutomationAvailabilityKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[_RWIApplicationInfo hasUpdatedFromListing](self, "hasUpdatedFromListing"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("WIRIsApplicationReadyKey"));

  if (self->_hostApplicationPID)
  {
    +[_RWIApplicationInfo identifierForPID:](_RWIApplicationInfo, "identifierForPID:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("WIRHostApplicationIdentifierKey"));

  }
  -[_RWIApplicationInfo bundleId](self, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  protocolIconDataForBundleIdentifier(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("WIRApplicationIconKey"));

  return v3;
}

- (BOOL)updateFromListing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _RWIApplicationInfo *v20;
  BOOL *p_hasRemoteDebugSession;
  void *v22;
  BOOL v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *debuggerConnectionIdentifier;
  int64_t automationAvailability;
  int hasUpdatedFromListing;
  int v33;
  int64_t v34;
  NSObject *v37;
  id v39;
  id v40;
  _RWIApplicationInfo *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRListingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)objc_opt_class();
    logUnexpectedType(v22, v6);

    v23 = 0;
    goto LABEL_50;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WIRAutomationAvailabilityKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = (void *)objc_opt_class();
    logUnexpectedType(v24, v8);

    v23 = 0;
    goto LABEL_49;
  }
  v41 = self;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v10)
  {

    v20 = self;
    p_hasRemoteDebugSession = &self->_hasRemoteDebugSession;
    if (v41->_hasRemoteDebugSession)
    {
LABEL_19:
      v9 = 0;
      *p_hasRemoteDebugSession = 0;
      v25 = 1;
    }
    else
    {
      v25 = 0;
      v9 = 0;
    }
    goto LABEL_32;
  }
  v11 = v10;
  v39 = v7;
  v40 = v4;
  v12 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(v9);
      v14 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_opt_class();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = (void *)objc_opt_class();
        logUnexpectedType(v26, v15);
LABEL_22:

        goto LABEL_23;
      }

      objc_msgSend(v9, "objectForKey:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = (void *)objc_opt_class();
        logUnexpectedType(v27, v16);

        v14 = v15;
        goto LABEL_22;
      }

      objc_msgSend(v15, "objectForKey:", CFSTR("WIRConnectionIdentifierKey"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          v20 = v41;
          p_hasRemoteDebugSession = &v41->_hasRemoteDebugSession;
          v25 = 1;
          if (v41->_hasRemoteDebugSession)
          {
            v9 = v17;
          }
          else
          {
            *p_hasRemoteDebugSession = 1;
            v9 = v17;
            v25 = 0;
          }
          v4 = v40;
          goto LABEL_31;
        }
        v28 = (void *)objc_opt_class();
        logUnexpectedType(v28, v19);

LABEL_23:
        v23 = 0;
        v4 = v40;
        v7 = v39;
        goto LABEL_48;
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
      continue;
    break;
  }

  v20 = v41;
  p_hasRemoteDebugSession = &v41->_hasRemoteDebugSession;
  if (v41->_hasRemoteDebugSession)
  {
    v4 = v40;
    v7 = v39;
    goto LABEL_19;
  }
  v25 = 0;
  v9 = 0;
  v4 = v40;
LABEL_31:
  v7 = v39;
LABEL_32:
  v29 = objc_msgSend(v9, "copy", v39);
  debuggerConnectionIdentifier = v20->_debuggerConnectionIdentifier;
  v20->_debuggerConnectionIdentifier = (NSString *)v29;

  automationAvailability = v20->_automationAvailability;
  hasUpdatedFromListing = v20->_hasUpdatedFromListing;
  v33 = 1;
  v20->_hasUpdatedFromListing = 1;
  if (v7)
  {
    if (RWIAutomationAvailabilityFromString(v7, &v20->_automationAvailability))
    {
      v33 = v20->_hasUpdatedFromListing;
      v34 = v20->_automationAvailability;
      goto LABEL_36;
    }
    RWIDefaultLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[_RWIApplicationInfo updateFromListing:].cold.1((uint64_t)v7, v37);

    v23 = 0;
  }
  else
  {
    v34 = automationAvailability;
LABEL_36:
    v23 = hasUpdatedFromListing != v33 || v25 != *p_hasRemoteDebugSession || automationAvailability != v34;
  }
LABEL_48:

LABEL_49:
LABEL_50:

  return v23;
}

- (void)setHostApplicationPID:(int)a3
{
  self->_hostApplicationPID = a3;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isProxy
{
  return self->_proxy;
}

- (void)setProxy:(BOOL)a3
{
  self->_proxy = a3;
}

- (_RWIRelayConnectionToApplication)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (_RWIRelayConnectionToApplication *)a3;
}

- (NSString)debuggerConnectionIdentifier
{
  return self->_debuggerConnectionIdentifier;
}

- (void)setDebuggerConnectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)debuggerAvailability
{
  return self->_debuggerAvailability;
}

- (void)setDebuggerAvailability:(unint64_t)a3
{
  self->_debuggerAvailability = a3;
}

- (int64_t)automationAvailability
{
  return self->_automationAvailability;
}

- (BOOL)hasRemoteDebugSession
{
  return self->_hasRemoteDebugSession;
}

- (BOOL)hasUpdatedFromListing
{
  return self->_hasUpdatedFromListing;
}

- (int)hostApplicationPID
{
  return self->_hostApplicationPID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggerConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)updateFromListing:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21AD49000, a2, OS_LOG_TYPE_ERROR, "Could not parse value for WIRAutomationAvailabilityKey: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
