@implementation TUCallGroup

- (TUCallGroup)initWithCalls:(id)a3
{
  id v5;
  TUCallGroup *v6;
  uint64_t v7;
  NSArray *calls;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallGroup.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calls.count > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TUCallGroup;
  v6 = -[TUCallGroup init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    calls = v6->_calls;
    v6->_calls = (NSArray *)v7;

  }
  return v6;
}

- (TUCallGroup)initWithCall:(id)a3
{
  id v5;
  void *v6;
  TUCallGroup *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallGroup.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("call != nil"));

  }
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUCallGroup initWithCalls:](self, "initWithCalls:", v6);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUCallGroup calls](self, "calls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p calls=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUCallGroup isEqualToCallGroup:](self, "isEqualToCallGroup:", v4);

  return v5;
}

- (BOOL)isEqualToCallGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCallGroup calls](self, "calls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToArray:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TUCallGroup calls](self, "calls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)displayName
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[TUCallGroup calls](self, "calls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[TUCallGroup calls](self, "calls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v9;
  }
  else
  {
    v11 = objc_msgSend(v6, "count");

    if (v11 < 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUCallGroup.m"), 68, CFSTR("Could not determine display name for TUCallGroup with an empty list of calls: %@"), self);

      return (NSString *)0;
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[TUCallGroup calls](self, "calls");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "displayFirstName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v15)
            {
              v20 = (void *)MEMORY[0x1E0CB3940];
              TUBundle();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringWithFormat:", v22, v15, v19);
              v23 = objc_claimAutoreleasedReturnValue();

              v15 = (id)v23;
            }
            else
            {
              v15 = v18;
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      return (NSString *)v15;
    }
  }
}

- (int)status
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TUCallGroup calls](self, "calls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");

  -[TUCallGroup calls](self, "calls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 2)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[TUCallGroup calls](self, "calls", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "status") == 1)
          {
            v5 = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUCallGroup;
  -[TUCallGroup methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TUCallGroup calls](self, "calls");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "selector");
  -[TUCallGroup calls](self, "calls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TUCallGroup calls](self, "calls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invokeWithTarget:", v8);

  }
}

- (NSArray)calls
{
  return self->_calls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calls, 0);
}

@end
