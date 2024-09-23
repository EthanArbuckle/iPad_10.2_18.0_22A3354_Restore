@implementation UpgradeFlowSpecificationSampleForLevel

void ___UpgradeFlowSpecificationSampleForLevel_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _ICQUpgradeFlowSpecification *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[_ICQUpgradeOfferPageSpecification upgradeOfferPageSpecificationSampleForLevel:](_ICQUpgradeOfferPageSpecification, "upgradeOfferPageSpecificationSampleForLevel:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQUpgradeCompletePageSpecification upgradeCompletePageSpecificationSampleForLevel:](_ICQUpgradeCompletePageSpecification, "upgradeCompletePageSpecificationSampleForLevel:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_ICQFlowSpecification initWithPages:]([_ICQUpgradeFlowSpecification alloc], "initWithPages:", v4);
  v6 = (void *)_UpgradeFlowSpecificationSampleForLevel_sUpgradeFlowSpecification;
  _UpgradeFlowSpecificationSampleForLevel_sUpgradeFlowSpecification = (uint64_t)v5;

}

@end
