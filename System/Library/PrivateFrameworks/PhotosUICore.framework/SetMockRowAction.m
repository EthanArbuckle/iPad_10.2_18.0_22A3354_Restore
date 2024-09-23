@implementation SetMockRowAction

uint64_t ___SetMockRowAction_block_invoke(uint64_t a1)
{
  void *v2;

  PXSharedUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("CPLStatusProviderMock"));

  return 1;
}

@end
