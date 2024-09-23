@implementation NSString(ICAXAdditions)

- (uint64_t)icaxLowPitchAttributedString
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "icaxAttributedStringForSpeakingStringInLowerPitch:", a1);
}

- (id)icaxAttributedStringWithLowPitchPrefix:()ICAXAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v11[1] = a1;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
  v8 = objc_msgSend(v4, "length");

  objc_msgSend(v7, "icaxApplyLowerPitchTokenToRange:", 0, v8);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

@end
