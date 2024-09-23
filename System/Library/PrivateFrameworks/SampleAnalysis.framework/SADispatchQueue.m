@implementation SADispatchQueue

+ (_QWORD)dispatchQueueWithId:(uint64_t)a1
{
  id v3;

  v3 = objc_alloc((Class)objc_opt_self());
  return -[SARecipe initWithId:](v3, a2);
}

- (NSString)debugDescription
{
  NSString *dispatchQueueLabel;
  id v4;
  void *v5;
  uint64_t v7;

  dispatchQueueLabel = self->_dispatchQueueLabel;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (dispatchQueueLabel)
    v5 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("DispatchQueue \"%@\"(%llu)"), self->_dispatchQueueLabel, -[SARecipe identifier](self, "identifier"));
  else
    v5 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("DispatchQueue %llu"), -[SARecipe identifier](self, "identifier"), v7);
  return (NSString *)v5;
}

- (BOOL)isConcurrent
{
  return self->_hasConcurrentExecution;
}

- (NSString)dispatchQueueLabel
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasConcurrentExecution
{
  return self->_hasConcurrentExecution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueueLabel, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SADispatchQueue");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  void *v2;
  unint64_t v3;

  -[SARecipe states](self, "states");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 8 * objc_msgSend(v2, "count") + 24;

  return v3;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unsigned int *v14;
  uint64_t v15;
  int v17;
  NSObject *v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  id v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  _BYTE v57[24];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v17 = *__error();
    _sa_logt();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[SADispatchQueue debugDescription](self, "debugDescription");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v55 = objc_msgSend(v19, "UTF8String");
      v56 = 2048;
      *(_QWORD *)v57 = -[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v17;
    -[SADispatchQueue debugDescription](self, "debugDescription");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    -[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4974, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  *(_WORD *)&a3->var0 = 513;
  *(_QWORD *)(&a3->var1 + 1) = -[SARecipe identifier](self, "identifier");
  BYTE6(a3->var2) = BYTE6(a3->var2) & 0xFE | self->_hasConcurrentExecution;
  -[SARecipe states](self, "states");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 0xFFFFFFFF)
  {
LABEL_8:
    v15 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[SADispatchQueue debugDescription](self, "debugDescription");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      -[SARecipe states](self, "states");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 136315394;
      v55 = v30;
      v56 = 2048;
      *(_QWORD *)v57 = v32;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "%s: %lu dispatchQueueStates", buf, 0x16u);

    }
    *__error() = v15;
    -[SADispatchQueue debugDescription](self, "debugDescription");
    a3 = ($82CD6472EE7B56EB03C663CAE55BF0B9 *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = -[$82CD6472EE7B56EB03C663CAE55BF0B9 UTF8String](a3, "UTF8String");
    -[SARecipe states](self, "states");
    self = (SADispatchQueue *)objc_claimAutoreleasedReturnValue();
    -[SADispatchQueue count](self, "count");
    _SASetCrashLogMessage(4984, "%s: %lu dispatchQueueStates", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
LABEL_11:
    v40 = *__error();
    _sa_logt();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      -[SADispatchQueue debugDescription](self, "debugDescription");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = objc_msgSend(v42, "UTF8String");
      v44 = *(_DWORD *)((char *)&a3->var2 + 2);
      v45 = -[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v55 = v43;
      v56 = 1024;
      *(_DWORD *)v57 = v44;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = v15;
      *(_WORD *)&v57[14] = 2048;
      *(_QWORD *)&v57[16] = v45;
      _os_log_error_impl(&dword_1B9BE0000, v41, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u dispatchQueueStates), ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v40;
    -[SADispatchQueue debugDescription](self, "debugDescription");
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = objc_msgSend(v46, "UTF8String");
    -[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4991, "%s: after serializing (with %u dispatchQueueStates), ended with length %ld, should be %lu", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
  }
  -[SARecipe states](self, "states");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)((char *)&a3->var2 + 2) = objc_msgSend(v11, "count");

  v12 = *(unsigned int *)((char *)&a3->var2 + 2);
  -[SARecipe states](self, "states");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var3, v12, v13, v8);

  v14 = &a3->var3 + 2 * *(unsigned int *)((char *)&a3->var2 + 2);
  v15 = 8 * *(unsigned int *)((char *)&a3->var2 + 2) + 24;
  if (v15 != -[SADispatchQueue sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
    goto LABEL_11;
  *(_QWORD *)v14 = SASerializableIndexForPointerFromSerializationDictionary(self->_dispatchQueueLabel, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SARecipe states](self, "states", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[NSString addSelfToSerializationDictionary:](self->_dispatchQueueLabel, "addSelfToSerializationDictionary:", v4);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  id result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_11;
  if (a4 <= 0xF)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 16;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(5014, "bufferLength %lu < serialized SADispatchQueue struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 10) + 16 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(v5 + 10);
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct with %u dispatchQueueStates", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(5015, "bufferLength %lu < serialized SADispatchQueue struct with %u dispatchQueueStates", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SADispatchQueue version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SADispatchQueue, *(_QWORD *)((char *)a3 + 2));
  result = (id)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)result + 24) = *(_BYTE *)(v5 + 14) & 1;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  unint64_t v6;
  uint64_t v7;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSString *v20;
  NSString *dispatchQueueLabel;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint8_t buf[4];
  unint64_t v50;
  __int16 v51;
  _WORD v52[17];

  *(_QWORD *)&v52[13] = *MEMORY[0x1E0C80C00];
  v48 = a5;
  v12 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_19;
  if (a4 <= 0xF)
  {
    v22 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v50 = a4;
      v51 = 2048;
      *(_QWORD *)v52 = 16;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct %lu", buf, 0x16u);
    }

    *__error() = v22;
    _SASetCrashLogMessage(5028, "bufferLength %lu < serialized SADispatchQueue struct %lu", v23, v24, v25, v26, v27, v28, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  v7 = *(unsigned int *)((char *)a3 + 10);
  v13 = 8 * v7;
  v6 = 8 * v7 + 16;
  if (v6 > a4)
  {
LABEL_13:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      v50 = a4;
      v51 = 1024;
      *(_DWORD *)v52 = v31;
      v52[2] = 2048;
      *(_QWORD *)&v52[3] = v6;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct v1 with %u dispatchQueueStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v29;
    _SASetCrashLogMessage(5030, "bufferLength %lu < serialized SADispatchQueue struct v1 with %u dispatchQueueStates (%llu)", v32, v33, v34, v35, v36, v37, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    v38 = *__error();
    _sa_logt();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      v50 = a4;
      v51 = 1024;
      *(_DWORD *)v52 = v40;
      v52[2] = 2048;
      *(_QWORD *)&v52[3] = v7;
      _os_log_error_impl(&dword_1B9BE0000, v39, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct v2 with %u dispatchQueueStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v38;
    _SASetCrashLogMessage(5037, "bufferLength %lu < serialized SADispatchQueue struct v2 with %u dispatchQueueStates (%llu)", v41, v42, v43, v44, v45, v46, a4);
    _os_crash();
    __break(1u);
LABEL_19:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SADispatchQueue version"), 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v47);
  }
  v14 = v12;
  v15 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 16, v7, v48, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_atomic(self, v16, v17, 8);

  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    v7 = v13 + 24;
    if (v13 + 24 <= a4)
    {
      v18 = *((_QWORD *)a3 + *(unsigned int *)((char *)a3 + 10) + 2);
      v19 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v18, v48, v14, v19, 0);
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      dispatchQueueLabel = self->_dispatchQueueLabel;
      self->_dispatchQueueLabel = v20;

      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_9:

}

@end
