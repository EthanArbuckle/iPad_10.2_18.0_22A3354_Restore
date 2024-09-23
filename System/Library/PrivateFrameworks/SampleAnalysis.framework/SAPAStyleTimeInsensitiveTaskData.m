@implementation SAPAStyleTimeInsensitiveTaskData

+ (id)classDictionaryKey
{
  return CFSTR("PASampleTimeInsensitiveTaskData");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTimeInsensitiveTaskData"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTimeInsensitiveTaskData"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTimeInsensitiveTaskData"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleTimeInsensitiveTaskData *v5;
  uint64_t v6;
  SATask *task;
  const __CFString *v9;
  id v10;

  if (!a3)
  {
    v9 = CFSTR("Trying to init with nil serializedTimeInsensitiveTask_v5");
    goto LABEL_6;
  }
  if ((unint64_t)(*(_QWORD *)a3 - 4080925381) >= 3)
  {
    v9 = CFSTR("Bad SAPAStyleTimeInsensitiveTaskData magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = objc_alloc_init(SAPAStyleTimeInsensitiveTaskData);
  +[SATask taskWithoutReferencesFromPAStyleSerializedTask:]((uint64_t)SATask, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  task = v5->_task;
  v5->_task = (SATask *)v6;

  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  const __CFString *v10;
  id v11;
  id v12;

  v12 = a5;
  v9 = a6;
  if (!v12 || !v9)
  {
    v10 = CFSTR("Invalid args");
    goto LABEL_9;
  }
  if (!a3)
  {
    v10 = CFSTR("Passed NULL serializedTimeInsensitiveTask_v5");
    goto LABEL_9;
  }
  if ((unint64_t)(*(_QWORD *)a3 - 4080925381) >= 3)
  {
    v10 = CFSTR("Bad SAPAStyleTimeInsensitiveTaskData magic");
LABEL_9:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  -[SATask populateReferencesUsingPAStyleSerializedTask:andDeserializationDictionary:andDataBufferDictionary:](&self->_task->super.isa, a3, v12, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
