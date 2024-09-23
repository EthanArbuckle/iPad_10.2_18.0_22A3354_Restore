@implementation STScreenTimeSettings

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STScreenTimeSettings;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchScreenTimeSettingsInContext:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fetchRequest", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v7);

  v27 = 0;
  objc_msgSend(v5, "execute:", &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;
  v10 = v9;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v18;
      if (v18)
      {
        v19 = v18;
      }
      else if (a4)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = CFSTR("screen time settings not found");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 9, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v28 = v22;
          v29 = CFSTR("screen time settings not found");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 9, v26);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0CB2D50];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = CFSTR("There must be one and only once ScreenTimeSettings object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 502, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v32 = v12;
          v33 = CFSTR("There must be one and only once ScreenTimeSettings object.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 502, v16);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    if (a4 && v9)
    {
      v17 = 0;
      *a4 = objc_retainAutorelease(v9);
    }
  }

  return v17;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STScreenTimeSettings;
  v5 = -[STScreenTimeSettings validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STScreenTimeSettings _validateCurrentOrganization:](self, "_validateCurrentOrganization:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STScreenTimeSettings;
  v5 = -[STScreenTimeSettings validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v5 = -[STScreenTimeSettings _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
      if (v5)
        LOBYTE(v5) = -[STScreenTimeSettings _validateCurrentOrganization:](self, "_validateCurrentOrganization:", a3);
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STScreenTimeSettings;
  v5 = -[STScreenTimeSettings validateForDelete:](&v7, sel_validateForDelete_);
  if (v5)
  {
    if (_os_feature_enabled_impl())
      LOBYTE(v5) = -[STScreenTimeSettings _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_validateCurrentOrganization:(id *)a3
{
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
  char isKindOfClass;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[STScreenTimeSettings currentOrganization](self, "currentOrganization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!a3)
      return 0;
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("The ScreenTimeSettings object must always contain a currentOrganization.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 21, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v27 = v8;
    v28 = CFSTR("The ScreenTimeSettings object must always contain a currentOrganization.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = 21;
    goto LABEL_12;
  }
  -[STScreenTimeSettings currentOrganization](self, "currentOrganization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    return 1;
  }
  -[STScreenTimeSettings currentOrganization](self, "currentOrganization");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  if (a3)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("The ScreenTimeSettings object references an unsupported organization class.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 503, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = v19;
      v24 = CFSTR("The ScreenTimeSettings object references an unsupported organization class.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v22;
      v14 = 503;
LABEL_12:
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v14, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
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
  +[STScreenTimeSettings fetchRequest](STScreenTimeSettings, "fetchRequest");
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
      v24 = CFSTR("There must be one ScreenTimeSettings object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 9, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v21 = v16;
        v22 = CFSTR("There must be one ScreenTimeSettings object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v19;
        v14 = 9;
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
    v28[0] = CFSTR("There must be one and only one ScreenTimeSettings object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 502, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v25 = v8;
      v26 = CFSTR("There must be one and only one ScreenTimeSettings object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = 502;
LABEL_11:
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), v14, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_12;
  }

  return (char)a3;
}

@end
