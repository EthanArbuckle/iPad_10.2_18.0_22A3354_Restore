@implementation SATTSSpeechSynthesisResource(VSAceObjectUtility)

- (id)vsDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resourceVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
