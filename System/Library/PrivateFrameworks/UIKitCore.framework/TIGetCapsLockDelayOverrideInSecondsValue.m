@implementation TIGetCapsLockDelayOverrideInSecondsValue

void __TIGetCapsLockDelayOverrideInSecondsValue_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("CapsLockDelayOverrideInSeconds"), CFSTR("com.apple.keyboard"), &unk_1E1A972F0);

}

@end
