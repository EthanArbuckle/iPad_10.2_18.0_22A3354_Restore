@implementation NFTLV

+ (id)TLVsWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v7;

  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v4, "bytes");
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "_parseTLVs:end:simple:definite:", &v7, v7 + v5, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)TLVsWithData:(id)a3 requireDefiniteEncoding:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v4 = a4;
  v6 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v6, "bytes");
  v7 = objc_msgSend(v6, "length");

  objc_msgSend(a1, "_parseTLVs:end:simple:definite:", &v9, v9 + v7, 0, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)simpleTLVsWithData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v7;

  v4 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v4, "bytes");
  v5 = objc_msgSend(v4, "length");

  objc_msgSend(a1, "_parseTLVs:end:simple:definite:", &v7, v7 + v5, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)TLVSsWithBytes:(const void *)a3 length:(unint64_t)a4 requireDefiniteEncoding:(BOOL)a5
{
  const void *v6;

  v6 = a3;
  objc_msgSend(a1, "_parseTLVs:end:simple:definite:", &v6, (char *)a3 + a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)TLVWithData:(id)a3
{
  void *v5;
  char *v6;
  void *v7;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *v9;
  _BOOL4 v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  char *v18;
  void *specific;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  int v27;
  void *v28;
  const char *v30;
  const char *Name;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "TLVsWithData:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v18 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v20 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v20)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v24 = 45;
        if (isMetaClass)
          v24 = 43;
        v20(3, "%c[%{public}s %{public}s]:%i No TLV detected", v24, ClassName, Name, 58);
        v18 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v25 = dispatch_get_specific(v18);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v14 = (id)_NFSharedLogClient[(_QWORD)v25];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v26 = object_getClass(a1);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      *(_DWORD *)buf = 67109890;
      v33 = v27;
      v34 = 2082;
      v35 = object_getClassName(a1);
      v36 = 2082;
      v37 = sel_getName(a2);
      v38 = 1024;
      v39 = 58;
      v17 = "%c[%{public}s %{public}s]:%i No TLV detected";
      goto LABEL_27;
    }
LABEL_31:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    objc_msgSend(v5, "lastObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v7 >= 4)
    goto LABEL_31;
  v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v7);
  if (v8)
  {
    v9 = object_getClass(a1);
    v10 = class_isMetaClass(v9);
    v11 = object_getClassName(a1);
    v30 = sel_getName(a2);
    v12 = 45;
    if (v10)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i More than one TLV detected", v12, v11, v30, 63);
    v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v13 = dispatch_get_specific(v6);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v14 = (id)_NFSharedLogClient[(_QWORD)v13];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    goto LABEL_28;
  v15 = object_getClass(a1);
  if (class_isMetaClass(v15))
    v16 = 43;
  else
    v16 = 45;
  *(_DWORD *)buf = 67109890;
  v33 = v16;
  v34 = 2082;
  v35 = object_getClassName(a1);
  v36 = 2082;
  v37 = sel_getName(a2);
  v38 = 1024;
  v39 = 63;
  v17 = "%c[%{public}s %{public}s]:%i More than one TLV detected";
LABEL_27:
  _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
LABEL_28:

  v28 = 0;
LABEL_30:

  return v28;
}

+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "tag") == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[NFTLV simpleTLVsWithData:](NFTLV, "simpleTLVsWithData:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "tag") == a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_opt_new();
  *(_DWORD *)(v7 + 8) = a3;
  objc_storeStrong((id *)(v7 + 24), a4);
  *(_QWORD *)(v7 + 32) = 8;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        *(_QWORD *)(v7 + 32) += *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++) + 32);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return (id)v7;
}

+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = a4;
  v6 = objc_opt_new();
  *(_DWORD *)(v6 + 8) = a3;
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;
  v8 = v5;

  v9 = objc_msgSend(v8, "length");
  *(_QWORD *)(v6 + 32) = v9 + 8;
  return (id)v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v8, 1);
  +[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int16 v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v8, 2);
  +[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v8, 4);
  +[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  NSArray *children;
  id v4;
  void *v5;
  void *v6;
  uint64_t tag;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  children = self->_children;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = v4;
  if (children)
  {
    v16.receiver = self;
    v16.super_class = (Class)NFTLV;
    -[NFTLV description](&v16, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    tag = self->_tag;
    -[NFTLV children](self, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@ %02x : %@"), v6, tag, v8, v13);
  }
  else
  {
    v6 = (void *)objc_msgSend(v4, "initWithData:encoding:", self->_value, 1);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v6)
    {
      v15.receiver = self;
      v15.super_class = (Class)NFTLV;
      -[NFTLV description](&v15, sel_description);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %02x = %@ \"%@\"), v8, self->_tag, self->_value, v6);
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)NFTLV;
      -[NFTLV description](&v14, sel_description);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@ %02x = %@"), v8, self->_tag, self->_value, v13);
    }
  }
  v11 = (void *)v9;

  return v11;
}

- (unsigned)tag
{
  return self->_tag;
}

- (NSData)value
{
  return self->_value;
}

- (id)valueAsString
{
  void *v2;

  if (self->_value)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_value, 1);
  else
    v2 = 0;
  return v2;
}

- (id)valueAsHexString
{
  return -[NSData NF_asHexString](self->_value, "NF_asHexString");
}

- (unsigned)valueAsUnsignedLong
{
  NSData *value;
  char *v5;
  void *specific;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  NSData *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned int v22;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSData *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 5)
  {
    v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v7)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 166, self->_value);
      v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v14 = (id)_NFSharedLogClient[(_QWORD)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 2082;
      v29 = v18;
      v30 = 1024;
      v31 = 166;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v21 = 0;
  v22 = 0;
  do
    v22 = v20[v21++] | (v22 << 8);
  while (-[NSData length](self->_value, "length") > v21);
  return v22;
}

- (unsigned)valueAsUnsignedShort
{
  NSData *value;
  char *v5;
  void *specific;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  NSData *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned __int16 v22;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSData *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 3)
  {
    v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v7)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 183, self->_value);
      v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v14 = (id)_NFSharedLogClient[(_QWORD)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 2082;
      v29 = v18;
      v30 = 1024;
      v31 = 183;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v21 = 0;
  v22 = 0;
  do
    v22 = v20[v21++] | (unsigned __int16)(v22 << 8);
  while (-[NSData length](self->_value, "length") > v21);
  return v22;
}

- (unint64_t)valueAsUnsignedLongLong
{
  NSData *value;
  char *v5;
  void *specific;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  NSData *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSData *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  value = self->_value;
  if (!value)
    return 0;
  if (-[NSData length](value, "length") >= 9)
  {
    v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v7)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 201, self->_value);
      v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v14 = (id)_NFSharedLogClient[(_QWORD)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(self);
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(self);
      v18 = sel_getName(a2);
      v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      v25 = v16;
      v26 = 2082;
      v27 = v17;
      v28 = 2082;
      v29 = v18;
      v30 = 1024;
      v31 = 201;
      v32 = 2114;
      v33 = v19;
      _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = -[NSData bytes](self->_value, "bytes");
  if (!-[NSData length](self->_value, "length"))
    return 0;
  v21 = 0;
  v22 = 0;
  do
    v22 = v20[v21++] | (v22 << 8);
  while (-[NSData length](self->_value, "length") > v21);
  return v22;
}

- (NSArray)children
{
  return self->_children;
}

- (id)childrenWithTag:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NFTLV children](self, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "tag") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)childWithTag:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NFTLV children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "tag") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_intToData:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  char v9;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4);
  v5 = v4;
  v9 = 0;
  if (a3)
  {
    v6 = 4;
    if (HIBYTE(a3))
      goto LABEL_12;
    do
    {
      v7 = HIWORD(a3);
      a3 <<= 8;
      --v6;
    }
    while (!v7 && v6);
    if (v6)
    {
LABEL_12:
      do
      {
        v9 = HIBYTE(a3);
        objc_msgSend(v5, "appendBytes:length:", &v9, 1);
        a3 <<= 8;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(v4, "appendBytes:length:", &v9, 1);
  }
  return v5;
}

- (id)asMutableData
{
  void *v3;
  void *v4;
  NSData *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", self->_worseCaseSizeAsData);
  +[NFTLV _intToData:](NFTLV, "_intToData:", self->_tag);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  v5 = self->_value;
  if (!v5)
  {
    if (self->_children)
    {
      v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", self->_worseCaseSizeAsData);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v6 = self->_children;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "asData");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSData appendData:](v5, "appendData:", v11);

          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v8);
      }

    }
    else
    {
      v5 = 0;
    }
  }
  v12 = -[NSData length](v5, "length");
  +[NFTLV _intToData:](NFTLV, "_intToData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 >= 0x80)
  {
    v16 = objc_msgSend(v13, "length") | 0x80;
    objc_msgSend(v3, "appendBytes:length:", &v16, 1);
  }
  objc_msgSend(v3, "appendData:", v14);
  if (v5)
    objc_msgSend(v3, "appendData:", v5);

  return v3;
}

+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5 definite:(BOOL)a6
{
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  char v15;
  char v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  char *v21;
  void *v22;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  int v35;
  int v36;
  char *v37;
  void *v38;
  void (*v39)(uint64_t, const char *, ...);
  objc_class *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  int v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  int v55;
  const char *v56;
  void *v57;
  char *v58;
  void *v59;
  void (*v60)(uint64_t, const char *, ...);
  objc_class *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  objc_class *v65;
  int v66;
  const char *v67;
  const char *v68;
  void *v69;
  char *v70;
  void *v71;
  void (*v72)(uint64_t, const char *, ...);
  objc_class *v73;
  _BOOL4 v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  objc_class *v79;
  int v80;
  const char *v81;
  const char *v82;
  const char *v83;
  NSObject *v84;
  uint32_t v85;
  char *v86;
  void *v87;
  void (*v88)(uint64_t, const char *, ...);
  objc_class *v89;
  _BOOL4 v90;
  uint64_t v91;
  void *v92;
  objc_class *v93;
  int v94;
  const char *v95;
  const char *v96;
  char *v97;
  void *v98;
  void (*v99)(uint64_t, const char *, ...);
  objc_class *v100;
  _BOOL4 v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  objc_class *v105;
  int v106;
  const char *v107;
  const char *v108;
  char *v109;
  void *v110;
  void (*v111)(uint64_t, const char *, ...);
  objc_class *v112;
  _BOOL4 v113;
  const char *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  objc_class *v118;
  int v119;
  const char *v120;
  const char *v121;
  int64_t v122;
  const char *v123;
  char *v124;
  void *specific;
  void (*v126)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v129;
  void *v130;
  objc_class *v131;
  int v132;
  const char *v133;
  const char *v134;
  char *v135;
  void *v136;
  void (*v137)(uint64_t, const char *, ...);
  objc_class *v138;
  _BOOL4 v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  objc_class *v143;
  int v144;
  const char *v145;
  const char *v146;
  id v147;
  char *v148;
  void *v149;
  void (*v150)(uint64_t, const char *, ...);
  objc_class *v151;
  _BOOL4 v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  objc_class *v156;
  int v157;
  const char *v158;
  const char *v159;
  char *v161;
  void *v162;
  void (*v163)(uint64_t, const char *, ...);
  objc_class *v164;
  _BOOL4 v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  NSObject *v169;
  objc_class *v170;
  int v171;
  const char *v172;
  const char *v173;
  const char *v174;
  const char *v175;
  const char *v176;
  const char *ClassName;
  const char *v178;
  const char *v179;
  const char *v180;
  const char *v181;
  const char *v182;
  const char *v183;
  const char *Name;
  const char *v185;
  const char *v186;
  const char *v187;
  _BOOL4 v188;
  int v189;
  void *v190;
  const char *v191;
  _BOOL4 v192;
  _BOOL4 v193;
  uint8_t buf[4];
  int v196;
  __int16 v197;
  const char *v198;
  __int16 v199;
  const char *v200;
  __int16 v201;
  int v202;
  __int16 v203;
  int v204;
  __int16 v205;
  int v206;
  __int16 v207;
  int64_t v208;
  __int16 v209;
  const char *v210;
  uint64_t v211;

  v192 = a6;
  v193 = a5;
  v211 = *MEMORY[0x1E0C80C00];
  v191 = *a3;
  v9 = (void *)objc_opt_new();
  v10 = *a3;
  if (*a3 < a4)
  {
    while (1)
    {
      v11 = v10 + 1;
      *a3 = v10 + 1;
      v12 = *(unsigned __int8 *)v10;
      if (v193)
      {
        if (v11 >= a4)
        {
          v124 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)specific >= 4)
            goto LABEL_184;
          v126 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
          if (v126)
          {
            Class = object_getClass(a1);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName(a2);
            v129 = 45;
            if (isMetaClass)
              v129 = 43;
            v126(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v129, ClassName, Name, 321, v12);
            v124 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v130 = dispatch_get_specific(v124);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v78 = (id)_NFSharedLogClient[(_QWORD)v130];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v131 = object_getClass(a1);
            if (class_isMetaClass(v131))
              v132 = 43;
            else
              v132 = 45;
            v133 = object_getClassName(a1);
            v134 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v196 = v132;
            v197 = 2082;
            v198 = v133;
            v199 = 2082;
            v200 = v134;
            v201 = 1024;
            v202 = 321;
            v203 = 1024;
            v204 = v12;
            v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
            goto LABEL_152;
          }
          goto LABEL_154;
        }
        v13 = v10 + 2;
        *a3 = v10 + 2;
        v14 = *((unsigned __int8 *)v10 + 1);
        if ((_DWORD)v14 != 255)
          goto LABEL_9;
        LODWORD(v14) = 0;
        v15 = 1;
        do
        {
          if (v13 >= a4)
          {
            v86 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v87 >= 4)
              goto LABEL_184;
            v88 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v87);
            if (v88)
            {
              v89 = object_getClass(a1);
              v90 = class_isMetaClass(v89);
              v176 = object_getClassName(a1);
              v182 = sel_getName(a2);
              v91 = 45;
              if (v90)
                v91 = 43;
              v88(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v91, v176, v182, 327, v12);
              v86 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v92 = dispatch_get_specific(v86);
            if (NFSharedLogInitialize_onceToken != -1)
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            v78 = (id)_NFSharedLogClient[(_QWORD)v92];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              v93 = object_getClass(a1);
              if (class_isMetaClass(v93))
                v94 = 43;
              else
                v94 = 45;
              v95 = object_getClassName(a1);
              v96 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v196 = v94;
              v197 = 2082;
              v198 = v95;
              v199 = 2082;
              v200 = v96;
              v201 = 1024;
              v202 = 327;
              v203 = 1024;
              v204 = v12;
              v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
              goto LABEL_152;
            }
            goto LABEL_154;
          }
          v16 = v15;
          v15 = 0;
          v17 = v13 + 1;
          *a3 = v13 + 1;
          v14 = *(unsigned __int8 *)v13++ | ((_DWORD)v14 << 8);
        }
        while ((v16 & 1) != 0);
        v13 = v17;
LABEL_9:
        v18 = v12;
        if ((_DWORD)v12)
          goto LABEL_48;
LABEL_34:
        if ((_DWORD)v14)
        {
          v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v38 < 4)
          {
            v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v38);
            if (v39)
            {
              v40 = object_getClass(a1);
              v41 = class_isMetaClass(v40);
              v174 = object_getClassName(a1);
              v179 = sel_getName(a2);
              v42 = 45;
              if (v41)
                v42 = 43;
              v39(4, "%c[%{public}s %{public}s]:%i Unexpected %u len on tag 0", v42, v174, v179, 385, v14);
              v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v43 = dispatch_get_specific(v37);
            if (NFSharedLogInitialize_onceToken != -1)
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            v44 = (id)_NFSharedLogClient[(_QWORD)v43];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = object_getClass(a1);
              if (class_isMetaClass(v45))
                v46 = 43;
              else
                v46 = 45;
              v47 = object_getClassName(a1);
              v48 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              v196 = v46;
              v197 = 2082;
              v198 = v47;
              v199 = 2082;
              v200 = v48;
              v201 = 1024;
              v202 = 385;
              v203 = 1024;
              v204 = v14;
              _os_log_impl(&dword_1C34DB000, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected %u len on tag 0", buf, 0x28u);
            }

            v18 = 0;
            v13 = *a3;
            goto LABEL_48;
          }
LABEL_184:
          __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
        }
        goto LABEL_156;
      }
      if ((~(_DWORD)v12 & 0x1F) == 0)
      {
        v19 = 1;
        v20 = *(unsigned __int8 *)v10;
        while (1)
        {
          if (v19 >= 5)
          {
            v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v22 >= 4)
              goto LABEL_184;
            v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v22);
            if (v23)
            {
              v24 = object_getClass(a1);
              v25 = class_isMetaClass(v24);
              v26 = object_getClassName(a1);
              v178 = sel_getName(a2);
              v27 = 45;
              if (v25)
                v27 = 43;
              v23(3, "%c[%{public}s %{public}s]:%i Tag value overflows", v27, v26, v178, 342);
              v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v28 = dispatch_get_specific(v21);
            if (NFSharedLogInitialize_onceToken != -1)
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            v29 = (id)_NFSharedLogClient[(_QWORD)v28];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = object_getClass(a1);
              if (class_isMetaClass(v30))
                v31 = 43;
              else
                v31 = 45;
              v32 = object_getClassName(a1);
              v33 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v196 = v31;
              v197 = 2082;
              v198 = v32;
              v199 = 2082;
              v200 = v33;
              v201 = 1024;
              v202 = 342;
              _os_log_impl(&dword_1C34DB000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag value overflows", buf, 0x22u);
            }

            v11 = *a3;
          }
          if (v11 >= a4)
            break;
          v34 = v11 + 1;
          *a3 = v11 + 1;
          v35 = *v11;
          v18 = *(unsigned __int8 *)v11 | (v20 << 8);
          ++v19;
          ++v11;
          v20 = v18;
          if ((v35 & 0x80000000) == 0)
            goto LABEL_31;
        }
        v70 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v71 >= 4)
          goto LABEL_184;
        v72 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v71);
        if (v72)
        {
          v73 = object_getClass(a1);
          v74 = class_isMetaClass(v73);
          v75 = object_getClassName(a1);
          v181 = sel_getName(a2);
          v76 = 45;
          if (v74)
            v76 = 43;
          v72(3, "%c[%{public}s %{public}s]:%i Underflow", v76, v75, v181, 344);
          v70 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v77 = dispatch_get_specific(v70);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v78 = (id)_NFSharedLogClient[(_QWORD)v77];
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          goto LABEL_154;
        v79 = object_getClass(a1);
        if (class_isMetaClass(v79))
          v80 = 43;
        else
          v80 = 45;
        v81 = object_getClassName(a1);
        v82 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v196 = v80;
        v197 = 2082;
        v198 = v81;
        v199 = 2082;
        v200 = v82;
        v201 = 1024;
        v202 = 344;
        v83 = "%c[%{public}s %{public}s]:%i Underflow";
LABEL_90:
        v84 = v78;
        v85 = 34;
        goto LABEL_153;
      }
      v34 = v10 + 1;
      v18 = v12;
LABEL_31:
      if (v34 >= a4)
        break;
      v13 = v34 + 1;
      *a3 = v34 + 1;
      v36 = *v34;
      v14 = v36;
      if (v36 < 0)
      {
        v55 = v36 & 0x7F;
        if ((v14 & 0x7F) != 0)
        {
          LODWORD(v14) = 0;
          while (v13 < a4)
          {
            v56 = v13 + 1;
            *a3 = v13 + 1;
            v14 = *(unsigned __int8 *)v13++ | ((_DWORD)v14 << 8);
            if (!--v55)
            {
              v13 = v56;
              if (!(_DWORD)v18)
                goto LABEL_34;
              goto LABEL_48;
            }
          }
          v97 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v98 >= 4)
            goto LABEL_184;
          v99 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v98);
          if (v99)
          {
            v100 = object_getClass(a1);
            v101 = class_isMetaClass(v100);
            v102 = object_getClassName(a1);
            v183 = sel_getName(a2);
            v103 = 45;
            if (v101)
              v103 = 43;
            v99(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v103, v102, v183, 367, v18);
            v97 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v104 = dispatch_get_specific(v97);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v78 = (id)_NFSharedLogClient[(_QWORD)v104];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v105 = object_getClass(a1);
            if (class_isMetaClass(v105))
              v106 = 43;
            else
              v106 = 45;
            v107 = object_getClassName(a1);
            v108 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v196 = v106;
            v197 = 2082;
            v198 = v107;
            v199 = 2082;
            v200 = v108;
            v201 = 1024;
            v202 = 367;
            v203 = 1024;
            v204 = v18;
            v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
            goto LABEL_152;
          }
          goto LABEL_154;
        }
        if ((_DWORD)v18)
        {
          v14 = 0;
          goto LABEL_48;
        }
        goto LABEL_156;
      }
      if (!(_DWORD)v18)
        goto LABEL_34;
LABEL_48:
      if (a4 - v13 < v14)
      {
        v109 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v110 >= 4)
          goto LABEL_184;
        v111 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v110);
        if (v111)
        {
          v112 = object_getClass(a1);
          v113 = class_isMetaClass(v112);
          v114 = object_getClassName(a1);
          v115 = sel_getName(a2);
          v116 = 43;
          if (!v113)
            v116 = 45;
          v111(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x len=%u have=%lu offset=%lu", v116, v114, v115, 390, v18, v14, a4 - *a3, *a3 - v191);
          v109 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v117 = dispatch_get_specific(v109);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v78 = (id)_NFSharedLogClient[(_QWORD)v117];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v118 = object_getClass(a1);
          if (class_isMetaClass(v118))
            v119 = 43;
          else
            v119 = 45;
          v120 = object_getClassName(a1);
          v121 = sel_getName(a2);
          v122 = a4 - *a3;
          v123 = (const char *)(*a3 - v191);
          *(_DWORD *)buf = 67110914;
          v196 = v119;
          v197 = 2082;
          v198 = v120;
          v199 = 2082;
          v200 = v121;
          v201 = 1024;
          v202 = 390;
          v203 = 1024;
          v204 = v18;
          v205 = 1024;
          v206 = v14;
          v207 = 2048;
          v208 = v122;
          v209 = 2048;
          v210 = v123;
          v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x len=%u have=%lu offset=%lu";
          v84 = v78;
          v85 = 66;
          goto LABEL_153;
        }
        goto LABEL_154;
      }
      v49 = v14;
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *a3, v14);
      if ((v12 & 0x20) != 0)
      {
        objc_msgSend(a1, "_parseTLVs:end:simple:definite:", a3, &(*a3)[v49], v193, v192);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "count"))
        {
          +[NFTLV TLVWithTag:children:](NFTLV, "TLVWithTag:children:", v18, v52);
          v53 = objc_claimAutoreleasedReturnValue();
          if (!v53)
          {
            v161 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            v162 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v162 >= 4)
              goto LABEL_184;
            v163 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v162);
            if (v163)
            {
              v164 = object_getClass(a1);
              v165 = class_isMetaClass(v164);
              v166 = object_getClassName(a1);
              v187 = sel_getName(a2);
              v167 = 45;
              if (v165)
                v167 = 43;
              v163(3, "%c[%{public}s %{public}s]:%i [NFTLV TLVWithTag:children:] failed!", v167, v166, v187, 410);
              v161 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v168 = dispatch_get_specific(v161);
            if (NFSharedLogInitialize_onceToken != -1)
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            v169 = (id)_NFSharedLogClient[(_QWORD)v168];
            if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
            {
              v170 = object_getClass(a1);
              if (class_isMetaClass(v170))
                v171 = 43;
              else
                v171 = 45;
              v172 = object_getClassName(a1);
              v173 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              v196 = v171;
              v197 = 2082;
              v198 = v172;
              v199 = 2082;
              v200 = v173;
              v201 = 1024;
              v202 = 410;
              _os_log_impl(&dword_1C34DB000, v169, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i [NFTLV TLVWithTag:children:] failed!", buf, 0x22u);
            }

            goto LABEL_155;
          }
          v54 = (void *)v53;
          objc_storeStrong((id *)(v53 + 16), v50);
          objc_msgSend(v9, "addObject:", v54);

        }
        else
        {
          v190 = v52;
          v57 = v9;
          v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v59 >= 4)
            goto LABEL_184;
          v60 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v59);
          if (v60)
          {
            v61 = object_getClass(a1);
            v188 = class_isMetaClass(v61);
            v175 = object_getClassName(a1);
            v180 = sel_getName(a2);
            v62 = 45;
            if (v188)
              v62 = 43;
            v60(4, "%c[%{public}s %{public}s]:%i Failed to recurse children of constructed (?) tag 0x%x, returning as simple", v62, v175, v180, 404, v18);
            v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v63 = dispatch_get_specific(v58);
          v9 = v57;
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v64 = (id)_NFSharedLogClient[(_QWORD)v63];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = object_getClass(a1);
            if (class_isMetaClass(v65))
              v66 = 43;
            else
              v66 = 45;
            v189 = v66;
            v67 = object_getClassName(a1);
            v68 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            v196 = v189;
            v197 = 2082;
            v198 = v67;
            v9 = v57;
            v199 = 2082;
            v200 = v68;
            v201 = 1024;
            v202 = 404;
            v203 = 1024;
            v204 = v18;
            _os_log_impl(&dword_1C34DB000, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to recurse children of constructed (?) tag 0x%x, returning as simple", buf, 0x28u);
          }

          +[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", v18, v50);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v69);

          *a3 = &v13[v49];
          v52 = v190;
        }

      }
      else
      {
        +[NFTLV TLVWithTag:value:](NFTLV, "TLVWithTag:value:", v18, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v51);

        *a3 += v49;
      }

      v10 = *a3;
      if (*a3 >= a4)
        goto LABEL_169;
    }
    if ((_DWORD)v18)
    {
      v135 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v136 >= 4)
        goto LABEL_184;
      v137 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v136);
      if (v137)
      {
        v138 = object_getClass(a1);
        v139 = class_isMetaClass(v138);
        v140 = object_getClassName(a1);
        v185 = sel_getName(a2);
        v141 = 45;
        if (v139)
          v141 = 43;
        v137(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v141, v140, v185, 356, v18);
        v135 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v142 = dispatch_get_specific(v135);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v78 = (id)_NFSharedLogClient[(_QWORD)v142];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        v143 = object_getClass(a1);
        if (class_isMetaClass(v143))
          v144 = 43;
        else
          v144 = 45;
        v145 = object_getClassName(a1);
        v146 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v196 = v144;
        v197 = 2082;
        v198 = v145;
        v199 = 2082;
        v200 = v146;
        v201 = 1024;
        v202 = 356;
        v203 = 1024;
        v204 = v18;
        v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
LABEL_152:
        v84 = v78;
        v85 = 40;
LABEL_153:
        _os_log_impl(&dword_1C34DB000, v84, OS_LOG_TYPE_ERROR, v83, buf, v85);
      }
LABEL_154:

LABEL_155:
      v147 = 0;
      goto LABEL_170;
    }
LABEL_156:
    if (v192)
    {
      v148 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v149 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v149 >= 4)
        goto LABEL_184;
      v150 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v149);
      if (v150)
      {
        v151 = object_getClass(a1);
        v152 = class_isMetaClass(v151);
        v153 = object_getClassName(a1);
        v186 = sel_getName(a2);
        v154 = 45;
        if (v152)
          v154 = 43;
        v150(3, "%c[%{public}s %{public}s]:%i Require definite encoding, but got zero tag and len", v154, v153, v186, 380);
        v148 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v155 = dispatch_get_specific(v148);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v78 = (id)_NFSharedLogClient[(_QWORD)v155];
      if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        goto LABEL_154;
      v156 = object_getClass(a1);
      if (class_isMetaClass(v156))
        v157 = 43;
      else
        v157 = 45;
      v158 = object_getClassName(a1);
      v159 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v196 = v157;
      v197 = 2082;
      v198 = v158;
      v199 = 2082;
      v200 = v159;
      v201 = 1024;
      v202 = 380;
      v83 = "%c[%{public}s %{public}s]:%i Require definite encoding, but got zero tag and len";
      goto LABEL_90;
    }
  }
LABEL_169:
  v147 = v9;
LABEL_170:

  return v147;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
