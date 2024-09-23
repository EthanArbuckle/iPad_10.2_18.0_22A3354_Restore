@implementation SAPAStyleSourceInfo

+ (id)classDictionaryKey
{
  return CFSTR("PASymbolSourceInfo");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSourceInfo"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSourceInfo"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSourceInfo"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id result;
  id v6;

  if (*(_QWORD *)a3 != 1126258297)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbolSourceInfo magic"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  result = objc_alloc_init(SAPAStyleSourceInfo);
  *((_QWORD *)result + 2) = *((_QWORD *)a3 + 1);
  *((_QWORD *)result + 3) = *((_QWORD *)a3 + 2);
  *((_DWORD *)result + 2) = *((_DWORD *)a3 + 8);
  *((_DWORD *)result + 3) = *((_DWORD *)a3 + 9);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSString *v13;
  NSString *filePath;
  id v15;
  id v16;

  v16 = a5;
  v9 = a6;
  if (*(_QWORD *)a3 != 1126258297)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbolSourceInfo magic"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v10 = v9;
  v11 = *((_QWORD *)a3 + 3);
  v12 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v16, v10, v12, 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  filePath = self->_filePath;
  self->_filePath = v13;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
