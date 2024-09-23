@implementation SSStringFromTopHit

void __SSStringFromTopHit_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v6[0] = CFSTR("SFTopHitNo");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  v6[1] = CFSTR("SFTopHitShouldBe");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  v6[2] = CFSTR("SFTopHitMustBe");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)SSStringFromTopHit__topHitValueStrings;
  SSStringFromTopHit__topHitValueStrings = v3;

}

@end
