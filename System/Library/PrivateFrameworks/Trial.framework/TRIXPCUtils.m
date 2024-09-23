@implementation TRIXPCUtils

+ (BOOL)validateSafeASCIISubsetIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = qword_1ECED7FF8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECED7FF8, &__block_literal_global_26);
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", _MergedGlobals_21);

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

void __49__TRIXPCUtils_validateSafeASCIISubsetIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_.-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = v2;

  objc_autoreleasePoolPop(v0);
}

@end
