@implementation SAModelExecution

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SAModelExecution requester](self, "requester");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAModelExecution useCaseID](self, "useCaseID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SAModelExecution instructions](self, "instructions");
  -[SAModelExecution startTime](self, "startTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAModelExecution endTime](self, "endTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("execution on behalf of %@ use case %@, %llu instructions, from %@-%@"), v4, v5, v6, v8, v10);

  return (NSString *)v11;
}

- (NSString)requester
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequester:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)useCaseID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUseCaseID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(unint64_t)a3
{
  self->_instructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_useCaseID, 0);
  objc_storeStrong((id *)&self->_requester, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;
  NSString *requester;
  NSString *useCaseID;
  NSString *v7;
  SATimestamp *startTime;
  SATimestamp *endTime;
  void *v10;
  SATimestamp *v11;
  SATimestamp *v12;
  id v13;

  v4 = a3;
  requester = self->_requester;
  v13 = v4;
  if (requester)
  {
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("requester"), requester);
    useCaseID = self->_useCaseID;
    if (useCaseID)
      SAJSONWriteDictionaryEntry(v13, CFSTR("useCaseID"), useCaseID);
    goto LABEL_6;
  }
  v7 = self->_useCaseID;
  if (v7)
  {
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("useCaseID"), v7);
LABEL_6:
    startTime = self->_startTime;
    if (startTime)
      SAJSONWriteDictionaryEntry(v13, CFSTR("startTime"), startTime);
    goto LABEL_8;
  }
  v11 = self->_startTime;
  if (v11)
  {
    SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("startTime"), v11);
LABEL_8:
    endTime = self->_endTime;
    if (endTime)
      SAJSONWriteDictionaryEntry(v13, CFSTR("endTime"), endTime);
    goto LABEL_10;
  }
  v12 = self->_endTime;
  if (!v12)
  {
    if (!self->_instructions)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryFirstEntry(v13, (uint64_t)CFSTR("instructions"), v10);
    goto LABEL_12;
  }
  SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("endTime"), v12);
LABEL_10:
  if (self->_instructions)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v13, CFSTR("instructions"), v10);
LABEL_12:

  }
LABEL_13:

}

+ (id)classDictionaryKey
{
  return CFSTR("SAModelExecution");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 42;
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
  if (-[SAModelExecution sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SAModelExecution debugDescription](self, "debugDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v22 = objc_msgSend(v12, "UTF8String");
      v23 = 2048;
      v24 = -[SAModelExecution sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v25 = 2048;
      v26 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v10;
    -[SAModelExecution debugDescription](self, "debugDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    -[SAModelExecution sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(430, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 771;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_requester, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTime, v8);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTime, v8);
  *(unint64_t *)((char *)&a3->var4 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_useCaseID, v8);
  *(unint64_t *)((char *)&a3->var5 + 2) = self->_instructions;

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
  {
    -[NSString addSelfToSerializationDictionary:](self->_requester, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTime, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTime, "addSelfToSerializationDictionary:", v6);
    -[NSString addSelfToSerializationDictionary:](self->_useCaseID, "addSelfToSerializationDictionary:", v6);
  }

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
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_7;
  if (a4 <= 0x21)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a4;
      v18 = 2048;
      v19 = 34;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(460, "bufferLength %lu < serialized SAModelExecution struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModelExecution version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init(SAModelExecution);
  *((_QWORD *)result + 5) = *(_QWORD *)((char *)a3 + 26);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSString *v14;
  NSString *requester;
  unint64_t v16;
  void *v17;
  SATimestamp *v18;
  SATimestamp *startTime;
  unint64_t v20;
  void *v21;
  SATimestamp *v22;
  SATimestamp *endTime;
  unint64_t v24;
  void *v25;
  NSString *v26;
  NSString *useCaseID;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_13;
  if (a4 <= 0x21)
  {
    v28 = *__error();
    _sa_logt();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v47 = a4;
      v48 = 2048;
      v49 = 34;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution struct %lu", buf, 0x16u);
    }

    *__error() = v28;
    _SASetCrashLogMessage(473, "bufferLength %lu < serialized SAModelExecution struct %lu", v30, v31, v32, v33, v34, v35, a4);
    _os_crash();
    __break(1u);
LABEL_10:
    v36 = *__error();
    _sa_logt();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v47 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v37, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution v2 struct", buf, 0xCu);
    }

    *__error() = v36;
    _SASetCrashLogMessage(482, "bufferLength %lu < serialized SAModelExecution v2 struct", v38, v39, v40, v41, v42, v43, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModelExecution version"), 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v45, v11, v13, 0);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  requester = self->_requester;
  self->_requester = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v45, v11, v17, 0);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v18;

  v20 = *(_QWORD *)((char *)a3 + 18);
  v21 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v20, v45, v11, v21, 0);
  v22 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  self->_endTime = v22;

  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    if (a4 > 0x29)
    {
      v24 = *(_QWORD *)((char *)a3 + 26);
      v25 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v45, v11, v25, 0);
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      useCaseID = self->_useCaseID;
      self->_useCaseID = v26;

      goto LABEL_6;
    }
    goto LABEL_10;
  }
LABEL_6:

}

@end
