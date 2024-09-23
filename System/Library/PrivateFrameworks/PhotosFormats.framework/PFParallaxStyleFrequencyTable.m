@implementation PFParallaxStyleFrequencyTable

void __PFParallaxStyleFrequencyTable_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("TrueColors");
  v2[1] = CFSTR("TrueColors");
  v2[2] = CFSTR("TrueColors");
  v2[3] = CFSTR("TrueColors");
  v2[4] = CFSTR("BlackWhite");
  v2[5] = CFSTR("WarmColors");
  v2[6] = CFSTR("CoolColors");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFParallaxStyleFrequencyTable_frequencyTable;
  PFParallaxStyleFrequencyTable_frequencyTable = v0;

}

@end
