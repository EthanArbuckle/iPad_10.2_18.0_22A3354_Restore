@implementation PSCandidate

void __29___PSCandidate_selfCandidate__block_invoke()
{
  void *v0;
  _PSCandidate *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = -[_PSCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:]([_PSCandidate alloc], "initWithDomainId:derivedIntentId:bundleId:recipientsId:", CFSTR("self"), CFSTR("self"), CFSTR("self"), 0);
  -[_PSCandidate candidateForDeduping](v1, "candidateForDeduping");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)selfCandidate__pasExprOnceResult;
  selfCandidate__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
