@implementation SAPAStyleHIDEvent

+ (id)classDictionaryKey
{
  return CFSTR("PASerializedHIDEvent");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleHIDEvent"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleHIDEvent"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleHIDEvent"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleHIDEvent *v5;
  uint64_t v6;
  SAHIDEvent *hidEvent;
  const __CFString *v9;
  id v10;

  if (!a3)
  {
    v9 = CFSTR("NULL serializedHIDEvent");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 1105100401)
  {
    v9 = CFSTR("Bad SAPAStyleHIDEvent magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = objc_alloc_init(SAPAStyleHIDEvent);
  +[SAHIDEvent hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:]((uint64_t)SAHIDEvent, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  hidEvent = v5->_hidEvent;
  v5->_hidEvent = (SAHIDEvent *)v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidEvent, 0);
}

@end
