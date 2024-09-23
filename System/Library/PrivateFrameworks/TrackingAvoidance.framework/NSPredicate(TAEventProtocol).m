@implementation NSPredicate(TAEventProtocol)

+ (id)predicateForTAEventsInDateInterval:()TAEventProtocol
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD1758];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__NSPredicate_TAEventProtocol__predicateForTAEventsInDateInterval___block_invoke;
  v8[3] = &unk_24D815038;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "predicateWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForTAEventsClass:()TAEventProtocol
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__NSPredicate_TAEventProtocol__predicateForTAEventsClass___block_invoke;
  v4[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v4[4] = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForTAEventsClass:()TAEventProtocol andEventSubtype:
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__NSPredicate_TAEventProtocol__predicateForTAEventsClass_andEventSubtype___block_invoke;
  v5[3] = &__block_descriptor_48_e25_B24__0_8__NSDictionary_16lu32l8;
  v5[4] = a3;
  v5[5] = a4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
