@implementation SAThreadExclavesInfo

- (_QWORD)initWithCallstacks:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SAThreadExclavesInfo;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[2];
      a1[2] = v4;

    }
  }

  return a1;
}

- (uint64_t)matchesStack:(uint64_t)a1
{
  id v3;
  const char *v4;
  uint64_t v5;
  id Property;
  uint64_t v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  id v16;
  const char *v17;
  const char *v18;
  id v19;
  SEL v20;
  id v21;

  v3 = a2;
  if (a1)
  {
    v5 = objc_msgSend(*(id *)(a1 + 16), "count");
    if (v3)
      Property = objc_getProperty(v3, v4, 16, 1);
    else
      Property = 0;
    if (objc_msgSend(Property, "count") != v5)
    {
LABEL_29:
      a1 = 0;
      goto LABEL_30;
    }
    if (v5)
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v3 ? objc_getProperty(v3, v8, 16, 1) : 0;
        objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v9 ? objc_getProperty(v9, v11, 8, 1) : 0;
        v15 = v13;
        v16 = v12 ? objc_getProperty(v12, v14, 8, 1) : 0;

        if (v15 != v16)
          break;
        if (v9 && objc_getProperty(v9, v17, 16, 1))
        {
          if (!v12)
            break;
          if (!objc_getProperty(v12, v17, 16, 1))
            break;
          v19 = objc_getProperty(v9, v18, 16, 1);
          v21 = objc_getProperty(v12, v20, 16, 1);

          if (v19 != v21)
            break;
        }
        else if (v12 && objc_getProperty(v12, v17, 16, 1))
        {
          break;
        }

        if (v5 == ++v7)
          goto LABEL_27;
      }

      goto LABEL_29;
    }
LABEL_27:
    a1 = 1;
  }
LABEL_30:

  return a1;
}

- (NSString)debugDescription
{
  const char *v3;
  id v4;
  id Property;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    Property = objc_getProperty(self, v3, 16, 1);
  else
    Property = 0;
  return (NSString *)(id)objc_msgSend(v4, "initWithFormat:", CFSTR("thread exclave info with %lu callstacks"), objc_msgSend(Property, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callstacks, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAThreadExclavesInfo");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  if (self)
    self = (SAThreadExclavesInfo *)objc_getProperty(self, a2, 16, 1);
  return 8 * -[SAThreadExclavesInfo count](self, "count") + 10;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  const char *v9;
  id i;
  unsigned int v11;
  int v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v13 = *__error();
    _sa_logt();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v34 = objc_msgSend(v15, "UTF8String");
      v35 = 2048;
      v36 = -[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v37 = 2048;
      v38 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v13;
    -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a3 = ($54D7D07E751DBEAE55462C0B4C71138B *)objc_msgSend(v16, "UTF8String");
    -[SAThreadExclavesInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(505, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, (char)a3);

    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  *(_WORD *)&a3->var0 = 257;
  if (!self)
    goto LABEL_12;
  *(_DWORD *)(&a3->var1 + 1) = self->_flags;
  for (i = objc_getProperty(self, v9, 16, 1); ; i = 0)
  {
    a4 = (unint64_t)i;
    if ((unint64_t)objc_msgSend((id)a4, "count") < 0xFFFFFFFF)
      break;
LABEL_9:
    v23 = *__error();
    _sa_logt();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
      a3 = ($54D7D07E751DBEAE55462C0B4C71138B *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = -[$54D7D07E751DBEAE55462C0B4C71138B UTF8String](a3, "UTF8String");
      v26 = objc_msgSend((id)a4, "count");
      *(_DWORD *)buf = 136315394;
      v34 = v25;
      v35 = 2048;
      v36 = v26;
      _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "%s: %lu callstacks", buf, 0x16u);

    }
    *__error() = v23;
    -[SAThreadExclavesInfo debugDescription](self, "debugDescription");
    self = (SAThreadExclavesInfo *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (id)-[SAThreadExclavesInfo UTF8String](self, "UTF8String");
    objc_msgSend((id)a4, "count");
    _SASetCrashLogMessage(513, "%s: %lu callstacks", v27, v28, v29, v30, v31, v32, (char)v8);

    _os_crash();
    __break(1u);
LABEL_12:
    *(_DWORD *)(&a3->var1 + 1) = 0;
  }
  v11 = objc_msgSend((id)a4, "count");
  *(unsigned int *)((char *)&a3->var2 + 2) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var3 + 2, v11, (void *)a4, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  const char *v7;
  id Property;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    if (self)
      Property = objc_getProperty(self, v7, 16, 1);
    else
      Property = 0;
    v9 = Property;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "addSelfToSerializationDictionary:", v4, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

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
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 9)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a4;
      v18 = 2048;
      v19 = 10;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(538, "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThreadExclavesInfo version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init(SAThreadExclavesInfo);
  *((_DWORD *)result + 2) = *(_DWORD *)((char *)a3 + 2);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *callstacks;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 9)
  {
    v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v36 = a4;
      v37 = 2048;
      v38 = 10;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(552, "bufferLength %lu < serialized SAThreadExclavesInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v11 = *(unsigned int *)((char *)a3 + 6);
  if (8 * v11 + 10 > a4)
  {
LABEL_8:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_DWORD *)((char *)a3 + 6);
      *(_DWORD *)buf = 134218240;
      v36 = a4;
      v37 = 1024;
      LODWORD(v38) = v26;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadExclavesInfo struct with %u callstacks", buf, 0x12u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(554, "bufferLength %lu < serialized SAThreadExclavesInfo struct with %u callstacks", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThreadExclavesInfo version"), 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v12 = v10;
  v13 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 10, v11, v34, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (NSArray *)objc_msgSend(v14, "copy");
  callstacks = self->_callstacks;
  self->_callstacks = v15;

}

@end
