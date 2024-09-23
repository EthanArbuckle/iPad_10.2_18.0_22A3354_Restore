@implementation CNVCardActivityAlertEscapingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "charactersToTriggerStrategy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_cn_containsCharacterInSet:", v5);

  return v6;
}

+ (id)charactersToTriggerStrategy
{
  if (charactersToTriggerStrategy_onceToken != -1)
    dispatch_once(&charactersToTriggerStrategy_onceToken, &__block_literal_global_72);
  return (id)charactersToTriggerStrategy_sCharSet;
}

void __80__CNVCardActivityAlertEscapingSerializationStrategy_charactersToTriggerStrategy__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("=,\\\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)charactersToTriggerStrategy_sCharSet;
  charactersToTriggerStrategy_sCharSet = v0;

}

+ (id)serializeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "regex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), CFSTR("\\\\$1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)regex
{
  if (regex_onceToken_77 != -1)
    dispatch_once(&regex_onceToken_77, &__block_literal_global_78);
  return (id)regex_sRegEx_76;
}

void __58__CNVCardActivityAlertEscapingSerializationStrategy_regex__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([=,\\\\\"])"), 0, 0);
  v1 = (void *)regex_sRegEx_76;
  regex_sRegEx_76 = v0;

}

@end
