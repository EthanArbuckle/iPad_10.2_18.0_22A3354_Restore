@implementation SAWSUpdate

+ (id)classDictionaryKey
{
  return CFSTR("PAWSUpdate");
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[SAWSUpdate classDictionaryKey](SAWSUpdate, "classDictionaryKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
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
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAWSUpdate sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v10 = *__error();
    _sa_logt();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SAWSUpdate debugDescription](self, "debugDescription");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v23 = objc_msgSend(v12, "UTF8String");
      v24 = 2048;
      v25 = -[SAWSUpdate sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v26 = 2048;
      v27 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v10;
    -[SAWSUpdate debugDescription](self, "debugDescription");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "UTF8String");
    -[SAWSUpdate sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(983, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
LABEL_8:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("No buffer or completedSerializationDictionary"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  if (!a3 || !v8)
    goto LABEL_8;
  *(_QWORD *)a3 = 287545748;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_frameStartTime;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_deferStartTime;
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_workStartTime;
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_workEndTime;

  return 1;
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 40;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id result;
  const __CFString *v6;
  id v7;

  if (!a3)
  {
    v6 = CFSTR("NULL buffer");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 287545748)
  {
    v6 = CFSTR("Bad SASerializedWSUpdateMagic magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  result = objc_alloc_init(SAWSUpdate);
  *((_QWORD *)result + 1) = *((_QWORD *)a3 + 1);
  *((_QWORD *)result + 2) = *((_QWORD *)a3 + 2);
  *((_QWORD *)result + 3) = *((_QWORD *)a3 + 3);
  *((_QWORD *)result + 4) = *((_QWORD *)a3 + 4);
  return result;
}

@end
