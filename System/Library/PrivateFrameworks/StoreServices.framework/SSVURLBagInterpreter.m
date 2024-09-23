@implementation SSVURLBagInterpreter

- (SSVURLBagInterpreter)initWithURLBag:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  SSVURLBagInterpreter *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v5 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __39__SSVURLBagInterpreter_initWithURLBag___block_invoke;
  v12 = &unk_1E47BA528;
  v14 = &v15;
  v6 = v5;
  v13 = v6;
  objc_msgSend(v4, "loadWithCompletionBlock:", &v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = -[SSVURLBagInterpreter initWithURLBagDictionary:](self, "initWithURLBagDictionary:", v16[5], v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __39__SSVURLBagInterpreter_initWithURLBag___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (SSVURLBagInterpreter)initWithURLBagDictionary:(id)a3
{
  id v4;
  SSVURLBagInterpreter *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedBagValues;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *subscriptionSignedActions;
  SSVSAPSignaturePolicy *v16;
  SSVSAPSignaturePolicy *subscriptionSignaturePolicy;
  void *v18;
  uint64_t v19;
  NSURL *mescalPrimingURL;
  uint64_t i;
  objc_super v23;
  _OWORD v24[5];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSVURLBagInterpreter;
  v5 = -[SSVURLBagInterpreter init](&v23, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedBagValues = v5->_cachedBagValues;
    v5->_cachedBagValues = v6;

    v8 = 0;
    v24[2] = xmmword_1E47BA568;
    v24[3] = *(_OWORD *)&off_1E47BA578;
    v24[4] = xmmword_1E47BA588;
    v24[0] = xmmword_1E47BA548;
    v24[1] = *(_OWORD *)&off_1E47BA558;
    do
    {
      v9 = *(_QWORD *)((char *)v24 + v8);
      objc_msgSend(v4, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMutableDictionary setObject:forKey:](v5->_cachedBagValues, "setObject:forKey:", v10, v9);

      v8 += 8;
    }
    while (v8 != 80);
    objc_msgSend(v4, "objectForKey:", CFSTR("musicCommon"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("musicMescal"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("actions"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v13, "copy");
          subscriptionSignedActions = v5->_subscriptionSignedActions;
          v5->_subscriptionSignedActions = (NSArray *)v14;

        }
        v16 = -[SSVSAPSignaturePolicy initWithSignedActionsDictionary:]([SSVSAPSignaturePolicy alloc], "initWithSignedActionsDictionary:", v12);
        subscriptionSignaturePolicy = v5->_subscriptionSignaturePolicy;
        v5->_subscriptionSignaturePolicy = v16;

        objc_msgSend(v12, "objectForKey:", CFSTR("primeUrl"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
          mescalPrimingURL = v5->_mescalPrimingURL;
          v5->_mescalPrimingURL = (NSURL *)v19;

        }
      }

    }
    for (i = 72; i != -8; i -= 8)

  }
  return v5;
}

- (SSVURLBagInterpreter)initWithSSBag:(id)a3
{
  id v4;
  SSVURLBagInterpreter *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedBagValues;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  SSVSAPSignaturePolicy *v19;
  SSVSAPSignaturePolicy *subscriptionSignaturePolicy;
  void *v21;
  void *v22;
  uint64_t v23;
  NSURL *mescalPrimingURL;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSVURLBagInterpreter;
  v5 = -[SSVURLBagInterpreter init](&v26, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedBagValues = v5->_cachedBagValues;
    v5->_cachedBagValues = v6;

    v8 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("amd-domains"), 0, 1);
    v9 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("sign-sap-setup-cert"), 5, 1);
    v10 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("sign-sap-setup"), 5, 1);
    v11 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("signed-actions"), 2, 1);
    v12 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("sign-sap-request"), 2, 1);
    v13 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("sign-sap-response"), 2, 1);
    v14 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("storefront-header-suffix"), 5, 1);
    v15 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("fps-request"), 5, 1);
    v16 = -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("fps-cert"), 5, 1);
    -[SSVURLBagInterpreter cachedValueFromBag:key:withType:updateCache:](v5, "cachedValueFromBag:key:withType:updateCache:", v4, CFSTR("musicCommon"), 2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", CFSTR("musicMescal"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = -[SSVSAPSignaturePolicy initWithSignedActionsDictionary:]([SSVSAPSignaturePolicy alloc], "initWithSignedActionsDictionary:", v18);
      subscriptionSignaturePolicy = v5->_subscriptionSignaturePolicy;
      v5->_subscriptionSignaturePolicy = v19;

      objc_msgSend(v18, "objectForKey:", CFSTR("actions"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_subscriptionSignedActions, v21);
      objc_msgSend(v18, "objectForKey:", CFSTR("primeUrl"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        mescalPrimingURL = v5->_mescalPrimingURL;
        v5->_mescalPrimingURL = (NSURL *)v23;

      }
    }

  }
  return v5;
}

- (id)cachedValueFromBag:(id)a3 key:(id)a4 withType:(unint64_t)a5 updateCache:(BOOL)a6
{
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  switch(a5)
  {
    case 0uLL:
      v37 = 0;
      v11 = (id *)&v37;
      objc_msgSend(v9, "arrayForKey:error:", v10, &v37);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1uLL:
      v36 = 0;
      v11 = (id *)&v36;
      objc_msgSend(v9, "BOOLForKey:error:", v10, &v36);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      v31 = 0;
      v11 = (id *)&v31;
      objc_msgSend(v9, "dictionaryForKey:error:", v10, &v31);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      v35 = 0;
      v11 = (id *)&v35;
      objc_msgSend(v9, "doubleForKey:error:", v10, &v35);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4uLL:
      v34 = 0;
      v11 = (id *)&v34;
      objc_msgSend(v9, "integerForKey:error:", v10, &v34);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      v33 = 0;
      v11 = (id *)&v33;
      objc_msgSend(v9, "stringForKey:error:", v10, &v33);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      v32 = 0;
      v11 = (id *)&v32;
      objc_msgSend(v9, "URLForKey:error:", v10, &v32);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v14 = (void *)v12;
      v15 = *v11;
      v13 = v15;
      if (!v14 || v15)
        goto LABEL_13;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedBagValues, "setObject:forKeyedSubscript:", v14, v10);
      goto LABEL_25;
    default:
      v13 = 0;
      v14 = 0;
LABEL_13:
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v16, "shouldLog");
      if (objc_msgSend(v16, "shouldLogToDisk"))
        v18 = v17 | 2;
      else
        v18 = v17;
      objc_msgSend(v16, "OSLogObject");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        v18 &= 2u;
      if (!v18)
        goto LABEL_23;
      v20 = (void *)objc_opt_class();
      v38 = 138412802;
      v39 = v20;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = v13;
      v21 = v20;
      LODWORD(v30) = 32;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v38, v30);
        v19 = objc_claimAutoreleasedReturnValue();
        free(v22);
        SSFileLog(v16, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_23:

      }
LABEL_25:

      return v14;
  }
}

- (NSArray)AMDDomains
{
  return (NSArray *)-[SSVURLBagInterpreter _valueForKey:withClass:](self, "_valueForKey:withClass:", CFSTR("amd-domains"), objc_opt_class());
}

- (NSURL)mescalCertificateURL
{
  return (NSURL *)-[SSVURLBagInterpreter URLForURLBagKey:](self, "URLForURLBagKey:", CFSTR("sign-sap-setup-cert"));
}

- (NSURL)mescalSetupURL
{
  return (NSURL *)-[SSVURLBagInterpreter URLForURLBagKey:](self, "URLForURLBagKey:", CFSTR("sign-sap-setup"));
}

- (id)mescalSignaturePolicyForRequestURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  SSVSAPSignatureComponent *v8;
  void *v9;
  SSVSAPSignaturePolicy *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVURLBagInterpreter mescalSignedRequests](self, "mescalSignedRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SSVURLPathMatchesActionDictionary(v5, v6);

  if (v7)
  {
    v8 = -[SSVSAPSignatureComponent initWithComponentType:key:]([SSVSAPSignatureComponent alloc], "initWithComponentType:key:", 0, 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v8, 0);
    v10 = -[SSVSAPSignaturePolicy initWithPolicyType:signatureComponents:]([SSVSAPSignaturePolicy alloc], "initWithPolicyType:signatureComponents:", 2, v9);
  }
  else
  {
    -[SSVURLBagInterpreter mescalSignedActions](self, "mescalSignedActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SSVURLBagGetSignaturePolicyDictionaryForURL(v4, v11);
    v8 = (SSVSAPSignatureComponent *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v10 = -[SSVSAPSignaturePolicy initWithSignedActionsDictionary:]([SSVSAPSignaturePolicy alloc], "initWithSignedActionsDictionary:", v8);
      goto LABEL_18;
    }
    if (!self->_subscriptionSignaturePolicy || !-[NSArray count](self->_subscriptionSignedActions, "count"))
    {
      v10 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v4, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_subscriptionSignedActions;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "caseInsensitiveCompare:", v9))
          {
            v10 = self->_subscriptionSignaturePolicy;
            goto LABEL_20;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v14)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_20:

  }
LABEL_18:

  return v10;
}

- (id)mescalSignaturePolicyForResponseURL:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  SSVSAPSignatureComponent *v7;
  void *v8;
  SSVSAPSignaturePolicy *v9;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVURLBagInterpreter mescalSignedResponses](self, "mescalSignedResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SSVURLPathMatchesActionDictionary(v4, v5);

  if (v6)
  {
    v7 = -[SSVSAPSignatureComponent initWithComponentType:key:]([SSVSAPSignatureComponent alloc], "initWithComponentType:key:", 0, 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
    v9 = -[SSVSAPSignaturePolicy initWithPolicyType:signatureComponents:]([SSVSAPSignaturePolicy alloc], "initWithPolicyType:signatureComponents:", 2, v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSDictionary)mescalSignedActions
{
  return (NSDictionary *)-[SSVURLBagInterpreter _valueForKey:withClass:](self, "_valueForKey:withClass:", CFSTR("signed-actions"), objc_opt_class());
}

- (NSDictionary)mescalSignedRequests
{
  return (NSDictionary *)-[SSVURLBagInterpreter _valueForKey:withClass:](self, "_valueForKey:withClass:", CFSTR("sign-sap-request"), objc_opt_class());
}

- (NSDictionary)mescalSignedResponses
{
  return (NSDictionary *)-[SSVURLBagInterpreter _valueForKey:withClass:](self, "_valueForKey:withClass:", CFSTR("sign-sap-response"), objc_opt_class());
}

- (NSURL)pastisCertificateURL
{
  return (NSURL *)-[SSVURLBagInterpreter URLForURLBagKey:](self, "URLForURLBagKey:", CFSTR("fps-cert"));
}

- (NSURL)pastisKeyServerURL
{
  return (NSURL *)-[SSVURLBagInterpreter URLForURLBagKey:](self, "URLForURLBagKey:", CFSTR("fps-request"));
}

- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3
{
  id v4;
  void *v5;
  char ShouldSendAMDForURL;

  v4 = a3;
  -[SSVURLBagInterpreter AMDDomains](self, "AMDDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldSendAMDForURL = SSVURLBagShouldSendAMDForURL(v4, v5);

  return ShouldSendAMDForURL;
}

- (NSString)storeFrontSuffix
{
  return (NSString *)-[SSVURLBagInterpreter _valueForKey:withClass:](self, "_valueForKey:withClass:", CFSTR("storefront-header-suffix"), objc_opt_class());
}

- (id)URLForURLBagKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[SSVURLBagInterpreter valueForURLBagKey:](self, "valueForURLBagKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = v3;
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (id)valueForURLBagKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_cachedBagValues, "objectForKey:", a3);
}

- (id)_valueForKey:(id)a3 withClass:(Class)a4
{
  uint64_t v5;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_cachedBagValues, "objectForKey:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a4 && v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  return v6;
}

- (NSURL)mescalPrimingURL
{
  return self->_mescalPrimingURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mescalPrimingURL, 0);
  objc_storeStrong((id *)&self->_subscriptionSignaturePolicy, 0);
  objc_storeStrong((id *)&self->_subscriptionSignedActions, 0);
  objc_storeStrong((id *)&self->_cachedBagValues, 0);
}

@end
