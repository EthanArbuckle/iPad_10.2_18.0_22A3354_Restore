@implementation WFForecastTypes

void __WFForecastTypes_block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 12; ++i)
    objc_msgSend(v3, "addIndex:", (1 << i));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)WFForecastTypes_Types;
  WFForecastTypes_Types = v1;

}

@end
