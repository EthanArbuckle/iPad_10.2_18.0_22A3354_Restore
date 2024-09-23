@implementation CNVCardValueEncoder

+ (id)substitutions
{
  if (substitutions_onceToken_1 != -1)
    dispatch_once(&substitutions_onceToken_1, &__block_literal_global_15);
  return (id)substitutions_sSubstitutions_1;
}

uint64_t __36__CNVCardValueEncoder_substitutions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D13AD0]);
  v1 = (void *)substitutions_sSubstitutions_1;
  substitutions_sSubstitutions_1 = (uint64_t)v0;

  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\n"), CFSTR("\r\n"));
  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\n"), CFSTR("\n"));
  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\n"), CFSTR("\r"));
  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\;"), CFSTR(";"));
  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\,"), CFSTR(","));
  objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", CFSTR("\\\\"), CFSTR("\\"));
  return objc_msgSend((id)substitutions_sSubstitutions_1, "setObject:forKey:", &stru_1E95708D8, &stru_1E9572C38);
}

+ (id)encodeValue:(id)a3
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
