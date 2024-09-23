@implementation RBPersonaManager

- (BOOL)personaForIdentity:(id)a3 context:(id)a4 personaUID:(unsigned int *)a5 personaUniqueString:(id *)a6
{
  id v10;
  id v11;
  double Current;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  unsigned int personalPersonaUID;
  void *v18;
  char v19;
  unsigned int *v20;
  BOOL v21;
  NSString *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  uint64_t i;
  unsigned int *v28;
  _BYTE buf[52];
  __int128 v30;
  __int128 v31;
  _OWORD v32[16];
  uint64_t v33;
  _QWORD v34[5];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!-[RBPersonaManager personasAreSupported](self, "personasAreSupported"))
  {
    v21 = 0;
    goto LABEL_24;
  }
  v28 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v10, "personaString");
  v34[0] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedPersona");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v34[1] = v13;
  personalPersonaUID = -1;
  do
  {
    v18 = (void *)v34[v15];
    if (v18)
    {
      *(_QWORD *)buf = 1;
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      kpersona_find();
    }
    v19 = v14;
    v14 = 1;
    v15 = 1;
  }
  while ((v19 & 1) == 0);
  if (objc_msgSend(v11, "lsPersona"))
  {
    v33 = 0;
    memset(v32, 0, sizeof(v32));
    v31 = 0u;
    v30 = 0u;
    memset(&buf[4], 0, 48);
    *(_DWORD *)buf = 2;
    v20 = v28;
    if (!kpersona_info())
    {
      personalPersonaUID = *(_DWORD *)&buf[4];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)v32 + 4);
      v23 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v23;
      if (!v28)
      {
LABEL_16:
        if (a6)
        {
          v16 = objc_retainAutorelease(v16);
          *a6 = v16;
        }
        v21 = 1;
        goto LABEL_19;
      }
LABEL_15:
      *v20 = personalPersonaUID;
      goto LABEL_16;
    }
  }
  else
  {
    v20 = v28;
  }
  if (objc_opt_class())
  {
    personalPersonaUID = self->_personalPersonaUID;
    v22 = self->_personalPersonaUniqueString;

    v16 = v22;
    if (!v20)
      goto LABEL_16;
    goto LABEL_15;
  }
  v21 = 0;
LABEL_19:
  v24 = CFAbsoluteTimeGetCurrent();
  rbs_job_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:]";
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (v24 - Current) * 1000.0;
    *(_WORD *)&buf[32] = 1024;
    *(_DWORD *)&buf[34] = personalPersonaUID;
    *(_WORD *)&buf[38] = 2114;
    *(_QWORD *)&buf[40] = v16;
    _os_log_impl(&dword_21A8B4000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: %s required %f ms (wallclock); resolved to {%u, %{public}@}",
      buf,
      0x30u);
  }

  for (i = 1; i != -1; --i)
LABEL_24:

  return v21;
}

- (BOOL)personasAreSupported
{
  return self->_personasSupported;
}

- (RBPersonaManager)init
{
  RBPersonaManager *v2;
  RBPersonaManager *v3;
  NSString *personalPersonaUniqueString;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  int v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)RBPersonaManager;
  v2 = -[RBPersonaManager init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_personasSupported = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    personalPersonaUniqueString = v2->_personalPersonaUniqueString;
    v2->_personalPersonaUniqueString = 0;

    if (objc_opt_class())
    {
      objc_msgSend(MEMORY[0x24BEBF278], "personaAttributesForPersonaType:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBF278], "personaAttributesForPersonaType:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
        v8 = v6 == 0;
      else
        v8 = 1;
      v9 = !v8;
      v3->_personasSupported = v9;
      if (!v8)
      {
        v3->_personalPersonaUID = objc_msgSend(v6, "userPersona_id");
        objc_msgSend(v7, "userPersonaUniqueString");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v3->_personalPersonaUniqueString;
        v3->_personalPersonaUniqueString = (NSString *)v10;

      }
      objc_msgSend(MEMORY[0x24BEBF260], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isSharedIPad");

      if (v13)
        v14 = "YES";
      else
        v14 = "NO";
    }
    else
    {
      v14 = "NO";
    }
    rbs_job_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_personasSupported)
        v16 = "YES";
      else
        v16 = "NO";
      *(_DWORD *)buf = 136315394;
      v20 = v16;
      v21 = 2080;
      v22 = v14;
      _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_DEFAULT, "Personas are supported: %s; isSharedIPad: %s",
        buf,
        0x16u);
    }

  }
  return v3;
}

- (id)personalPersonaUniqueString
{
  NSString *v3;

  if (-[RBPersonaManager personasAreSupported](self, "personasAreSupported"))
    v3 = self->_personalPersonaUniqueString;
  else
    v3 = 0;
  return v3;
}

- (BOOL)isConcretePersona:(id)a3
{
  id v4;

  v4 = a3;
  if (-[RBPersonaManager personasAreSupported](self, "personasAreSupported"))
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    kpersona_find();
  }

  return 0;
}

- (BOOL)personaRequiredForExtensionContext:(id)a3 serviceDict:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  objc_msgSend(a3, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    xpc_dictionary_get_value(v5, "PersonaEnterprise");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalPersonaUniqueString, 0);
}

@end
