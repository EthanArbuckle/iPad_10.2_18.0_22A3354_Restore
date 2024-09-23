@implementation SMHandle

- (SMHandle)initWithPrimaryHandle:(id)a3 secondaryHandles:(id)a4
{
  id v7;
  id v8;
  SMHandle *v9;
  id *p_isa;
  SMHandle *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SMHandle;
  v9 = -[SMHandle init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_primaryHandle, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (BOOL)hasEqualPrimaryHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SMHandle primaryHandle](self, "primaryHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (id)canonicalizedHandle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  SMHandle *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SMHandle primaryHandle](self, "primaryHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMHandleFormatting canonicalIDSAddressForAddress:](SMHandleFormatting, "canonicalIDSAddressForAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SMHandle primaryHandle](self, "primaryHandle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SMHandle secondaryHandles](self, "secondaryHandles", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        +[SMHandleFormatting canonicalIDSAddressForAddress:](SMHandleFormatting, "canonicalIDSAddressForAddress:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v14;
        v18 = v17;

        if (v18)
          objc_msgSend(v8, "addObject:", v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v19 = -[SMHandle initWithPrimaryHandle:secondaryHandles:]([SMHandle alloc], "initWithPrimaryHandle:secondaryHandles:", v7, v8);
  return v19;
}

+ (int64_t)getSMHandleTypeWithHandle:(id)a3
{
  id v3;
  NSObject *v4;
  int64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "+[SMHandle getSMHandleTypeWithHandle:]";
      v9 = 1024;
      v10 = 54;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handle (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }

  }
  if ((MEMORY[0x2495375D0](v3) & 1) != 0)
  {
    v5 = 1;
  }
  else if (IMStringIsEmail())
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)descriptionDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("__kSMPrimaryHandleKey");
  -[SMHandle primaryHandle](self, "primaryHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SMHandle descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SMHandle *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMPrimaryHandleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("__kSMSecondaryHandlesKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SMHandle initWithPrimaryHandle:secondaryHandles:](self, "initWithPrimaryHandle:secondaryHandles:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *primaryHandle;
  id v5;

  primaryHandle = self->_primaryHandle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primaryHandle, CFSTR("__kSMPrimaryHandleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryHandles, CFSTR("__kSMSecondaryHandlesKey"));

}

- (SMHandle)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SMHandle *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMPrimaryHandleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSecondaryHandlesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v7 = -[SMHandle initWithPrimaryHandle:secondaryHandles:]([SMHandle alloc], "initWithPrimaryHandle:secondaryHandles:", v5, v6);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[SMHandle initWithDictionary:]";
      _os_log_error_impl(&dword_245521000, v8, OS_LOG_TYPE_ERROR, "%s, toHandleString is empty", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[SMHandle primaryHandle](self, "primaryHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("__kSMPrimaryHandleKey"));

  -[SMHandle secondaryHandles](self, "secondaryHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("__kSMSecondaryHandlesKey"));

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SMHandle primaryHandle](self, "primaryHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMHandle secondaryHandles](self, "secondaryHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SMHandle *v5;
  SMHandle *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (SMHandle *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SMHandle primaryHandle](self, "primaryHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMHandle primaryHandle](v6, "primaryHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[SMHandle primaryHandle](self, "primaryHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMHandle primaryHandle](v6, "primaryHandle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[SMHandle secondaryHandles](self, "secondaryHandles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMHandle secondaryHandles](v6, "secondaryHandles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[SMHandle secondaryHandles](self, "secondaryHandles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMHandle secondaryHandles](v6, "secondaryHandles");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)primaryHandle
{
  return self->_primaryHandle;
}

- (NSArray)secondaryHandles
{
  return self->_secondaryHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryHandles, 0);
  objc_storeStrong((id *)&self->_primaryHandle, 0);
}

@end
