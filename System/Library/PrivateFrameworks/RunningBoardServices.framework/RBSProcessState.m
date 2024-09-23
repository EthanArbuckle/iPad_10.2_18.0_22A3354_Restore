@implementation RBSProcessState

- (RBSProcessHandle)process
{
  return self->_process;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

+ (void)setActiveStateDescriptor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("RBSProcessStateDescriptor"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("RBSProcessStateDescriptor"));

}

- (BOOL)isRunning
{
  return RBSTaskStateIsRunning(self->_taskState);
}

- (NSSet)endowmentNamespaces
{
  return self->_endowmentNamespaces;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[RBSProcessState initWithProcess:](+[RBSProcessState allocWithZone:](RBSProcessState, "allocWithZone:", a3), self->_process);
  objc_msgSend(v4, "setTaskState:", self->_taskState);
  objc_msgSend(v4, "setDebugState:", self->_debugState);
  objc_msgSend(v4, "setTerminationResistance:", self->_terminationResistance);
  v5 = (void *)-[NSSet copy](self->_endowmentNamespaces, "copy");
  objc_msgSend(v4, "setEndowmentNamespaces:", v5);

  v6 = (void *)-[NSSet copy](self->_tags, "copy");
  objc_msgSend(v4, "setTags:", v6);

  v7 = (void *)-[NSSet copy](self->_legacyAssertions, "copy");
  objc_msgSend(v4, "setLegacyAssertions:", v7);

  v8 = (void *)-[NSSet copy](self->_primitiveAssertions, "copy");
  objc_msgSend(v4, "setPrimitiveAssertions:", v8);

  v9 = (void *)-[NSSet copy](self->_endowmentInfos, "copy");
  objc_msgSend(v4, "setEndowmentInfos:", v9);

  return v4;
}

- (void)setEndowmentNamespaces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setEndowmentInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPrimitiveAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setTerminationResistance:(unsigned __int8)a3
{
  self->_terminationResistance = a3;
}

- (void)setLegacyAssertions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setTaskState:(unsigned __int8)a3
{
  self->_taskState = a3;
}

- (void)setDebugState:(unsigned __int8)a3
{
  self->_debugState = a3;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessState *v4;
  RBSProcessState *v5;
  uint64_t v6;
  _BOOL4 v7;

  v4 = (RBSProcessState *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else if (v4 && (v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    v7 = !-[RBSProcessState isDifferentFromState:significantly:](self, "isDifferentFromState:significantly:", v5, 0);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isDifferentFromState:(id)a3 significantly:(BOOL *)a4
{
  RBSProcessState *v6;
  RBSProcessState *v7;
  int v8;
  NSSet *endowmentNamespaces;
  const __CFSet *v10;
  CFIndex v11;
  NSSet *tags;
  const __CFSet *v13;
  char v14;
  CFIndex Count;
  NSSet *legacyAssertions;
  const __CFSet *v17;
  CFIndex v18;
  NSSet *primitiveAssertions;
  const __CFSet *v20;
  CFIndex v21;
  NSSet *endowmentInfos;
  const __CFSet *v23;
  CFIndex v24;
  BOOL v25;
  BOOL v26;
  BOOL v28;

  v6 = (RBSProcessState *)a3;
  v7 = v6;
  if (v6)
  {
    if (self == v6)
      goto LABEL_38;
    if (self->_taskState == v6->_taskState
      && (v8 = -[RBSProcessHandle pid](self->_process, "pid"), v8 == -[RBSProcessHandle pid](v7->_process, "pid")))
    {
      endowmentNamespaces = self->_endowmentNamespaces;
      v10 = (const __CFSet *)v7->_endowmentNamespaces;
      if (endowmentNamespaces == (NSSet *)v10
        || endowmentNamespaces
        && v10
        && (v11 = CFSetGetCount((CFSetRef)self->_endowmentNamespaces), v11 == CFSetGetCount(v10))
        && -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v10))
      {
        if (self->_debugState != v7->_debugState || self->_terminationResistance != v7->_terminationResistance)
          goto LABEL_41;
        tags = self->_tags;
        v13 = (const __CFSet *)v7->_tags;
        if (tags != (NSSet *)v13)
        {
          v14 = 0;
          if (!tags || !v13)
            goto LABEL_35;
          Count = CFSetGetCount((CFSetRef)self->_tags);
          if (Count != CFSetGetCount(v13) || !-[NSSet isEqualToSet:](tags, "isEqualToSet:", v13))
            goto LABEL_41;
        }
        legacyAssertions = self->_legacyAssertions;
        v17 = (const __CFSet *)v7->_legacyAssertions;
        if (legacyAssertions != (NSSet *)v17)
        {
          v14 = 0;
          if (!legacyAssertions || !v17)
            goto LABEL_35;
          v18 = CFSetGetCount((CFSetRef)self->_legacyAssertions);
          if (v18 != CFSetGetCount(v17) || !-[NSSet isEqualToSet:](legacyAssertions, "isEqualToSet:", v17))
            goto LABEL_41;
        }
        primitiveAssertions = self->_primitiveAssertions;
        v20 = (const __CFSet *)v7->_primitiveAssertions;
        if (primitiveAssertions != (NSSet *)v20)
        {
          v14 = 0;
          if (!primitiveAssertions || !v20)
            goto LABEL_35;
          v21 = CFSetGetCount((CFSetRef)self->_primitiveAssertions);
          if (v21 != CFSetGetCount(v20) || !-[NSSet isEqualToSet:](primitiveAssertions, "isEqualToSet:", v20))
          {
LABEL_41:
            v14 = 0;
            goto LABEL_35;
          }
        }
        endowmentInfos = self->_endowmentInfos;
        v23 = (const __CFSet *)v7->_endowmentInfos;
        if (endowmentInfos != (NSSet *)v23)
        {
          v14 = 0;
          if (!endowmentInfos || !v23)
            goto LABEL_35;
          v24 = CFSetGetCount((CFSetRef)endowmentInfos);
          if (v24 == CFSetGetCount(v23))
          {
            v25 = -[NSSet isEqualToSet:](endowmentInfos, "isEqualToSet:", v23);
            v14 = 0;
            v26 = 0;
            if (v25)
              goto LABEL_39;
            goto LABEL_35;
          }
          goto LABEL_41;
        }
LABEL_38:
        v26 = 0;
        goto LABEL_39;
      }
      v28 = -[NSSet containsObject:](self->_endowmentNamespaces, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
      v14 = v28 ^ -[NSSet containsObject:](v7->_endowmentNamespaces, "containsObject:", CFSTR("com.apple.frontboard.visibility"));
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = self->_taskState > 1u;
  }
LABEL_35:
  if (a4)
    *a4 = v14;
  v26 = 1;
LABEL_39:

  return v26;
}

- (unsigned)taskState
{
  return self->_taskState;
}

- (BOOL)isEmptyState
{
  int terminationResistance;
  BOOL v4;
  BOOL result;

  result = !-[RBSProcessState isRunning](self, "isRunning")
        && ((terminationResistance = self->_terminationResistance, terminationResistance != 20)
          ? (v4 = terminationResistance == 0)
          : (v4 = 1),
            v4
         && !-[NSSet count](self->_endowmentNamespaces, "count")
         && !-[NSSet count](self->_tags, "count")
         && !-[NSSet count](self->_legacyAssertions, "count")
         && !-[NSSet count](self->_primitiveAssertions, "count"))
        && -[NSSet count](self->_endowmentInfos, "count") == 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentInfos, 0);
  objc_storeStrong((id *)&self->_primitiveAssertions, 0);
  objc_storeStrong((id *)&self->_legacyAssertions, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_endowmentNamespaces, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_codedStateCache, 0);
  objc_storeStrong((id *)&self->_codedState, 0);
}

- (void)encodeWithPreviousState:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *codedState;
  uint64_t v6;
  id v7;
  unsigned __int8 *v8;
  void *v9;
  OS_xpc_object *v10;
  id v11;
  OS_xpc_object *v12;
  void *v13;
  void *v14;
  OS_xpc_object *v15;
  id v16;
  OS_xpc_object *v17;
  void *v18;
  void *v19;
  OS_xpc_object *v20;
  id v21;
  OS_xpc_object *v22;
  void *v23;
  OS_xpc_object *v24;
  id v25;
  OS_xpc_object *v26;
  void *v27;
  void *v28;
  NSSet *endowmentNamespaces;
  const __CFSet *v30;
  CFIndex Count;
  CFIndex v32;
  _BOOL4 v33;
  OS_xpc_object *v34;
  id v35;
  OS_xpc_object *v36;
  void *v37;
  void *v38;
  NSSet *tags;
  const __CFSet *v40;
  CFIndex v41;
  CFIndex v42;
  _BOOL4 v43;
  OS_xpc_object *v44;
  id v45;
  OS_xpc_object *v46;
  void *v47;
  void *v48;
  NSSet *legacyAssertions;
  const __CFSet *v50;
  CFIndex v51;
  CFIndex v52;
  _BOOL4 v53;
  OS_xpc_object *v54;
  id v55;
  OS_xpc_object *v56;
  void *v57;
  void *v58;
  NSSet *primitiveAssertions;
  const __CFSet *v60;
  CFIndex v61;
  CFIndex v62;
  _BOOL4 v63;
  OS_xpc_object *v64;
  id v65;
  OS_xpc_object *v66;
  void *v67;
  void *v68;
  NSSet *endowmentInfos;
  const __CFSet *v70;
  CFIndex v71;
  OS_xpc_object *v72;
  id v73;
  OS_xpc_object *v74;
  void *v75;
  void *v76;
  unsigned __int8 *v77;

  v77 = (unsigned __int8 *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_codedState)
  {
    v4 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    codedState = self->_codedState;
    self->_codedState = v4;

    if (v77)
    {
      v6 = *((_QWORD *)v77 + 2);
      v7 = *((id *)v77 + 1);
      v8 = v77;
      v9 = v7;
      if (self->_process == (RBSProcessHandle *)*((_QWORD *)v77 + 5))
      {
        v10 = self->_codedState;
        v11 = v7;
        v12 = v10;
        if (v11)
        {
          xpc_dictionary_get_value(v11, "_process");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v12 && v13)
            xpc_dictionary_set_value(v12, "_process", v13);
        }
        else
        {
          v14 = 0;
        }

        v8 = v77;
      }
      if ((v6 & 1) != 0 && self->_taskState == v8[36] && self->_debugState == v8[37])
      {
        v15 = self->_codedState;
        self->_codedValues |= 1uLL;
        v16 = v9;
        v17 = v15;
        if (v16)
        {
          xpc_dictionary_get_value(v16, "_taskState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17 && v18)
            xpc_dictionary_set_value(v17, "_taskState", v18);
        }
        else
        {
          v19 = 0;
        }

        v20 = self->_codedState;
        v21 = v16;
        v22 = v20;
        if (v16)
        {
          xpc_dictionary_get_value(v21, "_debugState");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v23;
          if (v22)
          {
            if (v23)
              xpc_dictionary_set_value(v22, "_debugState", v23);
          }
        }

        v8 = v77;
      }
      if ((v6 & 4) != 0 && self->_terminationResistance == v8[38])
      {
        v24 = self->_codedState;
        self->_codedValues |= 4uLL;
        v25 = v9;
        v26 = v24;
        if (v25)
        {
          xpc_dictionary_get_value(v25, "_terminationResistance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v26 && v27)
            xpc_dictionary_set_value(v26, "_terminationResistance", v27);
        }
        else
        {
          v28 = 0;
        }

        v8 = v77;
      }
      if ((v6 & 0x8000) != 0)
      {
        endowmentNamespaces = self->_endowmentNamespaces;
        v30 = (const __CFSet *)*((_QWORD *)v8 + 6);
        if (endowmentNamespaces == (NSSet *)v30
          || endowmentNamespaces
          && v30
          && (Count = CFSetGetCount((CFSetRef)self->_endowmentNamespaces),
              v32 = CFSetGetCount(v30),
              v8 = v77,
              Count == v32)
          && (v33 = -[NSSet isEqualToSet:](endowmentNamespaces, "isEqualToSet:", v30), v8 = v77, v33))
        {
          v34 = self->_codedState;
          self->_codedValues |= 0x8000uLL;
          v35 = v9;
          v36 = v34;
          if (v35)
          {
            xpc_dictionary_get_value(v35, "_endowmentNamespaces");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37;
            if (v36 && v37)
              xpc_dictionary_set_value(v36, "_endowmentNamespaces", v37);
          }
          else
          {
            v38 = 0;
          }

          v8 = v77;
        }
      }
      if ((v6 & 2) != 0)
      {
        tags = self->_tags;
        v40 = (const __CFSet *)*((_QWORD *)v8 + 7);
        if (tags == (NSSet *)v40
          || tags
          && v40
          && (v41 = CFSetGetCount((CFSetRef)self->_tags), v42 = CFSetGetCount(v40), v8 = v77, v41 == v42)
          && (v43 = -[NSSet isEqualToSet:](tags, "isEqualToSet:", v40), v8 = v77, v43))
        {
          v44 = self->_codedState;
          self->_codedValues |= 2uLL;
          v45 = v9;
          v46 = v44;
          if (v45)
          {
            xpc_dictionary_get_value(v45, "_tags");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v47;
            if (v46 && v47)
              xpc_dictionary_set_value(v46, "_tags", v47);
          }
          else
          {
            v48 = 0;
          }

          v8 = v77;
        }
      }
      if ((v6 & 8) != 0)
      {
        legacyAssertions = self->_legacyAssertions;
        v50 = (const __CFSet *)*((_QWORD *)v8 + 8);
        if (legacyAssertions == (NSSet *)v50
          || legacyAssertions
          && v50
          && (v51 = CFSetGetCount((CFSetRef)self->_legacyAssertions), v52 = CFSetGetCount(v50), v8 = v77, v51 == v52)
          && (v53 = -[NSSet isEqualToSet:](legacyAssertions, "isEqualToSet:", v50), v8 = v77, v53))
        {
          v54 = self->_codedState;
          self->_codedValues |= 8uLL;
          v55 = v9;
          v56 = v54;
          if (v55)
          {
            xpc_dictionary_get_value(v55, "_legacyAssertions");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57;
            if (v56 && v57)
              xpc_dictionary_set_value(v56, "_legacyAssertions", v57);
          }
          else
          {
            v58 = 0;
          }

          v8 = v77;
        }
      }
      if ((v6 & 0x10) != 0)
      {
        primitiveAssertions = self->_primitiveAssertions;
        v60 = (const __CFSet *)*((_QWORD *)v8 + 9);
        if (primitiveAssertions == (NSSet *)v60
          || primitiveAssertions
          && v60
          && (v61 = CFSetGetCount((CFSetRef)self->_primitiveAssertions), v62 = CFSetGetCount(v60), v8 = v77, v61 == v62)
          && (v63 = -[NSSet isEqualToSet:](primitiveAssertions, "isEqualToSet:", v60), v8 = v77, v63))
        {
          v64 = self->_codedState;
          self->_codedValues |= 0x10uLL;
          v65 = v9;
          v66 = v64;
          if (v65)
          {
            xpc_dictionary_get_value(v65, "_primitiveAssertions");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v67;
            if (v66 && v67)
              xpc_dictionary_set_value(v66, "_primitiveAssertions", v67);
          }
          else
          {
            v68 = 0;
          }

          v8 = v77;
        }
      }
      if ((v6 & 0x20) != 0)
      {
        endowmentInfos = self->_endowmentInfos;
        v70 = (const __CFSet *)*((_QWORD *)v8 + 10);
        if (endowmentInfos == (NSSet *)v70
          || endowmentInfos
          && v70
          && (v71 = CFSetGetCount((CFSetRef)self->_endowmentInfos), v71 == CFSetGetCount(v70))
          && -[NSSet isEqualToSet:](endowmentInfos, "isEqualToSet:", v70))
        {
          v72 = self->_codedState;
          self->_codedValues |= 0x20uLL;
          v73 = v9;
          v74 = v72;
          if (v73)
          {
            xpc_dictionary_get_value(v73, "_endowmentInfos");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v75;
            if (v74 && v75)
              xpc_dictionary_set_value(v74, "_endowmentInfos", v75);
          }
          else
          {
            v76 = 0;
          }

        }
      }

    }
    if (-[RBSProcessHandle isReported](self->_process, "isReported"))
      -[RBSProcessState _lock_finalizeCodingForValues:]((uint64_t)self, 32831);
  }
  os_unfair_lock_unlock(&self->_lock);

}

+ (id)untrackedRunningStateforProcess:(id)a3
{
  void *v3;

  +[RBSProcessState stateWithProcess:](RBSProcessState, "stateWithProcess:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTaskState:", 2);
  return v3;
}

+ (id)stateWithProcess:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = -[RBSProcessState initWithProcess:]([RBSProcessState alloc], v3);

  return v4;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RBSProcessStateDescriptor"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RBSProcessState _lock_encodedStateForDescriptor:]((uint64_t)self, v9);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("_codedState"));

    v5 = (id)v8;
  }
  else
  {
    -[RBSProcessState _lock_finalizeCodingForValues:]((uint64_t)self, -1);
    objc_msgSend(v5, "encodeObject:forKey:", self->_codedState, CFSTR("_codedState"));
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_encodedStateForDescriptor:(uint64_t)a1
{
  const os_unfair_lock *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  xpc_object_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  id v35;
  id v36;
  void *v37;
  char v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  id v43;
  id v44;
  void *v45;
  char v46;
  id v47;
  id v48;
  void *v49;
  char v50;
  void *v51;
  id v52;
  void *v53;

  if (!a1)
  {
    v12 = 0;
    return v12;
  }
  v3 = (const os_unfair_lock *)(a1 + 32);
  v4 = a2;
  os_unfair_lock_assert_owner(v3);
  v5 = objc_msgSend(v4, "values");
  -[RBSProcessStateDescriptor _endowmentNamespaces]((id *)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
    v5 |= 0x8000uLL;
  -[RBSProcessState _lock_finalizeCodingForValues:](a1, v5);
  v8 = *(_QWORD *)(a1 + 16) & v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    v14 = *(id *)(a1 + 8);
    v15 = v13;
    v12 = v15;
    if (v14)
    {
      xpc_dictionary_get_value(v14, "_process");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = v12 != 0;
      if (v12 && v16)
      {
        xpc_dictionary_set_value(v12, "_process", v16);
        v18 = 1;
      }
    }
    else
    {
      v17 = 0;
      v18 = v15 != 0;
    }

    if ((v8 & 1) != 0)
    {
      v19 = *(id *)(a1 + 8);
      v20 = v12;
      if (v19)
      {
        xpc_dictionary_get_value(v19, "_taskState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = !v18;
        if (!v21)
          v22 = 1;
        if ((v22 & 1) == 0)
          xpc_dictionary_set_value(v20, "_taskState", v21);
      }
      else
      {
        v21 = 0;
      }

      v23 = *(id *)(a1 + 8);
      v24 = v20;
      if (v23)
      {
        xpc_dictionary_get_value(v23, "_debugState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = !v18;
        if (!v25)
          v26 = 1;
        if ((v26 & 1) == 0)
          xpc_dictionary_set_value(v24, "_debugState", v25);
      }
      else
      {
        v25 = 0;
      }

      if ((v8 & 4) == 0)
      {
LABEL_13:
        if ((v8 & 0x8000) == 0)
          goto LABEL_14;
        goto LABEL_39;
      }
    }
    else if ((v8 & 4) == 0)
    {
      goto LABEL_13;
    }
    v27 = *(id *)(a1 + 8);
    v28 = v12;
    if (v27)
    {
      xpc_dictionary_get_value(v27, "_terminationResistance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = !v18;
      if (!v29)
        v30 = 1;
      if ((v30 & 1) == 0)
        xpc_dictionary_set_value(v28, "_terminationResistance", v29);
    }
    else
    {
      v29 = 0;
    }

    if ((v8 & 0x8000) == 0)
    {
LABEL_14:
      if ((v8 & 2) == 0)
        goto LABEL_15;
      goto LABEL_46;
    }
LABEL_39:
    v31 = *(id *)(a1 + 8);
    v32 = v12;
    if (v31)
    {
      xpc_dictionary_get_value(v31, "_endowmentNamespaces");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = !v18;
      if (!v33)
        v34 = 1;
      if ((v34 & 1) == 0)
        xpc_dictionary_set_value(v32, "_endowmentNamespaces", v33);
    }
    else
    {
      v33 = 0;
    }

    if ((v8 & 2) == 0)
    {
LABEL_15:
      if ((v8 & 8) == 0)
        goto LABEL_16;
      goto LABEL_53;
    }
LABEL_46:
    v35 = *(id *)(a1 + 8);
    v36 = v12;
    if (v35)
    {
      xpc_dictionary_get_value(v35, "_tags");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = !v18;
      if (!v37)
        v38 = 1;
      if ((v38 & 1) == 0)
        xpc_dictionary_set_value(v36, "_tags", v37);
    }
    else
    {
      v37 = 0;
    }

    if ((v8 & 8) == 0)
    {
LABEL_16:
      if ((v8 & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_60;
    }
LABEL_53:
    v39 = *(id *)(a1 + 8);
    v40 = v12;
    if (v39)
    {
      xpc_dictionary_get_value(v39, "_legacyAssertions");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = !v18;
      if (!v41)
        v42 = 1;
      if ((v42 & 1) == 0)
        xpc_dictionary_set_value(v40, "_legacyAssertions", v41);
    }
    else
    {
      v41 = 0;
    }

    if ((v8 & 0x10) == 0)
    {
LABEL_17:
      if ((v8 & 0x20) == 0)
      {
LABEL_74:
        v51 = *(void **)(a1 + 24);
        if (!v51)
        {
          v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v53 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v52;

          v51 = *(void **)(a1 + 24);
        }
        objc_msgSend(v51, "setObject:forKey:", v12, v9);
        goto LABEL_77;
      }
LABEL_67:
      v47 = *(id *)(a1 + 8);
      v48 = v12;
      if (v47)
      {
        xpc_dictionary_get_value(v47, "_endowmentInfos");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = !v18;
        if (!v49)
          v50 = 1;
        if ((v50 & 1) == 0)
          xpc_dictionary_set_value(v48, "_endowmentInfos", v49);
      }
      else
      {
        v49 = 0;
      }

      goto LABEL_74;
    }
LABEL_60:
    v43 = *(id *)(a1 + 8);
    v44 = v12;
    if (v43)
    {
      xpc_dictionary_get_value(v43, "_primitiveAssertions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = !v18;
      if (!v45)
        v46 = 1;
      if ((v46 & 1) == 0)
        xpc_dictionary_set_value(v44, "_primitiveAssertions", v45);
    }
    else
    {
      v45 = 0;
    }

    if ((v8 & 0x20) == 0)
      goto LABEL_74;
    goto LABEL_67;
  }
  v12 = v10;
LABEL_77:

  return v12;
}

- (void)_lock_finalizeCodingForValues:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 8);
    v5 = a2 & ~*(_QWORD *)(a1 + 16);
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 0;
    if (v6)
    {
      xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 8), "_process");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        return;
      v4 = *(_QWORD *)(a1 + 8);
    }
    +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v13 = v8;
      if ((objc_msgSend(v8, "containsValueForKey:", CFSTR("_process")) & 1) == 0)
        objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("_process"));
      if ((v5 & 1) != 0)
      {
        v9 = *(_QWORD *)(a1 + 16);
        if ((v9 & 1) == 0)
        {
          if (*(_BYTE *)(a1 + 36))
          {
            *(_QWORD *)(a1 + 16) = v9 | 1;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }
          if (*(_BYTE *)(a1 + 37))
          {
            *(_QWORD *)(a1 + 16) |= 1uLL;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }
        }
      }
      if ((v5 & 4) != 0)
      {
        v10 = *(_QWORD *)(a1 + 16);
        if ((v10 & 4) == 0)
        {
          if (*(_BYTE *)(a1 + 38))
          {
            *(_QWORD *)(a1 + 16) = v10 | 4;
            objc_msgSend(v13, "encodeInt64:forKey:");
          }
        }
      }
      if ((v5 & 0x8000) != 0 && (*(_BYTE *)(a1 + 17) & 0x80) == 0 && objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        *(_QWORD *)(a1 + 16) |= 0x8000uLL;
        objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("_endowmentNamespaces"));
      }
      if ((v5 & 2) != 0 && (*(_BYTE *)(a1 + 16) & 2) == 0 && objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        *(_QWORD *)(a1 + 16) |= 2uLL;
        objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("_tags"));
      }
      if ((v5 & 8) != 0 && (*(_BYTE *)(a1 + 16) & 8) == 0 && objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        *(_QWORD *)(a1 + 16) |= 8uLL;
        objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 64), CFSTR("_legacyAssertions"));
      }
      if ((v5 & 0x10) != 0 && (*(_BYTE *)(a1 + 16) & 0x10) == 0 && objc_msgSend(*(id *)(a1 + 72), "count"))
      {
        *(_QWORD *)(a1 + 16) |= 0x10uLL;
        objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 72), CFSTR("_primitiveAssertions"));
      }
      if ((v5 & 0x20) != 0 && (*(_BYTE *)(a1 + 16) & 0x20) == 0)
      {
        if (objc_msgSend(*(id *)(a1 + 80), "count"))
        {
          *(_QWORD *)(a1 + 16) |= 0x20uLL;
          objc_msgSend(v13, "encodeObject:forKey:", *(_QWORD *)(a1 + 80), CFSTR("_endowmentInfos"));
        }
      }
      objc_msgSend(v13, "createMessage");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v11;

    }
  }
}

- (RBSProcessState)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  RBSProcessState *v8;
  RBSProcessState *v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *endowmentNamespaces;
  uint64_t v13;
  uint64_t v14;
  NSSet *tags;
  uint64_t v16;
  uint64_t v17;
  NSSet *legacyAssertions;
  uint64_t v19;
  uint64_t v20;
  NSSet *primitiveAssertions;
  uint64_t v22;
  uint64_t v23;
  NSSet *endowmentInfos;
  RBSProcessState *v25;
  NSObject *v26;

  v4 = a3;
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_codedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_process"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[RBSProcessState init](self, "init");
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_process, v7);
      v9->_taskState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_taskState"));
      v9->_debugState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_debugState"));
      v9->_terminationResistance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_terminationResistance"));
      v10 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v10, objc_opt_class(), CFSTR("_endowmentNamespaces"));
      v11 = objc_claimAutoreleasedReturnValue();
      endowmentNamespaces = v9->_endowmentNamespaces;
      v9->_endowmentNamespaces = (NSSet *)v11;

      v13 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v13, objc_opt_class(), CFSTR("_tags"));
      v14 = objc_claimAutoreleasedReturnValue();
      tags = v9->_tags;
      v9->_tags = (NSSet *)v14;

      v16 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v16, objc_opt_class(), CFSTR("_legacyAssertions"));
      v17 = objc_claimAutoreleasedReturnValue();
      legacyAssertions = v9->_legacyAssertions;
      v9->_legacyAssertions = (NSSet *)v17;

      v19 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v19, objc_opt_class(), CFSTR("_primitiveAssertions"));
      v20 = objc_claimAutoreleasedReturnValue();
      primitiveAssertions = v9->_primitiveAssertions;
      v9->_primitiveAssertions = (NSSet *)v20;

      v22 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v22, objc_opt_class(), CFSTR("_endowmentInfos"));
      v23 = objc_claimAutoreleasedReturnValue();
      endowmentInfos = v9->_endowmentInfos;
      v9->_endowmentInfos = (NSSet *)v23;

    }
    self = v9;
    v25 = self;
  }
  else
  {
    rbs_general_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[RBSProcessState initWithRBSXPCCoder:].cold.1(v26);

    v25 = 0;
  }

  return v25;
}

- (void)initWithProcess:(void *)a1
{
  id v4;
  uint64_t v5;

  v4 = a2;
  if (a1)
  {
    v5 = objc_msgSend(a1, "init");
    a1 = (void *)v5;
    if (v5)
      objc_storeStrong((id *)(v5 + 40), a2);
  }

  return a1;
}

- (RBSProcessState)init
{
  RBSProcessState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessState;
  result = -[RBSProcessState init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (NSSet)endowmentInfos
{
  return self->_endowmentInfos;
}

- (NSSet)assertions
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", self->_legacyAssertions);
  objc_msgSend(v3, "unionSet:", self->_primitiveAssertions);
  return (NSSet *)v3;
}

- (BOOL)isDebugging
{
  return RBSDebugStateIsDebugging(self->_debugState);
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSString)description
{
  int terminationResistance;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _BOOL4 v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  int v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  uint64_t v51;

  terminationResistance = self->_terminationResistance;
  -[NSSet allObjects](self->_endowmentNamespaces, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[NSSet allObjects](self->_tags, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[NSSet allObjects](self->_legacyAssertions, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[NSSet allObjects](self->_primitiveAssertions, "allObjects");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v49, "count");
  -[NSSet allObjects](self->_endowmentInfos, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v10, "count");
  v37 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v40 = objc_claimAutoreleasedReturnValue();
  NSStringFromRBSTaskState(self->_taskState);
  v39 = objc_claimAutoreleasedReturnValue();
  NSStringFromRBSDebugState(self->_debugState);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR(" terminationResistance:");
  if (!terminationResistance)
    v11 = &stru_1E2D183D0;
  v36 = v11;
  v44 = terminationResistance;
  if (terminationResistance)
  {
    NSStringFromRBSTerminationResistance(self->_terminationResistance);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = &stru_1E2D183D0;
  }
  v12 = -[RBSProcessState isPreventedFromLaunching](self, "isPreventedFromLaunching");
  v13 = CFSTR(" launchPrevented");
  if (!v12)
    v13 = &stru_1E2D183D0;
  v34 = v13;
  v14 = CFSTR(" endowmentNamespace:[\n\t");
  if (!v5)
    v14 = &stru_1E2D183D0;
  v33 = v14;
  if (v5)
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",\n\t"));
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("\n\t]");
  }
  else
  {
    v32 = &stru_1E2D183D0;
    v47 = &stru_1E2D183D0;
  }
  v15 = CFSTR(" endowmentInfo:[\n\t");
  if (!v51)
    v15 = &stru_1E2D183D0;
  v31 = v15;
  v43 = v5;
  if (v51)
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(",\n\t"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = &stru_1E2D183D0;
  }
  if (v7)
    v16 = CFSTR(" tags:[\n\t");
  else
    v16 = &stru_1E2D183D0;
  v41 = v7;
  v42 = v10;
  if (v7)
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",\n\t"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("\n\t]");
  }
  else
  {
    v18 = &stru_1E2D183D0;
    v17 = &stru_1E2D183D0;
  }
  if (v9)
    v19 = CFSTR(" legacyAssertions:[\n\t");
  else
    v19 = &stru_1E2D183D0;
  v45 = v8;
  v38 = v9;
  if (v9)
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(",\n\t"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("\n\t]");
  }
  else
  {
    v21 = &stru_1E2D183D0;
    v20 = &stru_1E2D183D0;
  }
  v22 = v6;
  if (v35)
  {
    objc_msgSend(v49, "componentsJoinedByString:", CFSTR(",\n\t"));
    v23 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v21;
    v25 = (void *)v39;
    v26 = (void *)v40;
    v27 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("<%@| task:%@ debug:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v40, v39, v50, v36, v48, v34, v33, v47, v32, v31, v46, v16, v17, v18, v19, v20,
                    v29,
                    CFSTR(" rbAssertions:[\n\t"),
                    v24,
                    CFSTR("\n\t]"),
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0);

    v4 = v23;
  }
  else
  {
    v30 = v21;
    v25 = (void *)v39;
    v26 = (void *)v40;
    v27 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("<%@| task:%@ debug:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v40, v39, v50, v36, v48, v34, v33, v47, v32, v31, v46, v16, v17, v18, v19, v20,
                    v30,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0,
                    &stru_1E2D183D0);
  }
  if (v38)

  if (v41)
  if (v51)

  if (v43)
  if (v44)

  return (NSString *)v27;
}

- (BOOL)isPreventedFromLaunching
{
  return self->_preventedFromLaunching;
}

+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statesForPredicate:withDescriptor:error:", v8, v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 service:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a5, "statesForPredicate:withDescriptor:error:", a3, a4, a6);
}

- (unint64_t)hash
{
  return -[RBSProcessHandle hash](self->_process, "hash");
}

- (unsigned)debugState
{
  return self->_debugState;
}

- (NSSet)legacyAssertions
{
  return self->_legacyAssertions;
}

- (NSSet)primitiveAssertions
{
  return self->_primitiveAssertions;
}

- (unsigned)terminationResistance
{
  return self->_terminationResistance;
}

- (OS_xpc_object)codedState
{
  return self->_codedState;
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "No process handle could be decoded for RBSProcessState payload: did RBd crash?", v1, 2u);
}

@end
