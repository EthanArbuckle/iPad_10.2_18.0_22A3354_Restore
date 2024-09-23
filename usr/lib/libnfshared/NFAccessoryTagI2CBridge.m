@implementation NFAccessoryTagI2CBridge

- (NFAccessoryTagI2CBridge)init
{

  return 0;
}

- (NFAccessoryTagI2CBridge)initWithDelegate:(id)a3
{
  return -[NFAccessoryTagI2CBridge initWithType:delegate:](self, "initWithType:delegate:", 0, a3);
}

- (NFAccessoryTagI2CBridge)initWithType:(int64_t)a3 delegate:(id)a4
{
  NFAccessoryTagI2CBridge *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NFAccessoryTagI2CBridge;
  result = -[NFAccessoryTag initWithDelegate:](&v6, sel_initWithDelegate_, a4);
  if (result)
    result->_type = a3;
  return result;
}

- (id)selectTag
{
  id v2;

  if (self->_type)
  {
    v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
    return (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 0, 0);
  }
  else
  {
    -[NFAccessoryTagI2CBridge _selectTagType0](self, "_selectTagType0");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)writeToBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5
{
  id v5;

  if (self->_type)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    return (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 0, 0);
  }
  else
  {
    *a5 = 0;
    -[NFAccessoryTagI2CBridge _writeToBridgeType0:fragmentationSupport:](self, "_writeToBridgeType0:fragmentationSupport:", a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)readFromBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5
{
  id v5;

  if (self->_type)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    return (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 0, 0);
  }
  else
  {
    -[NFAccessoryTagI2CBridge _readFromBridgeType0:fragmentationSupport:](self, "_readFromBridgeType0:fragmentationSupport:", a5, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)tagUUID
{
  return self->_tagUUID;
}

- (void)setTagUUID:(id)a3
{
  objc_storeStrong((id *)&self->_tagUUID, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (int)transactionCounter
{
  return self->_transactionCounter;
}

- (void)setTransactionCounter:(int)a3
{
  self->_transactionCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagUUID, 0);
}

- (id)_selectTagType0
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  id v16;
  uint8_t buf[14];
  __int16 v18;

  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6 != 8))
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    return (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 1, 0);
  }
  else
  {
    v18 = 9506;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v18, 2);
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v8);

    NFSharedSignpostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_select", (const char *)&unk_1C350844F, buf, 2u);
    }

    -[NFAccessoryTag delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v10, "transceive:response:maxTimeout:", v7, &v16, 2.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;

    if (!v11)
    {
      if ((*(_BYTE *)objc_msgSend(objc_retainAutorelease(v12), "bytes") & 1) != 0)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v11 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
      }
      else
      {
        -[NFAccessoryTagI2CBridge setSelected:](self, "setSelected:", 1);
        -[NFAccessoryTagI2CBridge setTransactionCounter:](self, "setTransactionCounter:", 1);
        v11 = 0;
      }
    }

    return v11;
  }
}

- (BOOL)_bridgeType0WritePollForSystemReadyWithTimeout:(double)a3 beforeWrite:(BOOL)a4 outError:(id *)a5
{
  _BOOL4 v5;
  void *v8;
  NSObject *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  unsigned __int8 *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  char v25;
  NSObject *v26;
  id v29;
  uint8_t buf[4];
  int v31;
  uint64_t v32;

  v5 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NFSharedSignpostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67240192;
    v31 = v5;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "beforeWrite=%{public,signpost.description:attribute}d", buf, 8u);
  }

  v10 = 0;
  v11 = 0;
  while (1)
  {
    if (v11)
    {
      v11 = 1;
LABEL_20:
      NFSharedSignpostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 67240192;
        v31 = v10 & 1;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "timeout=%{public,signpost.description:attribute}d", buf, 8u);
      }
      v13 = 0;
      goto LABEL_26;
    }
    v12 = (void *)MEMORY[0x1C3BD2368]();
    v29 = 0;
    -[NFAccessoryTagI2CBridge _type0ReadConfigRange:data:](self, "_type0ReadConfigRange:data:", 160, 2, &v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v29;
    v15 = v14;
    if (v13)
      break;
    objc_msgSend(v14, "subdataWithRange:", 0, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subdataWithRange:", 4, 4);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "bytes");
    v19 = objc_retainAutorelease(v16);
    v20 = (unsigned __int8 *)objc_msgSend(v19, "bytes");
    v21 = *(_BYTE *)(v18 + 1) & 0xE;
    if (v5)
    {
      if (v21 == 10 && (~*v20 & 7) == 0)
        goto LABEL_13;
    }
    else if (v21 == 10 && (*v20 & 0x27) == 0x23 && (v20[1] & 2) == 0)
    {
LABEL_13:
      v11 = 1;
LABEL_16:
      v25 = 1;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v22);
    v24 = v23;

    v11 = 0;
    if (v24 <= a3)
      goto LABEL_16;
    v25 = 0;
    v10 = 1;
LABEL_17:

    objc_autoreleasePoolPop(v12);
    if ((v25 & 1) == 0)
      goto LABEL_20;
  }

  objc_autoreleasePoolPop(v12);
  NFSharedSignpostLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "ReadConfigError", buf, 2u);
  }
  v11 = 0;
LABEL_26:

  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v11;
}

- (void)_bridgeType0CreateAccessoryHeaderWithBuffer:(id)a3 pageLength:(unint64_t)a4 isLastPage:(BOOL)a5
{
  id v7;
  void *v8;
  char v9;
  __int16 v10;
  BOOL v11;

  v9 = a4;
  v7 = a3;
  v10 = -[NFAccessoryTagI2CBridge transactionCounter](self, "transactionCounter");
  v11 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v9, 4);
  objc_msgSend(v7, "appendData:", v8);

}

- (id)_bridgeType0WritePollForCompletionWithTimeout:(double)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _BYTE *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NFSharedSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForWriteComplete", (const char *)&unk_1C350844F, buf, 2u);
  }

  while (1)
  {
    v7 = (void *)MEMORY[0x1C3BD2368]();
    v22 = 0;
    -[NFAccessoryTagI2CBridge _type0ReadConfigReg:data:](self, "_type0ReadConfigReg:data:", 160, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    if (v8)
    {

      objc_autoreleasePoolPop(v7);
      NFSharedSignpostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v17))
        goto LABEL_15;
      *(_WORD *)buf = 0;
      v18 = "error";
      v19 = v17;
      v20 = 2;
      goto LABEL_14;
    }
    v10 = objc_retainAutorelease(v9);
    v11 = (_BYTE *)objc_msgSend(v10, "bytes");
    if ((*v11 & 0x20) == 0 && (v11[1] & 2) == 0)
      break;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v12);
    v14 = v13;

    objc_autoreleasePoolPop(v7);
    if (v14 > a3)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v8 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 5, 0);
      v16 = 0;
      goto LABEL_12;
    }
  }

  objc_autoreleasePoolPop(v7);
  v8 = 0;
  v16 = 1;
LABEL_12:
  NFSharedSignpostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (!os_signpost_enabled(v17))
    goto LABEL_15;
  *(_DWORD *)buf = 67240192;
  v24 = v16;
  v18 = "systemReady=%{public,signpost.description:attribute}d";
  v19 = v17;
  v20 = 8;
LABEL_14:
  _os_signpost_emit_with_name_impl(&dword_1C34DB000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForWriteComplete", v18, buf, v20);
LABEL_15:

  return v8;
}

- (id)_bridgeType0WriteOneSRAMPage:(id)a3 fragmentationSupport:(BOOL)a4 isLastPage:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v22;
  int v23;
  uint8_t buf[4];
  _BOOL4 v25;
  uint64_t v26;

  v5 = a5;
  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (v6)
    -[NFAccessoryTagI2CBridge _bridgeType0CreateAccessoryHeaderWithBuffer:pageLength:isLastPage:](self, "_bridgeType0CreateAccessoryHeaderWithBuffer:pageLength:isLastPage:", v9, objc_msgSend(v8, "length"), v5);
  objc_msgSend(v9, "appendData:", v8);
  v10 = objc_msgSend(v9, "length") & 3;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 - v10);
    objc_msgSend(v9, "appendData:", v11);

  }
  NFSharedSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", (const char *)&unk_1C350844F, buf, 2u);
  }

  v13 = objc_msgSend(v9, "length");
  if (v13 < 0xFC)
  {
    -[NFAccessoryTagI2CBridge _type0WriteSRAM:data:](self, "_type0WriteSRAM:data:", 1, v9);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v16 = (void *)v18;
      NFSharedSignpostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
    v14 = v13;
    objc_msgSend(v9, "subdataWithRange:", 0, 248);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFAccessoryTagI2CBridge _type0WriteSRAM:data:](self, "_type0WriteSRAM:data:", 1, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      NFSharedSignpostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
LABEL_21:
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", "error", buf, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    objc_msgSend(v9, "subdataWithRange:", 248, (v14 & 0xFFFFFFFFFFFFFFFCLL) - 248);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFAccessoryTagI2CBridge _type0WriteSRAM:data:](self, "_type0WriteSRAM:data:", 63, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      NFSharedSignpostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  if ((unint64_t)objc_msgSend(v9, "length") <= 0xFC)
  {
    v23 = -272716322;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v23, 4);
    -[NFAccessoryTagI2CBridge _type0WriteSRAM:data:](self, "_type0WriteSRAM:data:", 63, v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      NFSharedSignpostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  NFSharedSignpostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 67240192;
    v25 = v5;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", "isLastPage=%{public,signpost.description:attribute}d", buf, 8u);
  }

  -[NFAccessoryTagI2CBridge _bridgeType0WritePollForCompletionWithTimeout:](self, "_bridgeType0WritePollForCompletionWithTimeout:", 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v16;
}

- (id)_writeToBridgeType0:(id)a3 fragmentationSupport:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  void *specific;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  id v36;
  const char *Name;
  id v39;
  uint8_t buf[4];
  _BYTE v41[14];
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  v9 = v8;
  if (v4)
    v10 = 248;
  else
    v10 = 256;
  if (v8 % v10)
    v11 = v8 / v10 + 1;
  else
    v11 = v8 / v10;
  NFSharedSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", (const char *)&unk_1C350844F, buf, 2u);
  }

  if (v11)
  {
    v13 = 0;
    while (1)
    {
      v39 = 0;
      v14 = -[NFAccessoryTagI2CBridge _bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:](self, "_bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:", 1, &v39, 0.5);
      v15 = v39;
      if (v15)
      {
        v18 = v15;
        NFSharedSignpostLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          goto LABEL_43;
        }
LABEL_44:

        goto LABEL_45;
      }
      if (!v14)
        break;
      if (v9 >= v10)
        v16 = v10;
      else
        v16 = v9;
      objc_msgSend(v7, "subdataWithRange:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NFAccessoryTagI2CBridge _bridgeType0WriteOneSRAMPage:fragmentationSupport:isLastPage:](self, "_bridgeType0WriteOneSRAMPage:fragmentationSupport:isLastPage:", v17, v4, v9 <= v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        NFSharedSignpostLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
LABEL_43:
          _os_signpost_emit_with_name_impl(&dword_1C34DB000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "error", buf, 2u);
        }
        goto LABEL_44;
      }
      if (v9 >= v10)
        v9 -= v10;
      else
        v9 = 0;
      v13 += v10;
      if (!--v11)
        goto LABEL_21;
    }
    v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v24)
    {
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = 45;
      if (isMetaClass)
        v28 = 43;
      v24(6, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v28, ClassName, Name, 297);
      v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v29 = dispatch_get_specific(v22);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v30 = (id)_NFSharedLogClient[(_QWORD)v29];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = object_getClass(self);
      if (class_isMetaClass(v31))
        v32 = 43;
      else
        v32 = 45;
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v41 = v32;
      *(_WORD *)&v41[4] = 2082;
      *(_QWORD *)&v41[6] = v33;
      v42 = 2082;
      v43 = v34;
      v44 = 1024;
      v45 = 297;
      _os_log_impl(&dword_1C34DB000, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
    }

    NFSharedSignpostLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "systemNotReady", buf, 2u);
    }

    v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 5, 0);
  }
  else
  {
LABEL_21:
    NFSharedSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v19))
    {
      v20 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)v41 = v20;
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "totalLen=%{public,signpost.description:attribute}lu", buf, 0xCu);
    }

    -[NFAccessoryTagI2CBridge setTransactionCounter:](self, "setTransactionCounter:", -[NFAccessoryTagI2CBridge transactionCounter](self, "transactionCounter") + 1);
    v18 = 0;
  }
LABEL_45:

  return v18;
}

- (id)_bridgeType0ReadMultipleSRAMPagesWithBuffer:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  unsigned __int8 *v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  NSObject *v22;
  char *v23;
  void *specific;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  const char *Name;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  while (1)
  {
    v47 = v5;
    v6 = -[NFAccessoryTagI2CBridge _bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:](self, "_bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:", 0, &v47, 0.5);
    v7 = v47;

    if (v7)
      goto LABEL_41;
    if (!v6)
      break;
    NFSharedSignpostLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", (const char *)&unk_1C350844F, buf, 2u);
    }

    v46 = 0;
    -[NFAccessoryTagI2CBridge _type0ReadSRAM:numOfBlocks:data:](self, "_type0ReadSRAM:numOfBlocks:data:", 1, 4, &v46);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v46;
    v10 = v9;
    if (v7)
    {
      NFSharedSignpostLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      goto LABEL_40;
    }
    v10 = objc_retainAutorelease(v9);
    v11 = (unsigned __int8 *)objc_msgSend(v10, "bytes");
    v12 = *v11;
    if (v12 >= 0xF9)
    {
      NFSharedSignpostLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v7 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
      goto LABEL_40;
    }
    v13 = v11[3];
    if (v12 < 0xD)
    {
      objc_msgSend(v10, "subdataWithRange:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendData:", v19);

      v17 = v10;
LABEL_13:
      v44 = v17;
      -[NFAccessoryTagI2CBridge _type0ReadSRAM:numOfBlocks:data:](self, "_type0ReadSRAM:numOfBlocks:data:", 63, 1, &v44);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v44;

      v17 = v20;
      goto LABEL_14;
    }
    v14 = v12 - 12;
    objc_msgSend(v10, "subdataWithRange:", 4, 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendData:", v15);

    v16 = vcvtpd_s64_f64((double)(int)v14 * 0.25);
    v45 = v10;
    -[NFAccessoryTagI2CBridge _type0ReadSRAM:numOfBlocks:data:](self, "_type0ReadSRAM:numOfBlocks:data:", 5, v16, &v45);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v45;

    if (v7)
    {
      NFSharedSignpostLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      v10 = v17;
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v17, "subdataWithRange:", 0, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendData:", v18);

    v5 = 0;
    if ((v16 & 0xFFFFFFFE) != 0x3A)
      goto LABEL_13;
LABEL_14:
    v21 = v13 & 1;
    NFSharedSignpostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 67240192;
      v49 = v21;
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "isLastPage=%{public,signpost.description:attribute}d", buf, 8u);
    }

    if (v21)
    {

      v7 = 0;
      goto LABEL_41;
    }
  }
  v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v25)
  {
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v29 = 45;
    if (isMetaClass)
      v29 = 43;
    v25(3, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v29, ClassName, Name, 341);
    v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v30 = dispatch_get_specific(v23);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v31 = (id)_NFSharedLogClient[(_QWORD)v30];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = object_getClass(self);
    if (class_isMetaClass(v32))
      v33 = 43;
    else
      v33 = 45;
    v34 = object_getClassName(self);
    v35 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v49 = v33;
    v50 = 2082;
    v51 = v34;
    v52 = 2082;
    v53 = v35;
    v54 = 1024;
    v55 = 341;
    _os_log_impl(&dword_1C34DB000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
  }

  v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v7 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 5, 0);
LABEL_41:

  return v7;
}

- (id)_readFromBridgeType0:(id *)a3 fragmentationSupport:(BOOL)a4
{
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  char *v26;
  void *specific;
  void (*v28)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  objc_class *v35;
  int v36;
  const char *v37;
  const char *v38;
  id v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v43;
  const char *Name;
  id v45;
  uint8_t buf[4];
  _BYTE v47[14];
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  NFSharedSignpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", (const char *)&unk_1C350844F, buf, 2u);
  }

  if (!a4)
  {
    v45 = 0;
    v15 = -[NFAccessoryTagI2CBridge _bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:](self, "_bridgeType0WritePollForSystemReadyWithTimeout:beforeWrite:outError:", 0, &v45, 0.5);
    v16 = v45;
    if (v16)
    {
      v17 = v16;
      NFSharedSignpostLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C34DB000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", "error", buf, 2u);
      }

      v19 = v17;
      goto LABEL_36;
    }
    if (v15)
    {
      -[NFAccessoryTagI2CBridge _type0ReadSRAM:numOfBlocks:data:](self, "_type0ReadSRAM:numOfBlocks:data:", 0, 64, a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NFSharedSignpostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_enabled(v23);
      if (!v22)
      {
        if (!v24)
          goto LABEL_35;
        v43 = objc_msgSend(*a3, "length");
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)v47 = v43;
        v25 = "totalLen=%{public,signpost.description:attribute}lu";
        v40 = v23;
        v41 = 12;
        goto LABEL_34;
      }
      if (!v24)
      {
LABEL_35:

        v19 = v22;
LABEL_36:
        v21 = v19;
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      v25 = "error";
    }
    else
    {
      v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4)
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      v28 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v28)
      {
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v32 = 45;
        if (isMetaClass)
          v32 = 43;
        v28(3, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v32, ClassName, Name, 425);
        v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v33 = dispatch_get_specific(v26);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v34 = (id)_NFSharedLogClient[(_QWORD)v33];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = object_getClass(self);
        if (class_isMetaClass(v35))
          v36 = 43;
        else
          v36 = 45;
        v37 = object_getClassName(self);
        v38 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v47 = v36;
        *(_WORD *)&v47[4] = 2082;
        *(_QWORD *)&v47[6] = v37;
        v48 = 2082;
        v49 = v38;
        v50 = 1024;
        v51 = 425;
        _os_log_impl(&dword_1C34DB000, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
      }

      v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = (void *)objc_msgSend(v39, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 5, 0);
      NFSharedSignpostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v23))
        goto LABEL_35;
      *(_WORD *)buf = 0;
      v25 = "systemNotReady";
    }
    v40 = v23;
    v41 = 2;
LABEL_34:
    _os_signpost_emit_with_name_impl(&dword_1C34DB000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", v25, buf, v41);
    goto LABEL_35;
  }
  v9 = (void *)objc_opt_new();
  -[NFAccessoryTagI2CBridge _bridgeType0ReadMultipleSRAMPagesWithBuffer:](self, "_bridgeType0ReadMultipleSRAMPagesWithBuffer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    NFSharedSignpostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      v12 = "error";
      v13 = v11;
      v14 = 2;
LABEL_13:
      _os_signpost_emit_with_name_impl(&dword_1C34DB000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", v12, buf, v14);
    }
  }
  else
  {
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v9);
    NFSharedSignpostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      v20 = objc_msgSend(v9, "length");
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)v47 = v20;
      v12 = "totalLen=%{public,signpost.description:attribute}lu";
      v13 = v11;
      v14 = 12;
      goto LABEL_13;
    }
  }

  v21 = v10;
LABEL_37:

  return v21;
}

- (id)_type0ReadConfigReg:(unsigned __int8)a3 data:(id *)a4
{
  return -[NFAccessoryTagI2CBridge _type0ReadConfigRange:data:](self, "_type0ReadConfigRange:data:", a3, 1, a4);
}

- (id)_type0ReadConfigRange:(_NSRange)a3 data:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _BYTE v29[2];
  __int16 v30;
  char v31;

  length = a3.length;
  location = a3.location;
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11 != 8)
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = NFAccessoryTagI2CBridgeErrorDomain;
      v15 = 1;
      return (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, 0);
    }
  }
  if (location > 0xFF || length > 0x100 || !length)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = NFAccessoryTagI2CBridgeErrorDomain;
    v15 = 2;
    return (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, v15, 0);
  }
  v31 = 4;
  v30 = -16382;
  if (-[NFAccessoryTagI2CBridge selected](self, "selected"))
  {
    v12 = 18;
  }
  else
  {
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_14;
    v12 = 34;
  }
  LOBYTE(v30) = v12;
LABEL_14:
  v29[0] = location;
  v29[1] = length - 1;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v30, 3);
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = -[NFAccessoryTagI2CBridge selected](self, "selected");

    if (!v21)
    {
      -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendData:", v22);

    }
  }
  objc_msgSend(v18, "appendBytes:length:", v29, 2);
  -[NFAccessoryTag delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v23, "transceive:response:maxTimeout:", v18, &v28, 2.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v28;

  if (!v24)
  {
    v26 = objc_retainAutorelease(v25);
    if ((*(_BYTE *)objc_msgSend(v26, "bytes") & 1) != 0)
    {
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
    }
    else
    {
      objc_msgSend(v26, "subdataWithRange:", 1, objc_msgSend(v26, "length") - 1);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v24;
}

- (id)_type0WriteConfigReg:(unsigned __int8)a3 data:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v26;
  unsigned __int8 v27;
  __int16 v28;
  char v29;

  v6 = a4;
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 != 8)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = NFAccessoryTagI2CBridgeErrorDomain;
      v14 = 1;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(v6, "length") != 4)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = NFAccessoryTagI2CBridgeErrorDomain;
    v14 = 2;
LABEL_8:
    v15 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, v14, 0);
    goto LABEL_20;
  }
  v29 = 4;
  v28 = -16126;
  if (-[NFAccessoryTagI2CBridge selected](self, "selected"))
  {
    v11 = 18;
  }
  else
  {
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_12;
    v11 = 34;
  }
  LOBYTE(v28) = v11;
LABEL_12:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v28, 3);
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    v20 = -[NFAccessoryTagI2CBridge selected](self, "selected");

    if (!v20)
    {
      -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendData:", v21);

    }
  }
  v27 = a3;
  objc_msgSend(v17, "appendBytes:length:", &v27, 1);
  objc_msgSend(v17, "appendData:", v6);
  -[NFAccessoryTag delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v22, "transceive:response:maxTimeout:", v17, &v26, 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v26;

  if (!v15)
  {
    if ((*(_BYTE *)objc_msgSend(objc_retainAutorelease(v23), "bytes") & 1) != 0)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
    }
    else
    {
      v15 = 0;
    }
  }

LABEL_20:
  return v15;
}

- (id)_type0ReadSRAM:(unsigned __int8)a3 numOfBlocks:(unsigned __int8)a4 data:(id *)a5
{
  int v6;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _BYTE v30[2];
  __int16 v31;
  char v32;

  v6 = a4;
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12 != 8)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = NFAccessoryTagI2CBridgeErrorDomain;
      v16 = 1;
      return (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v16, 0);
    }
  }
  if (!v6)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = NFAccessoryTagI2CBridgeErrorDomain;
    v16 = 2;
    return (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v16, 0);
  }
  v32 = 4;
  v31 = -11774;
  if (-[NFAccessoryTagI2CBridge selected](self, "selected"))
  {
    v13 = 18;
  }
  else
  {
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_12;
    v13 = 34;
  }
  LOBYTE(v31) = v13;
LABEL_12:
  v30[0] = a3;
  v30[1] = v6 - 1;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v31, 3);
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = -[NFAccessoryTagI2CBridge selected](self, "selected");

    if (!v22)
    {
      -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "appendData:", v23);

    }
  }
  objc_msgSend(v19, "appendBytes:length:", v30, 2);
  -[NFAccessoryTag delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v24, "transceive:response:maxTimeout:", v19, &v29, 2.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v29;

  if (!v25)
  {
    v27 = objc_retainAutorelease(v26);
    if ((*(_BYTE *)objc_msgSend(v27, "bytes") & 1) != 0)
    {
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
    }
    else
    {
      objc_msgSend(v27, "subdataWithRange:", 1, objc_msgSend(v27, "length") - 1);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v25;
}

- (id)_type0WriteSRAM:(unsigned __int8)a3 data:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _BYTE v29[2];
  __int16 v30;
  char v31;

  v6 = a4;
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 != 8)
    {
      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = NFAccessoryTagI2CBridgeErrorDomain;
      v13 = 1;
      goto LABEL_6;
    }
  }
  if ((objc_msgSend(v6, "length") & 3) != 0 || !objc_msgSend(v6, "length"))
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = NFAccessoryTagI2CBridgeErrorDomain;
    v13 = 2;
LABEL_6:
    v14 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, v13, 0);
    goto LABEL_7;
  }
  v16 = (unint64_t)objc_msgSend(v6, "length") >> 2;
  v31 = 4;
  v30 = -11518;
  if (-[NFAccessoryTagI2CBridge selected](self, "selected"))
  {
    v17 = 18;
  }
  else
  {
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_14;
    v17 = 34;
  }
  LOBYTE(v30) = v17;
LABEL_14:
  v19 = v16 - 1;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v30, 3);
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    v23 = -[NFAccessoryTagI2CBridge selected](self, "selected");

    if (!v23)
    {
      -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendData:", v24);

    }
  }
  v29[0] = a3;
  v29[1] = v19;
  objc_msgSend(v20, "appendBytes:length:", v29, 2);
  objc_msgSend(v20, "appendData:", v6);
  -[NFAccessoryTag delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v25, "transceive:response:maxTimeout:", v20, &v28, 2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v28;

  if (!v14)
  {
    if ((*(_BYTE *)objc_msgSend(objc_retainAutorelease(v26), "bytes") & 1) != 0)
    {
      v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
    }
    else
    {
      v14 = 0;
    }
  }

LABEL_7:
  return v14;
}

- (id)_type0GetSystemInfo:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v22;
  id v23;
  __int16 v24;
  char v25;

  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 != 8)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
      return (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 1, 0);
    }
  }
  v25 = 4;
  v24 = -21758;
  if (-[NFAccessoryTagI2CBridge selected](self, "selected"))
  {
    v9 = 18;
  }
  else
  {
    -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
    v9 = 34;
  }
  LOBYTE(v24) = v9;
LABEL_8:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v24, 3);
  -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[NFAccessoryTagI2CBridge selected](self, "selected");

    if (!v14)
    {
      -[NFAccessoryTagI2CBridge tagUUID](self, "tagUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendData:", v15);

    }
  }
  -[NFAccessoryTag delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v16, "transceive:response:maxTimeout:", v11, &v23, 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;

  if (!v17)
  {
    v19 = objc_retainAutorelease(v18);
    if ((*(_BYTE *)objc_msgSend(v19, "bytes") & 1) != 0)
    {
      v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", NFAccessoryTagI2CBridgeErrorDomain, 4, 0);
    }
    else
    {
      objc_msgSend(v19, "subdataWithRange:", 1, objc_msgSend(v19, "length") - 1);
      v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v17;
}

@end
