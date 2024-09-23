@implementation TISupplementalLexicon(TextInputCore)

- (id)core_searchPrefixSet
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "searchPrefixes"))
  {
    v2 = (void *)objc_opt_new();
    if ((objc_msgSend(a1, "searchPrefixes") & 1) != 0)
      objc_msgSend(v2, "appendString:", CFSTR("@"));
    if ((objc_msgSend(a1, "searchPrefixes") & 2) != 0)
      objc_msgSend(v2, "appendString:", CFSTR("#"));
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
