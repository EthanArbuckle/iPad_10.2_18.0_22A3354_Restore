@implementation RMModelStatusReason(RemoteManagement)

+ (id)reasonWithCode:()RemoteManagement description:details:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  if (a5)
  {
    v8 = (void *)MEMORY[0x24BE7EB68];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "buildFromDictionary:", a5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "buildWithCode:description:details:", v10, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = a4;
    v11 = a3;
    objc_msgSend(a1, "buildWithCode:description:details:", v11, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)reasonWithCode:()RemoteManagement description:underlyingError:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (v8)
  {
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0BA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v8, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v8, "localizedFailureReason");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v18;

    }
    v21 = CFSTR("Error");
    v22[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "reasonWithCode:description:details:", v10, v9, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "reasonWithCode:description:details:", v10, v9, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

+ (id)reasonWithError:()RemoteManagement
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RMErrorUserInfoKeyDescriptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD0BA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v4, "localizedFailureReason");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v13;

  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(a1, "buildWithCode:description:details:", v6, v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("An unknown error occurred: %@"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BE7EB68];
    v22[0] = CFSTR("Domain");
    objc_msgSend(v4, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = CFSTR("Code");
    v23[0] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "code"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "buildFromDictionary:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "buildWithCode:description:details:", CFSTR("Error.Unknown"), v15, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (uint64_t)isEqual:()RemoteManagement
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (a1 == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(a1, "isEqualToStatusReason:", v4);
    else
      v5 = 0;
  }

  return v5;
}

- (uint64_t)isEqualToStatusReason:()RemoteManagement
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v4 = a3;
  objc_msgSend(a1, "statusCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    objc_msgSend(a1, "statusDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      v12 = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!(_DWORD)v12)
        goto LABEL_16;
    }
    objc_msgSend(a1, "statusDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v17 = v16;
    v18 = v17;
    if (v13 == v17)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v13 && v17)
        v12 = objc_msgSend(v13, "isEqual:", v17);
    }

    goto LABEL_15;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

@end
