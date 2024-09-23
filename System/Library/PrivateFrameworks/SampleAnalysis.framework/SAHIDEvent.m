@implementation SAHIDEvent

- (double)thresholdToGroupSameEventType
{
  return 0.0;
}

- (NSString)hidEventTypeString
{
  unsigned int v2;
  void *v3;

  v2 = self->_hidEventType - 1;
  if (v2 <= 0xB && ((0xE0Fu >> v2) & 1) != 0)
    v3 = (void *)*((_QWORD *)&off_1E714A028 + (int)v2);
  else
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN(%d)"), self->_hidEventType);
  return (NSString *)v3;
}

+ (_QWORD)hidEventWithHIDEventType:(void *)a3 atTimestamp:
{
  id v5;
  _QWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  objc_opt_self();
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = v5;
  if (v6)
  {
    v12.receiver = v6;
    v12.super_class = (Class)SAHIDEvent;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    v6 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 4) = a2;
      objc_storeStrong((id *)v8 + 3, a3);
      v9 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
      v10 = (void *)v6[1];
      v6[1] = v9;

    }
  }

  return v6;
}

- (void)addKTraceEvent:(uint64_t)a1 fromSession:(uint64_t)a2
{
  SAHIDStep *v4;
  SAHIDStep *v5;
  void *v6;
  int v7;
  int pid_for_thread;
  void *v9;
  unsigned __int16 v10;
  int v11;
  unsigned int v12;
  unsigned __int16 v13;
  id v14;
  id *v15;
  id *v16;
  id v17;
  id *v18;
  objc_super v19;

  if (a1)
  {
    objc_opt_self();
    v4 = [SAHIDStep alloc];
    if (!v4)
    {
LABEL_37:

      return;
    }
    v5 = v4;
    +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_DWORD *)(a2 + 48);
    pid_for_thread = -1;
    if (v7 > 736428035)
    {
      if ((v7 - 736428036) <= 0x1C)
      {
        if (((1 << (v7 - 4)) & 0x1111111) != 0)
          goto LABEL_18;
        if (v7 == 736428064)
        {
          v9 = 0;
          pid_for_thread = *(_DWORD *)(a2 + 24);
LABEL_34:
          v14 = v6;
          v19.receiver = v5;
          v19.super_class = (Class)SAHIDStep;
          v15 = (id *)objc_msgSendSuper2(&v19, sel_init);
          v16 = v15;
          if (v15)
          {
            *((_DWORD *)v15 + 2) = v7;
            objc_storeStrong(v15 + 2, v6);
            *((_DWORD *)v16 + 3) = pid_for_thread;
            v16[3] = v9;

            v18 = v16;
            objc_msgSend(*(id *)(a1 + 8), "addObject:", v18);

            return;
          }

          v17 = 0;
          v4 = 0;
          goto LABEL_37;
        }
      }
      if ((v7 - 736493572) > 0xC)
      {
        v11 = *(_DWORD *)(a2 + 48);
        goto LABEL_20;
      }
      v11 = *(_DWORD *)(a2 + 48);
      if (((1 << (v7 - 4)) & 0x1111) == 0)
      {
LABEL_20:
        v9 = 0;
        if (v11 > 736428035)
        {
          if ((v11 - 736428036) > 0x18 || ((1 << (v11 - 4)) & 0x1111111) == 0)
          {
            v12 = v11 - 736493572;
            if (v12 > 0xC || ((1 << v12) & 0x1111) == 0)
              goto LABEL_34;
          }
          goto LABEL_33;
        }
        if (v11 > 730268059)
        {
          if ((v11 - 735576101) < 2)
            goto LABEL_33;
          v13 = 412;
        }
        else
        {
          if ((v11 - 730267892) <= 0x10 && ((1 << (v11 + 12)) & 0x10011) != 0)
            goto LABEL_33;
          v13 = 408;
        }
        if (v11 != (v13 | 0x2B870000))
          goto LABEL_34;
LABEL_33:
        v9 = *(void **)(a2 + 40);
        goto LABEL_34;
      }
LABEL_18:
      pid_for_thread = *(_DWORD *)(a2 + 88);
      v11 = *(_DWORD *)(a2 + 48);
      if (pid_for_thread < 0)
      {
        pid_for_thread = ktrace_get_pid_for_thread();
        v11 = *(_DWORD *)(a2 + 48);
      }
      goto LABEL_20;
    }
    if (v7 > 730268059)
    {
      if ((v7 - 735576101) < 2)
        goto LABEL_18;
      v10 = 412;
    }
    else
    {
      if ((v7 - 730267892) <= 0x10 && ((1 << (v7 + 12)) & 0x10011) != 0)
        goto LABEL_18;
      v10 = 408;
    }
    v11 = *(_DWORD *)(a2 + 48);
    if (v7 != (v10 | 0x2B870000))
      goto LABEL_20;
    goto LABEL_18;
  }
}

+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  ktrace_session *v13;

  v5 = a4;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__SAHIDEvent_parseKTrace_findingHIDEvents___block_invoke;
  v10[3] = &unk_1E7146BF8;
  v12 = v5;
  v13 = a3;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  v9 = (void *)MEMORY[0x1BCCCC450](v10);
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();
  ktrace_events_range();

}

void __43__SAHIDEvent_parseKTrace_findingHIDEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  BOOL v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v4 = HIDEventTimestampForKTraceEvent(a2);
  if (v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a2 + 48);
    v7 = (v6 - 736428036) > 0x1C || ((1 << (v6 - 4)) & 0x11111111) == 0;
    if (!v7
      || ((v6 - 736493572) <= 0xC ? (v8 = ((1 << (v6 - 4)) & 0x1111) == 0) : (v8 = 1),
          (v9 = v6 - 735576101, v8) ? (v10 = v9 >= 2) : (v10 = 0),
          !v10))
    {
      v11 = *(_DWORD *)(a2 + 16);
      if (v11)
      {
        v12 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v14 = (uint64_t)v23;
        if (!v23)
        {
          if (*(_DWORD *)(a2 + 48) == 735576102)
          {
            v15 = 0;
LABEL_27:

            return;
          }
          +[SATimestamp timestampWithMachAbsTime:fromKtraceSession:]((uint64_t)SATimestamp, v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)SAHIDEvent, v11, v16);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, v18);

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          v14 = (uint64_t)v24;
        }
        v25 = (id)v14;
        -[SAHIDEvent addKTraceEvent:fromSession:](v14, a2);
        v19 = *(_DWORD *)(a2 + 48);
        if (v19 == 730267896
          || v19 == 730268060
          || v19 == 736493584 && (v20 = *(const char **)(a2 + 80)) != 0 && strcmp(v20, "UIKitHostApp"))
        {
          v21 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v22);

        }
        v15 = v25;
        goto LABEL_27;
      }
    }
  }
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[SATimestamp debugDescription](self->_hidEventTimestamp, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ HID event type %d\n"), v4, self->_hidEventType);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_steps;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "debugDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSArray)steps
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (SATimestamp)hidEventTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)hidEventType
{
  return self->_hidEventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidEventTimestamp, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAHIDEvent");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 24 * -[NSMutableArray count](self->_steps, "count") + 18;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v5;
  id v9;
  unsigned __int16 v10;
  unint64_t v11;
  $1CB927D85F2FFBE2DD68615DF00AAEE4 *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unsigned __int8 *v19;
  NSObject *v21;
  id v22;
  id v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  int var2;
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
  v9 = a5;
  if (-[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v5 = *__error();
    _sa_logt();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[SAHIDEvent debugDescription](self, "debugDescription");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v55 = objc_msgSend(v22, "UTF8String");
      v56 = 2048;
      *(_QWORD *)v57 = -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v5;
    -[SAHIDEvent debugDescription](self, "debugDescription");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = objc_msgSend(v23, "UTF8String");
    -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(779, "%s: size %lu != buffer length %lu", v25, v26, v27, v28, v29, v30, v24);

    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  *(_WORD *)&a3->var0 = 513;
  a3->var3 = self->_hidEventType;
  a3->var4 = SASerializableIndexForPointerFromSerializationDictionary(self->_hidEventTimestamp, v9);
  if ((unint64_t)-[NSMutableArray count](self->_steps, "count") >= 0xFFFF)
  {
LABEL_13:
    v31 = *__error();
    _sa_logt();
    a3 = ($1CB927D85F2FFBE2DD68615DF00AAEE4 *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      v32 = -[NSMutableArray count](self->_steps, "count");
      *(_DWORD *)buf = 134217984;
      v55 = v32;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "hid event with %lu steps", buf, 0xCu);
    }

    *__error() = v31;
    v33 = -[NSMutableArray count](self->_steps, "count");
    _SASetCrashLogMessage(787, "hid event with %lu steps", v34, v35, v36, v37, v38, v39, v33);
    _os_crash();
    __break(1u);
LABEL_16:
    v40 = *__error();
    _sa_logt();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      -[SAHIDEvent debugDescription](self, "debugDescription");
      v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v43 = objc_msgSend(v42, "UTF8String");
      var2 = a3->var2;
      v45 = -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v55 = v43;
      v56 = 1024;
      *(_DWORD *)v57 = var2;
      *(_WORD *)&v57[4] = 2048;
      *(_QWORD *)&v57[6] = v5;
      *(_WORD *)&v57[14] = 2048;
      *(_QWORD *)&v57[16] = v45;
      _os_log_error_impl(&dword_1B9BE0000, v41, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u steps), ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v40;
    -[SAHIDEvent debugDescription](self, "debugDescription");
    v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v47 = objc_msgSend(v46, "UTF8String");
    -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(798, "%s: after serializing (with %u steps), ended with length %ld, should be %lu", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
  }
  v10 = -[NSMutableArray count](self->_steps, "count");
  a3->var2 = v10;
  if (v10)
  {
    v11 = 0;
    v12 = a3 + 2;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v12[-1].var0 = objc_msgSend(v13, "debugid");

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12[-1].var3 = objc_msgSend(v14, "pid");

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12[-1].var4 = objc_msgSend(v15, "tid");

      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v12->var0 = SASerializableIndexForPointerFromSerializationDictionary(v17, v9);
      v12 = ($1CB927D85F2FFBE2DD68615DF00AAEE4 *)((char *)v12 + 24);

      ++v11;
      v18 = a3->var2;
    }
    while (v11 < v18);
  }
  else
  {
    LODWORD(v18) = 0;
  }
  v19 = &a3[1].var0 + 24 * v18;
  v5 = 24 * v18 + 18;
  if (v5 != -[SAHIDEvent sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
    goto LABEL_16;
  objc_opt_class();
  *v19 = *v19 & 0xFE | objc_opt_isKindOfClass() & 1;

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
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_hidEventTimestamp, "addSelfToSerializationDictionary:", v4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_steps;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "timestamp", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSelfToSerializationDictionary:", v4);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  int v6;
  __objc2_class **v7;
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t *v12;
  void *v13;
  unsigned int v14;
  int v15;
  unint64_t v16;
  void *v17;
  int v19;
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
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  unint64_t v46;
  __int16 v47;
  _WORD v48[17];

  *(_QWORD *)&v48[13] = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_24;
  if (a4 <= 0xF)
  {
    v19 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v46 = a4;
      v47 = 2048;
      *(_QWORD *)v48 = 16;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAHIDEvent struct %lu", buf, 0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(821, "bufferLength %lu < serialized SAHIDEvent struct %lu", v20, v21, v22, v23, v24, v25, a4);
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 16 > a4)
  {
LABEL_18:
    v26 = *__error();
    _sa_logt();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218496;
      v46 = a4;
      v47 = 1024;
      *(_DWORD *)v48 = v28;
      v48[2] = 2048;
      *(_QWORD *)&v48[3] = 8 * v28 + 16;
      _os_log_error_impl(&dword_1B9BE0000, v27, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v26;
    _SASetCrashLogMessage(822, "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu", v29, v30, v31, v32, v33, v34, a4);
    _os_crash();
    __break(1u);
LABEL_21:
    v35 = *__error();
    _sa_logt();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = *(unsigned __int16 *)(v5 + 2);
      *(_DWORD *)buf = 134218240;
      v46 = a4;
      v47 = 1024;
      *(_DWORD *)v48 = v37;
      _os_log_error_impl(&dword_1B9BE0000, v36, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", buf, 0x12u);
    }

    *__error() = v35;
    _SASetCrashLogMessage(829, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", v38, v39, v40, v41, v42, v43, a4);
    _os_crash();
    __break(1u);
LABEL_24:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAHIDEvent version"), 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (24 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 18 <= a4)
    {
      v6 = *((_BYTE *)a3 + 24 * *((unsigned __int16 *)a3 + 1) + 16) & 1;
      goto LABEL_8;
    }
    goto LABEL_21;
  }
  v6 = *(unsigned __int8 *)gSASerializationEncodedDataIsEmbedded();
LABEL_8:
  if (v6)
    v7 = off_1E7145AF0;
  else
    v7 = off_1E7145AE8;
  v8 = objc_alloc_init(*v7);
  v8[4] = *(_DWORD *)(v5 + 4);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned __int16 *)(v5 + 2));
  v10 = (void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v9;

  if (*(_WORD *)(v5 + 2))
  {
    v11 = 0;
    v12 = (unint64_t *)(v5 + 24);
    do
    {
      v13 = (void *)*((_QWORD *)v8 + 1);
      v14 = *((_DWORD *)v12 - 2);
      v15 = *((_DWORD *)v12 - 1);
      v16 = *v12;
      v12 += 3;
      +[SAHIDStep hidStepWithDebugId:pid:tid:]((uint64_t)SAHIDStep, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v17);

      ++v11;
    }
    while (v11 < *(unsigned __int16 *)(v5 + 2));
  }
  return v8;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *hidEventTimestamp;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  _WORD v45[17];

  *(_QWORD *)&v45[13] = *MEMORY[0x1E0C80C00];
  v41 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_16;
  if (a4 <= 0xF)
  {
    v24 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v43 = a4;
      v44 = 2048;
      *(_QWORD *)v45 = 16;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAHIDEvent struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(860, "bufferLength %lu < serialized SAHIDEvent struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 1) + 16 > a4)
  {
LABEL_13:
    v31 = *__error();
    _sa_logt();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = *((unsigned __int16 *)a3 + 1);
      *(_DWORD *)buf = 134218496;
      v43 = a4;
      v44 = 1024;
      *(_DWORD *)v45 = v33;
      v45[2] = 2048;
      *(_QWORD *)&v45[3] = 8 * v33 + 16;
      _os_log_error_impl(&dword_1B9BE0000, v32, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v31;
    _SASetCrashLogMessage(861, "bufferLength %lu < serialized SAHIDEvent struct plus %u children %lu", v34, v35, v36, v37, v38, v39, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAHIDEvent version"), 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v11 = v10;
  v12 = *((_QWORD *)a3 + 1);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v41, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  hidEventTimestamp = self->_hidEventTimestamp;
  self->_hidEventTimestamp = v14;

  if (*((_WORD *)a3 + 1))
  {
    v16 = 0;
    v17 = (unint64_t *)((char *)a3 + 32);
    do
    {
      v18 = *v17;
      v17 += 3;
      v19 = (void *)objc_opt_class();
      SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v18, v41, v11, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      if (v21)
        objc_setProperty_atomic(v21, v22, v20, 16);

      ++v16;
    }
    while (v16 < *((unsigned __int16 *)a3 + 1));
  }

}

+ (id)hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  unsigned int *v9;
  void *v10;
  const char *v11;
  void *v12;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", *(_QWORD *)(a2 + 16), 0, *(double *)(a2 + 8), 0.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)SAHIDEvent, *(_DWORD *)(a2 + 24), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(a2 + 28) >= 0xFFFFu)
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(a2 + 28);
      *(_DWORD *)buf = 67109120;
      v24 = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "hid event with %u steps", buf, 8u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(875, "hid event with %u steps", v17, v18, v19, v20, v21, v22, *(_DWORD *)(a2 + 28));
    _os_crash();
    __break(1u);
  }
  v5 = (id *)v4;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 28));
  v7 = v5[1];
  v5[1] = (id)v6;

  if (*(_WORD *)(a2 + 28))
  {
    v8 = 0;
    v9 = (unsigned int *)(a2 + 52);
    do
    {
      +[SAHIDStep hidStepWithDebugId:pid:tid:]((uint64_t)SAHIDStep, *v9, *(v9 - 1), *(_QWORD *)(v9 - 3));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0, 0, *(double *)(a2 + 32), 0.0, 0.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_setProperty_atomic(v10, v11, v12, 16);
      v9 += 6;

      objc_msgSend(v5[1], "addObject:", v10);
      ++v8;
    }
    while (v8 < *(unsigned __int16 *)(a2 + 28));
  }

  return v5;
}

@end
