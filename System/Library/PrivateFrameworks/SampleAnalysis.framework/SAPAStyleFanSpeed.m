@implementation SAPAStyleFanSpeed

+ (id)classDictionaryKey
{
  return CFSTR("PASerializedFanSpeed");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFanSpeed"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFanSpeed"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFanSpeed"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleFanSpeed *v5;
  uint64_t v6;
  SAFanSpeed *fanSpeed;
  const __CFString *v9;
  id v10;

  if (!a3)
  {
    v9 = CFSTR("NULL serializedFanSpeed");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 4205488804)
  {
    v9 = CFSTR("Bad PAFanSpeed magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = objc_alloc_init(SAPAStyleFanSpeed);
  +[SAFanSpeed fanSpeedWithPAStyleSerializedFanSpeed:]((uint64_t)SAFanSpeed, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  fanSpeed = v5->_fanSpeed;
  v5->_fanSpeed = (SAFanSpeed *)v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fanSpeed, 0);
}

@end
