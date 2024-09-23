@implementation SATurnstileInfo

- (SATurnstileInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SATurnstileInfo;
  return (SATurnstileInfo *)-[SABlockingInfo _init](&v3, sel__init);
}

- (SATurnstileInfo)initWithKCDataTurnstileInfo:(const stackshot_thread_turnstileinfo_v2 *)a3
{
  SATurnstileInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SATurnstileInfo;
  result = -[SABlockingInfo _init](&v5, sel__init);
  if (result)
  {
    result->_context = a3->turnstile_context;
    result->_priority = a3->turnstile_priority;
    result->_numHops = a3->number_of_hops;
    result->_flags = a3->turnstile_flags;
  }
  return result;
}

+ (id)turnstileInfoWithKCDataTurnstileInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:
{
  id v9;
  objc_class *v10;
  SATurnstileInfoWithPortLabel *v11;
  id v12;
  id *v13;
  uint64_t v14;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (objc_class *)objc_opt_self();
  if (v9)
  {
    v11 = [SATurnstileInfoWithPortLabel alloc];
    v12 = v9;
    if (v11)
    {
      v20.receiver = v11;
      v20.super_class = (Class)SATurnstileInfoWithPortLabel;
      v13 = (id *)objc_msgSendSuper2(&v20, sel_initWithKCDataTurnstileInfo_, a2);
      v14 = (uint64_t)v13;
      if (v13)
      {
        objc_storeStrong(v13 + 4, a3);
        if (a4 >= 0x10000)
        {
          v16 = *__error();
          _sa_logt();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v22 = a4;
            _os_log_fault_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_FAULT, "port label flags 0x%llx is too large", buf, 0xCu);
          }

          *__error() = v16;
        }
        *(_WORD *)(v14 + 40) = a4;
        if (a5 >= 0x100)
        {
          v18 = *__error();
          _sa_logt();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v22 = a5;
            _os_log_fault_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_FAULT, "port label domain %llu is too large", buf, 0xCu);
          }

          *__error() = v18;
        }
        *(_BYTE *)(v14 + 42) = a5;
      }
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = objc_msgSend([v10 alloc], "initWithKCDataTurnstileInfo:", a2);
  }

  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  SATurnstileInfo *v4;
  SATurnstileInfo *v5;
  BOOL v6;

  v4 = (SATurnstileInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = self->_context == v5->_context
        && self->_priority == v5->_priority
        && self->_numHops == v5->_numHops
        && self->_flags == v5->_flags;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unint64_t context;
  unint64_t v6;
  unsigned int priority;
  unsigned int v8;
  unsigned int numHops;
  unsigned int v10;
  int64_t v11;
  unint64_t flags;
  unint64_t v13;

  v4 = a3;
  context = self->_context;
  v6 = v4[2];
  if (context > v6)
    goto LABEL_9;
  if (context < v6)
    goto LABEL_7;
  priority = self->_priority;
  v8 = *((unsigned __int8 *)v4 + 8);
  if (priority > v8)
    goto LABEL_9;
  if (priority < v8)
  {
LABEL_7:
    v11 = -1;
    goto LABEL_10;
  }
  numHops = self->_numHops;
  v10 = *((unsigned __int8 *)v4 + 9);
  if (numHops > v10)
    goto LABEL_9;
  if (numHops < v10)
    goto LABEL_7;
  flags = self->_flags;
  v13 = v4[3];
  if (flags > v13)
  {
LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  if (flags >= v13)
    v11 = 0;
  else
    v11 = -1;
LABEL_10:

  return v11;
}

- (uint64_t)matchesKCDataTurnstileInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v9 = a3;
  if (a1
    && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 8)
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 9) == *(unsigned __int8 *)(a2 + 17)
    && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 18)
    && objc_msgSend((id)a1, "portDomain") == a5
    && objc_msgSend((id)a1, "portFlags") == a4)
  {
    objc_msgSend((id)a1, "portName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 | v10)
    {
      objc_msgSend((id)a1, "portName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = 0;
      if (v9 && v11)
      {
        objc_msgSend((id)a1, "portName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v14, "isEqualToString:", v9);

      }
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_context ^ self->_priority ^ self->_numHops ^ self->_flags;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  unint64_t context;
  uint64_t priority;
  uint64_t numHops;
  unint64_t flags;
  void *v10;
  void *v11;

  -[SABlockingInfo portName](self, "portName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = v4;
  context = self->_context;
  priority = self->_priority;
  numHops = self->_numHops;
  flags = self->_flags;
  if (v3)
  {
    -[SABlockingInfo portName](self, "portName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("turnstile blocked on 0x%llx at priority %d, %d hops, 0x%llx flags, port name:%@, flags:0x%llx, domain:%llu"), context, priority, numHops, flags, v10, -[SABlockingInfo portFlags](self, "portFlags"), -[SABlockingInfo portDomain](self, "portDomain"));

  }
  else
  {
    v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("turnstile blocked on 0x%llx at priority %d, %d hops, 0x%llx flags"), context, priority, self->_numHops, flags);
  }
  return (NSString *)v11;
}

- (unint64_t)blockingTid
{
  if ((self->_flags & 8) != 0)
    return self->_context;
  else
    return 0;
}

- (int)blockingPid
{
  if ((self->_flags & 0x10) != 0)
    return self->_context;
  else
    return -1;
}

- (uint64_t)displaysSameContentAs:(uint64_t)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:
{
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;

  v7 = a2;
  v8 = v7;
  if (!a1)
    goto LABEL_27;
  if ((_BYTE *)a1 == v7)
    goto LABEL_15;
  if (!v7)
  {
    if ((a5 & 1) != 0)
      goto LABEL_27;
    v23 = *(_QWORD *)(a1 + 24);
    if ((v23 & 8) != 0 || (a5 & 2) != 0 && (v23 & 4) != 0)
      goto LABEL_27;
    objc_msgSend((id)a1, "portName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_27;
LABEL_15:
    v25 = 1;
    goto LABEL_28;
  }
  v9 = *(_QWORD *)(a1 + 24);
  v43 = *((_QWORD *)v7 + 3);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *((_QWORD *)v7 + 2);
  v12 = *(unsigned __int8 *)(a1 + 8);
  v40 = *(unsigned __int8 *)(a1 + 9);
  v41 = v7[8];
  v39 = v7[9];
  objc_msgSend((id)a1, "portName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v9;
  v42 = v12;
  if (!v13)
  {
    objc_msgSend(v8, "portName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      v38 = 0;
      v22 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  objc_msgSend((id)a1, "portName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_17;
  v15 = (void *)v14;
  objc_msgSend(v8, "portName");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

LABEL_17:
    v22 = 0;
    if (!v13)
      goto LABEL_20;
    goto LABEL_21;
  }
  v17 = (void *)v16;
  objc_msgSend((id)a1, "portName");
  v37 = v10;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "portName");
  v19 = a5;
  v20 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "isEqualToString:", v21);

  v11 = v20;
  a5 = v19;

  v10 = v37;
  if (!v13)
    goto LABEL_20;
LABEL_21:

  v26 = objc_msgSend((id)a1, "portFlags");
  v27 = objc_msgSend(v8, "portFlags");
  v28 = objc_msgSend((id)a1, "portDomain");
  v29 = objc_msgSend(v8, "portDomain");
  v25 = 0;
  if (v22 && v26 == v27 && v28 == v29)
  {
    v30 = *(_QWORD *)(a1 + 24);
    if ((v30 & 0xC) != 0 || (v8[24] & 0xC) != 0)
    {
      if (((v43 ^ v44) & 0xC) != 0)
      {
LABEL_27:
        v25 = 0;
        goto LABEL_28;
      }
      v32 = (v30 >> 2) & 1;
      v34 = v42 == v41 && v40 == v39;
      v35 = v10 == v11 && v34;
      if ((((a5 & 2) == 0) & v32) != 0)
        v25 = v34;
      else
        v25 = v35;
    }
    else
    {
      v25 = (a5 & 1) == 0 || v44 == v43;
    }
  }
LABEL_28:

  return v25;
}

- (uint64_t)_displaysContentForPid:(uint64_t)a3 tid:(int)a4 threadPriority:(char)a5 options:(_QWORD *)a6 displayString:(void *)a7 nameCallback:
{
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  if (!a1)
    goto LABEL_26;
  if ((a5 & 1) != 0)
    goto LABEL_5;
  objc_msgSend((id)a1, "portName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (v22 = *(_QWORD *)(a1 + 24), (v22 & 0x10) != 0) && (*(_BYTE *)(a1 + 19) & 0x80) == 0)
  {

    goto LABEL_5;
  }
  if ((v22 & 8) != 0 && *(_QWORD *)(a1 + 16))
  {
LABEL_5:
    if (!a6)
    {
LABEL_58:
      v23 = 1;
      goto LABEL_59;
    }
    v15 = (void *)objc_msgSend(CFSTR("turnstile"), "mutableCopy");
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 24);
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v15, "appendString:", CFSTR(" UNKNOWN"));
      v17 = *(_QWORD *)(a1 + 24);
    }
    if ((v17 & 2) != 0)
      objc_msgSend(v16, "appendString:", CFSTR(" LOCKED"));
    if (*(unsigned __int8 *)(a1 + 8) != a4)
      objc_msgSend(v16, "appendFormat:", CFSTR(" with priority %d"), *(unsigned __int8 *)(a1 + 8));
    if ((*(_BYTE *)(a1 + 24) & 0xDC) == 0)
    {
      objc_msgSend((id)a1, "portName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_52;
    }
    objc_msgSend(v16, "appendString:", CFSTR(" waiting for"));
    v19 = *(_QWORD *)(a1 + 24);
    if ((v19 & 8) != 0)
    {
      v20 = *(_QWORD *)(a1 + 16);
      if (!v20)
      {
        v21 = CFSTR(" unknown thread");
        goto LABEL_33;
      }
      if (v20 == a3)
      {
        v21 = CFSTR(" this thread");
LABEL_33:
        objc_msgSend(v16, "appendString:", v21);
        goto LABEL_36;
      }
      v13[2](v13, 0xFFFFFFFFLL, v20);
    }
    else
    {
      if ((v19 & 0x10) == 0)
      {
        if ((v19 & 4) != 0)
        {
          objc_msgSend(v16, "appendString:", CFSTR(" workqueue"));
          if ((a5 & 2) != 0)
            objc_msgSend(v16, "appendFormat:", CFSTR(" address 0x%llx"), *(_QWORD *)(a1 + 16));
        }
LABEL_36:
        v26 = *(_QWORD *)(a1 + 24);
        if ((v26 & 0x40) != 0)
        {
          v27 = CFSTR(" send port");
        }
        else
        {
          if ((v26 & 0x80) == 0)
            goto LABEL_41;
          v27 = CFSTR(" receive port");
        }
        objc_msgSend(v16, "appendString:", v27);
LABEL_41:
        objc_msgSend((id)a1, "portName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28 || objc_msgSend((id)a1, "portFlags"))
        {

LABEL_44:
          if ((*(_BYTE *)(a1 + 24) & 0xC0) == 0)
            objc_msgSend(v16, "appendString:", CFSTR(" port"));
          objc_msgSend((id)a1, "portName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {
            objc_msgSend((id)a1, "portName");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "appendFormat:", CFSTR(" name \"%@\"), v30);

          }
          if (objc_msgSend((id)a1, "portFlags"))
            objc_msgSend(v16, "appendFormat:", CFSTR(" flags 0x%llx"), objc_msgSend((id)a1, "portFlags"));
          if (objc_msgSend((id)a1, "portDomain"))
            objc_msgSend(v16, "appendFormat:", CFSTR(" in domain %llu"), objc_msgSend((id)a1, "portDomain"));
          goto LABEL_52;
        }
        if (objc_msgSend((id)a1, "portDomain"))
          goto LABEL_44;
LABEL_52:
        v31 = *(_QWORD *)(a1 + 24);
        if ((v31 & 0x20) != 0)
        {
          objc_msgSend(v16, "appendFormat:", CFSTR(" iplock held"));
          v31 = *(_QWORD *)(a1 + 24);
        }
        if (v31 >= 0x100)
        {
          v34 = *__error();
          _sa_logt();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            v36 = *(_QWORD *)(a1 + 24);
            *(_DWORD *)buf = 134217984;
            v38 = v36;
            _os_log_fault_impl(&dword_1B9BE0000, v35, OS_LOG_TYPE_FAULT, "Unknown turnstile flags 0x%llx", buf, 0xCu);
          }

          *__error() = v34;
          objc_msgSend(v16, "appendFormat:", CFSTR(" with unknown flags 0x%llx"), *(_QWORD *)(a1 + 24));
        }
        if (*(_BYTE *)(a1 + 9) != 1)
          objc_msgSend(v16, "appendFormat:", CFSTR(" after %d hops"), *(unsigned __int8 *)(a1 + 9));
        v32 = objc_retainAutorelease(v16);
        *a6 = v32;

        goto LABEL_58;
      }
      v24 = *(unsigned int *)(a1 + 16);
      if ((v24 & 0x80000000) != 0)
      {
        v21 = CFSTR(" unknown process");
        goto LABEL_33;
      }
      if ((_DWORD)v24 == a2)
      {
        v21 = CFSTR(" this process");
        goto LABEL_33;
      }
      v13[2](v13, v24, 0);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR(" %@"), v25);

    goto LABEL_36;
  }
LABEL_26:
  v23 = 0;
LABEL_59:

  return v23;
}

- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 threadPriority:(int)a5 options:(unint64_t)a6 nameCallback:(id)a7
{
  id v8;

  v8 = 0;
  -[SATurnstileInfo _displaysContentForPid:tid:threadPriority:options:displayString:nameCallback:]((uint64_t)self, a3, a4, a5, a6, &v8, a7);
  return v8;
}

- (unint64_t)context
{
  return self->_context;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)numHops
{
  return self->_numHops;
}

- (unint64_t)flags
{
  return self->_flags;
}

+ (id)classDictionaryKey
{
  return CFSTR("SATurnstileInfo");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  void *v9;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SATurnstileInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SATurnstileInfo debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = objc_msgSend(v13, "UTF8String");
      v24 = 2048;
      v25 = -[SATurnstileInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v26 = 2048;
      v27 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SATurnstileInfo debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SATurnstileInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5397, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 513;
  *(_QWORD *)(&a3->var1 + 1) = self->_context;
  BYTE2(a3->var2) = self->_priority;
  BYTE3(a3->var2) = self->_numHops;
  *(unint64_t *)((char *)&a3->var2 + 4) = self->_flags;
  -[SABlockingInfo portName](self, "portName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(&a3->var4 + 3) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  *(unint64_t *)((char *)&a3->var5 + 4) = -[SABlockingInfo portFlags](self, "portFlags");
  *(unint64_t *)((char *)&a3->var6 + 4) = -[SABlockingInfo portDomain](self, "portDomain");

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    -[SABlockingInfo portName](self, "portName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSelfToSerializationDictionary:", v7);

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SATurnstileInfoWithPortLabel *v6;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_17;
  if (a4 <= 0x13)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a4;
      v27 = 2048;
      v28 = 20;
      _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5427, "bufferLength %lu < serialized SATurnstileInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a4;
      v27 = 2048;
      v28 = 44;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5433, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATurnstileInfo version"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
LABEL_9:
    v6 = objc_alloc_init(SATurnstileInfo);
    goto LABEL_10;
  }
  if (a4 <= 0x2B)
    goto LABEL_14;
  if (*(_QWORD *)((char *)a3 + 20) == -1 && !*(_QWORD *)((char *)a3 + 28) && !*(_QWORD *)((char *)a3 + 36))
    goto LABEL_9;
  v6 = objc_alloc_init(SATurnstileInfoWithPortLabel);
  -[SATurnstileInfoWithPortLabel setPortFlags:](v6, "setPortFlags:", *(_QWORD *)((char *)a3 + 28));
  -[SATurnstileInfoWithPortLabel setPortDomain:](v6, "setPortDomain:", *(_QWORD *)((char *)a3 + 36));
LABEL_10:
  v6->super._context = *(_QWORD *)((char *)a3 + 2);
  v6->super._priority = *((_BYTE *)a3 + 10);
  v6->super._numHops = *((_BYTE *)a3 + 11);
  v6->super._flags = *(_QWORD *)((char *)a3 + 12);
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  SATurnstileInfo *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  const char *ClassName;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v42 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_20;
  if (a4 <= 0x13)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v44 = a4;
      v45 = 2048;
      v46 = 20;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5462, "bufferLength %lu < serialized SATurnstileInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u)
    goto LABEL_10;
  if (a4 <= 0x2B)
  {
LABEL_14:
    v24 = *__error();
    _sa_logt();
    self = (SATurnstileInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v44 = a4;
      v45 = 2048;
      v46 = 44;
      _os_log_error_impl(&dword_1B9BE0000, &self->super.super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5466, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    v31 = *__error();
    _sa_logt();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self);
      *(_DWORD *)buf = 136315138;
      v44 = (unint64_t)ClassName;
      _os_log_error_impl(&dword_1B9BE0000, v32, OS_LOG_TYPE_ERROR, "turnstile info with port info, but class is %s", buf, 0xCu);
    }

    *__error() = v31;
    v34 = object_getClassName(self);
    _SASetCrashLogMessage(5472, "turnstile info with port info, but class is %s", v35, v36, v37, v38, v39, v40, v34);
    _os_crash();
    __break(1u);
LABEL_20:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATurnstileInfo version"), 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  if (*(_QWORD *)((char *)a3 + 20) != -1 || *(_QWORD *)((char *)a3 + 28) || *(_QWORD *)((char *)a3 + 36))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = *(_QWORD *)((char *)a3 + 20);
      v13 = self;
      v14 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v42, v11, v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SATurnstileInfo setPortName:](v13, "setPortName:", v15);

      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_10:

}

@end
