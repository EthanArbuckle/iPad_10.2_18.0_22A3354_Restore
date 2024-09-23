@implementation TRITaskAttributionInternalInsecure

- (TRITaskAttributionInternalInsecure)initWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  TRITaskAttributionInternalInsecure *v16;
  TRITaskAttributionInternalInsecure *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 866, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationBundleIdentifier != nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 867, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("networkOptions != nil"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)TRITaskAttributionInternalInsecure;
  v16 = -[TRITaskAttributionInternalInsecure init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_teamIdentifier, a3);
    v17->_triCloudKitContainer = a4;
    objc_storeStrong((id *)&v17->_applicationBundleIdentifier, a5);
    objc_storeStrong((id *)&v17->_networkOptions, a6);
  }

  return v17;
}

+ (id)taskAttributionWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", v12, v7, v11, v10);

  return v13;
}

- (id)copyWithReplacementTeamIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", v4, self->_triCloudKitContainer, self->_applicationBundleIdentifier, self->_networkOptions);

  return v5;
}

- (id)copyWithReplacementTriCloudKitContainer:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", self->_teamIdentifier, *(_QWORD *)&a3, self->_applicationBundleIdentifier, self->_networkOptions);
}

- (id)copyWithReplacementApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", self->_teamIdentifier, self->_triCloudKitContainer, v4, self->_networkOptions);

  return v5;
}

- (id)copyWithReplacementNetworkOptions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", self->_teamIdentifier, self->_triCloudKitContainer, self->_applicationBundleIdentifier, v4);

  return v5;
}

- (BOOL)isEqualToTaskAttribution:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *teamIdentifier;
  void *v10;
  int v11;
  int triCloudKitContainer;
  int v13;
  void *v14;
  int v15;
  NSString *applicationBundleIdentifier;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  TRIDownloadOptions *networkOptions;
  void *v23;
  char v24;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = self->_teamIdentifier != 0;
  objc_msgSend(v4, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_12;
  teamIdentifier = self->_teamIdentifier;
  if (teamIdentifier)
  {
    objc_msgSend(v5, "teamIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](teamIdentifier, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  triCloudKitContainer = self->_triCloudKitContainer;
  if (triCloudKitContainer != objc_msgSend(v5, "triCloudKitContainer"))
    goto LABEL_12;
  v13 = self->_applicationBundleIdentifier != 0;
  objc_msgSend(v5, "applicationBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v13 == v15)
    goto LABEL_12;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier)
  {
    objc_msgSend(v5, "applicationBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[NSString isEqual:](applicationBundleIdentifier, "isEqual:", v17);

    if (!v18)
      goto LABEL_12;
  }
  v19 = self->_networkOptions != 0;
  objc_msgSend(v5, "networkOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    v24 = 0;
  }
  else
  {
    networkOptions = self->_networkOptions;
    if (networkOptions)
    {
      objc_msgSend(v5, "networkOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TRIDownloadOptions isEqual:](networkOptions, "isEqual:", v23);

    }
    else
    {
      v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  TRITaskAttributionInternalInsecure *v4;
  TRITaskAttributionInternalInsecure *v5;
  BOOL v6;

  v4 = (TRITaskAttributionInternalInsecure *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRITaskAttributionInternalInsecure isEqualToTaskAttribution:](self, "isEqualToTaskAttribution:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_teamIdentifier, "hash");
  v4 = self->_triCloudKitContainer - v3 + 32 * v3;
  v5 = -[NSString hash](self->_applicationBundleIdentifier, "hash") - v4 + 32 * v4;
  return -[TRIDownloadOptions hash](self->_networkOptions, "hash") - v5 + 32 * v5;
}

- (NSString)description
{
  id v3;
  NSString *teamIdentifier;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  teamIdentifier = self->_teamIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_triCloudKitContainer);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRITaskAttributionInternalInsecure | teamIdentifier:%@ triCloudKitContainer:%@ applicationBundleIdentifier:%@ networkOptions:%@>"), teamIdentifier, v5, self->_applicationBundleIdentifier, self->_networkOptions);

  return (NSString *)v6;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (int)triCloudKitContainer
{
  return self->_triCloudKitContainer;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (TRIDownloadOptions)networkOptions
{
  return self->_networkOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOptions, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
}

+ (id)taskAttributionFirstPartyWithNetworkOptions:(id)a3
{
  id v3;
  TRITaskAttributionInternalInsecure *v4;

  v3 = a3;
  v4 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", 0, 1, CFSTR("com.apple.triald"), v3);

  return v4;
}

+ (id)taskAttributionFromPersistedTask:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  objc_class *v12;
  objc_class *v13;
  TRITaskAttributionInternalInsecure *v14;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  TRITaskAttributionInternalInsecure *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "hasApplicationBundleId") & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v24;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: applicationBundleId", (uint8_t *)&v25, 0xCu);

    }
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v10;
    v11 = "Cannot decode message of type %@ with missing field: applicationBundleId";
    goto LABEL_14;
  }
  objc_msgSend(v3, "applicationBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v10;
      v11 = "Cannot decode message of type %@ with field of length 0: applicationBundleId";
LABEL_14:
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v25, 0xCu);

    }
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "hasCloudKitContainer") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v10;
      v11 = "Cannot decode message of type %@ with missing field: cloudKitContainer";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "teamId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v3, "teamId");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  if (!objc_msgSend(v3, "hasNetworkBehavior")
    || (v16 = objc_alloc(MEMORY[0x1E0DC0A10]),
        objc_msgSend(v3, "networkBehavior"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = (void *)objc_msgSend(v16, "initFromPersistedBehavior:", v17),
        v17,
        !v18))
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "unable to parse persisted network behavior, assuming discretionary", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC0A10], "inexpensiveOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = [TRITaskAttributionInternalInsecure alloc];
  v21 = objc_msgSend(v3, "cloudKitContainer");
  objc_msgSend(v3, "applicationBundleId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:](v20, "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", v7, v21, v22, v18);

LABEL_16:
  return v14;
}

- (id)asPersistedTaskAttribution
{
  TRIPersistedTaskAttribution *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(TRIPersistedTaskAttribution);
  -[TRITaskAttributionInternalInsecure teamIdentifier](self, "teamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[TRITaskAttributionInternalInsecure teamIdentifier](self, "teamIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIPersistedTaskAttribution setTeamId:](v3, "setTeamId:", v5);

  }
  else
  {
    -[TRIPersistedTaskAttribution setTeamId:](v3, "setTeamId:", 0);
  }

  -[TRITaskAttributionInternalInsecure applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPersistedTaskAttribution setApplicationBundleId:](v3, "setApplicationBundleId:", v6);

  -[TRIPersistedTaskAttribution setCloudKitContainer:](v3, "setCloudKitContainer:", -[TRITaskAttributionInternalInsecure triCloudKitContainer](self, "triCloudKitContainer"));
  -[TRITaskAttributionInternalInsecure networkOptions](self, "networkOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializeToPersistedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIPersistedTaskAttribution setNetworkBehavior:](v3, "setNetworkBehavior:", v8);

  return v3;
}

@end
