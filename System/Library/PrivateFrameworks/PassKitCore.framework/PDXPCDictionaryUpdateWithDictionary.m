@implementation PDXPCDictionaryUpdateWithDictionary

uint64_t __PDXPCDictionaryUpdateWithDictionary_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !xpc_equal(v6, v5))
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

@end
