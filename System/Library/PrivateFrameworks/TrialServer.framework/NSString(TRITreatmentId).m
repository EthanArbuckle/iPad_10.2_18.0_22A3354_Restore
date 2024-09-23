@implementation NSString(TRITreatmentId)

- (BOOL)triIsValidTreatmentId
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addCharactersInString:", CFSTR("-"));
  objc_msgSend(v3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v4) == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

@end
