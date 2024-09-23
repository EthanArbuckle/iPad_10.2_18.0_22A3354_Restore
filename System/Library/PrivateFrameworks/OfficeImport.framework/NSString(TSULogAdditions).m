@implementation NSString(TSULogAdditions)

- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions arguments:
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%s"), CFSTR("<REDACT %s REDACT>"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%@"), CFSTR("<REDACT %@ REDACT>"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{public}s"), CFSTR("%s"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{public}@"), CFSTR("%@"), 0, 0, objc_msgSend(v5, "length"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v5, a4);
  if (tsu_initRedactedWithFormat_arguments__onceToken != -1)
    dispatch_once(&tsu_initRedactedWithFormat_arguments__onceToken, &__block_literal_global_210);
  objc_msgSend((id)tsu_initRedactedWithFormat_arguments__redactRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), CFSTR("<redacted>"));
  v7 = objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions arguments:
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%{public}"), CFSTR("%"), 0, 0, objc_msgSend(v5, "length"));
  v6 = objc_msgSend(a1, "initWithFormat:arguments:", v5, a4);

  return v6;
}

- (uint64_t)tsu_initRedactedWithFormat:()TSULogAdditions
{
  return objc_msgSend(a1, "tsu_initRedactedWithFormat:arguments:", a3, &a9, &a9, &a9);
}

- (uint64_t)tsu_initUnRedactedWithFormat:()TSULogAdditions
{
  return objc_msgSend(a1, "tsu_initUnRedactedWithFormat:arguments:", a3, &a9, &a9, &a9);
}

@end
