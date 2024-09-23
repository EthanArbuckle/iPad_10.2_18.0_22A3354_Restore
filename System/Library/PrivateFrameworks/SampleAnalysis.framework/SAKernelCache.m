@implementation SAKernelCache

+ (void)_doKernelCachesWork:(uint64_t)a1
{
  id v2;
  void (**v3)(id, uint64_t);

  v3 = a2;
  objc_opt_self();
  if (qword_1ED1DD870 != -1)
    dispatch_once(&qword_1ED1DD870, &__block_literal_global_365);
  v2 = (id)qword_1ED1DD868;
  objc_sync_enter(v2);
  v3[2](v3, qword_1ED1DD868);
  objc_sync_exit(v2);

}

void __37__SAKernelCache__doKernelCachesWork___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  v1 = (void *)qword_1ED1DD868;
  qword_1ED1DD868 = v0;

}

+ (id)kernelCacheWithUUID:(id)a3 loadAddress:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__SAKernelCache_kernelCacheWithUUID_loadAddress___block_invoke;
  v10[3] = &unk_1E7148180;
  v7 = v6;
  v12 = &v14;
  v13 = a4;
  v11 = v7;
  +[SAKernelCache _doKernelCachesWork:]((uint64_t)a1, v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__SAKernelCache_kernelCacheWithUUID_loadAddress___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  SAKernelCache *v11;
  void *v12;
  unint64_t v13;
  id v14;
  SAKernelCache *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id obj;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v41 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v41[4]);
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v10, "loadAddress") == v41[6])
        {
          objc_storeStrong((id *)(*(_QWORD *)(v41[5] + 8) + 40), v10);
          v19 = v5;
          goto LABEL_30;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = [SAKernelCache alloc];
  v12 = (void *)v41[4];
  v13 = v41[6];
  v14 = v12;
  if (v11)
  {
    v50.receiver = v11;
    v50.super_class = (Class)SAKernelCache;
    v15 = (SAKernelCache *)objc_msgSendSuper2(&v50, sel_init);
    v11 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_uuid, v12);
      v11->_loadAddress = v13;
    }
  }

  v16 = *(_QWORD *)(v41[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v11;

  objc_msgSend(v5, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "binaryLoadInfos");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v38 = v5;
      v39 = v3;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v20, "count"));
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v37 = v20;
      obj = v20;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            v27 = objc_msgSend(v26, "loadAddress");
            v28 = v27 - objc_msgSend(v19, "loadAddress");
            v29 = objc_msgSend(*(id *)(*(_QWORD *)(v41[5] + 8) + 40), "loadAddress") + v28;
            objc_msgSend(v26, "segment");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(v26, "segment");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v26, "isInKernelAddressSpace");
              objc_msgSend(v26, "exclave");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v31, v29, v32, v33);
            }
            else
            {
              objc_msgSend(v26, "binary");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v26, "isInKernelAddressSpace");
              objc_msgSend(v26, "exclave");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v31, v29, v34, v33);
            }
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "addObject:", v35);
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v23);
      }

      v36 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(v41[5] + 8) + 40), "setBinaryLoadInfos:", v36);

      v5 = v38;
      v3 = v39;
      v20 = v37;
    }

  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(*(_QWORD *)(v41[5] + 8) + 40));
LABEL_30:

}

+ (void)clearCaches
{
  +[SAKernelCache _doKernelCachesWork:]((uint64_t)a1, &__block_literal_global_367_0);
}

uint64_t __28__SAKernelCache_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] loadAddress:(unint64_t)a4
{
  unsigned __int8 uu1[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_loadAddress != a4)
    return 0;
  *(_QWORD *)uu1 = 0;
  v7 = 0;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", uu1);
  return uuid_compare(uu1, a3) == 0;
}

- (unint64_t)startAddress
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSArray firstObject](self->_binaryLoadInfos, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "loadAddress");
  else
    v4 = -1;

  return v4;
}

- (unint64_t)endAddress
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[NSArray lastObject](self->_binaryLoadInfos, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "length");
    if (v4)
      v5 = v4;
    else
      v5 = 0x10000000;
    v6 = v5 + objc_msgSend(v3, "loadAddress");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx Kernel cache <%@> (%lu binaries)"), self->_loadAddress, self->_uuid, -[NSArray count](self->_binaryLoadInfos, "count"));
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBinaryLoadInfos:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)loadAddress
{
  return self->_loadAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryFirstEntry(v6, (uint64_t)CFSTR("uuid"), v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_loadAddress);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v6, CFSTR("loadAddress"), v5);

  if (self->_binaryLoadInfos)
  {
    objc_msgSend(v6, "appendString:", CFSTR(",\"binaryLoadInfos\":"));
    SAJSONWriteArray(v6, self->_binaryLoadInfos);
  }

}

+ (id)classDictionaryKey
{
  return CFSTR("SAKernelCache");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSArray count](self->_binaryLoadInfos, "count") + 28;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  int v5;
  id v9;
  unsigned __int16 v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSUInteger v14;
  NSObject *v16;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var3 + 1) = self->_loadAddress;
  -[NSUUID getUUIDBytes:](self->_uuid, "getUUIDBytes:", a3->var2);
  if (-[SAKernelCache sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") == a4)
  {
    if (-[NSArray count](self->_binaryLoadInfos, "count") < 0xFFFF)
    {
      v10 = -[NSArray count](self->_binaryLoadInfos, "count");
      a3->var3 = v10;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 4, v10, self->_binaryLoadInfos, v9);
      goto LABEL_8;
    }
    v12 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[SAKernelCache debugDescription](self, "debugDescription");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v33 = objc_msgSend(v17, "UTF8String");
      v34 = 1024;
      LODWORD(v35) = 0xFFFF;
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "%s: more than %d binaries", buf, 0x12u);

    }
    *__error() = (int)v12;
    -[SAKernelCache debugDescription](self, "debugDescription");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    _SASetCrashLogMessage(5353, "%s: more than %d binaries", v20, v21, v22, v23, v24, v25, v19);

    v11 = _os_crash();
    __break(1u);
LABEL_12:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v33 = a4;
      v34 = 2048;
      v35 = 28;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "bufferLength %lu != serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v5;
    _SASetCrashLogMessage(5359, "bufferLength %lu != serialized SAKernelCache struct %lu", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
  }
  v5 = *__error();
  _sa_logt();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 != 28)
    goto LABEL_12;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SAKernelCache debugDescription](self, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSArray count](self->_binaryLoadInfos, "count");
    *(_DWORD *)buf = 138412546;
    v33 = (unint64_t)v13;
    v34 = 2048;
    v35 = v14;
    _os_log_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: SAKernelCache %@ got its %lu binaries after starting serialization!", buf, 0x16u);

  }
  *__error() = v5;
  a3->var3 = 0;
LABEL_8:

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
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_binaryLoadInfos;
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
  void *v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  _WORD v29[17];

  *(_QWORD *)&v29[13] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x1B)
  {
    v9 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v27 = a4;
      v28 = 2048;
      *(_QWORD *)v29 = 28;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v9;
    _SASetCrashLogMessage(5382, "bufferLength %lu < serialized SAKernelCache struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_8:
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      v27 = a4;
      v28 = 1024;
      *(_DWORD *)v29 = v18;
      v29[2] = 2048;
      *(_QWORD *)&v29[3] = 8 * v18 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5383, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", v19, v20, v21, v22, v23, v24, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAKernelCache version"), 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  uuidForBytes((uint64_t)a3 + 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SAKernelCache kernelCacheWithUUID:loadAddress:](SAKernelCache, "kernelCacheWithUUID:loadAddress:", v6, *(_QWORD *)(v5 + 20));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *binaryLoadInfos;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
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
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_14;
  if (a4 <= 0x1B)
  {
    v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v36 = a4;
      v37 = 2048;
      *(_QWORD *)v38 = 28;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(5397, "bufferLength %lu < serialized SAKernelCache struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_11:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = *((unsigned __int16 *)a3 + 9);
      *(_DWORD *)buf = 134218496;
      v36 = a4;
      v37 = 1024;
      *(_DWORD *)v38 = v26;
      v38[2] = 2048;
      *(_QWORD *)&v38[3] = 8 * v26 + 28;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5398, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAInstruction version"), 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v11 = v10;
  if (!-[NSArray count](self->_binaryLoadInfos, "count"))
  {
    v12 = *((unsigned __int16 *)a3 + 9);
    if (*((_WORD *)a3 + 9))
    {
      v13 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 28, v12, v34, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (NSArray *)objc_msgSend(v14, "copy");
      binaryLoadInfos = self->_binaryLoadInfos;
      self->_binaryLoadInfos = v15;

    }
  }

}

@end
