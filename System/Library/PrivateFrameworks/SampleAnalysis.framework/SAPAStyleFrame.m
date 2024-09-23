@implementation SAPAStyleFrame

+ (id)classDictionaryKey
{
  return CFSTR("PASampleFrame");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFrame"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFrame"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleFrame"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleFrame *v5;
  uint64_t v6;
  SAFrame *frame;
  id v9;

  if (!a3)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Passed in NULL buffer"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = objc_alloc_init(SAPAStyleFrame);
  +[SAFrame frameWithPAStyleSerializedFrame:]((uint64_t)SAFrame, (uint64_t)a3);
  v6 = objc_claimAutoreleasedReturnValue();
  frame = v5->_frame;
  v5->_frame = (SAFrame *)v6;

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
    v11 = CFSTR("Passed NULL buffer");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 826366246)
  {
    v11 = CFSTR("Bad PASampleFrame magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v10 = v9;
  -[SAFrame populateReferencesUsingPAStyleSerializedFrame:andDeserializationDictionary:andDataBufferDictionary:]((uint64_t)self->_frame, (uint64_t)a3, v13, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frame, 0);
}

@end
