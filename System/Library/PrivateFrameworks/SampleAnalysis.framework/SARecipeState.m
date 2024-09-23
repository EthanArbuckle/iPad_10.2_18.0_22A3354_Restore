@implementation SARecipeState

+ (_QWORD)stateWithThread:(uint64_t)a3 threadStateIndex:
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = a2;
  v5 = objc_alloc((Class)objc_opt_self());
  v6 = -[SARecipeState initWithThread:threadStateIndex:](v5, v4, a3);

  return v6;
}

- (_QWORD)initWithThread:(uint64_t)a3 threadStateIndex:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)SARecipeState;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
    }
  }

  return a1;
}

- (SAThreadState)threadState
{
  void *v3;
  void *v4;

  -[SAThread threadStates](self->_thread, "threadStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", self->_threadStateIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SAThreadState *)v4;
}

- (SAThread)thread
{
  return (SAThread *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)threadStateIndex
{
  return self->_threadStateIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
}

+ (id)classDictionaryKey
{
  int v3;
  NSObject *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  uint8_t buf[4];
  const char *ClassName;

  v3 = *__error();
  _sa_logt();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(a1);
    _os_log_error_impl(&dword_1B9BE0000, v4, OS_LOG_TYPE_ERROR, "SARecipeState classDictionaryKey not overridden by %s", buf, 0xCu);
  }

  *__error() = v3;
  v5 = object_getClassName(a1);
  _SASetCrashLogMessage(5163, "SARecipeState classDictionaryKey not overridden by %s", v6, v7, v8, v9, v10, v11, v5);
  result = (id)_os_crash();
  __break(1u);
  return result;
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 14;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  unint64_t v9;
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
  int v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  unint64_t threadStateIndex;
  id v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SARecipeState debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v36 = objc_msgSend(v13, "UTF8String");
      v37 = 2048;
      v38 = -[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v39 = 2048;
      v40 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SARecipeState debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SARecipeState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5171, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[SARecipeState debugDescription](self, "debugDescription");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = objc_msgSend(v24, "UTF8String");
      threadStateIndex = self->_threadStateIndex;
      *(_DWORD *)buf = 136315394;
      v36 = v25;
      v37 = 2048;
      v38 = threadStateIndex;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "%s: %lu threadStateIndex", buf, 0x16u);

    }
    *__error() = v22;
    -[SARecipeState debugDescription](self, "debugDescription");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "UTF8String");
    _SASetCrashLogMessage(5176, "%s: %lu threadStateIndex", v29, v30, v31, v32, v33, v34, v28);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  v9 = self->_threadStateIndex;
  if (v9 >= 0xFFFFFFFF)
    goto LABEL_7;
  *(_DWORD *)((char *)&a3->var2 + 2) = v9;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_thread, v8);

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
    -[SAThread addSelfToSerializationDictionary:](self->_thread, "addSelfToSerializationDictionary:", v6);

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
  if (a4 <= 0xD)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a4;
      v18 = 2048;
      v19 = 14;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SARecipeState struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(5197, "bufferLength %lu < serialized SARecipeState struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SARecipeState version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 2) = *(unsigned int *)((char *)a3 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SAThread *v14;
  SAThread *thread;
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
  if (a4 <= 0xD)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a4;
      v28 = 2048;
      v29 = 14;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SARecipeState struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5211, "bufferLength %lu < serialized SARecipeState struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SARecipeState version"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13);
  v14 = (SAThread *)objc_claimAutoreleasedReturnValue();
  thread = self->_thread;
  self->_thread = v14;

}

@end
