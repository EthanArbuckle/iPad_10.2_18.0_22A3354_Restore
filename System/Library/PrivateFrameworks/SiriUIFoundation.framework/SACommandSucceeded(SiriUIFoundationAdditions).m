@implementation SACommandSucceeded(SiriUIFoundationAdditions)

+ (id)sruif_commandSucceededWithRefId:()SiriUIFoundationAdditions
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE811B8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setRefId:", v4);

  return v5;
}

@end
