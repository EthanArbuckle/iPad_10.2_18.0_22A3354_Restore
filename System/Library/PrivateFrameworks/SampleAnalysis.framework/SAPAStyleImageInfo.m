@implementation SAPAStyleImageInfo

+ (id)classDictionaryKey
{
  return CFSTR("PAStackshotImageInfo");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleImageInfo"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleImageInfo"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleImageInfo"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleImageInfo *v5;
  uint64_t v6;
  SABinaryLoadInfo *binaryLoadInfo;
  const __CFString *v9;
  id v10;

  if (!a3)
  {
    v9 = CFSTR("NULL buffer for SAPAStyleImageInfo");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 2271560481)
  {
    v9 = CFSTR("Bad magic for SAPAStyleImageInfo");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v5 = objc_alloc_init(SAPAStyleImageInfo);
  +[SABinaryLoadInfo binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:]((uint64_t)SABinaryLoadInfo, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  binaryLoadInfo = v5->_binaryLoadInfo;
  v5->_binaryLoadInfo = (SABinaryLoadInfo *)v6;

  return v5;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v16;
  __int16 v17;
  uint8_t buf[16];

  v9 = a5;
  v10 = a6;
  v11 = v10;
  if (!v9 || !v10)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "Invalid args", buf, 2u);
    }
    goto LABEL_13;
  }
  if (!a3)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v14 = "WARNING: Passed NULL serializedImageInfo";
      v15 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_13:

    *__error() = v12;
    goto LABEL_14;
  }
  if (*(_QWORD *)a3 != 2271560481)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v14 = "WARNING: Bad magic value";
      v15 = (uint8_t *)&v16;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[SABinaryLoadInfo populateReferencesUsingPAStyleSerializedImageInfo:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_binaryLoadInfo, (uint64_t)a3, v9, v10);
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLoadInfo, 0);
}

@end
