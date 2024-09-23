@implementation SAModelLoadedChange

- (SAModelLoadedChange)initWithTimestamp:(id)a3 endTime:(id)a4 userInitiated:(BOOL)a5 loadedRequesters:(id)a6 inMemory:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  SAModelLoadedChange *v16;
  SAModelLoadedChange *v17;
  uint64_t v18;
  NSArray *loadedRequesters;
  SAModelLoadedChange *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SAModelLoadedChange;
  v16 = -[SAModelLoadedChange init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timestamp, a3);
    objc_storeStrong((id *)&v17->_endTime, a4);
    v17->_userInitiated = a5;
    v18 = objc_msgSend(v15, "copy");
    loadedRequesters = v17->_loadedRequesters;
    v17->_loadedRequesters = (NSArray *)v18;

    v17->_inMemory = a7;
    v20 = v17;
  }

  return v17;
}

- (BOOL)loaded
{
  return self->_loadedRequesters != 0;
}

- (NSString)debugDescription
{
  id v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[SAModelLoadedChange loaded](self, "loaded");
  v5 = -[SAModelLoadedChange userInitiated](self, "userInitiated");
  -[SAModelLoadedChange loadedRequesters](self, "loadedRequesters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAModelLoadedChange timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("load change (loaded:%d UI:%d) requested by %@ at %@"), v4, v5, v7, v9);

  return (NSString *)v10;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)inMemory
{
  return self->_inMemory;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (NSArray)loadedRequesters
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedRequesters, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  SATimestamp *timestamp;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAModelLoadedChange loaded](self, "loaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)CFSTR("loaded"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SAModelLoadedChange userInitiated](self, "userInitiated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v7, CFSTR("userInitiated"), v5);

  timestamp = self->_timestamp;
  if (timestamp)
    SAJSONWriteDictionaryEntry(v7, CFSTR("timestamp"), timestamp);
  if (-[NSArray count](self->_loadedRequesters, "count"))
    SAJSONWriteDictionaryEntry(v7, CFSTR("loadedRequesters"), self->_loadedRequesters);

}

+ (id)classDictionaryKey
{
  return CFSTR("SAModelLoadedChange");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_loadedRequesters, "count") + 15;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  char *v5;
  id v9;
  char v10;
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
  id v25;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  id v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  id v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v13 = *__error();
    _sa_logt();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAModelLoadedChange debugDescription](self, "debugDescription");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v48 = objc_msgSend(v15, "UTF8String");
      v49 = 2048;
      v50 = -[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v51 = 2048;
      v52 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v13;
    -[SAModelLoadedChange debugDescription](self, "debugDescription");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (char *)objc_msgSend(v16, "UTF8String");
    -[SAModelLoadedChange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(304, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v9);
  BYTE2(a3->var2) = BYTE2(a3->var2) & 0xFE | -[SAModelLoadedChange loaded](self, "loaded");
  if (-[SAModelLoadedChange userInitiated](self, "userInitiated"))
    v10 = 2;
  else
    v10 = 0;
  BYTE2(a3->var2) = BYTE2(a3->var2) & 0xFD | v10;
  if (-[NSArray count](self->_loadedRequesters, "count") >= 0xFFFFFFFF)
  {
LABEL_11:
    v23 = *__error();
    _sa_logt();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[SAModelLoadedChange debugDescription](self, "debugDescription");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = (char *)objc_msgSend(v25, "UTF8String");
      v26 = -[NSArray count](self->_loadedRequesters, "count");
      *(_DWORD *)buf = 136315394;
      v48 = (uint64_t)v5;
      v49 = 2048;
      v50 = v26;
      _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "%s has %lu requesters", buf, 0x16u);

    }
    *__error() = v23;
    -[SAModelLoadedChange debugDescription](self, "debugDescription");
    a4 = (unint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a3 = ($9DA4A231F2B4D1689A952C857665C544 *)objc_msgSend((id)a4, "UTF8String");
    -[NSArray count](self->_loadedRequesters, "count");
    _SASetCrashLogMessage(313, "%s has %lu requesters", v27, v28, v29, v30, v31, v32, (char)a3);

    _os_crash();
    __break(1u);
LABEL_14:
    v33 = *__error();
    _sa_logt();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[SAModelLoadedChange debugDescription](self, "debugDescription");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = objc_msgSend(v35, "UTF8String");
      v37 = -[NSArray count](self->_loadedRequesters, "count");
      v38 = -[NSArray count](self->_loadedRequesters, "count");
      *(_DWORD *)buf = 136315906;
      v48 = v36;
      v49 = 2048;
      v50 = v37;
      v51 = 2048;
      v52 = &v5[8 * v38] - (char *)a3;
      v53 = 2048;
      v54 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v34, OS_LOG_TYPE_ERROR, "%s: after serializing (with %lu loadedRequesters), ended with length %ld, should be %lu", buf, 0x2Au);

    }
    *__error() = v33;
    -[SAModelLoadedChange debugDescription](self, "debugDescription");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend(v39, "UTF8String");
    -[NSArray count](self->_loadedRequesters, "count");
    -[NSArray count](self->_loadedRequesters, "count");
    _SASetCrashLogMessage(318, "%s: after serializing (with %lu loadedRequesters), ended with length %ld, should be %lu", v41, v42, v43, v44, v45, v46, v40);

    _os_crash();
    __break(1u);
  }
  v5 = (char *)&a3->var2 + 7;
  if (8 * -[NSArray count](self->_loadedRequesters, "count") + 15 != a4)
    goto LABEL_14;
  v11 = -[NSArray count](self->_loadedRequesters, "count");
  *(_DWORD *)((char *)&a3->var2 + 3) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var2 + 7, v11, self->_loadedRequesters, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSArray *v7;
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
    -[SATimestamp addSelfToSerializationDictionary:](self->_timestamp, "addSelfToSerializationDictionary:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_loadedRequesters;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

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
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0xE)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 15;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelLoadedChange struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(342, "bufferLength %lu < serialized SAModelLoadedChange struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 11) + 15 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(v5 + 11);
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(343, "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModelLoadedChange version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  result = objc_alloc_init(SAModelLoadedChange);
  *((_BYTE *)result + 9) = (*(_BYTE *)(v5 + 10) & 2) != 0;
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
  char *v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *loadedRequesters;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_13;
  if (a4 <= 0xE)
  {
    v21 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v40 = a4;
      v41 = 2048;
      v42 = 15;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelLoadedChange struct %lu", buf, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(356, "bufferLength %lu < serialized SAModelLoadedChange struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 11) + 15 > a4)
  {
LABEL_10:
    v28 = *__error();
    _sa_logt();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_DWORD *)((char *)a3 + 11);
      *(_DWORD *)buf = 134218240;
      v40 = a4;
      v41 = 1024;
      LODWORD(v42) = v30;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters", buf, 0x12u);
    }

    *__error() = v28;
    _SASetCrashLogMessage(357, "bufferLength %lu < serialized SAModelLoadedChange struct with %u requesters", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModelLoadedChange version"), 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v37);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v38, v11, v13, 0);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;

  if ((*((_BYTE *)a3 + 10) & 1) != 0)
  {
    v16 = (char *)a3 + 15;
    v17 = *(unsigned int *)((char *)a3 + 11);
    v18 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList((uint64_t)v16, v17, v38, v11, v18);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    loadedRequesters = self->_loadedRequesters;
    self->_loadedRequesters = v19;

  }
}

@end
