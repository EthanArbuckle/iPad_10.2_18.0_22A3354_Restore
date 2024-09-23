@implementation PFPosterPathFileAttributes

void __PFPosterPathFileAttributes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD0CF0];
  v4[0] = *MEMORY[0x24BDD0CC8];
  v4[1] = v0;
  v1 = *MEMORY[0x24BDD0CF8];
  v5[0] = &unk_251549FE8;
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PFPosterPathFileAttributes___sharedInstance;
  PFPosterPathFileAttributes___sharedInstance = v2;

}

@end
