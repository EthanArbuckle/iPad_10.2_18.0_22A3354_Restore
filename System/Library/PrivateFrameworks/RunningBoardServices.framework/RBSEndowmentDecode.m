@implementation RBSEndowmentDecode

id __RBSEndowmentDecode_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  size_t count;
  void *v9;
  id v10;
  size_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD applier[4];
  id v21;

  v4 = a3;
  v5 = v4;
  switch(a2)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v4));
      goto LABEL_6;
    case 3:
      v7 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
      objc_msgSend(v7, "_setEndpoint:", v5);
      break;
    case 4:
      v6 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_6:
      v7 = (id)v6;
      break;
    case 5:
      count = xpc_array_get_count(v4);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __RBSEndowmentDecode_block_invoke_2;
      applier[3] = &unk_1E2D178E0;
      v10 = v9;
      v21 = v10;
      xpc_array_apply(v5, applier);
      if (count == objc_msgSend(v10, "count"))
        v7 = (id)objc_msgSend(v10, "copy");
      else
        v7 = 0;
      v13 = v21;
      goto LABEL_16;
    case 6:
      v11 = xpc_dictionary_get_count(v4);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __RBSEndowmentDecode_block_invoke_3;
      v18 = &unk_1E2D17908;
      v10 = v12;
      v19 = v10;
      xpc_dictionary_apply(v5, &v15);
      if (v11 == objc_msgSend(v10, "count", v15, v16, v17, v18))
        v7 = (id)objc_msgSend(v10, "copy");
      else
        v7 = 0;
      v13 = v19;
LABEL_16:

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

BOOL __RBSEndowmentDecode_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a3, &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  return v4 != 0;
}

BOOL __RBSEndowmentDecode_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;

  _RBSEndowmentUnwrapTypeAndDecodeWithBlock(a3, &__block_literal_global_10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

  }
  return v5 != 0;
}

@end
