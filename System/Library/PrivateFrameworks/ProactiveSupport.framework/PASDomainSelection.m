@implementation PASDomainSelection

void __34___PASDomainSelection_description__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)description__pasExprOnceResult;
  description__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
