@implementation NSError

BOOL __52__NSError_SCKAdditions__sck_hasUnderlyingErrorCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
    v5 = objc_msgSend(v3, "code") == *(_QWORD *)(a1 + 32);
  else
    v5 = 0;

  return v5;
}

@end
