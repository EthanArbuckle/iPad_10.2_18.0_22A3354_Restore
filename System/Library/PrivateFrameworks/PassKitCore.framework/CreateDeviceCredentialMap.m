@implementation CreateDeviceCredentialMap

uint64_t __CreateDeviceCredentialMap_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

void __CreateDeviceCredentialMap_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_193);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

id __CreateDeviceCredentialMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostSpecificIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
