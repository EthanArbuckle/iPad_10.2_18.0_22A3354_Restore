@implementation NSUUID(NSUUIDSASerializable)

+ (const)classDictionaryKey
{
  return CFSTR("NSUUIDPASeriablizable");
}

- (uint64_t)addSelfToBuffer:()NSUUIDSASerializable bufferLength:withCompletedSerializationDictionary:
{
  id v7;
  void *v8;
  id v10;

  v7 = a5;
  if (!a3 || (v8 = v7) == 0)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Invalid args"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  *a3 = 4277006349;
  objc_msgSend(a1, "getUUIDBytes:", a3 + 1);

  return 1;
}

- (void)addSelfToSerializationDictionary:()NSUUIDSASerializable
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "classDictionaryKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);

}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return 24;
}

+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSUUIDSASerializable bufferLength:
{
  uint64_t result;
  const __CFString *v4;
  id v5;

  if (!a3)
  {
    v4 = CFSTR("Invalid buffer");
    goto LABEL_8;
  }
  if (*a3 != 4277006349)
  {
    v4 = CFSTR("Bad SANSUUID magic");
    goto LABEL_8;
  }
  uuidForBytes((uint64_t)(a3 + 1));
  result = objc_claimAutoreleasedReturnValue();
  if (!result)
  {
    v4 = CFSTR("Got a nil UUID");
LABEL_8:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return result;
}

@end
