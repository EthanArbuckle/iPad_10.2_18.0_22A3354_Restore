@implementation SAMountSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedThreadIDs, 0);
  objc_storeStrong((id *)&self->_timeWhenMeasured, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAMountSnapshot");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_blockedThreadIDs, "count") + 22;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t i;
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
  NSUInteger v31;
  id v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[SAMountSnapshot debugDescription](self, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v46 = objc_msgSend(v18, "UTF8String");
      v47 = 2048;
      v48 = -[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v49 = 2048;
      v50 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v16;
    -[SAMountSnapshot debugDescription](self, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    -[SAMountSnapshot sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(698, "%s: size %lu != buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
LABEL_14:
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[SAMountSnapshot debugDescription](self, "debugDescription");
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = objc_msgSend(v29, "UTF8String");
      v31 = -[NSArray count](self->_blockedThreadIDs, "count");
      *(_DWORD *)buf = 136315394;
      v46 = v30;
      v47 = 2048;
      v48 = v31;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "%s: %lu blockedThreadIDs", buf, 0x16u);

    }
    *__error() = v27;
    -[SAMountSnapshot debugDescription](self, "debugDescription");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "UTF8String");
    -[NSArray count](self->_blockedThreadIDs, "count");
    _SASetCrashLogMessage(707, "%s: %lu blockedThreadIDs", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(unint64_t *)((char *)&a3->var3 + 6) = *(_QWORD *)&self->_timestampOfLastResponse;
  *(_QWORD *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_timeWhenMeasured, v8);
  if (-[NSArray count](self->_blockedThreadIDs, "count") >= 0xFFFFFFFF)
    goto LABEL_14;
  *(_DWORD *)(&a3->var1 + 1) = -[NSArray count](self->_blockedThreadIDs, "count");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = self->_blockedThreadIDs;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = (_QWORD *)((char *)&a3->var4 + 6);
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v9);
        *v12++ = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "unsignedLongLongValue");
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v11);
  }

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
    -[SATimestamp addSelfToSerializationDictionary:](self->_timeWhenMeasured, "addSelfToSerializationDictionary:", v6);

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  SAMountSnapshot *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *blockedThreadIDs;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_14;
  if (a4 <= 0x15)
  {
    v13 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v31 = a4;
      v32 = 2048;
      v33 = 22;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountSnapshot struct %lu", buf, 0x16u);
    }

    *__error() = v13;
    _SASetCrashLogMessage(733, "bufferLength %lu < serialized SAMountSnapshot struct %lu", v14, v15, v16, v17, v18, v19, a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 2) + 22 > a4)
  {
LABEL_11:
    v20 = *__error();
    _sa_logt();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(unsigned int *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      v31 = a4;
      v32 = 2048;
      v33 = v22;
      _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(734, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads", v23, v24, v25, v26, v27, v28, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountSnapshot version"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v6 = objc_alloc_init(SAMountSnapshot);
  v6->_timestampOfLastResponse = *(double *)(v5 + 14);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v5 + 2));
  if (*(_DWORD *)(v5 + 2))
  {
    v8 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v5 + 22 + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while (v8 < *(unsigned int *)(v5 + 2));
  }
  v10 = objc_msgSend(v7, "copy");
  blockedThreadIDs = v6->_blockedThreadIDs;
  v6->_blockedThreadIDs = (NSArray *)v10;

  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *timeWhenMeasured;
  int v16;
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
  id v32;
  id v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x15)
  {
    v16 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v35 = a4;
      v36 = 2048;
      v37 = 22;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountSnapshot struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(754, "bufferLength %lu < serialized SAMountSnapshot struct %lu", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 2) + 22 > a4)
  {
LABEL_8:
    v23 = *__error();
    _sa_logt();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(unsigned int *)((char *)a3 + 2);
      *(_DWORD *)buf = 134218240;
      v35 = a4;
      v36 = 2048;
      v37 = v25;
      _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads", buf, 0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(755, "bufferLength %lu < serialized SAMountStatusTracker struct with %lu blockedThreads", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountSnapshot version"), 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 6);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v33, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timeWhenMeasured = self->_timeWhenMeasured;
  self->_timeWhenMeasured = v14;

}

+ (SAMountSnapshot)mountSnapshotWithoutReferencesFromPAStyleMountSnapshot:(uint64_t)a1
{
  SAMountSnapshot *v3;
  uint64_t v4;
  SATimestamp *timeWhenMeasured;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *blockedThreadIDs;

  objc_opt_self();
  v3 = objc_alloc_init(SAMountSnapshot);
  v3->_timestampOfLastResponse = *(double *)(a2 + 16);
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0, 0, *(double *)(a2 + 8), 0.0, 0.0);
  v4 = objc_claimAutoreleasedReturnValue();
  timeWhenMeasured = v3->_timeWhenMeasured;
  v3->_timeWhenMeasured = (SATimestamp *)v4;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_DWORD *)(a2 + 24))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 28 + 8 * v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < *(unsigned int *)(a2 + 24));
  }
  v9 = objc_msgSend(v6, "copy");
  blockedThreadIDs = v3->_blockedThreadIDs;
  v3->_blockedThreadIDs = (NSArray *)v9;

  return v3;
}

@end
