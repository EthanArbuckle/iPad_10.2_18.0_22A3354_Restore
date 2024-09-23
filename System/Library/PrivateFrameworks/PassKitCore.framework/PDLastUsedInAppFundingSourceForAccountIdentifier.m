@implementation PDLastUsedInAppFundingSourceForAccountIdentifier

void __PDLastUsedInAppFundingSourceForAccountIdentifier_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)CFPreferencesCopyAppValue(CFSTR("PDLastUsedInAppFundingSourceKey"), CFSTR("com.apple.passd"));
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
