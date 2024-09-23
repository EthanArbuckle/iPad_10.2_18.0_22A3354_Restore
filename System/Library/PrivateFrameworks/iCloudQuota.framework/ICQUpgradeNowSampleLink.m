@implementation ICQUpgradeNowSampleLink

void ___ICQUpgradeNowSampleLink_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Upgrade%CStorage%C>"), 160, 160);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLink linkWithText:options:action:parameters:](ICQLink, "linkWithText:options:action:parameters:", v2, 2, 3, MEMORY[0x1E0C9AA70]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ICQUpgradeNowSampleLink_sUpgradeNowSampleLink;
  _ICQUpgradeNowSampleLink_sUpgradeNowSampleLink = v0;

}

@end
