@implementation SATimeRange

- (SATimeRange)initWithStart:(id)a3 end:(id)a4
{
  id v7;
  id v8;
  SATimeRange *v9;
  SATimeRange *v10;
  int v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "le:", v8) & 1) == 0)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "debugDescription");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v14, "UTF8String");
      objc_msgSend(v8, "debugDescription");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v28 = v15;
      v29 = 2080;
      v30 = objc_msgSend(v16, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "start time %s > end time %s", buf, 0x16u);

    }
    *__error() = v12;
    objc_msgSend(v7, "debugDescription");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "UTF8String");
    objc_msgSend(v8, "debugDescription");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "UTF8String");
    _SASetCrashLogMessage(567, "start time %s > end time %s", v20, v21, v22, v23, v24, v25, v18);

    _os_crash();
    __break(1u);
  }
  v26.receiver = self;
  v26.super_class = (Class)SATimeRange;
  v9 = -[SATimeRange init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startTime, a3);
    objc_storeStrong((id *)&v10->_endTime, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (id)timeRangeStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStart:end:", v7, v6);

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[SATimestamp compare:](self->_startTime, "compare:", v4);
  if (v5 == -1)
  {
    if (-[SATimestamp compare:](self->_endTime, "compare:", v4) == -1)
      v5 = -1;
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)deltaMachAbsTime
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = -[SATimestamp machAbsTime](self->_startTime, "machAbsTime");
  v4 = -[SATimestamp machAbsTime](self->_endTime, "machAbsTime");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  else
    return v4 - v3;
}

- (double)deltaMachAbsTimeSeconds
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[SATimestamp machAbsTimeSeconds](self->_startTime, "machAbsTimeSeconds");
  v4 = v3;
  -[SATimestamp machAbsTimeSeconds](self->_endTime, "machAbsTimeSeconds");
  v6 = v4 == 0.0 || v5 == 0.0;
  result = v5 - v4;
  if (v6)
    return 0.0;
  return result;
}

- (unint64_t)deltaMachContTime
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = -[SATimestamp machContTime](self->_startTime, "machContTime");
  v4 = -[SATimestamp machContTime](self->_endTime, "machContTime");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  else
    return v4 - v3;
}

- (double)deltaMachContTimeSeconds
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[SATimestamp machContTimeSeconds](self->_startTime, "machContTimeSeconds");
  v4 = v3;
  -[SATimestamp machContTimeSeconds](self->_endTime, "machContTimeSeconds");
  v6 = v4 == 0.0 || v5 == 0.0;
  result = v5 - v4;
  if (v6)
    return 0.0;
  return result;
}

- (double)deltaWallTime
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  -[SATimestamp wallTime](self->_startTime, "wallTime");
  v4 = v3;
  -[SATimestamp wallTime](self->_endTime, "wallTime");
  v6 = v4 == 0.0 || v5 == 0.0;
  result = v5 - v4;
  if (v6)
    return 0.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[SATimestamp copy](self->_startTime, "copy");
  v6 = (void *)-[SATimestamp copy](self->_endTime, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithStart:end:", v5, v6);

  return v7;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SATimestamp debugDescription](self->_startTime, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATimestamp debugDescription](self->_endTime, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("start: %@\n  end: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 8, 1);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendString:", CFSTR("\"startTime\":{"));
  -[SATimestamp writeJSONDictionaryEntriesToStream:](self->_startTime, "writeJSONDictionaryEntriesToStream:", v4);
  objc_msgSend(v4, "appendString:", CFSTR("},\"endTime\":{"));
  -[SATimestamp writeJSONDictionaryEntriesToStream:](self->_endTime, "writeJSONDictionaryEntriesToStream:", v4);
  objc_msgSend(v4, "appendString:", CFSTR("}"));

}

+ (id)classDictionaryKey
{
  return CFSTR("SATimeRange");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 18;
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
  if (-[SATimeRange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SATimeRange debugDescription](self, "debugDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v22 = objc_msgSend(v12, "UTF8String");
      v23 = 2048;
      v24 = -[SATimeRange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v25 = 2048;
      v26 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v10;
    -[SATimeRange debugDescription](self, "debugDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    -[SATimeRange sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(838, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTime, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTime, v8);

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
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTime, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTime, "addSelfToSerializationDictionary:", v6);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x11)
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v16 = a4;
      v17 = 2048;
      v18 = 18;
      _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimeRange struct %lu", buf, 0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(863, "bufferLength %lu < serialized SATimeRange struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATimeRange version"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  return objc_alloc_init(SATimeRange);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *startTime;
  unint64_t v16;
  void *v17;
  SATimestamp *v18;
  SATimestamp *endTime;
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
  if (*(unsigned __int8 *)a3 >= 2u)
    goto LABEL_7;
  if (a4 <= 0x11)
  {
    v20 = *__error();
    _sa_logt();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v31 = a4;
      v32 = 2048;
      v33 = 18;
      _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimeRange struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(873, "bufferLength %lu < serialized SATimeRange struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATimeRange version"), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  self->_endTime = v18;

}

@end
