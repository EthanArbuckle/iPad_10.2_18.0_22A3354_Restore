@implementation SAPAStyleMountSnapshot

+ (id)classDictionaryKey
{
  return CFSTR("PASerializedMountSnapshot");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountSnapshot"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountSnapshot"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleMountSnapshot"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleMountSnapshot *v5;
  uint64_t v6;
  SAMountSnapshot *mountSnapshot;

  v5 = objc_alloc_init(SAPAStyleMountSnapshot);
  +[SAMountSnapshot mountSnapshotWithoutReferencesFromPAStyleMountSnapshot:]((uint64_t)SAMountSnapshot, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  mountSnapshot = v5->_mountSnapshot;
  v5->_mountSnapshot = (SAMountSnapshot *)v6;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountSnapshot, 0);
}

@end
