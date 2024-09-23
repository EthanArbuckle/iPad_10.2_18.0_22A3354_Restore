@implementation TransparencyError

+ (id)unimplementedError:(id)a3
{
  return +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorInterface"), -132, CFSTR("%@ is unimplemented"), a3);
}

+ (id)truncateUnderlyingErrorDepth:(id)a3 maxDepth:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
    {
      objc_msgSend(v5, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x24BDD1398];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[TransparencyError truncateUnderlyingErrorDepth:maxDepth:](TransparencyError, "truncateUnderlyingErrorDepth:maxDepth:", v8, a4 - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v5, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryWithDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v7);
      v13 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v5, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v5, "code"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v5, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v5, "code"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8 arguments:(char *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v16)
  {
    v18 = objc_msgSend(v16, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  if (v15)
  {
    +[TransparencyError truncateUnderlyingErrorDepth:maxDepth:](TransparencyError, "truncateUnderlyingErrorDepth:maxDepth:", v15, 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v20, *MEMORY[0x24BDD1398]);

  }
  if (v17)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v17, a9);
    objc_msgSend(v19, "setObject:forKey:", v21, *MEMORY[0x24BDD0FC8]);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v14, a4, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 5)
  {
    +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 0;
    goto LABEL_12;
  }
  if (a5 == 6)
  {
    +[TransparencyAnalytics logger](TransparencyAnalytics, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = 1;
LABEL_12:
    objc_msgSend(v23, "logResultForEvent:hardFailure:result:", CFSTR("errorEvent"), v25, v22);

  }
  return v22;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8
{
  uint64_t v9;

  +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:", a3, a4, a5, a6, a7, a8, &v9, &v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 userinfo:(id)a6 description:(id)a7
{
  return +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:", a3, (int)a4, 4, a5, a6, CFSTR("%@"), a7);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8
{
  return +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:", a3, a4, a5, a6, 0, a7, a8);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7
{
  uint64_t v8;

  +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:arguments:", a3, a4, a5, a6, a7, &v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6
{
  uint64_t v7;

  +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:arguments:", a3, a4, 4, a5, a6, &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  uint64_t v6;

  +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:arguments:", a3, a4, 4, 0, a5, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)hasUnknownSPKIHashError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    LOBYTE(v7) = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("TransparencyErrorVerify")))
  {

LABEL_7:
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *MEMORY[0x24BDD1398];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "domain");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("TransparencyErrorVerify")))
          {
            v13 = objc_msgSend(v11, "code");

            if (v13 == -9)
            {
              LOBYTE(v7) = 1;
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {

          }
        }
        LOBYTE(v7) = 0;
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != -9)
    goto LABEL_7;
  LOBYTE(v7) = 1;
LABEL_18:

  return (char)v7;
}

+ (id)errorWithError:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDD1398];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "code");
    if (v10)
    {
      objc_msgSend(v5, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[TransparencyError errorWithError:underlyingError:](TransparencyError, "errorWithError:underlyingError:", v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v11, v12, v15, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", v11, v12, v7, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = v6;
  }

  return v16;
}

+ (id)diagnosticUserInfoValue:(id)a3 depth:(unint64_t)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = 0;
  if (v6 && a4 <= 5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (__CFString *)v6;
LABEL_6:
      v7 = v8;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "diagnosticUserInfo:depth:", v6, a4 + 1);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "diagnosticError:depth:", v6, a4 + 1);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v7 = CFSTR("unknown");
            goto LABEL_7;
          }
          objc_msgSend(v6, "description");
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      v14 = a4 + 1;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "diagnosticUserInfoValue:depth:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), v14, (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[__CFString addObject:](v7, "addObject:", v16);

          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
LABEL_7:

  return v7;
}

+ (id)diagnosticUserInfo:(id)a3 depth:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 <= 5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = a4 + 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "diagnosticUserInfoValue:depth:", v14, v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)diagnosticError:(id)a3 depth:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 <= 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14[0] = CFSTR("domain");
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("code");
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "diagnosticUserInfo:depth:", v11, a4 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("userInfo"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)diagnosticError:(id)a3
{
  return (id)objc_msgSend(a1, "diagnosticError:depth:", a3, 0);
}

@end
