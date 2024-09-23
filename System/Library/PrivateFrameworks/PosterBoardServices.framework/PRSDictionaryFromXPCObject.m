@implementation PRSDictionaryFromXPCObject

uint64_t __PRSDictionaryFromXPCObject_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  char *string_ptr;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithUTF8String:", a2);
  string_ptr = (char *)xpc_string_get_string_ptr(v6);

  if (string_ptr)
    string_ptr = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string_ptr);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", string_ptr, v7);

  return 1;
}

@end
