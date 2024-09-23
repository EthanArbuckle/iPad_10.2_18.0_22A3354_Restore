@implementation SAExclave

- (_QWORD)initWithIdentifier:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)SAExclave;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)v4[5];
    v4[5] = v5;

  }
  return v4;
}

- (void)initWithKCData:(void *)a3 name:(void *)a4 textLayout:
{
  id v7;
  _QWORD *v8;

  v7 = a4;
  if (a1)
  {
    v8 = -[SAExclave initWithIdentifier:](a1, *a2);
    a1 = v8;
    if (v8)
      -[SAExclave fillInName:textLayout:]((uint64_t)v8, a3, v7);
  }

  return a1;
}

- (void)fillInName:(void *)a3 textLayout:
{
  const char *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  const char *v10;
  id v11;
  SEL v12;
  void *v13;
  SEL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a1)
  {
    if (a2 && !*(_QWORD *)(a1 + 8))
    {
      SANSStringForCString(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v7;

    }
    if (v6)
    {
      v9 = objc_msgSend(objc_getProperty(v6, v5, 16, 1), "count");
      if (v9 > objc_msgSend(*(id *)(a1 + 24), "count"))
      {
        *(_QWORD *)(a1 + 32) = *(_QWORD *)(v6[1] + 8);
        if (objc_msgSend(objc_getProperty(v6, v10, 16, 1), "count"))
        {
          v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(objc_getProperty(v6, v12, 16, 1), "count"));
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v30 = v6;
          obj = objc_getProperty(v6, v14, 16, 1);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v33;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v33 != v17)
                  objc_enumerationMutation(obj);
                v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
                if (v19)
                {
                  v20 = *(_QWORD *)(v19 + 8);
                  v21 = v20 + 16;
                }
                else
                {
                  v20 = 0;
                  v21 = 16;
                }
                v22 = *(_QWORD *)v21;
                uuidForBytes(v20);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v23, 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[SABinary segmentWithCleanName:](v24, CFSTR("__TEXT"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v25)
                {
                  +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v24, CFSTR("__TEXT"), 0);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SABinary addSegment:](v24, v25);
                }
                +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v25, v22, 1, (void *)a1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v26);

                ++v18;
              }
              while (v16 != v18);
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
              v16 = v27;
            }
            while (v27);
          }

          +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v13);
          v28 = objc_msgSend(v13, "copy");
          v29 = *(void **)(a1 + 24);
          *(_QWORD *)(a1 + 24) = v28;

          v6 = v30;
        }
      }
    }
  }

}

- (BOOL)synthetic
{
  return self->_textlayout_flags & 1;
}

- (BOOL)unslid
{
  return (LOBYTE(self->_textlayout_flags) >> 1) & 1;
}

- (void)enumerateFrames:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v5 = v3;
      +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v4, v3);
      v3 = v5;
    }
  }

}

- (void)fixupFrameInstructionsWithNewInstructions:(_BYTE *)a3 foundNewBinaryInfo:
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (a1)
  {
    if (a3)
      *a3 = 0;
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      v7 = v5;
      +[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, v6, *(void **)(a1 + 24), 0, v5);
      v5 = v7;
    }
  }

}

- (NSString)debugDescription
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[SAExclave identifier](self, "identifier");
  -[SAExclave name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("exclave 0x%llx %@"), v4, v5);

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSArray)loadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFrames, 0);
  objc_storeStrong((id *)&self->_loadInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAExclave");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  SAExclave *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v2 = self;
  if (self)
    self = (SAExclave *)objc_getProperty(self, a2, 40, 1);
  v3 = -[SAExclave count](self, "count");
  -[SAExclave loadInfos](v2, "loadInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 8 * (objc_msgSend(v4, "count") + v3) + 34;

  return v5;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v9;
  void *v10;
  const char *v11;
  id i;
  unsigned int v13;
  unsigned int v14;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t buf[4];
  $D4B2CDE5810726702A84729949394ECB *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v16 = *__error();
    _sa_logt();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[SAExclave debugDescription](self, "debugDescription");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      a3 = ($D4B2CDE5810726702A84729949394ECB *)objc_msgSend(v18, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v46 = a3;
      v47 = 2048;
      v48 = -[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v49 = 2048;
      v50 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v16;
    -[SAExclave debugDescription](self, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (id)objc_msgSend(v19, "UTF8String");
    -[SAExclave sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(327, "%s: size %lu != buffer length %lu", v20, v21, v22, v23, v24, v25, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  *(_WORD *)&a3->var0 = 257;
  -[SAExclave name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(v10, v9);

  *(unint64_t *)((char *)&a3->var2 + 2) = -[SAExclave identifier](self, "identifier");
  if (!self)
    goto LABEL_16;
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_textlayout_flags;
  for (i = objc_getProperty(self, v11, 40, 1); ; i = 0)
  {
    a4 = (unint64_t)i;
    if ((unint64_t)objc_msgSend((id)a4, "count") >= 0xFFFFFFFF)
    {
LABEL_10:
      v26 = *__error();
      _sa_logt();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        -[SAExclave debugDescription](self, "debugDescription");
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        a3 = ($D4B2CDE5810726702A84729949394ECB *)objc_msgSend(v5, "UTF8String");
        v28 = objc_msgSend((id)a4, "count");
        *(_DWORD *)buf = 136315394;
        v46 = a3;
        v47 = 2048;
        v48 = v28;
        _os_log_error_impl(&dword_1B9BE0000, v27, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);

      }
      *__error() = v26;
      -[SAExclave debugDescription](self, "debugDescription");
      self = (SAExclave *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (id)-[SAExclave UTF8String](self, "UTF8String");
      objc_msgSend((id)a4, "count");
      _SASetCrashLogMessage(337, "%s: %lu rootFrames", v29, v30, v31, v32, v33, v34, (char)v9);

      _os_crash();
      __break(1u);
      goto LABEL_13;
    }
    v13 = objc_msgSend((id)a4, "count");
    *(_DWORD *)((char *)&a3->var4 + 2) = v13;
    SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var5 + 2, v13, (void *)a4, v9);
    -[SAExclave loadInfos](self, "loadInfos");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 0xFFFFFFFF)
      break;
LABEL_13:
    v35 = *__error();
    _sa_logt();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      -[SAExclave debugDescription](self, "debugDescription");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      a3 = ($D4B2CDE5810726702A84729949394ECB *)objc_msgSend(v9, "UTF8String");
      v37 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 136315394;
      v46 = a3;
      v47 = 2048;
      v48 = v37;
      _os_log_error_impl(&dword_1B9BE0000, v36, OS_LOG_TYPE_ERROR, "%s: %lu loadInfos", buf, 0x16u);

    }
    *__error() = v35;
    -[SAExclave debugDescription](self, "debugDescription");
    self = (SAExclave *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = -[SAExclave UTF8String](self, "UTF8String");
    objc_msgSend(v5, "count");
    _SASetCrashLogMessage(343, "%s: %lu loadInfos", v39, v40, v41, v42, v43, v44, v38);

    _os_crash();
    __break(1u);
LABEL_16:
    *(unint64_t *)((char *)&a3->var3 + 2) = 0;
  }
  v14 = objc_msgSend(v5, "count");
  *(_DWORD *)((char *)&a3->var4 + 6) = v14;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var5 + 8 * *(unsigned int *)((char *)&a3->var4 + 2) + 2, v14, v5, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  const char *v8;
  id Property;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SAExclave name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSelfToSerializationDictionary:", v4);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (self)
      Property = objc_getProperty(self, v8, 40, 1);
    else
      Property = 0;
    v10 = Property;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "addSelfToSerializationDictionary:", v4);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SAExclave loadInfos](self, "loadInfos", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "addSelfToSerializationDictionary:", v4);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
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
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(372, "bufferLength %lu < serialized SAExclave struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAExclave version"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  result = objc_alloc_init(SAExclave);
  *((_QWORD *)result + 2) = *(_QWORD *)((char *)a3 + 10);
  *((_QWORD *)result + 4) = *(_QWORD *)((char *)a3 + 18);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSString *v14;
  NSString *name;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *loadInfos;
  uint64_t v23;
  void *v24;
  NSMutableSet *v25;
  NSMutableSet *rootFrames;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  _WORD v49[9];

  *(_QWORD *)&v49[5] = *MEMORY[0x1E0C80C00];
  v45 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x21)
  {
    v27 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v47 = a4;
      v48 = 2048;
      *(_QWORD *)v49 = 34;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct %lu", buf, 0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(387, "bufferLength %lu < serialized SAExclave struct %lu", v28, v29, v30, v31, v32, v33, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 30) + *(_DWORD *)((char *)a3 + 26)) + 34 > a4)
  {
LABEL_8:
    v34 = *__error();
    _sa_logt();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = *(_DWORD *)((char *)a3 + 26);
      v37 = *(_DWORD *)((char *)a3 + 30);
      *(_DWORD *)buf = 134218496;
      v47 = a4;
      v48 = 1024;
      *(_DWORD *)v49 = v36;
      v49[2] = 1024;
      *(_DWORD *)&v49[3] = v37;
      _os_log_error_impl(&dword_1B9BE0000, v35, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos", buf, 0x18u);
    }

    *__error() = v34;
    _SASetCrashLogMessage(389, "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos", v38, v39, v40, v41, v42, v43, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAExclave version"), 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v45, v11, v13, 0);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v14;

  v16 = (char *)a3 + 34;
  v17 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 26) + 34;
  v18 = *(unsigned int *)((char *)a3 + 30);
  v19 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v45, v11, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (NSArray *)objc_msgSend(v20, "copy");
  loadInfos = self->_loadInfos;
  self->_loadInfos = v21;

  v23 = *(unsigned int *)((char *)a3 + 26);
  v24 = (void *)objc_opt_class();
  SASerializableNewMutableSetFromIndexList((uint64_t)v16, v23, v45, v11, v24);
  v25 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v25;

}

@end
