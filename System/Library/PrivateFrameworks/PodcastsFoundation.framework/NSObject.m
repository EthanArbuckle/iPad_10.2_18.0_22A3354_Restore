@implementation NSObject

id __77__NSObject_NSKeyValueCoding_MTAdditions__mt_dictionaryWithValuesForKeyPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
