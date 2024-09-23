@implementation SAPAStyleMountStatus

+ (id)classDictionaryKey
{
  return CFSTR("PASerializedMountStatus");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountStatus"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountStatus"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountStatus"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleMountStatus *v4;
  SAMountStatus *v5;
  SAMountStatus *mountStatus;
  id v8;

  if (*(_QWORD *)a3 != 3735928559)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PAMountStatus magic"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v4 = objc_alloc_init(SAPAStyleMountStatus);
  v5 = objc_alloc_init(SAMountStatus);
  mountStatus = v4->_mountStatus;
  v4->_mountStatus = v5;

  return v4;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a5;
  v9 = a6;
  if (*(_QWORD *)a3 != 3735928559)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PAMountStatus magic"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v10 = v9;
  -[SAMountStatus populateReferencesUsingPAStyleSerializedMountStatus:andDeserializationDictionary:andDataBufferDictionary:](&self->_mountStatus->super.isa, (uint64_t)a3, v12, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountStatus, 0);
}

@end
