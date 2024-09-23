@implementation SAIOEvent

- (void)setEndTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_endTimestamp, a3);
}

+ (void)parseKTrace:(void *)a3 findingIOEvents:
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_self();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v3;
  v4 = v3;
  ktrace_events_range();
  v5 = v6;
  ktrace_events_single();

}

void __41__SAIOEvent_parseKTrace_findingIOEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  unsigned int v6;
  SAIOEvent *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a2 + 8);
  +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_DWORD *)(a2 + 48);
  if ((v6 & 4) != 0)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v7 = (SAIOEvent *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SAIOEvent setEndTimestamp:](v7, "setEndTimestamp:", v5);
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", v17);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v7 = -[SAIOEvent initWithStartTime:threadID:blockNumber:size:type:tier:]([SAIOEvent alloc], "initWithStartTime:threadID:blockNumber:size:type:tier:", v5, *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), v6 & 0xFFFFFFFC, (v6 >> 10) & 0xF);
    v8 = *(void **)(a1 + 32);
    v9 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v18 = *__error();
      _sa_logt();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v25 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "debugDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAIOEvent debugDescription](v7, "debugDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v23;
        v28 = 2112;
        v29 = v24;
        _os_log_fault_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_FAULT, "Existing IOEvent %@ when adding new event %@", buf, 0x16u);

        v9 = 0x1E0CB3000;
        v18 = v25;
      }

      *__error() = v18;
    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedLongLong:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v13);

  }
}

uint64_t __41__SAIOEvent_parseKTrace_findingIOEvents___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

- (SAIOEvent)initWithStartTime:(id)a3 threadID:(unint64_t)a4 blockNumber:(unint64_t)a5 size:(unint64_t)a6 type:(unint64_t)a7 tier:(unsigned int)a8
{
  unsigned int v9;
  id v15;
  SAIOEvent *v16;
  SAIOEvent *v17;
  objc_super v19;

  v9 = a7;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SAIOEvent;
  v16 = -[SAIOEvent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_startTimestamp, a3);
    v17->_size = a6;
    v17->_threadID = a4;
    v17->_tier = a8;
    v17->_rawType = v9;
    v17->_blockNumber = a5;
  }

  return v17;
}

- (NSString)type
{
  return (NSString *)+[SAIOEvent typeString:](SAIOEvent, "typeString:", self->_rawType);
}

+ (id)typeString:(unsigned int)a3
{
  unsigned int v4;

  if ((int)a3 > 167773439)
  {
    if ((int)a3 > 167773695)
    {
      if (a3 == 167773696)
        return CFSTR("ReadMigration");
      if (a3 == 167773712)
        return CFSTR("WriteMigration");
    }
    else
    {
      if (a3 == 167773440)
        return CFSTR("ReadTransform");
      if (a3 == 167773456)
        return CFSTR("WriteTransform");
    }
  }
  else if ((int)a3 > 167772927)
  {
    if (a3 == 167772928)
      return CFSTR("ReadMeta");
    if (a3 == 167772944)
      return CFSTR("WriteMeta");
  }
  else
  {
    if (a3 == 167772672)
      return CFSTR("ReadChunk");
    if (a3 == 167772688)
      return CFSTR("WriteChunk");
  }
  v4 = (a3 & 0x3020068) - 50462720;
  if (v4 > 0x4F)
    return CFSTR("Other");
  else
    return *(__CFString **)((char *)off_1E7146C40 + v4);
}

- (BOOL)isRead
{
  signed int rawType;
  unsigned __int16 v3;

  rawType = self->_rawType;
  LOBYTE(self) = 1;
  if (rawType > 167773439)
  {
    if (rawType > 167773695)
    {
      if (rawType == 167773696)
        return (char)self;
      v3 = 1552;
    }
    else
    {
      if (rawType == 167773440)
        return (char)self;
      v3 = 1296;
    }
  }
  else if (rawType > 167772927)
  {
    if (rawType == 167772928)
      return (char)self;
    v3 = 784;
  }
  else
  {
    if (rawType == 167772672)
      return (char)self;
    v3 = 528;
  }
  if (rawType == (v3 | 0xA000000))
    LOBYTE(self) = 0;
  else
    LODWORD(self) = (rawType >> 3) & 1;
  return (char)self;
}

- (NSString)debugDescription
{
  void *v3;
  unint64_t threadID;
  void *v5;
  unint64_t size;
  uint64_t tier;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  threadID = self->_threadID;
  -[SAIOEvent type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  size = self->_size;
  tier = self->_tier;
  -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IO Event [thread:0x%llx, type:%@, size 0x%llx tier:%d]\nstart:%@\n  end:%@"), threadID, v5, size, tier, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)size
{
  return self->_size;
}

- (unsigned)tier
{
  return self->_tier;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SAIOEvent type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v8, (uint64_t)CFSTR("type"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_size);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, CFSTR("size"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, CFSTR("tier"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_threadID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v8, CFSTR("threadID"), v7);

  SAJSONWriteDictionaryEntry(v8, CFSTR("startTime"), self->_startTimestamp);
  SAJSONWriteDictionaryEntry(v8, CFSTR("endTime"), self->_endTimestamp);

}

+ (id)classDictionaryKey
{
  return CFSTR("SAIOEvent");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 58;
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
  if (-[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SAIOEvent debugDescription](self, "debugDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v22 = objc_msgSend(v12, "UTF8String");
      v23 = 2048;
      v24 = -[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v25 = 2048;
      v26 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v10;
    -[SAIOEvent debugDescription](self, "debugDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    -[SAIOEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(221, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 513;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTimestamp, v8);
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_size;
  *(_QWORD *)((char *)&a3->var7 + 2) = self->_threadID;
  *(unint64_t *)((char *)&a3->var5 + 2) = self->_blockNumber;
  *(_DWORD *)((char *)&a3->var6 + 2) = self->_rawType;
  *(_DWORD *)((char *)&a3->var6 + 6) = self->_tier;
  *(unint64_t *)((char *)&a3->var4 + 2) = 0;

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
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTimestamp, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTimestamp, "addSelfToSerializationDictionary:", v6);
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
  int v15;
  NSObject *v16;
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
    goto LABEL_13;
  if (a4 <= 0x31)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 50;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAIOEvent struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(253, "bufferLength %lu < serialized SAIOEvent struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_10:
    v15 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 58;
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAIOEvent_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v15;
    _SASetCrashLogMessage(263, "bufferLength %lu < serialized SAIOEvent_v2 struct %lu", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAIOEvent version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  result = objc_alloc_init(SAIOEvent);
  *((_QWORD *)result + 6) = *(_QWORD *)((char *)a3 + 34);
  *((_QWORD *)result + 4) = *(_QWORD *)((char *)a3 + 18);
  *((_DWORD *)result + 3) = *(_DWORD *)((char *)a3 + 42);
  *((_DWORD *)result + 2) = *(_DWORD *)((char *)a3 + 46);
  if (*((unsigned __int8 *)a3 + 1) < 2u)
    return result;
  if (a4 <= 0x39)
    goto LABEL_10;
  *((_QWORD *)result + 5) = *(_QWORD *)((char *)a3 + 50);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *startTimestamp;
  unint64_t v16;
  void *v17;
  SATimestamp *v18;
  SATimestamp *endTimestamp;
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
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_7;
  if (a4 <= 0x31)
  {
    v20 = *__error();
    _sa_logt();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v31 = a4;
      v32 = 2048;
      v33 = 50;
      _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAIOEvent struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(276, "bufferLength %lu < serialized SAIOEvent struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAIOEvent version"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;

}

@end
