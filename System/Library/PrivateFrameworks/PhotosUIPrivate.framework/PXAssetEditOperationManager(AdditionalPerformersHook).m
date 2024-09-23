@implementation PXAssetEditOperationManager(AdditionalPerformersHook)

- (uint64_t)registerAdditionalPerformers
{
  objc_msgSend(a1, "registerPerformerClass:withPredicate:", objc_opt_class(), &__block_literal_global_55428);
  return objc_msgSend(a1, "registerPerformerClass:withPredicate:", objc_opt_class(), &__block_literal_global_134);
}

@end
