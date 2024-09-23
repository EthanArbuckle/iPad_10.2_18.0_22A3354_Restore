@implementation NSURL(StoreCacheAdditions)

+ (id)wf_inMemoryAddress
{
  if (wf_inMemoryAddress_onceToken != -1)
    dispatch_once(&wf_inMemoryAddress_onceToken, &__block_literal_global_1);
  return (id)wf__inMemoryAddress;
}

- (uint64_t)wf_isInMemoryAddress
{
  void *v1;
  uint64_t v2;

  if ((void *)wf__inMemoryAddress == a1)
    return 1;
  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("memory"));

  return v2;
}

@end
