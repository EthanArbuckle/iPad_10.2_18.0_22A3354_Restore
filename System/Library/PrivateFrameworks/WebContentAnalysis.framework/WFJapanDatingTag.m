@implementation WFJapanDatingTag

+ (id)japanDatingTag
{
  return CFSTR("JapanDatingWebFilterTag");
}

- (WFJapanDatingTag)tagWithWebpage:(id)a3
{
  void *v3;
  const __CFString *v4;
  __CFString **v5;
  const __CFString *v6;
  WFJapanDatingTag *v7;

  v3 = (void *)objc_msgSend(a3, "pageContent");
  v4 = CFSTR("18歳以上");
  v5 = off_24C583AB0;
  while (!objc_msgSend(v3, "WF_containsWord:", v4))
  {
    v6 = *v5++;
    v4 = v6;
    if (!v6)
      return 0;
  }
  v7 = (WFJapanDatingTag *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  -[WFJapanDatingTag appendString:](v7, "appendString:", objc_msgSend((id)objc_opt_class(), "japanDatingTag"));
  -[WFJapanDatingTag appendString:](v7, "appendString:", CFSTR(" "));
  return v7;
}

@end
