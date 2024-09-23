@implementation STiCloudOrganization

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16;
      if (v16)
      {
        v14 = v16;
        v15 = v14;
      }
      else
      {
        if (a4)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB2D50];
          v26 = *MEMORY[0x1E0CB2D50];
          v27 = CFSTR("There must be one Cloud Organization.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 505, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v24 = v18;
            v25 = CFSTR("There must be one Cloud Organization.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 505, v22);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v15 = 0;
      }
      goto LABEL_13;
    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("There must be one and only one Cloud Organization object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 504, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v28 = v10;
        v29 = CFSTR("There must be one and only one Cloud Organization object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 504, v14);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)fetchOrCreateiCloudOrganizationWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  STiCloudOrganization *v11;
  STiCloudOrganizationSettings *v12;

  v6 = a3;
  objc_msgSend(a1, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executeFetchRequest:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      +[STLog persistence](STLog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[STiCloudOrganization fetchOrCreateiCloudOrganizationWithContext:error:].cold.1();

    }
    objc_msgSend(v9, "firstObject");
    v11 = (STiCloudOrganization *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = -[STiCloudOrganization initWithContext:]([STiCloudOrganization alloc], "initWithContext:", v6);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      -[STiCloudOrganization settings](v11, "settings");
      v12 = (STiCloudOrganizationSettings *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v12 = -[STiCloudOrganizationSettings initWithContext:]([STiCloudOrganizationSettings alloc], "initWithContext:", v6);
        -[STiCloudOrganizationSettings setOrganization:](v12, "setOrganization:", v11);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STiCloudOrganization;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("RMiCloudOrganization");
}

- (BOOL)validateForUpdate:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STiCloudOrganization;
  return -[STiCloudOrganization validateForUpdate:](&v4, sel_validateForUpdate_, a3);
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STiCloudOrganization;
  v5 = -[STiCloudOrganization validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STiCloudOrganization _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STiCloudOrganization;
  v5 = -[STiCloudOrganization validateForDelete:](&v7, sel_validateForDelete_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STiCloudOrganization _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_validateNumberOfObjects:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  +[STiCloudOrganization fetchRequest](STiCloudOrganization, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_12;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v6, "count"))
    {
      LOBYTE(a3) = 1;
    }
    else if (a3)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("There must be one Cloud Organization object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 505, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v21 = v16;
        v22 = CFSTR("There must be one Cloud Organization object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v19;
        v14 = 505;
        goto LABEL_11;
      }
LABEL_12:
      LOBYTE(a3) = 0;
    }
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("There must be one and only one Cloud Organization object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 504, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v25 = v8;
      v26 = CFSTR("There must be one and only one Cloud Organization object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = 504;
LABEL_11:
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v14, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_12;
  }

  return (char)a3;
}

+ (void)fetchOrCreateiCloudOrganizationWithContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "organization is not unique but should be:\n%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
