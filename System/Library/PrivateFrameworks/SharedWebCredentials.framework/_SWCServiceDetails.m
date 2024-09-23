@implementation _SWCServiceDetails

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 error:(id *)a4
{
  objc_msgSend(a1, "_serviceDetailsWithServiceSpecifier:URLComponents:limit:callerAuditToken:error:", a3, 0, -1, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 error:(id *)a5
{
  objc_msgSend(a1, "_serviceDetailsWithServiceSpecifier:URLComponents:limit:callerAuditToken:error:", a3, 0, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 limit:(unint64_t)a4 auditToken:(id *)a5 error:(id *)a6
{
  objc_msgSend(a1, "_serviceDetailsWithServiceSpecifier:URLComponents:limit:callerAuditToken:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  objc_msgSend(a1, "_serviceDetailsWithServiceSpecifier:URLComponents:limit:callerAuditToken:error:", a3, a4, a5, 0, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6 error:(id *)a7
{
  objc_msgSend(a1, "_serviceDetailsWithServiceSpecifier:URLComponents:limit:callerAuditToken:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)new
{
  abort();
}

- (_SWCServiceDetails)init
{
  abort();
}

- (id)_initWithServiceSpecifier:(id)a3 fields:(const SWCFields *)a4
{
  id v7;
  _SWCServiceDetails *v8;
  _SWCServiceDetails *v9;
  __int16 v11;
  char relativeOrder;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SWCServiceDetails;
  v8 = -[_SWCServiceDetails init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceSpecifier, a3);
    if (a4)
    {
      v11 = *(_WORD *)a4;
      relativeOrder = a4->relativeOrder;
    }
    else
    {
      relativeOrder = 0;
      v11 = 0;
    }
    *(_WORD *)&v9->_fields = v11;
    v9->_fields.relativeOrder = relativeOrder;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _SWCServiceDetails *v4;
  BOOL v5;

  v4 = (_SWCServiceDetails *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_SWCServiceSpecifier isEqual:](self->_serviceSpecifier, "isEqual:", v4->_serviceSpecifier);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[_SWCServiceSpecifier hash](self->_serviceSpecifier, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_SWCServiceSpecifier serviceType](self->_serviceSpecifier, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCServiceSpecifier applicationIdentifier](self->_serviceSpecifier, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCServiceSpecifier domain](self->_serviceSpecifier, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)&self->_fields & 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SWCServiceApprovalStateGetDebugDescription((*(_BYTE *)&self->_fields >> 2) & 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }"), v4, v5, v6, v7, v8);

  return v9;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_SWCServiceDetails description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_SWCServiceSpecifier serviceType](self->_serviceSpecifier, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCServiceSpecifier SWCApplicationIdentifier](self->_serviceSpecifier, "SWCApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "redactedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SWCServiceSpecifier SWCDomain](self->_serviceSpecifier, "SWCDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "redactedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)&self->_fields & 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _SWCServiceApprovalStateGetDebugDescription((*(_BYTE *)&self->_fields >> 2) & 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }"), v4, v6, v8, v9, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceSpecifier, CFSTR("serviceSpecifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", *(_WORD *)&self->_fields | ((unint64_t)self->_fields.relativeOrder << 16), CFSTR("fields"));

}

- (_SWCServiceDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _SWCServiceDetails *v7;
  __int16 v9;
  char v10;

  v4 = a3;
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fields"));
  v9 = v6;
  v10 = BYTE2(v6);
  v7 = -[_SWCServiceDetails _initWithServiceSpecifier:fields:](self, "_initWithServiceSpecifier:fields:", v5, &v9);

  return v7;
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  return (_SWCServiceSpecifier *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceSpecifier, 0);
}

- (BOOL)isApproved
{
  return (*(_WORD *)&self->_fields & 3) == 1 || (*(_WORD *)&self->_fields & 0xC) == 4;
}

- (unsigned)userApprovalState
{
  return *(_WORD *)&self->_fields & 3;
}

- (void)setUserApprovalState:(unsigned __int8)a3
{
  -[_SWCServiceDetails setUserApprovalState:error:](self, "setUserApprovalState:error:", a3, 0);
}

- (BOOL)setUserApprovalState:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  _SWCServiceSpecifier *serviceSpecifier;
  int v11;
  BOOL v12;
  _QWORD v14[7];
  char v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  _SWCGetServerConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke;
  v16[3] = &unk_1E547CFB0;
  v16[4] = &v17;
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  serviceSpecifier = self->_serviceSpecifier;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69___SWCServiceDetails_SWCServiceApproval__setUserApprovalState_error___block_invoke_2;
  v14[3] = &unk_1E547D250;
  v14[5] = &v23;
  v14[6] = &v17;
  v14[4] = self;
  v15 = v5;
  objc_msgSend(v9, "setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:", v5, serviceSpecifier, v14);
  v11 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = objc_retainAutorelease((id)v18[5]);
    v11 = *((unsigned __int8 *)v24 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

- (unsigned)siteApprovalState
{
  SWCFields fields;

  fields = self->_fields;
  if ((*(_BYTE *)&fields & 0x20) != 0)
    return 0;
  else
    return (*(unsigned int *)&fields >> 2) & 3;
}

- (unsigned)frameworkApprovalState
{
  return (*(_WORD *)&self->_fields >> 2) & (*(_WORD *)&self->_fields << 26 >> 31) & 3;
}

- (void)waitForSiteApprovalWithCompletionHandler:(id)a3
{
  void (**v5)(id, _SWCServiceDetails *, _QWORD);
  void *v6;
  void (**v7)(id, _SWCServiceDetails *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = (void (**)(id, _SWCServiceDetails *, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCServiceDetails.mm"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

  }
  if ((*(_WORD *)&self->_fields & 0xC) != 0)
  {
    v5[2](v5, self, 0);
  }
  else
  {
    _SWCGetServerConnection();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83___SWCServiceDetails_SWCServiceApproval__waitForSiteApprovalWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E547D278;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SWCServiceDetails serviceSpecifier](self, "serviceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "waitForSiteApprovalWithServiceSpecifier:completionHandler:", v9, v7);

  }
}

+ (BOOL)currentProcessHasReadAccess
{
  int v3;
  _OWORD v5[2];
  _OWORD v6[2];

  v3 = _SWCGetAuditTokenForSelf(v6);
  if (v3)
  {
    v5[0] = v6[0];
    v5[1] = v6[1];
    LOBYTE(v3) = objc_msgSend(a1, "auditTokenHasReadAccess:", v5);
  }
  return v3;
}

+ (BOOL)auditTokenHasReadAccess:(id *)a3
{
  __int128 v4;
  int v5;
  __int128 v6;
  _OWORD v8[4];

  v4 = *(_OWORD *)&a3->var0[4];
  v8[2] = *(_OWORD *)a3->var0;
  v8[3] = v4;
  v5 = _SWCCanAuditTokenConnect();
  if (v5)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(v5) = _SWCIsAuditTokenEntitled(v8, 0);
  }
  return v5;
}

+ (BOOL)currentProcessHasWriteAccess
{
  int v3;
  _OWORD v5[2];
  _OWORD v6[2];

  v3 = _SWCGetAuditTokenForSelf(v6);
  if (v3)
  {
    v5[0] = v6[0];
    v5[1] = v6[1];
    LOBYTE(v3) = objc_msgSend(a1, "auditTokenHasWriteAccess:", v5);
  }
  return v3;
}

+ (BOOL)auditTokenHasWriteAccess:(id *)a3
{
  __int128 v4;
  int v5;
  __int128 v6;
  _OWORD v8[4];

  v4 = *(_OWORD *)&a3->var0[4];
  v8[2] = *(_OWORD *)a3->var0;
  v8[3] = v4;
  v5 = _SWCCanAuditTokenConnect();
  if (v5)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    LOBYTE(v5) = _SWCIsAuditTokenEntitled(v8, 1);
  }
  return v5;
}

- (BOOL)isUpdating
{
  return (*(_WORD *)&self->_fields >> 4) & 1;
}

- (BOOL)isSystemApplication
{
  return (*(_WORD *)&self->_fields >> 5) & 1;
}

- (BOOL)wasReadFromDisk
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 1024;
}

- (BOOL)wasProvidedByAdditionalServiceDetailsProvider
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 3072;
}

- (BOOL)isAlwaysEnabled
{
  return (*(_WORD *)&self->_fields & 0xC0) == 0x40
      && -[_SWCServiceDetails isSystemApplication](self, "isSystemApplication");
}

- (NSNumber)isEnabledByDefault
{
  uint64_t v2;
  NSNumber *v3;

  v2 = (*(_WORD *)&self->_fields >> 6) - 1;
  if (v2 > 2)
    return 0;
  v3 = (NSNumber *)qword_1E547D398[v2];
  if (-[_SWCServiceDetails isSystemApplication](self, "isSystemApplication"))
    return v3;
  else
    return 0;
}

- (BOOL)isWatchKitExtension
{
  return 0;
}

- (BOOL)isSystemPlaceholder
{
  return (*(_WORD *)&self->_fields >> 9) & 1;
}

- (BOOL)isEnterpriseManaged
{
  return HIBYTE(*(_WORD *)&self->_fields) & 1;
}

- (char)modeOfOperation
{
  void *v2;
  char v3;

  -[_SWCServiceSpecifier SWCDomain](self->_serviceSpecifier, "SWCDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modeOfOperation");

  return v3;
}

+ (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _SWCApplicationIdentifier *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceDetails.mm"), 397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationIdentifiers != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCServiceDetails.mm"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("jsonDataByDomainName != nil"));

LABEL_3:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v34;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v12);
        v16 = -[_SWCApplicationIdentifier initWithString:]([_SWCApplicationIdentifier alloc], "initWithString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15));
        if (v16)
          objc_msgSend(v11, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke;
  v31[3] = &unk_1E547D2A0;
  v19 = v17;
  v32 = v19;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v31);
  _SWCGetServerConnection();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_2;
  v29[3] = &unk_1E547D278;
  v21 = v26;
  v30 = v21;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __136___SWCServiceDetails_Synchronization__setAdditionalServiceDetailsForApplicationIdentifiers_usingContentsOfDictionary_completionHandler___block_invoke_3;
  v27[3] = &unk_1E547D2C8;
  v23 = v21;
  v28 = v23;
  objc_msgSend(v22, "setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:", v11, v19, v27);

}

+ (void)synchronizeWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  _SWCGetServerConnection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E547D278;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72___SWCServiceDetails_Synchronization__synchronizeWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E547D2C8;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addAllAppsWithCompletionHandler:", v9);

}

+ (BOOL)isDeveloperModeEnabled
{
  void *v2;
  void *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  _SWCGetServerConnection();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59___SWCServiceDetails_DeveloperMode__isDeveloperModeEnabled__block_invoke_2;
  v6[3] = &unk_1E547D310;
  v6[4] = &v7;
  objc_msgSend(v3, "getDeveloperModeEnabledWithCompletionHandler:", v6);
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = a4;
  _SWCGetServerConnection();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &__block_literal_global_134;
  if (v5)
    v7 = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79___SWCServiceDetails_DeveloperMode__setDeveloperModeEnabled_completionHandler___block_invoke_2;
  v10[3] = &unk_1E547D278;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeveloperModeEnabled:completionHandler:", v4, v8);

}

+ (id)_serviceDetailsWithServiceSpecifier:(id)a3 URLComponents:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v11 = a3;
  v12 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1;
  v32 = __Block_byref_object_dispose__1;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a6, "{?=[8I]}");
    a6 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)objc_claimAutoreleasedReturnValue();
  }
  _SWCGetServerConnection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke;
  v21[3] = &unk_1E547CFB0;
  v21[4] = &v22;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __110___SWCServiceDetails_Private___serviceDetailsWithServiceSpecifier_URLComponents_limit_callerAuditToken_error___block_invoke_2;
  v20[3] = &unk_1E547D378;
  v20[4] = &v28;
  v20[5] = &v22;
  objc_msgSend(v15, "getDetailsWithServiceSpecifier:URL:limit:callerAuditToken:completionHandler:", v11, v16, a5, a6, v20);

  v17 = (void *)v29[5];
  if (a7 && !v17)
  {
    *a7 = objc_retainAutorelease((id)v23[5]);
    v17 = (void *)v29[5];
  }
  v18 = v17;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

@end
