@implementation ACAccount

void __75__ACAccount_ICAccountAdditions__ic_setPrivateListeningEnabledForHomeUsers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

void __71__ACAccount_ICAccountAdditions__ic_privateListeningEnabledForHomeUsers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (_NSIsNSString() && _NSIsNSNumber())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  }
}

@end
