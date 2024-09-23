@implementation TRIDynamicNamespaceRecord

- (TRIDynamicNamespaceRecord)initWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  TRIDynamicNamespaceRecord *v19;
  TRIDynamicNamespaceRecord *v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId != nil"));

    if (v17)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

  if (!v16)
    goto LABEL_8;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appContainer != nil"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)TRIDynamicNamespaceRecord;
  v19 = -[TRIDynamicNamespaceRecord init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    objc_storeStrong((id *)&v20->_teamId, a4);
    objc_storeStrong((id *)&v20->_appContainer, a5);
    v20->_cloudKitContainer = a6;
    v20->_compatibilityVersion = a7;
    objc_storeStrong((id *)&v20->_defaultsFileURL, a8);
    v20->_hasFetched = a9;
  }

  return v20;
}

+ (id)dynamicNamespaceRecordWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9
{
  uint64_t v9;
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOBYTE(v21) = a9;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", v18, v17, v16, v10, v9, v15, v21);

  return v19;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", v4, self->_teamId, self->_appContainer, self->_cloudKitContainer, self->_compatibilityVersion, self->_defaultsFileURL, v8);

  return v6;
}

- (id)copyWithReplacementTeamId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, v4, self->_appContainer, self->_cloudKitContainer, self->_compatibilityVersion, self->_defaultsFileURL, v8);

  return v6;
}

- (id)copyWithReplacementAppContainer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, self->_teamId, v4, self->_cloudKitContainer, self->_compatibilityVersion, self->_defaultsFileURL, v8);

  return v6;
}

- (id)copyWithReplacementCloudKitContainer:(int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_hasFetched;
  return (id)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, self->_teamId, self->_appContainer, v3, self->_compatibilityVersion, self->_defaultsFileURL, v7);
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_hasFetched;
  return (id)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, self->_teamId, self->_appContainer, self->_cloudKitContainer, v3, self->_defaultsFileURL, v7);
}

- (id)copyWithReplacementDefaultsFileURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)objc_msgSend(v5, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, self->_teamId, self->_appContainer, self->_cloudKitContainer, self->_compatibilityVersion, v4, v8);

  return v6;
}

- (id)copyWithReplacementHasFetched:(BOOL)a3
{
  uint64_t v4;

  LOBYTE(v4) = a3;
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", self->_name, self->_teamId, self->_appContainer, self->_cloudKitContainer, self->_compatibilityVersion, self->_defaultsFileURL, v4);
}

- (BOOL)isEqualToDynamicNamespaceRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *name;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *teamId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  TRIAppContainer *appContainer;
  void *v22;
  int v23;
  int cloudKitContainer;
  unsigned int compatibilityVersion;
  int v26;
  void *v27;
  int v28;
  NSURL *defaultsFileURL;
  void *v30;
  int v31;
  int hasFetched;
  BOOL v33;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_17;
  v6 = self->_name != 0;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_17;
  name = self->_name;
  if (name)
  {
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](name, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  v12 = self->_teamId != 0;
  objc_msgSend(v5, "teamId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_17;
  teamId = self->_teamId;
  if (teamId)
  {
    objc_msgSend(v5, "teamId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](teamId, "isEqual:", v16);

    if (!v17)
      goto LABEL_17;
  }
  v18 = self->_appContainer != 0;
  objc_msgSend(v5, "appContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_17;
  appContainer = self->_appContainer;
  if (appContainer)
  {
    objc_msgSend(v5, "appContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[TRIAppContainer isEqual:](appContainer, "isEqual:", v22);

    if (!v23)
      goto LABEL_17;
  }
  cloudKitContainer = self->_cloudKitContainer;
  if (cloudKitContainer != objc_msgSend(v5, "cloudKitContainer"))
    goto LABEL_17;
  compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != objc_msgSend(v5, "compatibilityVersion"))
    goto LABEL_17;
  v26 = self->_defaultsFileURL != 0;
  objc_msgSend(v5, "defaultsFileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (v26 == v28
    || (defaultsFileURL = self->_defaultsFileURL) != 0
    && (objc_msgSend(v5, "defaultsFileURL"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = -[NSURL isEqual:](defaultsFileURL, "isEqual:", v30),
        v30,
        !v31))
  {
LABEL_17:
    v33 = 0;
  }
  else
  {
    hasFetched = self->_hasFetched;
    v33 = hasFetched == objc_msgSend(v5, "hasFetched");
  }

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  TRIDynamicNamespaceRecord *v4;
  TRIDynamicNamespaceRecord *v5;
  BOOL v6;

  v4 = (TRIDynamicNamespaceRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIDynamicNamespaceRecord isEqualToDynamicNamespaceRecord:](self, "isEqualToDynamicNamespaceRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_teamId, "hash") - v3 + 32 * v3;
  v5 = -[TRIAppContainer hash](self->_appContainer, "hash");
  v6 = self->_cloudKitContainer - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = self->_compatibilityVersion - v6 + 32 * v6;
  v8 = -[NSURL hash](self->_defaultsFileURL, "hash");
  return self->_hasFetched - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDynamicNamespaceRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TRIDynamicNamespaceRecord *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString **v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v6 = 0;
        v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v42 = *MEMORY[0x1E0CB2D50];
      v43 = CFSTR("Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.teamId");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 2, v8);
      objc_msgSend(v4, "failWithError:", v11);
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIDynamicNamespaceRecord key \"teamId\" (expected %@, decoded %@)"), v8, v11, 0);
      v40 = *MEMORY[0x1E0CB2D50];
      v41 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 3, v19);
      objc_msgSend(v4, "failWithError:", v20);

LABEL_15:
LABEL_16:

LABEL_30:
      v13 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appContainer"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cloudKitContainer"));
      if (!(_DWORD)v9)
      {
        objc_msgSend(v4, "error");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          goto LABEL_25;
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("cloudKitContainer")) & 1) == 0)
        {
          v36 = *MEMORY[0x1E0CB2D50];
          v37 = CFSTR("Missing serialized value for TRIDynamicNamespaceRecord.cloudKitContainer");
          v23 = (void *)MEMORY[0x1E0C99D80];
          v24 = &v37;
          v25 = &v36;
          goto LABEL_37;
        }
      }
      v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("compatibilityVersion"));
      if ((_DWORD)v10)
        goto LABEL_7;
      objc_msgSend(v4, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("compatibilityVersion")) & 1) != 0)
        {
LABEL_7:
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultsFileURL"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend(v4, "error");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              v11 = 0;
              goto LABEL_30;
            }
          }
          v12 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("hasFetched"));
          if (v12)
            goto LABEL_9;
          objc_msgSend(v4, "error");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            goto LABEL_30;
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("hasFetched")) & 1) != 0)
          {
LABEL_9:
            LOBYTE(v31) = v12 != 0;
            self = -[TRIDynamicNamespaceRecord initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:](self, "initWithName:teamId:appContainer:cloudKitContainer:compatibilityVersion:defaultsFileURL:hasFetched:", v5, v6, v8, v9, v10, v11, v31);
            v13 = self;
LABEL_31:

            goto LABEL_32;
          }
          v32 = *MEMORY[0x1E0CB2D50];
          v33 = CFSTR("Missing serialized value for TRIDynamicNamespaceRecord.hasFetched");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 1, v18);
          objc_msgSend(v4, "failWithError:", v19);
          goto LABEL_15;
        }
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = CFSTR("Missing serialized value for TRIDynamicNamespaceRecord.compatibilityVersion");
        v23 = (void *)MEMORY[0x1E0C99D80];
        v24 = &v35;
        v25 = &v34;
LABEL_37:
        objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 1, v11);
        objc_msgSend(v4, "failWithError:", v18);
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        v38 = *MEMORY[0x1E0CB2D50];
        v39 = CFSTR("Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.appContainer");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 2, v11);
        objc_msgSend(v4, "failWithError:", v27);

        v8 = 0;
        goto LABEL_30;
      }
      v8 = 0;
    }
LABEL_25:
    v13 = 0;
LABEL_32:

    goto LABEL_33;
  }
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v44 = *MEMORY[0x1E0CB2D50];
    v45[0] = CFSTR("Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIDynamicNamespaceRecordOCNTErrorDomain"), 2, v6);
    objc_msgSend(v4, "failWithError:", v8);
    goto LABEL_25;
  }
  v13 = 0;
LABEL_34:

  return v13;
}

- (void)defaultEncodeWithCoder:(id)a3
{
  id v4;
  NSString *name;
  NSString *teamId;
  TRIAppContainer *appContainer;
  NSURL *defaultsFileURL;
  id v9;

  v4 = a3;
  name = self->_name;
  v9 = v4;
  if (name)
  {
    objc_msgSend(v4, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v9;
  }
  teamId = self->_teamId;
  if (teamId)
  {
    objc_msgSend(v9, "encodeObject:forKey:", teamId, CFSTR("teamId"));
    v4 = v9;
  }
  appContainer = self->_appContainer;
  if (appContainer)
  {
    objc_msgSend(v9, "encodeObject:forKey:", appContainer, CFSTR("appContainer"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_cloudKitContainer, CFSTR("cloudKitContainer"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_compatibilityVersion, CFSTR("compatibilityVersion"));
  defaultsFileURL = self->_defaultsFileURL;
  if (defaultsFileURL)
    objc_msgSend(v9, "encodeObject:forKey:", defaultsFileURL, CFSTR("defaultsFileURL"));
  objc_msgSend(v9, "encodeInt64:forKey:", self->_hasFetched, CFSTR("hasFetched"));

}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 314, CFSTR("Do not use NSKeyedArchiver to persist instances of TRIDynamicNamespaceRecord to disk. If you want to persist this object to disk, create a protobuf schema."));

  }
  -[TRIDynamicNamespaceRecord defaultEncodeWithCoder:](self, "defaultEncodeWithCoder:", v6);

}

- (id)description
{
  id v3;
  TRIAppContainer *appContainer;
  void *v5;
  void *v6;
  NSURL *defaultsFileURL;
  void *v8;
  void *v9;
  __int128 v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = *(_OWORD *)&self->_name;
  appContainer = self->_appContainer;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cloudKitContainer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_compatibilityVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  defaultsFileURL = self->_defaultsFileURL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFetched);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIDynamicNamespaceRecord | name:%@ teamId:%@ appContainer:%@ cloudKitContainer:%@ compatibilityVersion:%@ defaultsFileURL:%@ hasFetched:%@>"), v11, appContainer, v5, v6, defaultsFileURL, v8);

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (int)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSURL)defaultsFileURL
{
  return self->_defaultsFileURL;
}

- (BOOL)hasFetched
{
  return self->_hasFetched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsFileURL, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
