@implementation NSString(CSSEscaping)

- (id)CM_stringByAddingCSSEscapes
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (qword_255AFDB10 != -1)
    dispatch_once(&qword_255AFDB10, &__block_literal_global_107);
  v2 = a1;
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("\\\\"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", _MergedGlobals_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\\a "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<"), CFSTR("\\3c "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), CFSTR("\\3e "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
