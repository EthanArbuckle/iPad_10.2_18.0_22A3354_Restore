@implementation TIKeyboardHandwritingSpecialization

- (id)keyboardBehaviors
{
  return (id)objc_opt_new();
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)wordSeparator
{
  return &stru_251980880;
}

- (id)replacementForDoubleSpace
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[TIKeyboardFeatureSpecialization inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replacementForDoubleSpace");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("。");
  v5 = v3;

  return v5;
}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardHandwritingSpecialization;
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](&v5, sel_nonstopPunctuationCharacters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("☻"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

@end
