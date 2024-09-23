@implementation SAPAStyleTaskPrivateData

+ (id)classDictionaryKey
{
  return CFSTR("PASampleTaskDataPrivateData");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskPrivateData"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskPrivateData"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleTaskPrivateData"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleTaskPrivateData *v5;
  SAPAStyleTaskPrivateData *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  const __CFString *v11;
  id v12;

  if (!a3)
  {
    v11 = CFSTR("NULL serializedTaskPrivateData");
    goto LABEL_12;
  }
  if ((unint64_t)(*(_QWORD *)a3 - 2255827088) >= 3)
  {
    v11 = CFSTR("Bad SAPAStyleTaskPrivateData magic");
LABEL_12:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v5 = objc_alloc_init(SAPAStyleTaskPrivateData);
  v6 = v5;
  if (*(_QWORD *)a3 <= 0x86753090uLL)
  {
    if (newInstanceWithoutReferencesFromSerializedBuffer_bufferLength__onceToken != -1)
      dispatch_once(&newInstanceWithoutReferencesFromSerializedBuffer_bufferLength__onceToken, &__block_literal_global_4);
    v6->_suspend_count = *((_DWORD *)a3 + 2);
    v7 = *MEMORY[0x1E0C85AD8] * *((int *)a3 + 3);
    v6->_faults = *((_DWORD *)a3 + 4);
    v6->_pageins = *((_DWORD *)a3 + 5);
    v6->_cow_faults = *((_DWORD *)a3 + 6);
    v8 = *((unsigned int *)a3 + 7);
    v9 = *((_DWORD *)a3 + 8);
    v6->_task_size_bytes = v7;
    v6->_ss_flags = v8;
    v6->_latency_qos = v9;
  }
  else
  {
    v5->_suspend_count = *((_DWORD *)a3 + 6);
    v5->_task_size_bytes = *((_QWORD *)a3 + 1);
    v5->_faults = *((_DWORD *)a3 + 7);
    v5->_pageins = *((_DWORD *)a3 + 8);
    v5->_cow_faults = *((_DWORD *)a3 + 9);
    v5->_ss_flags = *((_QWORD *)a3 + 2);
    v5->_latency_qos = *((_DWORD *)a3 + 10);
    if (*(_QWORD *)a3 > 0x86753091uLL)
    {
      v5->_terminatedThreadsUserTimeInNs = *(_QWORD *)((char *)a3 + 44);
      v5->_terminatedThreadsSystemTimeInNs = *(_QWORD *)((char *)a3 + 52);
      v5->_terminatedThreadsInstructions = *(_QWORD *)((char *)a3 + 60);
      v5->_terminatedThreadsCycles = *(_QWORD *)((char *)a3 + 68);
    }
  }
  return v6;
}

uint64_t __90__SAPAStyleTaskPrivateData_newInstanceWithoutReferencesFromSerializedBuffer_bufferLength___block_invoke()
{
  return fprintf((FILE *)*MEMORY[0x1E0C80C10], "Warning: Assuming page size is %lu bytes for task size\n", *MEMORY[0x1E0C85AD8]);
}

@end
