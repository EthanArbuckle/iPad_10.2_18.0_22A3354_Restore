@implementation PLSearchStringByTrimmingApostrophes

void __PLSearchStringByTrimmingApostrophes_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("'’ʻʼ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PLSearchStringByTrimmingApostrophes_apostropheCharacterSet;
  PLSearchStringByTrimmingApostrophes_apostropheCharacterSet = v0;

}

@end
