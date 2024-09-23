@implementation TRINamespaceStatus

+ (id)statusFromData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  uint64_t v16;

  v16 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPersistedNamespaceStatus, "parseFromData:error:", a3, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v15 = 0;
    v7 = "failed to parse persisted namespace status from data";
    v8 = (uint8_t *)&v15;
LABEL_12:
    _os_log_error_impl(&dword_19B89C000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    goto LABEL_13;
  }
  if ((objc_msgSend(v3, "hasNamespaceName") & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v14 = 0;
    v7 = "parsed persisted namespace status from data but name is not set";
    v8 = (uint8_t *)&v14;
    goto LABEL_12;
  }
  if ((objc_msgSend(v4, "hasNamespaceCompatibilityVersion") & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 0;
      v7 = "parsed persisted namespace status from data but compatibility version is not set";
      v8 = (uint8_t *)&v13;
      goto LABEL_12;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "hasLatestNotificationQueryLocalTime"))
  {
    objc_msgSend(v4, "latestNotificationQueryLocalTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v4, "hasLastFetchWasSuccess"))
    v11 = objc_msgSend(v4, "lastFetchWasSuccess");
  else
    v11 = 0;
  objc_msgSend(v4, "namespaceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceStatus statusWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:](TRINamespaceStatus, "statusWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v12, objc_msgSend(v4, "namespaceCompatibilityVersion"), v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v9;
}

- (id)asData
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  -[TRINamespaceStatus namespaceName](self, "namespaceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.namespaceName != nil"));

  }
  v5 = (void *)objc_opt_new();
  -[TRINamespaceStatus namespaceName](self, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNamespaceName:", v6);

  objc_msgSend(v5, "setNamespaceCompatibilityVersion:", -[TRINamespaceStatus compatibilityVersion](self, "compatibilityVersion"));
  -[TRINamespaceStatus lastFetchAttempt](self, "lastFetchAttempt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "setLatestNotificationQueryLocalTime:", v8);

    -[TRINamespaceStatus lastFetchAttempt](self, "lastFetchAttempt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestNotificationQueryLocalTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDate:", v9);

  }
  objc_msgSend(v5, "setLastFetchWasSuccess:", -[TRINamespaceStatus lastFetchWasSuccess](self, "lastFetchWasSuccess"));
  objc_msgSend(v5, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceStatusProvider.m"), 69, CFSTR("failed to serialize persisted namespace status to data"));

  }
  return v11;
}

- (TRINamespaceStatus)initWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6
{
  id v12;
  id v13;
  TRINamespaceStatus *v14;
  TRINamespaceStatus *v15;
  void *v17;
  objc_super v18;

  v12 = a3;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)TRINamespaceStatus;
  v14 = -[TRINamespaceStatus init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_namespaceName, a3);
    v15->_compatibilityVersion = a4;
    objc_storeStrong((id *)&v15->_lastFetchAttempt, a5);
    v15->_lastFetchWasSuccess = a6;
  }

  return v15;
}

+ (id)statusWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v11, v7, v10, v6);

  return v12;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v4, self->_compatibilityVersion, self->_lastFetchAttempt, self->_lastFetchWasSuccess);

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", self->_namespaceName, *(_QWORD *)&a3, self->_lastFetchAttempt, self->_lastFetchWasSuccess);
}

- (id)copyWithReplacementLastFetchAttempt:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", self->_namespaceName, self->_compatibilityVersion, v4, self->_lastFetchWasSuccess);

  return v5;
}

- (id)copyWithReplacementLastFetchWasSuccess:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", self->_namespaceName, self->_compatibilityVersion, self->_lastFetchAttempt, a3);
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *namespaceName;
  void *v10;
  int v11;
  unsigned int compatibilityVersion;
  int v13;
  void *v14;
  int v15;
  NSDate *lastFetchAttempt;
  void *v17;
  int v18;
  int lastFetchWasSuccess;
  BOOL v20;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  v6 = self->_namespaceName != 0;
  objc_msgSend(v4, "namespaceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_10;
  namespaceName = self->_namespaceName;
  if (namespaceName)
  {
    objc_msgSend(v5, "namespaceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](namespaceName, "isEqual:", v10);

    if (!v11)
      goto LABEL_10;
  }
  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != objc_msgSend(v5, "compatibilityVersion"))
    goto LABEL_10;
  v13 = self->_lastFetchAttempt != 0;
  objc_msgSend(v5, "lastFetchAttempt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15
    || (lastFetchAttempt = self->_lastFetchAttempt) != 0
    && (objc_msgSend(v5, "lastFetchAttempt"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = -[NSDate isEqual:](lastFetchAttempt, "isEqual:", v17),
        v17,
        !v18))
  {
LABEL_10:
    v20 = 0;
  }
  else
  {
    lastFetchWasSuccess = self->_lastFetchWasSuccess;
    v20 = lastFetchWasSuccess == objc_msgSend(v5, "lastFetchWasSuccess");
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  TRINamespaceStatus *v4;
  TRINamespaceStatus *v5;
  BOOL v6;

  v4 = (TRINamespaceStatus *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRINamespaceStatus isEqualToStatus:](self, "isEqualToStatus:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_namespaceName, "hash");
  v4 = self->_compatibilityVersion - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_lastFetchAttempt, "hash");
  return self->_lastFetchWasSuccess - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRINamespaceStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  TRINamespaceStatus *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespaceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_10;
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("Retrieved nil serialized value for nonnull TRINamespaceStatus.namespaceName");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = 2;
LABEL_17:
    v9 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TRINamespaceStatusOCNTErrorDomain"), v17, v7);
    objc_msgSend(v4, "failWithError:", v9);
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityVersion"));
  if ((_DWORD)v6)
    goto LABEL_3;
  objc_msgSend(v4, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("compatibilityVersion")) & 1) != 0)
    {
LABEL_3:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFetchAttempt"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRINamespaceStatus key \"lastFetchAttempt\" (expected %@, decoded %@)"), v9, v11, 0);
          v26 = *MEMORY[0x1E0CB2D50];
          v27 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRINamespaceStatusOCNTErrorDomain"), 3, v13);
          objc_msgSend(v4, "failWithError:", v14);

LABEL_6:
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v7 = 0;
LABEL_19:
          v19 = 0;
          goto LABEL_20;
        }
      }
      v21 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastFetchWasSuccess"));
      if (v21)
        goto LABEL_14;
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_19;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lastFetchWasSuccess")) & 1) != 0)
      {
LABEL_14:
        self = -[TRINamespaceStatus initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:](self, "initWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v5, v6, v7, v21 != 0);
        v19 = self;
LABEL_20:

        goto LABEL_21;
      }
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("Missing serialized value for TRINamespaceStatus.lastFetchWasSuccess");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRINamespaceStatusOCNTErrorDomain"), 1, v9);
      objc_msgSend(v4, "failWithError:", v11);
      goto LABEL_6;
    }
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Missing serialized value for TRINamespaceStatus.compatibilityVersion");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = 1;
    goto LABEL_17;
  }
LABEL_10:
  v19 = 0;
LABEL_21:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *namespaceName;
  NSDate *lastFetchAttempt;
  id v6;

  v6 = a3;
  namespaceName = self->_namespaceName;
  if (namespaceName)
    objc_msgSend(v6, "encodeObject:forKey:", namespaceName, CFSTR("namespaceName"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_compatibilityVersion, CFSTR("compatibilityVersion"));
  lastFetchAttempt = self->_lastFetchAttempt;
  if (lastFetchAttempt)
    objc_msgSend(v6, "encodeObject:forKey:", lastFetchAttempt, CFSTR("lastFetchAttempt"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_lastFetchWasSuccess, CFSTR("lastFetchWasSuccess"));

}

- (id)description
{
  id v3;
  NSString *namespaceName;
  void *v5;
  NSDate *lastFetchAttempt;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  namespaceName = self->_namespaceName;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_compatibilityVersion);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lastFetchAttempt = self->_lastFetchAttempt;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastFetchWasSuccess);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRINamespaceStatus | namespaceName:%@ compatibilityVersion:%@ lastFetchAttempt:%@ lastFetchWasSuccess:%@>"), namespaceName, v5, lastFetchAttempt, v7);

  return v8;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSDate)lastFetchAttempt
{
  return self->_lastFetchAttempt;
}

- (BOOL)lastFetchWasSuccess
{
  return self->_lastFetchWasSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchAttempt, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

@end
