@implementation SAPowerModeTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (id)initWithLowPowerMode:(void *)a3 timestamp:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)SAPowerModeTransition;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_BYTE *)v7 + 9) = a2;
      *((_BYTE *)v7 + 8) = 1;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self->_lowPowerModeChanged)
  {
    if (self->_lowPowerMode)
      v3 = "low";
    else
      v3 = "default";
  }
  else
  {
    v3 = "unknown";
  }
  -[SATimestamp debugDescription](self->_timestamp, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s power mode at %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)lowPowerModeChanged
{
  return self->_lowPowerModeChanged;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  SATimestamp *timestamp;
  id v6;

  v6 = a3;
  if (self->_lowPowerModeChanged)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lowPowerMode);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v6, (uint64_t)CFSTR("lowPowerMode"), v4);

    timestamp = self->_timestamp;
    if (timestamp)
      SAJSONWriteDictionaryEntry(v6, CFSTR("timestamp"), timestamp);
  }

}

+ (id)classDictionaryKey
{
  return CFSTR("SAPowerModeTransition");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 18;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SAPowerModeTransition debugDescription](self, "debugDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v22 = objc_msgSend(v12, "UTF8String");
      v23 = 2048;
      v24 = -[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v25 = 2048;
      v26 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v10;
    -[SAPowerModeTransition debugDescription](self, "debugDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    -[SAPowerModeTransition sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(75, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(&a3->var1 + 1) = self->_lowPowerMode;
  *(&a3->var1 + 2) = self->_lowPowerModeChanged;
  *($FF3C895AB0208964DD20957A829FE7A6 *)((char *)&a3->var2 + 2) = ($FF3C895AB0208964DD20957A829FE7A6)SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
    -[SATimestamp addSelfToSerializationDictionary:](self->_timestamp, "addSelfToSerializationDictionary:", v6);

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id result;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x11)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a4;
      v18 = 2048;
      v19 = 18;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(100, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAPowerModeTransition version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init(SAPowerModeTransition);
  *((_BYTE *)result + 9) = *((_BYTE *)a3 + 2);
  *((_BYTE *)result + 8) = *((_BYTE *)a3 + 3);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *timestamp;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x11)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a4;
      v28 = 2048;
      v29 = 18;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(114, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAPowerModeTransition version"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 10);
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13, 0);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;

}

@end
