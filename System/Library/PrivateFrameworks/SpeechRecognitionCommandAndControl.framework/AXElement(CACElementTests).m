@implementation AXElement(CACElementTests)

+ (id)_testCombinationsFromTitle:()CACElementTests isCarPlayConnected:
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BDFEA68];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "_combinationsFromTitle:isCarPlayConnected:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
