@implementation STDynamicActivityAttribution

- (NSString)clientExecutablePath
{
  return self->_clientExecutablePath;
}

+ (id)attributionForClientAuditToken:(id *)a3 clientExecutablePath:(id)a4 bundleID:(id)a5 localizationKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  STDynamicActivityAttribution *v14;
  __int128 v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _BYTE buf[32];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = a1;
        v31 = 2114;
        v32 = CFSTR("STDynamicActivityAttribution.m");
        v33 = 1024;
        v34 = 17;
        v35 = 2114;
        v36 = v22;
        _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D12FA70CLL);
    }

    if (!v12)
      goto LABEL_8;
  }
  else if (!v12)
  {
    v16 = 0;
    goto LABEL_11;
  }
  NSClassFromString(CFSTR("NSString"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = a1;
      v31 = 2114;
      v32 = CFSTR("STDynamicActivityAttribution.m");
      v33 = 1024;
      v34 = 18;
      v35 = 2114;
      v36 = v26;
      _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D12FA804);
  }

LABEL_8:
  v14 = [STDynamicActivityAttribution alloc];
  v15 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v15;
  v16 = -[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v14, (__int128 *)buf, v11);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    v18 = (void *)v16[1];
    v16[1] = v17;

    v19 = objc_msgSend(v13, "copy");
    v20 = (void *)v16[2];
    v16[2] = v19;

  }
LABEL_11:

  return v16;
}

- (void)_initWithClientAuditToken:(void *)a3 clientExecutablePath:
{
  id v6;
  uint64_t v7;
  __int128 v8;

  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend(a1, "init");
    a1 = (void *)v7;
    if (v7)
    {
      v8 = *a2;
      *(_OWORD *)(v7 + 72) = a2[1];
      *(_OWORD *)(v7 + 56) = v8;
      objc_storeStrong((id *)(v7 + 40), a3);
    }
  }

  return a1;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 localizationKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  STDynamicActivityAttribution *v16;
  __int128 v17;
  char *v18;
  _QWORD *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _BYTE buf[32];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = a1;
        v31 = 2114;
        v32 = CFSTR("STDynamicActivityAttribution.m");
        v33 = 1024;
        v34 = 32;
        v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D12FAA94);
    }

    v16 = [STDynamicActivityAttribution alloc];
    v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (__int128 *)buf, v13);
    v19 = v18;
    if (v18)
    {
      v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)v19[6];
      v19[6] = v21;

      v23 = objc_msgSend(v15, "copy");
      v24 = (void *)v19[2];
      v19[2] = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 stringWithFormat:(id)a7
{
  id v13;
  id v14;
  id v15;
  STDynamicActivityAttribution *v16;
  __int128 v17;
  char *v18;
  _QWORD *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _BYTE buf[32];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = a1;
        v31 = 2114;
        v32 = CFSTR("STDynamicActivityAttribution.m");
        v33 = 1024;
        v34 = 47;
        v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D12FACBCLL);
    }

    v16 = [STDynamicActivityAttribution alloc];
    v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (__int128 *)buf, v13);
    v19 = v18;
    if (v18)
    {
      v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)v19[6];
      v19[6] = v21;

      v23 = objc_msgSend(v15, "copy");
      v24 = (void *)v19[3];
      v19[3] = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)attributionForClientAuditToken:(id *)a3 maskingClientAuditToken:(id *)a4 clientExecutablePath:(id)a5 maskingClientExecutablePath:(id)a6 website:(id)a7
{
  id v13;
  id v14;
  id v15;
  STDynamicActivityAttribution *v16;
  __int128 v17;
  char *v18;
  _QWORD *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  _BYTE buf[32];
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = a1;
        v31 = 2114;
        v32 = CFSTR("STDynamicActivityAttribution.m");
        v33 = 1024;
        v34 = 62;
        v35 = 2114;
        v36 = v26;
        _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D12FAEE4);
    }

    v16 = [STDynamicActivityAttribution alloc];
    v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v17;
    v18 = (char *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](v16, (__int128 *)buf, v13);
    v19 = v18;
    if (v18)
    {
      v20 = *(_OWORD *)a4->var0;
      *(_OWORD *)(v18 + 104) = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)(v18 + 88) = v20;
      v21 = objc_msgSend(v14, "copy");
      v22 = (void *)v19[6];
      v19[6] = v21;

      v23 = objc_msgSend(v15, "copy");
      v24 = (void *)v19[4];
      v19[4] = v23;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = BSVersionedPIDForAuditToken(), v4 == BSVersionedPIDForAuditToken())
    && (v5 = BSVersionedPIDForAuditToken(), v5 == BSVersionedPIDForAuditToken())
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings())
  {
    v6 = BSEqualStrings();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  id v16;

  v2 = (uint64_t)self;
  if (self)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSString lastPathComponent](self->_clientExecutablePath, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%d"), v4, BSPIDForAuditToken());
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(v2 + 48), "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%d"), v7, BSPIDForAuditToken());
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "appendObject:withName:", v5, CFSTR("client"));
    v11 = (id)objc_msgSend(v9, "appendObject:withName:", v8, CFSTR("maskingClient"));
    v12 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", *(_QWORD *)(v2 + 8), CFSTR("bundleID"), 1);
    v13 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", *(_QWORD *)(v2 + 16), CFSTR("locKey"), 1);
    v14 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", *(_QWORD *)(v2 + 24), CFSTR("formattedString"), 1);
    if (*(_QWORD *)(v2 + 32))
      v15 = CFSTR("YES");
    else
      v15 = 0;
    v16 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v15, CFSTR("websiteNonNil"), 1);

    objc_msgSend(v9, "build");
    v2 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  __int128 v5;
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;

  v4 = (void *)MEMORY[0x1E0D016E0];
  v5 = *(_OWORD *)&self->_clientAuditToken.val[4];
  v10 = *(_OWORD *)self->_clientAuditToken.val;
  v11 = v5;
  v6 = a3;
  objc_msgSend(v4, "tokenFromAuditToken:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("_clientAuditToken"), v10, v11);

  objc_msgSend(v6, "encodeObject:forKey:", self->_clientExecutablePath, CFSTR("_clientExecutablePath"));
  v8 = *(_OWORD *)&self->_maskingClientAuditToken.val[4];
  v10 = *(_OWORD *)self->_maskingClientAuditToken.val;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0D016E0], "tokenFromAuditToken:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("_maskingClientAuditToken"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_maskingClientExecutablePath, CFSTR("_maskingClientExecutablePath"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizationKey, CFSTR("_localizationKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_formattedString, CFSTR("_formattedString"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_website, CFSTR("_website"));

}

- (STDynamicActivityAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  STDynamicActivityAttribution *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  STDynamicActivityAttribution *v15;
  __int128 v16;
  __int128 v17;
  NSString *v18;
  NSString *bundleIdentifier;
  NSString *v20;
  NSString *localizationKey;
  NSString *v22;
  NSString *formattedString;
  NSString *v24;
  NSString *website;
  __int128 v27[6];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientAuditToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientExecutablePath"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maskingClientAuditToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maskingClientExecutablePath"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11)
    {
      objc_msgSend(v5, "realToken");
      objc_msgSend(v10, "realToken");
      v13 = v7;
      v14 = v12;
      if (self)
      {
        v15 = -[STDynamicActivityAttribution init](self, "init");
        self = v15;
        if (v15)
        {
          v16 = v27[5];
          *(_OWORD *)v15->_clientAuditToken.val = v27[4];
          *(_OWORD *)&v15->_clientAuditToken.val[4] = v16;
          objc_storeStrong((id *)&v15->_clientExecutablePath, v7);
          v17 = v27[3];
          *(_OWORD *)self->_maskingClientAuditToken.val = v27[2];
          *(_OWORD *)&self->_maskingClientAuditToken.val[4] = v17;
          objc_storeStrong((id *)&self->_maskingClientExecutablePath, v12);
        }
      }

    }
    else
    {
      objc_msgSend(v5, "realToken");
      self = (STDynamicActivityAttribution *)-[STDynamicActivityAttribution _initWithClientAuditToken:clientExecutablePath:](self, v27, v7);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizationKey"));
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizationKey = self->_localizationKey;
    self->_localizationKey = v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_formattedString"));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    formattedString = self->_formattedString;
    self->_formattedString = v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_website"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    website = self->_website;
    self->_website = v24;

    self = self;
    v9 = self;
  }

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (NSString)website
{
  return self->_website;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)maskingClientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)maskingClientExecutablePath
{
  return self->_maskingClientExecutablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskingClientExecutablePath, 0);
  objc_storeStrong((id *)&self->_clientExecutablePath, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
