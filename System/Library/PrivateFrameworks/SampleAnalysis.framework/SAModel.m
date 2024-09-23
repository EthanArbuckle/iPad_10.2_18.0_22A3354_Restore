@implementation SAModel

- (SAModel)initWithIdentifier:(id)a3
{
  id v4;
  SAModel *v5;
  uint64_t v6;
  NSString *identifier;
  NSMutableArray *v8;
  NSMutableArray *loadedChanges;
  NSMutableArray *v10;
  NSMutableArray *executions;
  SAModel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAModel;
  v5 = -[SAModel init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    loadedChanges = v5->_loadedChanges;
    v5->_loadedChanges = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    executions = v5->_executions;
    v5->_executions = v10;

    v12 = v5;
  }

  return v5;
}

- (NSArray)loadedChanges
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_loadedChanges, "copy");
}

- (NSArray)executions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_executions, "copy");
}

- (void)addExecution:(id)a3
{
  -[NSMutableArray addObject:](self->_executions, "addObject:", a3);
}

- (void)addLoadedChange:(id)a3
{
  -[NSMutableArray addObject:](self->_loadedChanges, "addObject:", a3);
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SAModel identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Model %@ with %lu load changes, %lu executions"), v4, -[NSMutableArray count](self->_loadedChanges, "count"), -[NSMutableArray count](self->_executions, "count"));

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)maxMemoryCostBytes
{
  return self->_maxMemoryCostBytes;
}

- (void)setMaxMemoryCostBytes:(unint64_t)a3
{
  self->_maxMemoryCostBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_executions, 0);
  objc_storeStrong((id *)&self->_loadedChanges, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)CFSTR("identifier"), self->_identifier);
  if (self->_maxMemoryCostBytes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, CFSTR("maxMemoryCostBytes"), v4);

  }
  if (-[NSMutableArray count](self->_loadedChanges, "count"))
  {
    -[SAModel loadedChanges](self, "loadedChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, CFSTR("loadedChanges"), v5);

  }
  if (-[NSMutableArray count](self->_executions, "count"))
  {
    -[SAModel executions](self, "executions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v7, CFSTR("executions"), v6);

  }
}

+ (id)classDictionaryKey
{
  return CFSTR("SAModel");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3;

  v3 = -[NSMutableArray count](self->_loadedChanges, "count");
  return 8 * (-[NSMutableArray count](self->_executions, "count") + v3) + 26;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v9;
  id v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  int v56;
  uint8_t buf[4];
  $F2866A4E0F716C88DFE0077AFF37461B *v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  unint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v15 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[SAModel debugDescription](self, "debugDescription");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v58 = a3;
      v59 = 2048;
      v60 = -[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v61 = 2048;
      v62 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v15;
    -[SAModel debugDescription](self, "debugDescription");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (id)objc_msgSend(v10, "UTF8String");
    -[SAModel sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(192, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_identifier, v9);
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_maxMemoryCostBytes;
  -[SAModel loadedChanges](self, "loadedChanges");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") >= 0xFFFFFFFF)
  {
LABEL_9:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[SAModel debugDescription](self, "debugDescription");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)objc_msgSend(v5, "UTF8String");
      v26 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      v59 = 2048;
      v60 = v26;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "%s has %lu loaded changes", buf, 0x16u);

    }
    *__error() = v24;
    -[SAModel debugDescription](self, "debugDescription");
    self = (SAModel *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = -[SAModel UTF8String](self, "UTF8String");
    objc_msgSend(v10, "count");
    _SASetCrashLogMessage(201, "%s has %lu loaded changes", v28, v29, v30, v31, v32, v33, v27);

    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  -[SAModel executions](self, "executions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 0xFFFFFFFF)
  {
LABEL_12:
    v11 = *__error();
    _sa_logt();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      -[SAModel debugDescription](self, "debugDescription");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)objc_msgSend(v10, "UTF8String");
      v35 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      v59 = 2048;
      v60 = v35;
      _os_log_error_impl(&dword_1B9BE0000, v34, OS_LOG_TYPE_ERROR, "%s has %lu executions", buf, 0x16u);

    }
    *__error() = v11;
    -[SAModel debugDescription](self, "debugDescription");
    self = (SAModel *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    a4 = -[SAModel UTF8String](self, "UTF8String");
    objc_msgSend(v5, "count");
    _SASetCrashLogMessage(204, "%s has %lu executions", v36, v37, v38, v39, v40, v41, a4);

    _os_crash();
    __break(1u);
LABEL_15:
    v56 = *__error();
    _sa_logt();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      -[SAModel debugDescription](self, "debugDescription");
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = objc_msgSend(v55, "UTF8String");
      v44 = objc_msgSend(v10, "count");
      v45 = objc_msgSend(v5, "count");
      v46 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136316162;
      v58 = ($F2866A4E0F716C88DFE0077AFF37461B *)v43;
      v59 = 2048;
      v60 = v44;
      v61 = 2048;
      v62 = v45;
      v63 = 2048;
      v64 = v11 + 8 * v46 - (_QWORD)a3;
      v65 = 2048;
      v66 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v42, OS_LOG_TYPE_ERROR, "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu", buf, 0x34u);

    }
    *__error() = v56;
    -[SAModel debugDescription](self, "debugDescription");
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v48 = objc_msgSend(v47, "UTF8String");
    objc_msgSend(v10, "count");
    objc_msgSend(v5, "count");
    objc_msgSend(v5, "count");
    _SASetCrashLogMessage(210, "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu", v49, v50, v51, v52, v53, v54, v48);

    _os_crash();
    __break(1u);
  }
  v11 = (unint64_t)&a3->var4 + 8 * objc_msgSend(v10, "count") + 2;
  if (v11 + 8 * objc_msgSend(v5, "count") - (_QWORD)a3 != a4)
    goto LABEL_15;
  v12 = objc_msgSend(v10, "count");
  *(_DWORD *)((char *)&a3->var3 + 2) = v12;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 2, v12, v10, v9);
  v13 = objc_msgSend(v5, "count");
  *(_DWORD *)((char *)&a3->var3 + 6) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((void *)v11, v13, v5, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[NSString addSelfToSerializationDictionary:](self->_identifier, "addSelfToSerializationDictionary:", v4);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_loadedChanges;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_executions;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "addSelfToSerializationDictionary:", v4, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  unint64_t v26;
  __int16 v27;
  _WORD v28[9];

  *(_QWORD *)&v28[5] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x19)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v26 = a4;
      v27 = 2048;
      *(_QWORD *)v28 = 26;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(240, "bufferLength %lu < serialized SAModel struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(v5 + 18);
      v17 = *(_DWORD *)(v5 + 22);
      *(_DWORD *)buf = 134218496;
      v26 = a4;
      v27 = 1024;
      *(_DWORD *)v28 = v16;
      v28[2] = 1024;
      *(_DWORD *)&v28[3] = v17;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", buf, 0x18u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(241, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModel version"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  result = objc_alloc_init(SAModel);
  *((_QWORD *)result + 4) = *(_QWORD *)(v5 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSString *v14;
  NSString *identifier;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *loadedChanges;
  char *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *executions;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint8_t buf[4];
  unint64_t v45;
  __int16 v46;
  _WORD v47[9];

  *(_QWORD *)&v47[5] = *MEMORY[0x1E0C80C00];
  v43 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x19)
  {
    v25 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v45 = a4;
      v46 = 2048;
      *(_QWORD *)v47 = 26;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct %lu", buf, 0x16u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(254, "bufferLength %lu < serialized SAModel struct %lu", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_8:
    v32 = *__error();
    _sa_logt();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = *(_DWORD *)((char *)a3 + 18);
      v35 = *(_DWORD *)((char *)a3 + 22);
      *(_DWORD *)buf = 134218496;
      v45 = a4;
      v46 = 1024;
      *(_DWORD *)v47 = v34;
      v47[2] = 1024;
      *(_DWORD *)&v47[3] = v35;
      _os_log_error_impl(&dword_1B9BE0000, v33, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", buf, 0x18u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(255, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", v36, v37, v38, v39, v40, v41, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAModel version"), 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v42);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v43, v11, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v14;

  v16 = *(unsigned int *)((char *)a3 + 18);
  v17 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 26, v16, v43, v11, v17);
  v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  loadedChanges = self->_loadedChanges;
  self->_loadedChanges = v18;

  v20 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 18) + 26;
  v21 = *(unsigned int *)((char *)a3 + 22);
  v22 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v20, v21, v43, v11, v22);
  v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  executions = self->_executions;
  self->_executions = v23;

}

@end
