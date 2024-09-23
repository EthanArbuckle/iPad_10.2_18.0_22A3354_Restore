@implementation PSGProactiveInputPredictionsSystem

+ (void)start
{
  id v2;

  objc_opt_self();
  objc_msgSend(MEMORY[0x24BE28650], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerForActivity:handler:", 12, &__block_literal_global_14);

}

void __71__PSGProactiveInputPredictionsSystem__registerForCustomResponseHarvest__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BE28650], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:state:", v2, 5);

}

@end
