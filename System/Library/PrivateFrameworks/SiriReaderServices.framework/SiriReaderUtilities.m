@implementation SiriReaderUtilities

+ (id)readerStartingToneAudioAssetURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("ReadThisSound"), CFSTR("wav"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
