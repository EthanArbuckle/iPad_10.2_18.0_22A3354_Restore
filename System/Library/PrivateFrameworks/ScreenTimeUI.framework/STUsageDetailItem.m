@implementation STUsageDetailItem

void __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke_2;
  v3[3] = &unk_24CED3DF8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "addOperationWithBlock:", v3);

}

uint64_t __54__STUsageDetailItem_UIAdditions__localizedDisplayName__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("localizedDisplayName"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("localizedDisplayName"));
}

@end
