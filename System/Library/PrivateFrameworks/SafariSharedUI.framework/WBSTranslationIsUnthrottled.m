@implementation WBSTranslationIsUnthrottled

void __WBSTranslationIsUnthrottled_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  WBSTranslationIsUnthrottled_translationIsUnthrottled = objc_msgSend(v0, "BOOLForKey:", *MEMORY[0x1E0D8A6C0]);

}

@end
