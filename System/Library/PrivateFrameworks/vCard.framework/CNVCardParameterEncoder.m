@implementation CNVCardParameterEncoder

+ (id)encodeParameterValue:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByReplacingEncodableCharactersInString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByEnclosingInQuotesIfNecessary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)substitutions
{
  if (substitutions_onceToken_0 != -1)
    dispatch_once(&substitutions_onceToken_0, &__block_literal_global_11);
  return (id)substitutions_sSubstitutions_0;
}

uint64_t __40__CNVCardParameterEncoder_substitutions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13AD0]);
  v1 = (void *)substitutions_sSubstitutions_0;
  substitutions_sSubstitutions_0 = (uint64_t)v0;

  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^n"), CFSTR("\n\r"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^n"), CFSTR("\r\n"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^n"), CFSTR("\n"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^n"), CFSTR("\r"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^t"), CFSTR("\t"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^^"), CFSTR("^"));
  objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", CFSTR("^'"), CFSTR("\"));
  return objc_msgSend((id)substitutions_sSubstitutions_0, "setObject:forKey:", &stru_1E95708D8, &stru_1E9572C38);
}

+ (id)stringByReplacingEncodableCharactersInString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "substitutions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_stringByReplacingStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringByEnclosingInQuotesIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(a1, "mustEncloseStringInQuotes:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

+ (BOOL)mustEncloseStringInQuotes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR(",:;"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
