@implementation SUControllerIPCDictionaryToXPC

void __SUControllerIPCDictionaryToXPC_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  xpc_object_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_retainAutorelease(v8);
      v9 = xpc_data_create((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = 0;
        goto LABEL_8;
      }
      v9 = xpc_int64_create(objc_msgSend(v8, "integerValue"));
    }
  }
  v11 = v9;
LABEL_8:
  v12 = *(void **)(a1 + 32);
  v13 = objc_retainAutorelease(v7);
  xpc_dictionary_set_value(v12, (const char *)objc_msgSend(v13, "UTF8String"), v11);
  *a4 = 0;

}

@end
