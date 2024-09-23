@implementation NSPredicate(RelativeRanks)

+ (id)_predicateForItemsWithAttribute:()RelativeRanks
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__NSPredicate_RelativeRanks___predicateForItemsWithAttribute___block_invoke;
  v4[3] = &__block_descriptor_36_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
