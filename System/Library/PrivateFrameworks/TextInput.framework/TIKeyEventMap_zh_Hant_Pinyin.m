@implementation TIKeyEventMap_zh_Hant_Pinyin

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TIKeyEventMap_zh_Hant_Pinyin_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_137 != -1)
    dispatch_once(&sharedInstance___onceToken_137, block);
  return (id)sharedInstance___keyEventMap_136;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)punctuationMap
{
  return (id)objc_msgSend((id)objc_opt_class(), "punctuationMap_zh_Hant");
}

@end
