@implementation TTSVBProcessIsVoicebankingd

void __TTSVBProcessIsVoicebankingd_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.voicebankingd"));

  if (v2)
    TTSVBProcessIsVoicebankingd__TTSVBProcessIsVoicebankingd = 1;
}

@end
