@implementation SASwiftTask

- (NSString)debugDescription
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SwiftTask %llu"), -[SARecipe identifier](self, "identifier"));
}

+ (id)classDictionaryKey
{
  return CFSTR("SASwiftTask");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  void *v2;
  unint64_t v3;

  -[SARecipe states](self, "states");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 8 * objc_msgSend(v2, "count") + 14;

  return v3;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SASwiftTask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[SASwiftTask debugDescription](self, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v43 = objc_msgSend(v18, "UTF8String");
      v44 = 2048;
      v45 = -[SASwiftTask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v46 = 2048;
      v47 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v16;
    -[SASwiftTask debugDescription](self, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    -[SASwiftTask sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5085, "%s: size %lu != buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
LABEL_7:
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[SASwiftTask debugDescription](self, "debugDescription");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      -[SARecipe states](self, "states");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      *(_DWORD *)buf = 136315394;
      v43 = v30;
      v44 = 2048;
      v45 = v32;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "%s: %lu swiftTaskStates", buf, 0x16u);

    }
    *__error() = v27;
    -[SASwiftTask debugDescription](self, "debugDescription");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = objc_msgSend(v33, "UTF8String");
    -[SARecipe states](self, "states");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "count");
    _SASetCrashLogMessage(5092, "%s: %lu swiftTaskStates", v36, v37, v38, v39, v40, v41, v34);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var1 + 1) = -[SARecipe identifier](self, "identifier");
  -[SARecipe states](self, "states");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 0xFFFFFFFF)
    goto LABEL_7;
  -[SARecipe states](self, "states");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)((char *)&a3->var2 + 2) = objc_msgSend(v11, "count");

  v12 = (char *)&a3->var2 + 6;
  v13 = *(unsigned int *)((char *)&a3->var2 + 2);
  -[SARecipe states](self, "states");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v12, v13, v14, v8);

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

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
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
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0xD)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 14;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(5115, "bufferLength %lu < serialized SASwiftTask struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 10) + 14 > a4)
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
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct with %u swiftTaskStates", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(5116, "bufferLength %lu < serialized SASwiftTask struct with %u swiftTaskStates", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SASwiftTask version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SASwiftTask, *(_QWORD *)((char *)a3 + 2));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  unint64_t v6;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
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
  _WORD v38[17];

  *(_QWORD *)&v38[13] = *MEMORY[0x1E0C80C00];
  v34 = a5;
  v11 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_13;
  if (a4 <= 0xD)
  {
    v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v36 = a4;
      v37 = 2048;
      *(_QWORD *)v38 = 14;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(5128, "bufferLength %lu < serialized SASwiftTask struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  v12 = *(unsigned int *)((char *)a3 + 10);
  v6 = 8 * v12 + 14;
  if (v6 > a4)
  {
LABEL_10:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      v36 = a4;
      v37 = 1024;
      *(_DWORD *)v38 = v26;
      v38[2] = 2048;
      *(_QWORD *)&v38[3] = v6;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct v1 with %u swiftTaskStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5130, "bufferLength %lu < serialized SASwiftTask struct v1 with %u swiftTaskStates (%llu)", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SASwiftTask version"), 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v13 = v11;
  v14 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 14, v12, v34, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_setProperty_atomic(self, v15, v16, 8);

}

@end
