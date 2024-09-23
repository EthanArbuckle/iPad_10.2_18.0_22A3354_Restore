@implementation NFCommandAPDU

- (unsigned)clss
{
  return self->_class;
}

- (unsigned)instruction
{
  return self->_instruction;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (unsigned)payloadLength
{
  return self->_payloadRange.length;
}

- (unsigned)lengthExpected
{
  return self->_lengthExpected;
}

- (const)payloadBytes
{
  return (const char *)(-[NSData bytes](self->_data, "bytes") + self->_payloadRange.location);
}

- (NSData)payload
{
  return -[NSData subdataWithRange:](self->_data, "subdataWithRange:", self->_payloadRange.location, self->_payloadRange.length);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)NFCommandAPDU;
  -[NFCommandAPDU description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData NF_asHexString](self->_data, "NF_asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { %@ }"), v4, v5);

  return v6;
}

- (NFCommandAPDU)initWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v5;
  NFCommandAPDU *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
  v6 = -[NFCommandAPDU initWithData:](self, "initWithData:", v5);

  return v6;
}

- (NFCommandAPDU)initWithData:(id)a3
{
  return -[NFCommandAPDU initWithData:uniformLengthCheck:](self, "initWithData:uniformLengthCheck:", a3, 1);
}

- (NFCommandAPDU)initWithData:(id)a3 uniformLengthCheck:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NFCommandAPDU *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NFCommandAPDU *v13;
  unsigned __int8 *v14;
  _BYTE *v15;
  int v16;
  _BOOL4 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  _BOOL4 v20;
  uint64_t v21;
  id v22;
  int v23;
  int v24;
  int v25;
  objc_super v27;

  v4 = a4;
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NFCommandAPDU;
  v7 = -[NFCommandAPDU init](&v27, sel_init);
  if (!v7)
    goto LABEL_36;
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");
  if ((unint64_t)objc_msgSend(v10, "length") >= 4)
  {
    v14 = (unsigned __int8 *)(v11 + v12);
    v7->_class = *(_BYTE *)v9;
    v7->_instruction = *(_BYTE *)(v9 + 1);
    v7->_p1 = *(_BYTE *)(v9 + 2);
    v15 = (_BYTE *)(v9 + 4);
    v7->_p2 = *(_BYTE *)(v9 + 3);
    if ((unsigned __int8 *)(v9 + 4) == v14)
      goto LABEL_36;
    v16 = *v15;
    v17 = *v15 == 0;
    if (*v15)
    {
      v18 = (unsigned __int8 *)(v9 + 5);
      v19 = *v15;
      goto LABEL_7;
    }
    v21 = v14 - v15;
    if (v21 == 1)
    {
      v17 = 0;
      v19 = 0;
      v18 = (unsigned __int8 *)(v9 + 5);
      v20 = 1;
    }
    else
    {
      if (v21 <= 2)
        goto LABEL_3;
      v18 = (unsigned __int8 *)(v9 + 7);
      v19 = __rev16(*(unsigned __int16 *)(v9 + 5));
      if (v19)
      {
LABEL_7:
        v20 = v16 != 0;
        if (v14 - v18 >= v19)
        {
          v22 = objc_retainAutorelease(v10);
          v7->_payloadRange.location = (NSUInteger)&v18[-objc_msgSend(v22, "bytes")];
          v7->_payloadRange.length = v19;
          objc_storeStrong((id *)&v7->_data, v22);
          v18 += v19;
        }
        else if (v14 - v18 > 0)
        {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
      v20 = 0;
      v17 = 1;
    }
LABEL_13:
    if (v18 == v14)
    {
      if (!v7->_data)
      {
        if (v17)
          v24 = 0x10000;
        else
          v24 = 256;
        if (v19)
          v24 = v19;
        v7->_lengthExpected = v24;
      }
    }
    else
    {
      if (v14 - v18 == 2)
      {
        if (v20 && v4)
          goto LABEL_3;
        v25 = *v18;
        v7->_lengthExpected = v25 << 8;
        if (v18[1] | (v25 << 8))
          v23 = v18[1] | (v25 << 8);
        else
          v23 = 0x10000;
      }
      else
      {
        if (v14 - v18 != 1 || v17 && v4)
          goto LABEL_3;
        v23 = *v18;
        if (!*v18)
          v23 = 256;
      }
      v7->_lengthExpected = v23;
      if (v7->_payloadRange.length && !v7->_data)
        goto LABEL_3;
    }
LABEL_36:
    v13 = v7;
    goto LABEL_37;
  }
LABEL_3:
  v13 = 0;
LABEL_37:

  return v13;
}

- (BOOL)isSelectCommand
{
  return !-[NFCommandAPDU clss](self, "clss") && -[NFCommandAPDU instruction](self, "instruction") == 164;
}

- (BOOL)isSecureMessaging
{
  unsigned __int8 v3;
  int v4;
  int v5;

  v3 = -[NFCommandAPDU clss](self, "clss");
  v4 = -[NFCommandAPDU clss](self, "clss");
  if ((v3 & 0x40) != 0)
    v5 = 32;
  else
    v5 = 12;
  return (v5 & v4) != 0;
}

- (BOOL)isSendCertificateCommand
{
  return -[NFCommandAPDU clss](self, "clss") == 128 && -[NFCommandAPDU instruction](self, "instruction") == 216;
}

- (BOOL)isGetVasDataCommand
{
  return -[NFCommandAPDU clss](self, "clss") == 128 && -[NFCommandAPDU instruction](self, "instruction") == 202;
}

- (BOOL)isGetMoreVasDataCommand
{
  return -[NFCommandAPDU clss](self, "clss") == 128 && -[NFCommandAPDU instruction](self, "instruction") == 192;
}

- (BOOL)isSelectByDFNameCommand
{
  return (-[NFCommandAPDU clss](self, "clss") & 0x80) == 0
      && -[NFCommandAPDU instruction](self, "instruction") == 164
      && -[NFCommandAPDU p1](self, "p1") == 4;
}

+ (id)buildAPDUHeaderWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 len:(unsigned int)a7 useExtendedLength:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v9;
  id v12;
  void *v13;
  char *v15;
  void *specific;
  void (*v17)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  int v24;
  const char *v25;
  const char *v26;
  char *v27;
  void *v28;
  void (*v29)(uint64_t, const char *, ...);
  objc_class *v30;
  _BOOL4 v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  int v37;
  const char *v38;
  const char *v39;
  const char *ClassName;
  const char *Name;
  const char *v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  v57 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v44 = a5;
  v43 = a6;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", a7 + 9);
  objc_msgSend(v12, "appendBytes:length:", &v46, 1);
  objc_msgSend(v12, "appendBytes:length:", &v45, 1);
  objc_msgSend(v12, "appendBytes:length:", &v44, 1);
  objc_msgSend(v12, "appendBytes:length:", &v43, 1);
  if (!(_DWORD)v9 && !v8)
    goto LABEL_10;
  if (v9 <= 0xFF && !v8)
  {
LABEL_9:
    buf[0] = v9;
    objc_msgSend(v12, "appendBytes:length:", buf, 1);
LABEL_10:
    v12 = v12;
    v13 = v12;
    goto LABEL_11;
  }
  if (!WORD1(v9) && !v8)
  {
    buf[0] = 0;
LABEL_8:
    objc_msgSend(v12, "appendBytes:length:", buf, 1);
    buf[0] = BYTE1(v9);
    objc_msgSend(v12, "appendBytes:length:", buf, 1);
    goto LABEL_9;
  }
  if (BYTE3(v9))
  {
    v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v17 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v17)
      {
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v20 = 45;
        if (isMetaClass)
          v20 = 43;
        v17(3, "%c[%{public}s %{public}s]:%i Unsupported length 0x%X", v20, ClassName, Name, 287, v9);
        v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v21 = dispatch_get_specific(v15);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v22 = (id)_NFSharedLogClient[(_QWORD)v21];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = object_getClass(a1);
        if (class_isMetaClass(v23))
          v24 = 43;
        else
          v24 = 45;
        v25 = object_getClassName(a1);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v48 = v24;
        v49 = 2082;
        v50 = v25;
        v51 = 2082;
        v52 = v26;
        v53 = 1024;
        v54 = 287;
        v55 = 1024;
        v56 = v9;
        _os_log_impl(&dword_1C34DB000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported length 0x%X", buf, 0x28u);
      }

      v12 = 0;
      goto LABEL_10;
    }
    goto LABEL_41;
  }
  if (v8)
  {
    buf[0] = BYTE2(v9);
    goto LABEL_8;
  }
  v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v28 >= 4)
LABEL_41:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v29 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v28);
  if (v29)
  {
    v30 = object_getClass(a1);
    v31 = class_isMetaClass(v30);
    v32 = object_getClassName(a1);
    v42 = sel_getName(a2);
    v33 = 45;
    if (v31)
      v33 = 43;
    v29(3, "%c[%{public}s %{public}s]:%i Unexpected length did you mean to use extended length ?", v33, v32, v42, 275);
    v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v34 = dispatch_get_specific(v27);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v35 = (id)_NFSharedLogClient[(_QWORD)v34];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = object_getClass(a1);
    if (class_isMetaClass(v36))
      v37 = 43;
    else
      v37 = 45;
    v38 = object_getClassName(a1);
    v39 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v48 = v37;
    v49 = 2082;
    v50 = v38;
    v51 = 2082;
    v52 = v39;
    v53 = 1024;
    v54 = 275;
    _os_log_impl(&dword_1C34DB000, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected length did you mean to use extended length ?", buf, 0x22u);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)appendExpectedLength:(unsigned __int16)a3 usingExtendedLength:(BOOL)a4 toAPDU:(id)a5
{
  unsigned int v6;
  id v9;
  void *v10;
  char *v11;
  void *specific;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *Name;
  _QWORD v31[4];
  _QWORD v32[4];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = v9;
  if (v6 < 0x100 || a4)
  {
    if (a4)
    {
      buf[0] = BYTE1(v6);
      objc_msgSend(v9, "appendBytes:length:", buf, 1);
    }
    buf[0] = v6;
    objc_msgSend(v10, "appendBytes:length:", buf, 1);
    v28 = 0;
  }
  else
  {
    v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v13 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v13)
    {
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Expected length is too large.", v17, ClassName, Name, 299);
      v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v18 = dispatch_get_specific(v11);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v19 = (id)_NFSharedLogClient[(_QWORD)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67109890;
      v34 = v21;
      v35 = 2082;
      v36 = object_getClassName(a1);
      v37 = 2082;
      v38 = sel_getName(a2);
      v39 = 1024;
      v40 = 299;
      _os_log_impl(&dword_1C34DB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Expected length is too large.", buf, 0x22u);
    }

    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    v32[1] = &unk_1E7D88598;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v32[2] = v25;
    v31[3] = *MEMORY[0x1E0CB2938];
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 300);
    v32[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 10, v27);

  }
  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
