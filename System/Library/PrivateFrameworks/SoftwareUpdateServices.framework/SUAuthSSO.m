@implementation SUAuthSSO

+ (id)sharedInstance
{
  void *v2;
  SUAuthSSO *v3;
  void *v4;

  v2 = (void *)sharedInstance_instance;
  if (!sharedInstance_instance)
  {
    v3 = objc_alloc_init(SUAuthSSO);
    v4 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v3;

    v2 = (void *)sharedInstance_instance;
  }
  return v2;
}

- (void)invokeSSOAuth
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[SUAuthSSO _getSsoToken](self, "_getSsoToken");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_msgSend(v11, "objectForKey:", CFSTR("ssodata")), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    SULogInfo(CFSTR("%s: Successfully acquired ssoData"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUAuthSSO invokeSSOAuth]");

  }
  else
  {
    SULogInfo(CFSTR("%s: Unable to get a new sso token."), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUAuthSSO invokeSSOAuth]");
  }

}

- (id)_getSsoToken
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*copyPersonalizationSSOToken)(_QWORD, id *);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  id v23;

  -[SUAuthSSO _ensureSsoLib](self, "_ensureSsoLib");
  copyPersonalizationSSOToken = (void (*)(_QWORD, id *))self->copyPersonalizationSSOToken;
  if (copyPersonalizationSSOToken)
  {
    v23 = 0;
    copyPersonalizationSSOToken(0, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    v20 = v12;
    if (v11)
      v21 = v12 == 0;
    else
      v21 = 0;
    if (!v21)
      SULogInfo(CFSTR("%s: failed to get sso token with error %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUAuthSSO _getSsoToken]");

  }
  else
  {
    SULogInfo(CFSTR("%s: failed to get sso token, couldn't find function copyPersonalizationSSOToken"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUAuthSSO _getSsoToken]");
    v11 = 0;
  }
  return v11;
}

- (void)_ensureSsoLib
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SUAuthSSO__ensureSsoLib__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  if (_ensureSsoLib_onceToken != -1)
    dispatch_once(&_ensureSsoLib_onceToken, block);
}

void __26__SUAuthSSO__ensureSsoLib__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = dlopen("/usr/lib/libSoftwareUpdateSSO.dylib", 1);
  if (v2)
  {
    v10 = v2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = dlsym(v2, "copyPersonalizationSSOToken");
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      SULogInfo(CFSTR("%s: unable to load functions from framework"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUAuthSSO _ensureSsoLib]_block_invoke");
      dlclose(v10);
    }
  }
  else
  {
    SULogInfo(CFSTR("%s: unable to initialize susso, unable to load framework"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUAuthSSO _ensureSsoLib]_block_invoke");
  }
}

@end
