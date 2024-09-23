@implementation SAMountStatus

- (void)enumerateSnapshotsBetweenStartTime:(void *)a3 endTime:(void *)a4 block:
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t, char *);
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id Property;
  double v18;
  double v19;
  uint64_t v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = *(id *)(a1 + 8);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v23;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15);
        if (!v7
          || (!v16
            ? (Property = 0)
            : (Property = objc_getProperty(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), v12, 8, 1)),
              (objc_msgSend(Property, "lt:", v7) & 1) == 0))
        {
          if (v8)
          {
            if (v16)
            {
              v18 = *(double *)(v16 + 16);
              objc_msgSend(v8, "machAbsTimeSeconds");
              if (v18 - v19 > 0.0)
                break;
            }
          }
          v21 = 0;
          v9[2](v9, v16, &v21);
          if (v21)
            break;
        }
        if (v13 == ++v15)
        {
          v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          v13 = v20;
          if (v20)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAMountStatus");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_snapshots, "count") + 20;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  unsigned __int16 v9;
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
  uint64_t v26;
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
  if (-[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SAMountStatus debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v36 = objc_msgSend(v13, "UTF8String");
      v37 = 2048;
      v38 = -[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v39 = 2048;
      v40 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SAMountStatus debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SAMountStatus sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(595, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[SAMountStatus debugDescription](self, "debugDescription");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = objc_msgSend(v24, "UTF8String");
      v26 = -[NSMutableArray count](self->_snapshots, "count");
      *(_DWORD *)buf = 136315394;
      v36 = v25;
      v37 = 2048;
      v38 = v26;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "%s: %lu snapshot", buf, 0x16u);

    }
    *__error() = v22;
    -[SAMountStatus debugDescription](self, "debugDescription");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = objc_msgSend(v27, "UTF8String");
    -[NSMutableArray count](self->_snapshots, "count");
    _SASetCrashLogMessage(603, "%s: %lu snapshot", v29, v30, v31, v32, v33, v34, v28);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var2 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_path, v8);
  *(unint64_t *)((char *)&a3->var3 + 4) = SASerializableIndexForPointerFromSerializationDictionary(self->_type, v8);
  if ((unint64_t)-[NSMutableArray count](self->_snapshots, "count") >= 0xFFFF)
    goto LABEL_7;
  v9 = -[NSMutableArray count](self->_snapshots, "count");
  a3->var2 = v9;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 4, v9, self->_snapshots, v8);

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
    v7 = self->_snapshots;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[NSString addSelfToSerializationDictionary:](self->_path, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_type, "addSelfToSerializationDictionary:", v4);
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
  if (a4 <= 0x13)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 20;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatus struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(631, "bufferLength %lu < serialized SAMountStatus struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 20 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatus struct with %u snapshots", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(632, "bufferLength %lu < serialized SAMountStatus struct with %u snapshots", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountStatus version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  return objc_alloc_init(SAMountStatus);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  NSString *v14;
  NSString *path;
  unint64_t v16;
  void *v17;
  NSString *v18;
  NSString *type;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *snapshots;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  int v43;
  id v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint8_t buf[4];
  unint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v53 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_15;
  if (a4 <= 0x13)
  {
    v24 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v55 = a4;
      v56 = 2048;
      v57 = 20;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatus struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(644, "bufferLength %lu < serialized SAMountStatus struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 20 > a4)
  {
LABEL_9:
    v31 = *__error();
    _sa_logt();
    self = (SAMountStatus *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      v32 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218240;
      v55 = a4;
      v56 = 1024;
      LODWORD(v57) = v32;
      _os_log_error_impl(&dword_1B9BE0000, &self->super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMountStatus struct with %u snapshots", buf, 0x12u);
    }

    *__error() = v31;
    _SASetCrashLogMessage(645, "bufferLength %lu < serialized SAMountStatus struct with %u snapshots", v33, v34, v35, v36, v37, v38, a4);
    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 4);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v53, v11, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v14;

  v16 = *(_QWORD *)((char *)a3 + 12);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v53, v11, v17);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v18;

  v20 = *((unsigned __int16 *)a3 + 1);
  if (v20 == 0xFFFF)
  {
LABEL_12:
    v39 = *__error();
    _sa_logt();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      -[SAMountStatus debugDescription](self, "debugDescription");
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v42 = objc_msgSend(v41, "UTF8String");
      v43 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 136315394;
      v55 = v42;
      v56 = 1024;
      LODWORD(v57) = v43;
      _os_log_error_impl(&dword_1B9BE0000, v40, OS_LOG_TYPE_ERROR, "%s: %u snapshots", buf, 0x12u);

    }
    *__error() = v39;
    -[SAMountStatus debugDescription](self, "debugDescription");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = objc_msgSend(v44, "UTF8String");
    _SASetCrashLogMessage(650, "%s: %u snapshots", v46, v47, v48, v49, v50, v51, v45);

    _os_crash();
    __break(1u);
LABEL_15:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAMountStatus version"), 0);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v52);
  }
  v21 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 20, v20, v53, v11, v21);
  v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  snapshots = self->_snapshots;
  self->_snapshots = v22;

}

- (void)populateReferencesUsingPAStyleSerializedMountStatus:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id Property;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = *(_QWORD *)(a2 + 8);
    v10 = (void *)objc_opt_class();
    SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v7, v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)a1[2];
    a1[2] = v11;

    v13 = *(_QWORD *)(a2 + 16);
    v14 = (void *)objc_opt_class();
    SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v7, v8, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)a1[3];
    a1[3] = v15;

    v17 = *(unsigned int *)(a2 + 24);
    v18 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList(a2 + 28, v17, v7, v8, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 24));
    v21 = (void *)a1[1];
    a1[1] = v20;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v32;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v22);
          Property = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v27);
          v29 = (void *)a1[1];
          if (Property)
            Property = objc_getProperty(Property, v24, 8, 1);
          v30 = Property;
          objc_msgSend(v29, "addObject:", v30, (_QWORD)v31);

          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v25);
    }

  }
}

@end
