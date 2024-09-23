@implementation NSMutableAttributedString(ICAXAdditions)

- (void)icaxApplyLowerPitchTokenToRange:()ICAXAdditions
{
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CF4228];
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAttributes:range:", v7, a3, a4);

}

@end
