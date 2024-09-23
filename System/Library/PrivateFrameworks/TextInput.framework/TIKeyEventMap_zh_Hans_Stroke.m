@implementation TIKeyEventMap_zh_Hans_Stroke

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TIKeyEventMap_zh_Hans_Stroke_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___onceToken_205 != -1)
    dispatch_once(&sharedInstance___onceToken_205, block);
  return (id)sharedInstance___keyEventMap_204;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)punctuationMap
{
  return (id)objc_msgSend((id)objc_opt_class(), "punctuationMap_zh_Hans");
}

@end
