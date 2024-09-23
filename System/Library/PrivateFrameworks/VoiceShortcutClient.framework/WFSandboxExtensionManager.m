@implementation WFSandboxExtensionManager

- (WFSandboxExtensionManager)init
{
  id v3;
  WFSandboxExtensionManager *v4;

  v3 = &unk_1E60041C0;
  v4 = -[WFSandboxExtensionManager initWithExtensionClassesPerResource:](self, "initWithExtensionClassesPerResource:", &unk_1E60041C0);

  return v4;
}

- (WFSandboxExtensionManager)initWithExtensionClassesPerResource:(id)a3
{
  id v4;
  WFSandboxExtensionManager *v5;
  uint64_t v6;
  NSDictionary *extensionClassesPerResource;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSSet *extensionResourcesClassNames;
  WFSandboxExtensionManager *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFSandboxExtensionManager;
  v5 = -[WFSandboxExtensionManager init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensionClassesPerResource = v5->_extensionClassesPerResource;
    v5->_extensionClassesPerResource = (NSDictionary *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    -[WFSandboxExtensionManager extensionClassesPerResource](v5, "extensionClassesPerResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    extensionResourcesClassNames = v5->_extensionResourcesClassNames;
    v5->_extensionResourcesClassNames = (NSSet *)v11;

    v13 = v5;
  }

  return v5;
}

- (NSDictionary)extensionClassesPerResource
{
  return self->_extensionClassesPerResource;
}

- (id)requestSandboxExtensionForResources:(id)a3 destinationProcessAuditToken:(id *)a4 unauthorizedResources:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  __int128 v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  WFSandboxExtensionManager *v19;
  id v20;
  __int128 v21;
  __int128 v22;

  v8 = (void *)MEMORY[0x1E0C99E20];
  v9 = a3;
  objc_msgSend(v8, "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke;
  v18 = &unk_1E5FC6FE0;
  v19 = self;
  v11 = v10;
  v20 = v11;
  v12 = *(_OWORD *)&a4->var0[4];
  v21 = *(_OWORD *)a4->var0;
  v22 = v12;
  objc_msgSend(v9, "if_compactMap:", &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = (id)objc_msgSend(v11, "copy", v15, v16, v17, v18, v19);

  return v13;
}

- (NSSet)extensionResourcesClassNames
{
  return self->_extensionResourcesClassNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionClassesPerResource, 0);
  objc_storeStrong((id *)&self->_extensionResourcesClassNames, 0);
}

id __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD aBlock[5];
  _BYTE buf[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "extensionClassesPerResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  v6 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&buf[16] = v6;
  v7 = sandbox_extension_issue_generic_to_process();
  v8 = v7;
  if (!v7)
  {
    getWFVoiceShortcutClientLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFSandboxExtensionManager requestSandboxExtensionForResources:destinationProcessAuditToken:"
                           "unauthorizedResources:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_FAULT, "%s Cannot issue sandbox extension for resource %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    goto LABEL_10;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke_32;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFSandboxExtensionManager requestSandboxExtensionForResources:destinationProcessAuditToken:un"
                         "authorizedResources:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEFAULT, "%s Sandbox extension issued for resource %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9);

LABEL_11:
  return v11;
}

void __116__WFSandboxExtensionManager_requestSandboxExtensionForResources_destinationProcessAuditToken_unauthorizedResources___block_invoke_32(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

+ (NSSet)allAvailableExtensionResourceClassNames
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = &unk_1E60041C0;
  objc_msgSend(&unk_1E60041C0, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

+ (BOOL)hasExtensionForResourceClassName:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = &unk_1E60041C0;
  objc_msgSend(&unk_1E60041C0, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

@end
