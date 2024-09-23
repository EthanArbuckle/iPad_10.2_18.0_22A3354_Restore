@implementation WFSlangTag

+ (id)sixtyNineTag
{
  return CFSTR("SixtyNineWebFilterTag");
}

- (WFSlangTag)tagWithWebpage:(id)a3
{
  void *v3;
  WFSlangTag *v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(a3, "pageContent"), "lowercaseString");
  if ((objc_msgSend(v3, "WF_containsWord:", CFSTR("69")) & 1) == 0
    && (objc_msgSend(v3, "WF_containsWord:", CFSTR("sixty nine")) & 1) == 0
    && !objc_msgSend(v3, "WF_containsWord:", CFSTR("sixty-nine")))
  {
    return 0;
  }
  v4 = (WFSlangTag *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  -[WFSlangTag appendString:](v4, "appendString:", objc_msgSend((id)objc_opt_class(), "sixtyNineTag"));
  -[WFSlangTag appendString:](v4, "appendString:", CFSTR(" "));
  return v4;
}

@end
