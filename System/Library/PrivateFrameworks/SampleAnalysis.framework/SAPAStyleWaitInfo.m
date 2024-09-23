@implementation SAPAStyleWaitInfo

+ (id)classDictionaryKey
{
  return CFSTR("PASampleWaitInfo");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleWaitInfo"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleWaitInfo"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleWaitInfo"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_initWithSerializedWaitInfo:(id *)a3
{
  SAPAStyleWaitInfo *v4;
  uint64_t v5;
  SAWaitInfo *waitInfo;
  id v8;
  objc_super v9;

  if (!a3 || a3->var0 != 233811181)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Tried to initialize with bad waitinfo"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  v9.receiver = self;
  v9.super_class = (Class)SAPAStyleWaitInfo;
  v4 = -[SAPAStyleWaitInfo init](&v9, sel_init);
  if (v4)
  {
    +[SAWaitInfo stateWithPAStyleSerializedWaitInfo:]((uint64_t)SAWaitInfo, (uint64_t)a3);
    v5 = objc_claimAutoreleasedReturnValue();
    waitInfo = v4->_waitInfo;
    v4->_waitInfo = (SAWaitInfo *)v5;

  }
  return v4;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id v5;

  if (!a3)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Passed in NULL buffer"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return -[SAPAStyleWaitInfo _initWithSerializedWaitInfo:]([SAPAStyleWaitInfo alloc], "_initWithSerializedWaitInfo:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitInfo, 0);
}

@end
