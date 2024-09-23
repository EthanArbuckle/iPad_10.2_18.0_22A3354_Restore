@implementation NFResponseAPDU

+ (id)responseWithData:(id)a3
{
  id v3;
  NFResponseAPDU *v4;

  v3 = a3;
  v4 = -[NFResponseAPDU initWithData:]([NFResponseAPDU alloc], "initWithData:", v3);

  return v4;
}

- (NFResponseAPDU)initWithData:(id)a3
{
  id v4;
  NFResponseAPDU *v5;
  int v6;
  int v7;
  NSData *v8;
  NSData *data;
  __int16 v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NFResponseAPDU;
  v5 = -[NFResponseAPDU init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    v6 = objc_msgSend(v4, "length");
    if ((v6 & 0xFFFFFFFE) != 0)
    {
      v7 = v6;
      objc_msgSend(v4, "getBytes:range:", (char *)&v11 + 1, (v6 - 2), 1);
      objc_msgSend(v4, "getBytes:range:", &v11, (v7 - 1), 1);
      v5->_status = v11 | (HIBYTE(v11) << 8);
      if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
        v8 = (NSData *)v4;
      else
        v8 = (NSData *)objc_msgSend(v4, "copy");
      data = v5->_data;
      v5->_data = v8;

    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSData)response
{
  return -[NSData subdataWithRange:](self->_data, "subdataWithRange:", 0, -[NSData length](self->_data, "length") - 2);
}

- (unsigned)decodeUnderlyingAppletError:(id *)a3
{
  unsigned __int16 status;
  uint64_t v7;
  NSObject *v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  NSData *data;
  unsigned __int8 v24;
  __int16 v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  NSData *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  status = self->_status;
  v24 = 0;
  if (-[NSData length](self->_data, "length") >= 9 && (self->_status & 0xFFF0) == 0x69F0)
  {
    v25 = 0;
    -[NSData getBytes:range:](self->_data, "getBytes:range:", (char *)&v25 + 1, -[NSData length](self->_data, "length") - 4, 1);
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v25, -[NSData length](self->_data, "length") - 3, 1);
    status = v25 | (HIBYTE(v25) << 8);
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v24, 0, 1);
    if (v24 - 4 > 0xC || (v7 = v24 + 5, v7 != -[NSData length](self->_data, "length")))
    {
      v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v11)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v16 = 45;
        if (isMetaClass)
          v16 = 43;
        v11(3, "%c[%{public}s %{public}s]:%i Invalid extended response length : %{public}@", v16, ClassName, Name, 73, self->_data);
        v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v17 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v8 = (id)_NFSharedLogClient[(_QWORD)v17];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18))
          v19 = 43;
        else
          v19 = 45;
        v20 = object_getClassName(self);
        v21 = sel_getName(a2);
        data = self->_data;
        *(_DWORD *)buf = 67110146;
        v27 = v19;
        v28 = 2082;
        v29 = v20;
        v30 = 2082;
        v31 = v21;
        v32 = 1024;
        v33 = 73;
        v34 = 2114;
        v35 = data;
        _os_log_impl(&dword_1C34DB000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid extended response length : %{public}@", buf, 0x2Cu);
      }
      goto LABEL_19;
    }
    if (a3)
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", 1, v24);
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject NF_asHexString](v8, "NF_asHexString");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    }
  }
  return status;
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
