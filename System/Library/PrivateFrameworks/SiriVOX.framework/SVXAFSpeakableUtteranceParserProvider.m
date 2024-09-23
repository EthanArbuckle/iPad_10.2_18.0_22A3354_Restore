@implementation SVXAFSpeakableUtteranceParserProvider

- (id)getWithLocale:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE09310];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLocale:", v4);

  return v5;
}

@end
