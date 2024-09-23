@implementation CNVCardActivityAlertQuotingSerializationStrategy

+ (BOOL)strategyWouldAlterString:(id)a3
{
  return objc_msgSend(a3, "_cn_containsSubstring:", CFSTR(" "));
}

+ (id)serializeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(a1, "regex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "length");

  objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, v7, CFSTR("\\\\$1"));
  objc_msgSend(v5, "insertString:atIndex:", CFSTR("\"), 0);
  objc_msgSend(v5, "appendString:", CFSTR("\"));

  return v5;
}

+ (id)regex
{
  if (regex_onceToken != -1)
    dispatch_once(&regex_onceToken, &__block_literal_global_20);
  return (id)regex_sRegEx;
}

void __57__CNVCardActivityAlertQuotingSerializationStrategy_regex__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([\"])"), 0, 0);
  v1 = (void *)regex_sRegEx;
  regex_sRegEx = v0;

}

@end
