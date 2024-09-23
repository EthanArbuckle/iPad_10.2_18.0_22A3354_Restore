@implementation SAPAStyleThreadData

+ (id)classDictionaryKey
{
  return CFSTR("PASampleThreadData");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleThreadData"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleThreadData"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleThreadData"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleThreadData *v5;
  uint64_t v6;
  SAThreadState *threadState;
  unint64_t v8;
  const __CFString *v10;
  id v11;

  if (!a3)
  {
    v10 = CFSTR("NULL buffer");
    goto LABEL_21;
  }
  if ((unint64_t)(*(_QWORD *)a3 - 287528979) >= 7)
  {
    v10 = CFSTR("Bad magic");
LABEL_21:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v5 = objc_alloc_init(SAPAStyleThreadData);
  +[SAThreadState stateWithoutReferencesFromPAStyleSerializedThread:]((uint64_t)SAThreadState, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  threadState = v5->_threadState;
  v5->_threadState = (SAThreadState *)v6;

  v8 = *(_QWORD *)a3;
  if (*(_QWORD *)a3 > 0x11235818uLL)
  {
    v5->_dispatchQueueId = *((_QWORD *)a3 + 6);
    v5->_threadId = *((_QWORD *)a3 + 5);
    if ((*((_BYTE *)a3 + 115) & 8) == 0)
      return v5;
    goto LABEL_11;
  }
  if (*(_QWORD *)a3 == 287528984)
  {
    v5->_dispatchQueueId = *((_QWORD *)a3 + 6);
    v5->_threadId = *((_QWORD *)a3 + 5);
    if ((*((_BYTE *)a3 + 99) & 8) == 0)
      return v5;
    goto LABEL_11;
  }
  if (v8 <= 0x11235816)
  {
    switch(v8)
    {
      case 0x11235813uLL:
      case 0x11235814uLL:
        v5->_dispatchQueueId = *((_QWORD *)a3 + 2);
        v5->_threadId = *((_QWORD *)a3 + 7);
        break;
      case 0x11235815uLL:
        v5->_dispatchQueueId = *((_QWORD *)a3 + 4);
        v5->_threadId = *((_QWORD *)a3 + 3);
        if ((*((_BYTE *)a3 + 80) & 8) != 0)
          goto LABEL_11;
        break;
      case 0x11235816uLL:
        v5->_dispatchQueueId = *((_QWORD *)a3 + 5);
        v5->_threadId = *((_QWORD *)a3 + 4);
        if ((*((_BYTE *)a3 + 88) & 8) != 0)
          goto LABEL_11;
        break;
      default:
        return v5;
    }
  }
  else
  {
    v5->_dispatchQueueId = *((_QWORD *)a3 + 6);
    v5->_threadId = *((_QWORD *)a3 + 5);
    if ((*((_BYTE *)a3 + 96) & 8) != 0)
LABEL_11:
      v5->_isGlobalForcedIdle = 1;
  }
  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;
  id v13;

  v13 = a5;
  v9 = a6;
  if (!a3)
  {
    v11 = CFSTR("NULL buffer");
    goto LABEL_6;
  }
  if ((unint64_t)(*(_QWORD *)a3 - 287528979) >= 7)
  {
    v11 = CFSTR("Bad magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v10 = v9;
  -[SAThreadState populateReferencesUsingPAStyleSerializedThread:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_threadState, a3, v13, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadState, 0);
}

@end
