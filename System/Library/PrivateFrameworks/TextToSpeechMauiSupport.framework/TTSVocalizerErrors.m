@implementation TTSVocalizerErrors

void __TTSVocalizerErrors_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("vocalizer_errors"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TTSVocalizerErrors_vocalizerErrors;
  TTSVocalizerErrors_vocalizerErrors = v1;

}

@end
