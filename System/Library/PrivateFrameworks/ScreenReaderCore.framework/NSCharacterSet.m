@implementation NSCharacterSet

void __59__NSCharacterSet_SCRCCharacterSetExtras__emojiCharacterSet__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &_block_invoke_emoji, 588);
  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  v1 = (void *)emojiCharacterSet_EmojiCharacterSet;
  emojiCharacterSet_EmojiCharacterSet = (uint64_t)v0;

  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInString:", v2);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127744, 1024);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127378, 9);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127344, 2);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127358, 2);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127490, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127543, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 126980, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127514, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127535, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127183, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127374, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127377, 10);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127489, 1);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127538, 9);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127568, 2);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 127462, 26);
  objc_msgSend((id)emojiCharacterSet_EmojiCharacterSet, "addCharactersInRange:", 8419, 1);

}

uint64_t __65__NSCharacterSet_SCRCCharacterSetExtras__modifierKeyCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)modifierKeyCharacterSet_modifierKeyCharacterSet;
  modifierKeyCharacterSet_modifierKeyCharacterSet = v0;

  return objc_msgSend((id)modifierKeyCharacterSet_modifierKeyCharacterSet, "addCharactersInString:", CFSTR("⇧⌃⌥⌘"));
}

@end
