@implementation RBEntitlementManager

void __48__RBEntitlementManager__entitlementsForProcess___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;

  v3 = a2;
  if (-[RBEntitlementManager _secTask:hasEntitlement:](*(_QWORD *)(a1 + 32), *(SecTaskRef *)(a1 + 48), v3))objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (uint64_t)_secTask:(CFStringRef)entitlement hasEntitlement:
{
  void *v3;
  uint64_t v4;
  CFErrorRef v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[8];
  CFErrorRef error;

  if (!a1)
    return 0;
  error = 0;
  v3 = (void *)SecTaskCopyValueForEntitlement(task, entitlement, &error);
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;
  v5 = error;
  if (error)
  {
    v6 = -[__CFError code](error, "code");
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_INFO, "sectask entitlement check made for not-running process", v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[RBEntitlementManager _secTask:hasEntitlement:].cold.1();
    }

  }
  return v4;
}

- (id)entitlementsForProcess:(id)a3
{
  id v4;
  void *v5;
  RBEntitlements *v6;
  void *v7;
  id v8;
  os_unfair_lock_s *p_lock;
  NSMapTable *entitlementsByIdentifier;
  void *v11;
  RBEntitlements *v12;
  void *v13;
  NSMapTable *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isTerminating"))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    entitlementsByIdentifier = self->_entitlementsByIdentifier;
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](entitlementsByIdentifier, "objectForKey:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v12 = [RBEntitlements alloc];
      -[RBEntitlementManager _entitlementsForProcess:](self, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[RBEntitlements _initWithEntitlements:](v12, "_initWithEntitlements:", v13);

      v14 = self->_entitlementsByIdentifier;
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v8, v15);

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = [RBEntitlements alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[RBEntitlements _initWithEntitlements:](v6, "_initWithEntitlements:", v7);

  }
  return v8;
}

- (_QWORD)_entitlementsForProcess:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SecTaskRef v7;
  __SecTask *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  SecTaskRef v17;
  audit_token_t token;
  audit_token_t v19;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "auditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      memset(&v19, 0, sizeof(v19));
      objc_msgSend(v5, "realToken");
      token = v19;
      v7 = SecTaskCreateWithAuditToken(0, &token);
      if (v7)
      {
        v8 = v7;
        v9 = (void *)a1[3];
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __48__RBEntitlementManager__entitlementsForProcess___block_invoke;
        v15[3] = &unk_24DD46548;
        v15[4] = a1;
        v17 = v7;
        v10 = v4;
        v16 = v10;
        objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);
        if ((objc_msgSend(v10, "containsObject:", CFSTR("com.apple.assertiond.app-state-monitor")) & 1) == 0
          && (objc_msgSend(v10, "containsObject:", CFSTR("com.apple.runningboard.testbinary")) & 1) == 0
          && (SecTaskGetCodeSignStatus(v8) & 0xC000001) == 0x4000001
          && (objc_msgSend(v3, "isTestApp") & 1) == 0)
        {
          objc_msgSend(v10, "addObject:", CFSTR("com.apple.assertiond.app-state-monitor"));
        }
        CFRelease(v8);

      }
      else
      {
        rbs_general_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[RBEntitlementManager _entitlementsForProcess:].cold.2();

      }
      -[RBEntitlementManager _removeRestrictedEntitlements:forProcess:]((uint64_t)a1, v4, v3);
      v12 = v4;
    }
    else
    {
      rbs_process_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RBEntitlementManager _entitlementsForProcess:].cold.1();

      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    a1 = v12;

  }
  return a1;
}

- (void)_removeRestrictedEntitlements:(void *)a3 forProcess:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_28;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "isTestApp");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (!v10)
  {

    v20 = 0;
    goto LABEL_27;
  }
  v11 = v10;
  v21 = v7;
  v22 = v5;
  v24 = 0;
  v12 = *(_QWORD *)v26;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "containsObject:", v8) & 1) == 0)
      {
        if (!os_variant_has_internal_content()
          || (objc_msgSend(v8, "hasConsistentLaunchdJob") & 1) != 0
          || (objc_msgSend(v8, "isEmbeddedApplication") & 1) != 0)
        {
          if ((v23 & 1) != 0)
            goto LABEL_18;
        }
        else if (((objc_msgSend(v8, "isXPCService") ^ 1 | v23) & 1) != 0)
        {
          goto LABEL_18;
        }
        rbs_process_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v8;
          v31 = 2114;
          v32 = v14;
          _os_log_fault_impl(&dword_21A8B4000, v17, OS_LOG_TYPE_FAULT, "RunningBoard: Process %{public}@ does not have permission to have entitlement %{public}@", buf, 0x16u);
        }

        v18 = v24;
        if (!v24)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v24 = v18;
        objc_msgSend(v18, "addObject:", v14);
      }
LABEL_18:

      ++v13;
    }
    while (v11 != v13);
    v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    v11 = v19;
  }
  while (v19);

  v20 = v24;
  if (v24)
    objc_msgSend(v9, "minusSet:", v24);
  v7 = v21;
  v5 = v22;
LABEL_27:

LABEL_28:
}

- (RBEntitlementManager)initWithDomainAttributeEntitlements:(id)a3
{
  id v5;
  RBEntitlementManager *v6;
  RBEntitlementManager *v7;
  uint64_t v8;
  NSMapTable *entitlementsByIdentifier;
  void *v10;
  uint64_t v11;
  NSSet *availableEntitlements;
  uint64_t v13;
  NSDictionary *restrictedEntitlements;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBEntitlementManager.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlements"));

  }
  v17.receiver = self;
  v17.super_class = (Class)RBEntitlementManager;
  v6 = -[RBEntitlementManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    entitlementsByIdentifier = v7->_entitlementsByIdentifier;
    v7->_entitlementsByIdentifier = (NSMapTable *)v8;

    +[RBEntitlementManager _hardCodedEntitlements]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setByAddingObjectsFromSet:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    availableEntitlements = v7->_availableEntitlements;
    v7->_availableEntitlements = (NSSet *)v11;

    restrictedEntitlementsFromPlist();
    v13 = objc_claimAutoreleasedReturnValue();
    restrictedEntitlements = v7->_restrictedEntitlements;
    v7->_restrictedEntitlements = (NSDictionary *)v13;

  }
  return v7;
}

+ (id)_hardCodedEntitlements
{
  objc_opt_self();
  if (_hardCodedEntitlements_onceToken != -1)
    dispatch_once(&_hardCodedEntitlements_onceToken, &__block_literal_global_5);
  return (id)_hardCodedEntitlements_hardCodedEntitlements;
}

- (NSString)debugDescription
{
  id v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_entitlementsByIdentifier;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_entitlementsByIdentifier, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\n\t"), v11, v10);

      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet allObjects](self->_availableEntitlements, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(",\n\t\t"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@|  availableEntitlements:[\n\t\t%@\n\t] entitlementsByIdentifier:[\n\t%@\n\t\t]>"), v13, v15, v3);

  return (NSString *)v16;
}

- (id)allEntitlements
{
  return (id)-[NSSet copy](self->_availableEntitlements, "copy");
}

- (void)purgeEntitlementsForProcess:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMapTable *entitlementsByIdentifier;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  entitlementsByIdentifier = self->_entitlementsByIdentifier;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable removeObjectForKey:](entitlementsByIdentifier, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)captureState
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBEntitlementManager debugDescription](self, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

void __46__RBEntitlementManager__hardCodedEntitlements__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.runningboard.primitiveattribute"), CFSTR("com.apple.runningboard.endowment-originator"), CFSTR("com.apple.runningboard.invalidateanyassertion"), CFSTR("com.apple.runningboard.launchprocess"), CFSTR("com.apple.runningboard.listallassertions"), CFSTR("com.apple.runningboard.process-state"), CFSTR("com.apple.runningboard.statecapture"), CFSTR("com.apple.runningboard.targetidentities"), CFSTR("com.apple.runningboard.terminateprocess"), CFSTR("com.apple.runningboard.terminatemanagedprocesses"), CFSTR("com.apple.runningboard.performancetest"), CFSTR("com.apple.runningboard.launch_extensions"), CFSTR("com.apple.runningboard.launch_dexts"), CFSTR("com.apple.runningboard.trustedtarget"), CFSTR("com.apple.runningboard.testbinary"), CFSTR("com.apple.developer.kernel.increased-memory-limit"), CFSTR("com.apple.private.security.container-required"),
    CFSTR("com.apple.backboard.client"),
    CFSTR("com.apple.assertiond.background-view-services"),
    CFSTR("com.apple.multitasking.newsstandassertions"),
    CFSTR("com.apple.assertiond.system-shell"),
    CFSTR("com.apple.multitasking.systemappassertions"),
    CFSTR("com.apple.multitasking.termination"),
    CFSTR("com.apple.multitasking.unlimitedassertions"),
    CFSTR("com.apple.UIKit.vends-view-services"),
    CFSTR("com.apple.multitasking.voipassertions"),
    CFSTR("com.apple.assertiond.app-state-monitor"),
    CFSTR("com.apple.private.xpc.launchd.app-server"),
    CFSTR("com.apple.backboardd.debugapplications"),
    CFSTR("com.apple.springboard.debugapplications"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_hardCodedEntitlements_hardCodedEntitlements;
  _hardCodedEntitlements_hardCodedEntitlements = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedEntitlements, 0);
  objc_storeStrong((id *)&self->_availableEntitlements, 0);
  objc_storeStrong((id *)&self->_entitlementsByIdentifier, 0);
}

- (void)_entitlementsForProcess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Unable to load defaults for %{public}@: no audit token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_entitlementsForProcess:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "SecTaskCreateWithAuditToken failed for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_secTask:hasEntitlement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "SecTaskCopyValueForEntitlement failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
