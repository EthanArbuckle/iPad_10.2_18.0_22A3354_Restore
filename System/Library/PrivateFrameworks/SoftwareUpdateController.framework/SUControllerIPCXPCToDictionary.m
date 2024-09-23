@implementation SUControllerIPCXPCToDictionary

uint64_t __SUControllerIPCXPCToDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *bytes_ptr;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = MEMORY[0x249580634]();
  if (v6 == MEMORY[0x24BDACFF0])
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v5));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == MEMORY[0x24BDACF90])
  {
    v8 = (void *)MEMORY[0x24BDBCE50];
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    objc_msgSend(v8, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v5));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 != MEMORY[0x24BDACFD0])
      goto LABEL_9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", xpc_int64_get_value(v5));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;
  if (v7)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
LABEL_9:

  return 1;
}

@end
