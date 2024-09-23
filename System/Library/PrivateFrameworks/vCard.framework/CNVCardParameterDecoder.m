@implementation CNVCardParameterDecoder

+ (id)substitutions
{
  if (substitutions_onceToken != -1)
    dispatch_once(&substitutions_onceToken, &__block_literal_global_10);
  return (id)substitutions_sSubstitutions;
}

uint64_t __40__CNVCardParameterDecoder_substitutions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13AD0]);
  v1 = (void *)substitutions_sSubstitutions;
  substitutions_sSubstitutions = (uint64_t)v0;

  objc_msgSend((id)substitutions_sSubstitutions, "setObject:forKey:", CFSTR("\n"), CFSTR("^n"));
  objc_msgSend((id)substitutions_sSubstitutions, "setObject:forKey:", CFSTR("\t"), CFSTR("^t"));
  objc_msgSend((id)substitutions_sSubstitutions, "setObject:forKey:", CFSTR("^"), CFSTR("^^"));
  return objc_msgSend((id)substitutions_sSubstitutions, "setObject:forKey:", CFSTR("\"), CFSTR("^'"));
}

+ (id)decodeParameterValue:(id)a3
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

@end
