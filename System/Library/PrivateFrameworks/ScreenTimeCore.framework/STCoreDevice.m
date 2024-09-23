@implementation STCoreDevice

+ (id)fetchDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;

  v7 = a4;
  v8 = a3;
  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  v24 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v24;
  v13 = v12;
  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
      v22 = objc_msgSend(v11, "count");
      if (a5 && !v22)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 13, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[STCoreDevice fetchDeviceWithIdentifier:inContext:error:].cold.1((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v11, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v21;
}

+ (id)fetchDeviceWithCoreDuetIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;

  v7 = a4;
  v8 = a3;
  +[STUserDeviceState fetchRequest](STUserDeviceState, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("coreDuetIdentifier"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  v25 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v25;
  v13 = v12;
  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "count") < 2)
    {
      v22 = objc_msgSend(v11, "count");
      if (a5 && !v22)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 13, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[STCoreDevice fetchDeviceWithCoreDuetIdentifier:inContext:error:].cold.1((uint64_t)v11, v14, v15, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v11, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v21;
}

+ (id)fetchOrCreateDeviceWithIdentifier:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  STCoreDevice *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17 = 0;
  objc_msgSend(a1, "fetchDeviceWithIdentifier:inContext:error:", v8, v9, &v17);
  v10 = (STCoreDevice *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = v11;
  if (!v10)
  {
    objc_msgSend(v11, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("STErrorDomain")))
    {
      v14 = objc_msgSend(v12, "code");

      if (v14 != 13)
      {
        v10 = 0;
        if (!a5)
          goto LABEL_11;
        goto LABEL_10;
      }
      +[STLog screentime](STLog, "screentime");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "+[STCoreDevice fetchOrCreateDeviceWithIdentifier:inContext:error:]";
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_1D22E7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating CoreDevice with deviceIdentifier: (%@)", buf, 0x16u);
      }

      v10 = -[STCoreDevice initWithContext:]([STCoreDevice alloc], "initWithContext:", v9);
      -[STCoreDevice setIdentifier:](v10, "setIdentifier:", v8);
      v13 = v12;
      v12 = 0;
    }
    else
    {
      v10 = 0;
    }

  }
  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v12);
LABEL_11:

  return v10;
}

+ (id)fetchOrCreateLocalDeviceInContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  STGetDeviceUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STCoreDevice fetchOrCreateDeviceWithIdentifier:inContext:error:](STCoreDevice, "fetchOrCreateDeviceWithIdentifier:inContext:error:", v6, v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    STGetDeviceName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v9);

  }
  if (!objc_msgSend(v7, "platform"))
    objc_msgSend(v7, "setPlatform:", 2);
  return v7;
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STCoreDevice;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequestForLocalDevices
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  STGetDeviceUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  return v2;
}

+ (id)fetchRequestForDevicesMissingUsage
{
  void *v2;
  void *v3;

  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K.@count == 0) AND (%K == NULL)"), CFSTR("usages"), CFSTR("localUserDeviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

+ (id)fetchRequestForNonLocalDevices
{
  void *v2;
  void *v3;

  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == NULL)"), CFSTR("localUserDeviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  return v2;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STCoreDevice;
  v5 = -[STCoreDevice validateForUpdate:](&v8, sel_validateForUpdate_);
  if (v5)
  {
    if (!_os_feature_enabled_impl())
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    v5 = -[STCoreDevice _validateUniqueIdentifier:](self, "_validateUniqueIdentifier:", a3);
    if (v5)
    {
      v5 = -[STCoreDevice _validateNumberOfLocalDevices:](self, "_validateNumberOfLocalDevices:", a3);
      if (v5)
      {
        -[STCoreDevice localUserDeviceState](self, "localUserDeviceState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          if (!-[STCoreDevice _validateLocalDevice:](self, "_validateLocalDevice:", a3))
          {
            LOBYTE(v5) = 0;
            return v5;
          }
        }
        else
        {
          v5 = -[STCoreDevice _validateRemoteDevice:](self, "_validateRemoteDevice:", a3);
          if (!v5)
            return v5;
        }
        LOBYTE(v5) = -[STCoreDevice _validateUserDeviceStates:](self, "_validateUserDeviceStates:", a3);
      }
    }
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STCoreDevice;
  v5 = -[STCoreDevice validateForInsert:](&v8, sel_validateForInsert_);
  if (v5)
  {
    if (!_os_feature_enabled_impl())
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    v5 = -[STCoreDevice _validateUniqueIdentifier:](self, "_validateUniqueIdentifier:", a3);
    if (v5)
    {
      v5 = -[STCoreDevice _validateNumberOfLocalDevices:](self, "_validateNumberOfLocalDevices:", a3);
      if (v5)
      {
        -[STCoreDevice localUserDeviceState](self, "localUserDeviceState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          if (!-[STCoreDevice _validateLocalDevice:](self, "_validateLocalDevice:", a3))
          {
            LOBYTE(v5) = 0;
            return v5;
          }
        }
        else
        {
          v5 = -[STCoreDevice _validateRemoteDevice:](self, "_validateRemoteDevice:", a3);
          if (!v5)
            return v5;
        }
        LOBYTE(v5) = -[STCoreDevice _validateUserDeviceStates:](self, "_validateUserDeviceStates:", a3);
      }
    }
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STCoreDevice;
  v5 = -[STCoreDevice validateForDelete:](&v7, sel_validateForDelete_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STCoreDevice _validateNumberOfLocalDevices:](self, "_validateNumberOfLocalDevices:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_validateLocalDevice:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  -[STCoreDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  STGetDeviceUUID();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    if (!a3)
      return 0;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v40 = *MEMORY[0x1E0CB2D50];
    v41[0] = CFSTR("A local device must have the UUID of the local device.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 521, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      return 0;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v38 = v13;
    v39 = CFSTR("A local device must have the UUID of the local device.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = 521;
    goto LABEL_14;
  }
  if (-[STCoreDevice platform](self, "platform") != 2)
  {
    if (!a3)
      return 0;
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("A local device must match the platform of the current device.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 524, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      return 0;
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v34 = v21;
    v35 = CFSTR("A local device must match the platform of the current device.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;
    v19 = 524;
    goto LABEL_14;
  }
  -[STCoreDevice userDeviceStates](self, "userDeviceStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreDevice localUserDeviceState](self, "localUserDeviceState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) != 0)
    return 1;
  if (a3)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = CFSTR("The localUserDeviceState of a local device MUST be in the device's userDeviceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 523, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = v26;
      v31 = CFSTR("The localUserDeviceState of a local device MUST be in the device's userDeviceState.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v29;
      v19 = 523;
LABEL_14:
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v19, v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
}

- (BOOL)_validateNumberOfLocalDevices:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("localUserDeviceState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "execute:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_12;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    if (objc_msgSend(v7, "count"))
    {
      LOBYTE(a3) = 1;
    }
    else if (a3)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("There must be local device (with localUserDeviceState).");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 519, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v22 = v17;
        v23 = CFSTR("There must be local device (with localUserDeviceState).");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        v15 = 519;
        goto LABEL_11;
      }
LABEL_12:
      LOBYTE(a3) = 0;
    }
  }
  else if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("There must be one and only device with localUserDeviceState.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 518, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v26 = v9;
      v27 = CFSTR("There must be one and only device with localUserDeviceState.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = 518;
LABEL_11:
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v15, v13);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_12;
  }

  return (char)a3;
}

- (BOOL)_validateRemoteDevice:(id *)a3
{
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = -[STCoreDevice platform](self, "platform");
  v5 = v4;
  if (a3)
  {
    if (!v4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2D50];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("A remote device must have a valid platform.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 526, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v13 = v7;
        v14 = CFSTR("A remote device must have a valid platform.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 526, v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v5 != 0;
}

- (BOOL)_validateUniqueIdentifier:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[STCoreDevice fetchRequest](STCoreDevice, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  -[STCoreDevice identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(v5, "execute:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
LABEL_6:
    LOBYTE(a3) = 0;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    LOBYTE(a3) = 1;
    goto LABEL_8;
  }
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("There must be one and only device with a given UUID.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 520, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v18 = v12;
      v19 = CFSTR("There must be one and only device with a given UUID.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 520, v16);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
LABEL_8:

  return (char)a3;
}

- (BOOL)_validateUserDeviceStates:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[STCoreDevice userDeviceStates](self, "userDeviceStates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (a3)
  {
    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2D50];
      v15 = *MEMORY[0x1E0CB2D50];
      v16[0] = CFSTR("All devices must have at least 1 user device state.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 525, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v13 = v7;
        v14 = CFSTR("All devices must have at least 1 user device state.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 525, v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v5 != 0;
}

+ (void)fetchDeviceWithIdentifier:(uint64_t)a3 inContext:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, a2, a3, "device identifier is not unique but it should be:\n%@", a5, a6, a7, a8, 2u);
}

+ (void)fetchDeviceWithCoreDuetIdentifier:(uint64_t)a3 inContext:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, a2, a3, "device identifier is not unique but it should be:\n%{public}@", a5, a6, a7, a8, 2u);
}

@end
