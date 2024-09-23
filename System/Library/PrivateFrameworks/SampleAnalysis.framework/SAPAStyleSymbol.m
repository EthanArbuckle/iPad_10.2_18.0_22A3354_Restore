@implementation SAPAStyleSymbol

+ (id)classDictionaryKey
{
  return CFSTR("PASymbol");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbol"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbol"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbol"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id result;
  id v6;

  if (*(_QWORD *)a3 >> 1 != 1278945817)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbol magic"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  result = objc_alloc_init(SAPAStyleSymbol);
  *((_QWORD *)result + 3) = *((_QWORD *)a3 + 3);
  *((_QWORD *)result + 2) = *((_QWORD *)a3 + 4);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSString *v13;
  NSString *name;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSArray *sourceInfos;
  id v19;
  id v20;

  v20 = a5;
  v9 = a6;
  if (*(_QWORD *)a3 >> 1 != 1278945817)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbol magic"), 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  v10 = v9;
  v11 = *((_QWORD *)a3 + 1);
  v12 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v11, v20, v10, v12, 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v13;

  if (*(_QWORD *)a3 > 0x98765432uLL)
  {
    v15 = *((_QWORD *)a3 + 5);
    if (v15)
    {
      v16 = (void *)objc_opt_class();
      SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 48, v15, v20, v10, v16);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sourceInfos = self->_sourceInfos;
      self->_sourceInfos = v17;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
