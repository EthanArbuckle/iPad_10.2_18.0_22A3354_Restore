@implementation TSWPListLanguageForInputLanguageString

uint64_t __TSWPListLanguageForInputLanguageString_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("zh-hans"), &unk_24D8FB0B8, CFSTR("zh_hans"), &unk_24D8FB0D0, CFSTR("zh-hant"), &unk_24D8FB0D0, CFSTR("zh_hant"), &unk_24D8FB0E8, CFSTR("ja-jp"), &unk_24D8FB100, CFSTR("ko-ko"), &unk_24D8FB0D0, CFSTR("zh"), &unk_24D8FB0E8, CFSTR("ja"), &unk_24D8FB100, CFSTR("ko"),
             &unk_24D8FB118,
             CFSTR("ar"),
             &unk_24D8FB130,
             CFSTR("he"),
             0);
  TSWPListLanguageForInputLanguageString::sMappings = result;
  return result;
}

@end
