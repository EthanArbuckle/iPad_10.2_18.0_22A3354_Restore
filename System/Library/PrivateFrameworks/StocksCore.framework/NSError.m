@implementation NSError

BOOL __51__NSError_SCWAdditions__sc_hasUnderlyingErrorCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    v5 = objc_msgSend(v3, "code") == *(_QWORD *)(a1 + 32);
  else
    v5 = 0;

  return v5;
}

@end
