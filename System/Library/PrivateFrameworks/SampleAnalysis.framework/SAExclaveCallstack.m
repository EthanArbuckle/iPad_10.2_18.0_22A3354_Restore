@implementation SAExclaveCallstack

- (id)initWithExclave:(void *)a3 leafFrame:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SAExclaveCallstack;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  const char *v3;
  id v4;
  id Property;
  const char *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    Property = objc_getProperty(self, v3, 8, 1);
  else
    Property = 0;
  objc_msgSend(Property, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v8 = objc_getProperty(self, v6, 16, 1);
  else
    v8 = 0;
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ callstack with leaf %@"), v7, v9);

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafFrame, 0);
  objc_storeStrong((id *)&self->_exclave, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAExclaveCallstack");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 34;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  const char *v9;
  id Property;
  SEL v11;
  id v12;
  unint64_t invocationID;
  int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAExclaveCallstack sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") == a4)
  {
    *(_WORD *)&a3->var0 = 257;
    if (self)
    {
      Property = objc_getProperty(self, v9, 8, 1);
      *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(Property, v8);
      v12 = objc_getProperty(self, v11, 16, 1);
      goto LABEL_4;
    }
  }
  else
  {
    v15 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[SAExclaveCallstack debugDescription](self, "debugDescription");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v26 = objc_msgSend(v17, "UTF8String");
      v27 = 2048;
      v28 = -[SAExclaveCallstack sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v29 = 2048;
      v30 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v15;
    -[SAExclaveCallstack debugDescription](self, "debugDescription");
    a3 = ($93CF9441C607C7AF89C984194EE6CD4E *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (id)-[$93CF9441C607C7AF89C984194EE6CD4E UTF8String](a3, "UTF8String");
    -[SAExclaveCallstack sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(430, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, (char)v8);

    _os_crash();
    __break(1u);
  }
  v24 = SASerializableIndexForPointerFromSerializationDictionary(0, v8);
  v12 = 0;
  *(_QWORD *)(&a3->var1 + 1) = v24;
LABEL_4:
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);
  if (self)
  {
    *(unint64_t *)((char *)&a3->var3 + 2) = self->_threadNumericID;
    invocationID = self->_invocationID;
  }
  else
  {
    invocationID = 0;
    *(unint64_t *)((char *)&a3->var3 + 2) = 0;
  }
  *(unint64_t *)((char *)&a3->var4 + 2) = invocationID;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  const char *v6;
  SEL v7;
  id Property;
  id v9;

  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v9, self, v4);

  if (v5)
  {
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v6, 8, 1), "addSelfToSerializationDictionary:", v9);
      Property = objc_getProperty(self, v7, 16, 1);
    }
    else
    {
      objc_msgSend(0, "addSelfToSerializationDictionary:", v9);
      Property = 0;
    }
    objc_msgSend(Property, "addSelfToSerializationDictionary:", v9);
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
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(457, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAExclaveCallstack version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init(SAExclaveCallstack);
  *((_QWORD *)result + 3) = *(_QWORD *)((char *)a3 + 18);
  *((_QWORD *)result + 4) = *(_QWORD *)((char *)a3 + 26);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SAExclave *v14;
  SAExclave *exclave;
  unint64_t v16;
  void *v17;
  SAFrame *v18;
  SAFrame *leafFrame;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x21)
  {
    v20 = *__error();
    _sa_logt();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v31 = a4;
      v32 = 2048;
      v33 = 34;
      _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(472, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAExclaveCallstack version"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  v14 = (SAExclave *)objc_claimAutoreleasedReturnValue();
  exclave = self->_exclave;
  self->_exclave = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17, 0);
  v18 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafFrame = self->_leafFrame;
  self->_leafFrame = v18;

}

@end
