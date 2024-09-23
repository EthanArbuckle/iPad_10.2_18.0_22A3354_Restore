@implementation PBFPosterDataStoreEvent

- (PBFPosterDataStoreEvent)initWithType:(id)a3
{
  id v5;
  PBFPosterDataStoreEvent *v6;
  PBFPosterDataStoreEvent *v7;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  PBFPosterDataStoreEvent *result;
  void *v11;
  objc_super v12;

  v5 = a3;
  if ((PBFPosterDataStoreEventTypeIsValid(v5) & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)PBFPosterDataStoreEvent;
    v6 = -[PBFPosterDataStoreEvent init](&v12, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_eventType, a3);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSUUID *)v8;

    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PBFPosterDataStoreEventTypeIsValid(type)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterDataStoreEvent initWithType:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (PBFPosterDataStoreEvent *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PBFPosterDataStoreEvent)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFPosterDataStoreEvent *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PBFPosterDataStoreEvent *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PBFPosterDataStoreEvent.m");
    v17 = 1024;
    v18 = 85;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFPosterDataStoreEvent *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  v2 = -[NSUUID hash](self->_uniqueIdentifier, "hash");
  v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) >> 27));
  return v3 ^ (v3 >> 31);
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3 == self)
    return 1;
  v4 = a3;
  -[PBFPosterDataStoreEvent uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = BSEqualObjects();
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  PBFPosterDataStoreEvent *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (PBFPosterDataStoreEvent *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && -[PBFPosterDataStoreEvent isEqualToEvent:](self, "isEqualToEvent:", v4);
  }

  return v7;
}

- (BOOL)couldRevert
{
  void *v2;
  BOOL v3;

  -[PBFPosterDataStoreEvent revertBlock](self, "revertBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)revert
{
  _BOOL4 v3;
  uint64_t (**v4)(void);
  char v5;

  v3 = -[PBFPosterDataStoreEvent couldRevert](self, "couldRevert");
  if (v3)
  {
    -[PBFPosterDataStoreEvent revertBlock](self, "revertBlock");
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v5 = v4[2]();

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isValidWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  const __CFString *eventType;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((PBFPosterDataStoreEventTypeIsValid(self->_eventType) & 1) != 0)
  {
    v15 = CFSTR("eventDescription");
    -[PBFPosterDataStoreEvent description](self, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("(null)");
    if (v5)
      v7 = (const __CFString *)v5;
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated"))|| -[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated"))|| -[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypePosterActivated"))|| -[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypePosterSelected")))
    {
      if (*(_OWORD *)&self->_fromValue == 0 || (BSEqualObjects() & 1) != 0)
        goto LABEL_10;
      goto LABEL_29;
    }
    if (!-[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypePosterDeleted")))
    {
      if (-[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypePosterAdded")))
      {
        if (!self->_toValue)
          goto LABEL_10;
        goto LABEL_29;
      }
      if (!-[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypePosterUpdated")))
      {
        if (-[NSString isEqualToString:](self->_eventType, "isEqualToString:", CFSTR("PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"))&& BSEqualStrings())
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBFPosterDataStoreEventErrorDomain"), -3453, v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          v11 = v9 == 0;
          if (a3 && v9)
          {
            v10 = objc_retainAutorelease(v9);
            v11 = 0;
            *a3 = v10;
          }
          goto LABEL_30;
        }
LABEL_29:
        v10 = 0;
        v11 = 1;
LABEL_30:

LABEL_31:
        return v11;
      }
      if (self->_toValue)
        goto LABEL_29;
    }
    if (!self->_fromValue)
      goto LABEL_10;
    goto LABEL_29;
  }
  if (a3)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    eventType = CFSTR("(null event type)");
    if (self->_eventType)
      eventType = (const __CFString *)self->_eventType;
    v17 = CFSTR("eventType");
    v18[0] = eventType;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PBFPosterDataStoreEventErrorDomain"), -3454, v10);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  PBFPosterDataStoreEvent *v17;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_eventType, CFSTR("eventType"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[PBFPosterDataStoreEvent couldRevert](self, "couldRevert"), CFSTR("couldRevert"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_originatingRoleCoordinatorChange, CFSTR("_originatingRoleCoordinatorChange"), 1);
  objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", self->_userInfo, CFSTR("userInfo"), 1);
  if (self->_fromValue || self->_toValue)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __38__PBFPosterDataStoreEvent_description__block_invoke;
    v15 = &unk_1E86F2540;
    v16 = v3;
    v17 = self;
    objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("changes"), CFSTR("\n"), &v12);

  }
  -[PBFPosterDataStoreEvent relatedProviders](self, "relatedProviders", v12, v13, v14, v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("relatedProviders"), 1);

  -[PBFPosterDataStoreEvent relatedPosters](self, "relatedPosters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("relatedPosters"), 1);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __38__PBFPosterDataStoreEvent_description__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("fromValue"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("toValue"), 1);
}

- (void)dumpLongDescriptionWithPreamble:(id)a3 log:(id)a4 type:(unsigned __int8)a5
{
  id v8;
  NSObject *v9;
  NSString *eventType;
  NSObject *v11;
  _BOOL4 v12;
  PBFPosterRoleCoordinatorChange *originatingRoleCoordinatorChange;
  id fromValue;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id toValue;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  NSDictionary *userInfo;
  PBFPosterDataStoreEvent *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled(v9, (os_log_type_t)a5))
  {
    eventType = self->_eventType;
    *(_DWORD *)buf = 138543618;
    v68 = v8;
    v69 = 2114;
    v70 = eventType;
    _os_log_impl(&dword_1CB9FA000, v9, (os_log_type_t)a5, "[%{public}@]\tEventType: %{public}@", buf, 0x16u);
  }
  v11 = v9;
  if (os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    v12 = -[PBFPosterDataStoreEvent couldRevert](self, "couldRevert");
    *(_DWORD *)buf = 138543618;
    v68 = v8;
    v69 = 1024;
    LODWORD(v70) = v12;
    _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\tcouldRevert: %{BOOL}u", buf, 0x12u);
  }

  if (self->_originatingRoleCoordinatorChange && os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    originatingRoleCoordinatorChange = self->_originatingRoleCoordinatorChange;
    *(_DWORD *)buf = 138543618;
    v68 = v8;
    v69 = 2114;
    v70 = originatingRoleCoordinatorChange;
    _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\toriginatingRoleCoordinatorChange: %{public}@", buf, 0x16u);
  }
  v47 = self;
  if (self->_fromValue)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      fromValue = self->_fromValue;
      *(_DWORD *)buf = 138543618;
      v68 = v8;
      v69 = 2114;
      v70 = fromValue;
      _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\tfromValue: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(self->_fromValue, "conformsToProtocol:", &unk_1EFA0AD40))
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v15 = self->_fromValue;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v19 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v61 != v19)
              objc_enumerationMutation(v15);
            if (os_log_type_enabled(v11, (os_log_type_t)a5))
            {
              v21 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
              *(_DWORD *)buf = 138543874;
              v68 = v8;
              v69 = 2048;
              v70 = v18;
              v71 = 2114;
              v72 = v21;
              _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\tfromValue @ idx %lu: %{public}@", buf, 0x20u);
              ++v18;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
        }
        while (v17);
      }

      self = v47;
    }
  }
  if (self->_toValue)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      toValue = self->_toValue;
      *(_DWORD *)buf = 138543618;
      v68 = v8;
      v69 = 2114;
      v70 = toValue;
      _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\ttoValue: %{public}@", buf, 0x16u);
    }
    if (objc_msgSend(self->_toValue, "conformsToProtocol:", &unk_1EFA0AD40))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v23 = self->_toValue;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v24)
      {
        v25 = v24;
        v26 = 0;
        v27 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v57 != v27)
              objc_enumerationMutation(v23);
            if (os_log_type_enabled(v11, (os_log_type_t)a5))
            {
              v29 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
              *(_DWORD *)buf = 138543874;
              v68 = v8;
              v69 = 2048;
              v70 = v26;
              v71 = 2114;
              v72 = v29;
              _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\ttoValue @ idx %lu: %{public}@", buf, 0x20u);
              ++v26;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v25);
      }

      self = v47;
    }
  }
  -[PBFPosterDataStoreEvent relatedPosters](self, "relatedPosters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      *(_DWORD *)buf = 138543362;
      v68 = v8;
      _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\trelatedPosters:", buf, 0xCu);
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[PBFPosterDataStoreEvent relatedPosters](self, "relatedPosters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v53;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v53 != v35)
            objc_enumerationMutation(v32);
          if (os_log_type_enabled(v11, (os_log_type_t)a5))
          {
            v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
            *(_DWORD *)buf = 138543618;
            v68 = v8;
            v69 = 2114;
            v70 = v37;
            _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\t\t %{public}@", buf, 0x16u);
          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v34);
    }

    self = v47;
  }
  -[PBFPosterDataStoreEvent relatedProviders](self, "relatedProviders");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    if (os_log_type_enabled(v11, (os_log_type_t)a5))
    {
      *(_DWORD *)buf = 138543362;
      v68 = v8;
      _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\trelatedProviders:", buf, 0xCu);
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[PBFPosterDataStoreEvent relatedProviders](self, "relatedProviders");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v49;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(v40);
          if (os_log_type_enabled(v11, (os_log_type_t)a5))
          {
            v45 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * m);
            *(_DWORD *)buf = 138543618;
            v68 = v8;
            v69 = 2114;
            v70 = v45;
            _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\t\t %{public}@", buf, 0x16u);
          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      }
      while (v42);
    }

    self = v47;
  }
  if (self->_userInfo && os_log_type_enabled(v11, (os_log_type_t)a5))
  {
    userInfo = self->_userInfo;
    *(_DWORD *)buf = 138543618;
    v68 = v8;
    v69 = 2114;
    v70 = userInfo;
    _os_log_impl(&dword_1CB9FA000, v11, (os_log_type_t)a5, "[%{public}@]\t\tuserInfo: %{public}@", buf, 0x16u);
  }

}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_storeStrong(&self->_fromValue, a3);
}

- (id)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_storeStrong(&self->_toValue, a3);
}

- (NSSet)relatedProviders
{
  return self->_relatedProviders;
}

- (void)setRelatedProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)relatedPosters
{
  return self->_relatedPosters;
}

- (void)setRelatedPosters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange
{
  return self->_originatingRoleCoordinatorChange;
}

- (void)setOriginatingRoleCoordinatorChange:(id)a3
{
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)revertBlock
{
  return self->_revertBlock;
}

- (void)setRevertBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_revertBlock, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, 0);
  objc_storeStrong((id *)&self->_relatedPosters, 0);
  objc_storeStrong((id *)&self->_relatedProviders, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

- (void)initWithType:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
