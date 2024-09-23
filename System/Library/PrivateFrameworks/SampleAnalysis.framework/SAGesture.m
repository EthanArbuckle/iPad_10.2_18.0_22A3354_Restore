@implementation SAGesture

- (SAGesture)initWithPid:(int)a3 type:(id)a4 startTime:(id)a5
{
  id v9;
  id v10;
  SAGesture *v11;
  SAGesture *v12;
  SATimeRange *v13;
  SATimeRange *timeRange;
  const char *v15;
  SATimeRange *v16;
  NSMutableArray *v17;
  NSMutableArray *hidEvents;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SAGesture;
  v11 = -[SAGesture init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_pid = a3;
    objc_storeStrong((id *)&v11->_gestureType, a4);
    v13 = objc_alloc_init(SATimeRange);
    timeRange = v12->_timeRange;
    v12->_timeRange = v13;

    v16 = v12->_timeRange;
    if (v16)
      objc_setProperty_atomic(v16, v15, v10, 8);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    hidEvents = v12->_hidEvents;
    v12->_hidEvents = v17;

  }
  return v12;
}

+ (void)parseKTrace:(char)a3 embedded:(void *)a4 findingGestureAndHIDEvents:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  v6 = a4;
  objc_opt_self();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)objc_opt_class();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke;
  v15[3] = &unk_1E7149FE0;
  v18 = a3;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  v17 = v10;
  objc_msgSend(v8, "parseKTrace:findingHIDEvents:", a2, v15);
  v14 = v9;
  ktrace_events_range();
  v13 = v10;
  v11 = v10;
  v12 = v14;
  ktrace_events_range();

}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_5;
  if (objc_msgSend(v3, "hidEventType") != 11)
    goto LABEL_5;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (id *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9[1], "addObject:", v10);

  }
  else
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t pid_for_thread;
  SAGesture *v5;
  void *v6;
  void *v7;
  void *v8;
  SAGesture *v9;

  pid_for_thread = *(unsigned int *)(a2 + 88);
  if ((pid_for_thread & 0x80000000) != 0)
    pid_for_thread = ktrace_get_pid_for_thread();
  v5 = [SAGesture alloc];
  +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SAGesture initWithPid:type:startTime:](v5, "initWithPid:type:startTime:", pid_for_thread, CFSTR("Scroll View Drag"), v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid_for_thread);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t pid_for_thread;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SEL v9;
  id Property;
  const char *v11;
  void *v12;
  void *v13;
  id self;

  pid_for_thread = *(unsigned int *)(a2 + 88);
  if ((pid_for_thread & 0x80000000) != 0)
    pid_for_thread = ktrace_get_pid_for_thread();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid_for_thread);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  self = (id)objc_claimAutoreleasedReturnValue();

  v7 = self;
  if (self)
  {
    +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Property = objc_getProperty(self, v9, 32, 1);
    if (Property)
      objc_setProperty_atomic(Property, v11, v8, 16);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid_for_thread);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v7 = self;
  }

}

- (NSString)debugDescription
{
  const char *v3;
  id v4;
  id v5;
  SEL v6;
  id Property;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    v5 = objc_getProperty(self, v3, 24, 1);
    Property = objc_getProperty(self, v6, 32, 1);
  }
  else
  {
    v5 = 0;
    Property = 0;
  }
  v8 = Property;
  objc_msgSend(v8, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v11 = objc_getProperty(self, v9, 8, 1);
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ %@ (%lu hid events)"), v5, v10, objc_msgSend(v11, "count"));

  return (NSString *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_gestureType, 0);
  objc_storeStrong((id *)&self->_hidEvents, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAGesture");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_hidEvents, "count") + 24;
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
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAGesture sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v11 = *__error();
    _sa_logt();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[SAGesture debugDescription](self, "debugDescription");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v33 = objc_msgSend(v13, "UTF8String");
      v34 = 2048;
      v35 = -[SAGesture sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v36 = 2048;
      v37 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v11;
    -[SAGesture debugDescription](self, "debugDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    -[SAGesture sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(932, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    v22 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = -[NSMutableArray count](self->_hidEvents, "count");
      *(_DWORD *)buf = 134217984;
      v33 = v24;
      _os_log_error_impl(&dword_1B9BE0000, v23, OS_LOG_TYPE_ERROR, "gesture with %lu hid events", buf, 0xCu);
    }

    *__error() = v22;
    v25 = -[NSMutableArray count](self->_hidEvents, "count");
    _SASetCrashLogMessage(941, "gesture with %lu hid events", v26, v27, v28, v29, v30, v31, v25);
    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_DWORD *)(&a3->var1 + 1) = self->_pid;
  *(_QWORD *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_gestureType, v8);
  *(unint64_t *)((char *)&a3->var3 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_timeRange, v8);
  if ((unint64_t)-[NSMutableArray count](self->_hidEvents, "count") >= 0xFFFF)
    goto LABEL_7;
  v9 = -[NSMutableArray count](self->_hidEvents, "count");
  HIWORD(a3->var4) = v9;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var5, v9, self->_hidEvents, v8);

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
    -[SATimeRange addSelfToSerializationDictionary:](self->_timeRange, "addSelfToSerializationDictionary:", v4);
    -[NSString addSelfToSerializationDictionary:](self->_gestureType, "addSelfToSerializationDictionary:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_hidEvents;
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
  uint64_t v16;
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
  _WORD v27[17];

  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_11;
  if (a4 <= 0x17)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      *(_QWORD *)v27 = 24;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(966, "bufferLength %lu < serialized SAGesture struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 11) + 24 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(unsigned __int16 *)(v5 + 22);
      *(_DWORD *)buf = 134218496;
      v25 = a4;
      v26 = 1024;
      *(_DWORD *)v27 = v16;
      v27[2] = 2048;
      *(_QWORD *)&v27[3] = 8 * v16 + 24;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v14;
    _SASetCrashLogMessage(967, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAGesture version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  result = objc_alloc_init((Class)objc_opt_class());
  *((_DWORD *)result + 4) = *(_DWORD *)(v5 + 2);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimeRange *v14;
  SATimeRange *timeRange;
  unint64_t v16;
  void *v17;
  NSString *v18;
  NSString *gestureType;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *hidEvents;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  _WORD v44[17];

  *(_QWORD *)&v44[13] = *MEMORY[0x1E0C80C00];
  v40 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_14;
  if (a4 <= 0x17)
  {
    v23 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v42 = a4;
      v43 = 2048;
      *(_QWORD *)v44 = 24;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct %lu", buf, 0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(980, "bufferLength %lu < serialized SAGesture struct %lu", v24, v25, v26, v27, v28, v29, a4);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 11) + 24 > a4)
  {
LABEL_11:
    v30 = *__error();
    _sa_logt();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = *((unsigned __int16 *)a3 + 11);
      *(_DWORD *)buf = 134218496;
      v42 = a4;
      v43 = 1024;
      *(_DWORD *)v44 = v32;
      v44[2] = 2048;
      *(_QWORD *)&v44[3] = 8 * v32 + 24;
      _os_log_error_impl(&dword_1B9BE0000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v30;
    _SASetCrashLogMessage(981, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", v33, v34, v35, v36, v37, v38, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAGesture version"), 0);
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v39);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 14);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v40, v11, v13);
  v14 = (SATimeRange *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  self->_timeRange = v14;

  v16 = *(_QWORD *)((char *)a3 + 6);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v40, v11, v17);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  gestureType = self->_gestureType;
  self->_gestureType = v18;

  objc_opt_class();
  if (*(uint64_t *)gSASerializationEncodedVersionBeingDecoded() <= 33
    && *(_BYTE *)gSASerializationEncodedDataIsEmbedded())
  {
    v20 = (void *)objc_opt_class();
  }
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 24, *((unsigned __int16 *)a3 + 11), v40, v11, v20);
  v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  hidEvents = self->_hidEvents;
  self->_hidEvents = v21;

}

@end
