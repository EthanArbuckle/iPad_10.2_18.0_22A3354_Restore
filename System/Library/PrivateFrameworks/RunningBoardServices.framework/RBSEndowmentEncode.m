@implementation RBSEndowmentEncode

void __RBSEndowmentEncode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  RBSEndowmentEncode(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
    v6 = v7;
  }
  else
  {
    *a4 = 1;
  }

}

void __RBSEndowmentEncode_block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    RBSEndowmentEncode(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), v8);
    else
      *a4 = 1;

  }
}

@end
