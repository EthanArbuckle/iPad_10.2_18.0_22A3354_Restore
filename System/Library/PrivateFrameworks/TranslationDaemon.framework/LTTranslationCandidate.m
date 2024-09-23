@implementation LTTranslationCandidate

id __56___LTTranslationCandidate_Osprey__initWithOspreyPhrase___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDF64C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithOspreyToken:", v3);

  return v4;
}

@end
