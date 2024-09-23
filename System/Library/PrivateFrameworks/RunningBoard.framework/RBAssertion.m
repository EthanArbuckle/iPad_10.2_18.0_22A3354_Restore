@implementation RBAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plugInHoldToken, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_assertionInfo, 0);
  objc_storeStrong((id *)&self->_lastConditions, 0);
  objc_storeStrong((id *)&self->_originatorInheritances, 0);
  objc_storeStrong((id *)&self->_intransientState, 0);
  objc_storeStrong((id *)&self->_transientState, 0);
  objc_storeStrong(&self->_targetState, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_targetProcessForAbstract, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (RBProcess)originator
{
  return self->_originator;
}

- (unsigned)invalidationReason
{
  RBAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)resolveStateWithContext:(id)a3
{
  RBAssertion *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  LOBYTE(v3) = -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)v3, v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)hasHereditaryGrant
{
  return -[RBAssertionIntransientState hasHereditaryGrant](self->_intransientState, "hasHereditaryGrant");
}

- (BOOL)isActive
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_active && !self->_suspended;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)invalidationDuration
{
  double result;

  -[RBAssertionIntransientState invalidationDuration](self->_intransientState, "invalidationDuration");
  return result;
}

- (RBProcessState)processState
{
  os_unfair_lock_s *p_lock;
  RBProcessState *v4;
  RBProcessState *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0 || !self->_targetState)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[RBAssertion processState].cold.1();
  v4 = (RBProcessState *)objc_msgSend(self->_targetState, "copy");
  if (!v4)
  {
LABEL_5:
    if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v5 = [RBProcessState alloc];
      -[RBConcreteTargeting identity](self->_target, "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[RBProcessState initWithIdentity:](v5, "initWithIdentity:", v6);

    }
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (unint64_t)endPolicy
{
  return -[RBAssertionIntransientState endPolicy](self->_intransientState, "endPolicy");
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSSet)sourceEnvironments
{
  return (NSSet *)-[RBAssertionIntransientState sourceEnvironments](self->_intransientState, "sourceEnvironments");
}

- (id)updateProcessStateWithAttributeContext:(id)a3
{
  -[RBAssertion resolveStateWithContext:](self, "resolveStateWithContext:", a3);
  return -[RBAssertion processState](self, "processState");
}

- (BOOL)isPersistent
{
  return -[RBAssertionIntransientState isPersistent](self->_intransientState, "isPersistent");
}

- (void)applyToProcessState:(id)a3 withAttributeContext:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) == 0 && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[RBAssertion applyToProcessState:withAttributeContext:].cold.1();
    v8 = objc_msgSend(self->_targetState, "copy");
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v10, "unionState:", v8);

    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (unint64_t)startPolicy
{
  return -[RBAssertionIntransientState startPolicy](self->_intransientState, "startPolicy");
}

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6 creationTime:(double)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  RBAssertion *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = [RBAssertion alloc];
  objc_msgSend(v14, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "explanation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]((uint64_t)v15, v13, v16, v17, v18, v12, v11, a7);
  return (RBAssertion *)v19;
}

- (NSString)debugDescription
{
  char v3;
  id targetState;
  const __CFString *v5;
  objc_class *v6;
  __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  RBAssertionTransientState *transientState;
  RBAssertionIntransientState *intransientState;
  RBAssertionTransientState *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  RBProcess *originator;
  NSString *explanation;
  RBConcreteTargeting *target;
  RBSAssertionIdentifier *identifier;
  void *v27;
  __CFString *v28;
  id v29;
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v3 = -[RBConcreteTargeting isSystem](self->_target, "isSystem");
  targetState = self->_targetState;
  if ((v3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = (const __CFString *)targetState;
    targetState = 0;
  }
  v28 = (__CFString *)v5;
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = (__CFString *)targetState;
  v29 = [v6 alloc];
  objc_msgSend((id)objc_opt_class(), "description");
  v8 = objc_claimAutoreleasedReturnValue();
  target = self->_target;
  identifier = self->_identifier;
  v27 = (void *)v8;
  originator = self->_originator;
  explanation = self->_explanation;
  v9 = CFSTR(" transientState:");
  transientState = self->_transientState;
  intransientState = self->_intransientState;
  if (!transientState)
    v9 = &stru_24DD48378;
  v22 = v9;
  if (transientState)
    v12 = self->_transientState;
  else
    v12 = (RBAssertionTransientState *)&stru_24DD48378;
  if (self->_active)
    v13 = CFSTR(" active");
  else
    v13 = &stru_24DD48378;
  if (v5)
    v14 = CFSTR(" processState:");
  else
    v14 = &stru_24DD48378;
  if (v5)
    v15 = v5;
  else
    v15 = &stru_24DD48378;
  if (v7)
    v16 = CFSTR(" systemState:");
  else
    v16 = &stru_24DD48378;
  if (v7)
    v17 = v7;
  else
    v17 = &stru_24DD48378;
  if (self->_suspended)
    v18 = CFSTR(" suspended");
  else
    v18 = &stru_24DD48378;
  -[NSArray componentsJoinedByString:](self->_attributes, "componentsJoinedByString:", CFSTR(",\n\t"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("<%@| identifier:%@ target:%@ explanation:\"%@\"%@ originator:%@%@%@ intransientState:%@%@%@%@%@ suspended:%@ attributes:[\n\t%@\n\t]>"), v27, identifier, target, explanation, v13, originator, v22, v12, intransientState, v14, v15, v16, v17, v18, v19);

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v20;
}

- (void)activate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 1;
  os_unfair_lock_unlock(p_lock);
}

- (uint64_t)_initWithTarget:(void *)a3 identifier:(void *)a4 explanation:(void *)a5 attributes:(void *)a6 originator:(void *)a7 context:(double)a8 creationTime:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  RBAssertionIntransientState *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t i;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v16 = a2;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v51 = a6;
  v20 = a7;
  if (a1)
  {
    v56.receiver = (id)a1;
    v56.super_class = (Class)RBAssertion;
    v21 = objc_msgSendSuper2(&v56, sel_init);
    a1 = (uint64_t)v21;
    if (v21)
    {
      v48 = v19;
      v49 = v17;
      v50 = v16;
      *((_DWORD *)v21 + 26) = 0;
      objc_storeStrong((id *)v21 + 1, a2);
      objc_storeStrong((id *)(a1 + 24), a3);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ (target:%@)"), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 8));
      v23 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v22;

      v24 = objc_msgSend(v18, "copy");
      v25 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v24;

      *(_BYTE *)(a1 + 111) = 0;
      objc_storeStrong((id *)(a1 + 40), a5);
      objc_storeStrong((id *)(a1 + 112), a6);
      *(_BYTE *)(a1 + 109) = 0;
      *(double *)(a1 + 96) = a8;
      v26 = objc_alloc_init(RBAssertionIntransientState);
      v27 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v26;

      *(_BYTE *)(a1 + 108) = 0;
      objc_msgSend(v20, "setAssertion:", a1);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v28 = *(id *)(a1 + 40);
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v29)
      {
        v30 = v29;
        v31 = 0;
        v32 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v53 != v32)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "applyToAssertionIntransientState:attributePath:context:", *(_QWORD *)(a1 + 64), RBSAttributePathIncrement(0, v31 + i), v20);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          v31 += i;
        }
        while (v30);
      }

      if (!v18)
      {
        rbs_assertion_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          -[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:].cold.1(a1, v34);

      }
      v35 = objc_msgSend(*(id *)(a1 + 64), "runningReason");
      v36 = objc_msgSend(*(id *)(a1 + 64), "legacyReason");
      if (v36)
      {
        v37 = v36;
        v38 = 3;
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 64), "hasDomainAttribute"))
          v38 = 2;
        else
          v38 = 1;
        v37 = v35;
      }
      v19 = v48;
      v17 = v49;
      v39 = objc_msgSend(objc_alloc(MEMORY[0x24BE80C48]), "initWithType:", v38);
      v40 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v39;

      v41 = *(void **)(a1 + 88);
      if (v18)
      {
        objc_msgSend(*(id *)(a1 + 88), "setExplanation:", v18);
      }
      else
      {
        objc_msgSend((id)a1, "description");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setExplanation:", v42);

      }
      v16 = v50;
      objc_msgSend(*(id *)(a1 + 88), "setReason:", v37);
      v43 = *(void **)(a1 + 88);
      objc_msgSend(*(id *)(a1 + 64), "domainAttributes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setDomain:", v44);

      v45 = *(void **)(a1 + 88);
      NSStringFromRBSLegacyReason();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setName:", v46);

    }
  }

  return a1;
}

- (BOOL)_lock_resolveStateWithContext:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFSet *v10;
  void *v11;
  void *v12;
  const __CFSet *v13;
  CFIndex Count;
  void *v15;
  char v16;
  RBAssertionTransientState *v17;
  RBMutableSystemState *v18;
  RBMutableProcessState *v19;
  RBMutableProcessState *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  RBAssertionTransientState *v34;
  uint64_t v35;
  void *v36;
  RBMutableSystemState *v38;
  void *v39;
  const __CFSet *v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 104));
    if (*(_BYTE *)(a1 + 111) && !*(_BYTE *)(a1 + 109))
    {
      objc_msgSend(v3, "availableInheritances");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allInheritances");
      v10 = (const __CFSet *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "systemState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "conditions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(a1 + 48)
        && ((v13 = *(const __CFSet **)(a1 + 72), v10 == v13)
         || v10
         && v13
         && (Count = CFSetGetCount(v10), Count == CFSetGetCount(v13))
         && -[__CFSet isEqualToSet:](v10, "isEqualToSet:", v13))
        && ((v15 = *(void **)(a1 + 80), v12 == v15) || v12 && v15 && (objc_msgSend(v12, "isEqual:") & 1) != 0))
      {
        v5 = 0;
      }
      else
      {
        v16 = objc_msgSend(*(id *)(a1 + 8), "isSystem");
        v17 = objc_alloc_init(RBAssertionTransientState);
        v39 = v12;
        v40 = v10;
        if ((v16 & 1) != 0)
        {
          v18 = objc_alloc_init(RBMutableSystemState);
          v19 = 0;
          v38 = v18;
        }
        else
        {
          v20 = [RBMutableProcessState alloc];
          objc_msgSend(*(id *)(a1 + 8), "identity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[RBProcessState initWithIdentity:](v20, "initWithIdentity:", v21);

          v18 = 0;
          v38 = (RBMutableSystemState *)v19;
        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = a1;
        obj = *(id *)(a1 + 40);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v25 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              v28 = RBSAttributePathIncrement(0, v24 + i);
              objc_msgSend(v27, "applyToAssertionTransientState:attributePath:context:", v17, v28, v3);
              if (v19)
                objc_msgSend(v27, "applyToProcessState:attributePath:context:", v19, v28, v3);
              if (v18)
                objc_msgSend(v27, "applyToSystemState:attributePath:context:", v18, v28, v3);
            }
            v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            v24 += i;
          }
          while (v23);
        }

        v29 = objc_msgSend(*(id *)(v41 + 88), "type");
        v30 = *(_QWORD *)(v41 + 88);
        if (v29 == 3)
          -[RBMutableProcessState addLegacyAssertion:](v19, "addLegacyAssertion:", v30);
        else
          -[RBMutableProcessState addRBAssertion:](v19, "addRBAssertion:", v30);
        v12 = v39;
        v10 = v40;
        v31 = -[RBMutableSystemState copy](v38, "copy");
        v32 = *(void **)(v41 + 48);
        *(_QWORD *)(v41 + 48) = v31;

        v33 = *(void **)(v41 + 56);
        *(_QWORD *)(v41 + 56) = v17;
        v34 = v17;

        v35 = -[__CFSet copy](v40, "copy");
        v36 = *(void **)(v41 + 72);
        *(_QWORD *)(v41 + 72) = v35;

        objc_storeStrong((id *)(v41 + 80), v39);
        v5 = 1;
      }

    }
    else
    {
      v4 = *(void **)(a1 + 48);
      v5 = v4 != 0;
      *(_QWORD *)(a1 + 48) = 0;

      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      v7 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = 0;

      v8 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)definesRelativeStartTime
{
  return -[RBAssertionIntransientState definesRelativeStartTime](self->_intransientState, "definesRelativeStartTime");
}

- (void)deactivate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_active = 0;
  os_unfair_lock_unlock(p_lock);
}

- (double)warningDuration
{
  double result;

  -[RBAssertionIntransientState warningDuration](self->_intransientState, "warningDuration");
  return result;
}

- (BOOL)isValid
{
  RBAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_invalidationReason == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)suspendsOnOriginatorSuspension
{
  return -[RBAssertionIntransientState suspendsOnOriginatorSuspension](self->_intransientState, "suspendsOnOriginatorSuspension");
}

- (RBAssertionIntransientState)intransientState
{
  return self->_intransientState;
}

- (id)lock_targetProcessForAbstract
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_targetProcessForAbstract;
}

- (void)setInvalidationReason:(unsigned __int8)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_invalidationReason = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)invalidatesSynchronously
{
  return -[RBAssertionIntransientState invalidatesSynchronously](self->_intransientState, "invalidatesSynchronously");
}

- (void)setTargetProcessForAbstract:(id)a3
{
  RBProcess *v4;
  RBProcess *targetProcessForAbstract;
  RBProcess *v6;
  id targetState;

  v4 = (RBProcess *)a3;
  os_unfair_lock_lock_with_options();
  targetProcessForAbstract = self->_targetProcessForAbstract;
  self->_targetProcessForAbstract = v4;
  v6 = v4;

  targetState = self->_targetState;
  self->_targetState = 0;

  os_unfair_lock_unlock(&self->_lock);
}

+ (RBAssertion)assertionWithDescriptor:(id)a3 target:(id)a4 originator:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "explanation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "assertionWithIdentifier:target:explanation:attributes:originator:context:", v14, v12, v15, v16, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBAssertion *)v17;
}

+ (RBAssertion)assertionWithIdentifier:(id)a3 target:(id)a4 explanation:(id)a5 attributes:(id)a6 originator:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  RBAssertion *v19;
  double v20;
  void *v21;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [RBAssertion alloc];
  RBSMachAbsoluteTime();
  v21 = (void *)-[RBAssertion _initWithTarget:identifier:explanation:attributes:originator:context:creationTime:]((uint64_t)v19, v17, v18, v16, v15, v14, v13, v20);

  return (RBAssertion *)v21;
}

- (void)suspend
{
  NSObject *v3;
  int v4;
  RBAssertion *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[RBAssertionIntransientState suspendsOnOriginatorSuspension](self->_intransientState, "suspendsOnOriginatorSuspension"))
  {
    rbs_ttl_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_DEFAULT, "Suspending assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)resume
{
  NSObject *v3;
  int v4;
  RBAssertion *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[RBAssertionIntransientState suspendsOnOriginatorSuspension](self->_intransientState, "suspendsOnOriginatorSuspension"))
  {
    rbs_ttl_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_DEFAULT, "Resuming assertion %{public}@", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock_with_options();
    self->_suspended = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)isSuspended
{
  RBAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_suspended;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  unint64_t v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = -[RBAssertionTransientState maxCPUUsageViolationPolicyForRole:](self->_transientState, "maxCPUUsageViolationPolicyForRole:", v3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)legacyReason
{
  return -[RBAssertionIntransientState legacyReason](self->_intransientState, "legacyReason");
}

- (unint64_t)runningReason
{
  return -[RBAssertionIntransientState runningReason](self->_intransientState, "runningReason");
}

- (BOOL)terminateTargetOnOriginatorExit
{
  return -[RBAssertionIntransientState terminateTargetOnOriginatorExit](self->_intransientState, "terminateTargetOnOriginatorExit");
}

- (RBInheritanceCollection)inheritances
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((-[RBConcreteTargeting isSystem](self->_target, "isSystem") & 1) != 0 || !self->_targetState)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[RBAssertion inheritances].cold.1();
    objc_msgSend(self->_targetState, "inheritances");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  return (RBInheritanceCollection *)v4;
}

- (BOOL)hasDomainAttribute
{
  return -[RBAssertionIntransientState hasDomainAttribute](self->_intransientState, "hasDomainAttribute");
}

- (void)applyToAssertionTransientState:(id)a3 withAttributeContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);

  if (self->_transientState)
    objc_msgSend(v7, "unionState:");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)applyToSystemState:(id)a3 withAttributeContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[RBAssertion _lock_resolveStateWithContext:]((uint64_t)self, v6);
  if (-[RBConcreteTargeting isSystem](self->_target, "isSystem") && self->_targetState)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[RBAssertion applyToSystemState:withAttributeContext:].cold.1();
    objc_msgSend(v7, "unionState:", self->_targetState);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (uint64_t)_exceptionCodeForAssertionTimeout
{
  uint64_t v2;
  void *v3;

  if (!a1)
    return 0;
  v2 = 562215635;
  objc_msgSend(a1, "explanation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("Shared Background Assertion")) & 1) != 0)
  {
    v2 = 562215634;
  }
  else if ((objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.nsurlsessiond.handlesession")) & 1) == 0
         && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.das.nsurlsessioncomplete")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.das.backgroundFetch")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.das.backgroundTasks"))
      && objc_msgSend(a1, "runningReason") == 100)
    {
      v2 = 562215636;
    }
    else
    {
      v2 = 562215597;
    }
  }

  return v2;
}

- (id)terminationContextForTargetProcess:(id)a3 originatorProcessIsActive:(BOOL)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  -[RBAssertion identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RBAssertion invalidationReason](self, "invalidationReason");
  -[RBAssertion originator](self, "originator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RBAssertion endPolicy](self, "endPolicy");
  if (objc_msgSend(v6, "isLifecycleManaged") && v8 == 4 && v10 == 2)
  {
    v11 = (void *)MEMORY[0x24BE80D40];
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = v9;
    if (!v9)
    {
      -[RBAssertion originator](self, "originator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[RBAssertion explanation](self, "explanation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Timed-out waiting for process %@ to invalidate assertion with identifier %@ and explanation '%@'. Direct this report to owners of that process"), v13, v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultContextWithExplanation:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    objc_msgSend(v16, "setPreventIfBeingDebugged:", 1);
    objc_msgSend(v16, "setReportType:", 0);
    objc_msgSend(v16, "setExceptionCode:", -[RBAssertion _exceptionCodeForAssertionTimeout](self));
    rbs_assertion_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    goto LABEL_14;
  }
  if (objc_msgSend(v6, "isLifecycleManaged") && v8 == 8 && v10 == 2)
  {
    v18 = (void *)MEMORY[0x24BE80D40];
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[RBAssertion explanation](self, "explanation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Conditions changed, forcing termination due to outstanding assertion with identifier %@ and explanation '%@'"), v7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultContextWithExplanation:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setReportType:", 0);
    objc_msgSend(v16, "setExceptionCode:", 97132013);
    rbs_assertion_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      goto LABEL_21;
    }
LABEL_14:
    -[RBAssertion terminationContextForTargetProcess:originatorProcessIsActive:].cold.1(v16);
    goto LABEL_15;
  }
  if (v8 == 1
    && -[RBAssertion terminateTargetOnOriginatorExit](self, "terminateTargetOnOriginatorExit")
    && (!v9 || !a4))
  {
    v23 = (void *)MEMORY[0x24BE80D40];
    v24 = (void *)MEMORY[0x24BDD17C8];
    v25 = v9;
    if (!v9)
    {
      -[RBAssertion originator](self, "originator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Terminating process %@ because the owner of this process %@ has exited (assertionID %@)"), v6, v25, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "defaultContextWithExplanation:", v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    objc_msgSend(v16, "setExceptionCode:", 2970726673);
    objc_msgSend(v16, "setReportType:", 0);
  }
  else
  {
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (NSString)stateCaptureTitle
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSAssertionIdentifier description](self->_identifier, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (id)plugInHoldToken
{
  return self->_plugInHoldToken;
}

- (void)setPlugInHoldToken:(id)a3
{
  objc_storeStrong(&self->_plugInHoldToken, a3);
}

- (void)_initWithTarget:(uint64_t)a1 identifier:(NSObject *)a2 explanation:attributes:originator:context:creationTime:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_FAULT, "Initializing assertion with null-proof explanation being null %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)inheritances
{
  __assert_rtn("-[RBAssertion inheritances]", "RBAssertion.m", 203, "[_targetState isKindOfClass:[RBProcessState class]]");
}

- (void)processState
{
  __assert_rtn("-[RBAssertion processState]", "RBAssertion.m", 215, "[_targetState isKindOfClass:[RBProcessState class]]");
}

- (void)applyToProcessState:withAttributeContext:.cold.1()
{
  __assert_rtn("-[RBAssertion applyToProcessState:withAttributeContext:]", "RBAssertion.m", 271, "[_targetState isKindOfClass:[RBProcessState class]]");
}

- (void)applyToSystemState:withAttributeContext:.cold.1()
{
  __assert_rtn("-[RBAssertion applyToSystemState:withAttributeContext:]", "RBAssertion.m", 294, "[_targetState isKindOfClass:[RBSystemState class]]");
}

- (void)terminationContextForTargetProcess:(void *)a1 originatorProcessIsActive:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "explanation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_21A8B4000, v2, v3, "%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
