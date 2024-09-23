@implementation NSString(NSStringSASerializable)

+ (const)classDictionaryKey
{
  return CFSTR("NSStringPASeriablizable");
}

- (uint64_t)addSelfToBuffer:()NSStringSASerializable bufferLength:withCompletedSerializationDictionary:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v14;
  NSObject *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (!a3)
    goto LABEL_11;
  v9 = v8;
  if (!v8)
    goto LABEL_11;
  *(_QWORD *)a3 = 4277001901;
  objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    *(_QWORD *)(a3 + 8) = 1;
    *(_BYTE *)(a3 + 16) = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "length") + 1 > (unint64_t)(a4 - 16))
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = a4 - 17;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v26 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
      v27 = 2048;
      v28 = v16;
      v29 = 2048;
      v30 = objc_msgSend(v11, "length");
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "%s claimed it was %lu UTF8 characters, but ended up being %lu", buf, 0x20u);
    }

    *__error() = v14;
    v17 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
    objc_msgSend(v11, "length");
    _SASetCrashLogMessage(768, "%s claimed it was %lu UTF8 characters, but ended up being %lu", v18, v19, v20, v21, v22, v23, v17);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Invalid args"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  v12 = objc_retainAutorelease(v11);
  memmove((void *)(a3 + 16), (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  *(_BYTE *)(a3 + 16 + objc_msgSend(v12, "length")) = 0;
  *(_QWORD *)(a3 + 8) = objc_msgSend(v12, "length") + 1;
LABEL_7:

  return 1;
}

- (void)addSelfToSerializationDictionary:()NSStringSASerializable
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "classDictionaryKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);

}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4) + 17;
}

+ (uint64_t)newInstanceWithoutReferencesFromSerializedBuffer:()NSStringSASerializable bufferLength:
{
  uint64_t v3;
  uint64_t result;
  const __CFString *v5;
  id v6;

  if (!a3)
  {
    v5 = CFSTR("Invalid buffer");
    goto LABEL_12;
  }
  if (*a3 != 4277001901)
  {
    v5 = CFSTR("Bad SANSString magic");
    goto LABEL_12;
  }
  v3 = a3[1];
  if (!v3)
  {
    v5 = CFSTR("0-length SANSString");
    goto LABEL_12;
  }
  if (*((_BYTE *)a3 + v3 + 15))
  {
    v5 = CFSTR("Non-nul terminated SANSString");
    goto LABEL_12;
  }
  SANSStringForCString(a3 + 2);
  result = objc_claimAutoreleasedReturnValue();
  if (!result)
  {
    v5 = CFSTR("Got a nil string");
LABEL_12:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return result;
}

@end
