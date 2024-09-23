@implementation TIGetFlexibleSmartWhitespaceEnabledValue

void __TIGetFlexibleSmartWhitespaceEnabledValue_block_invoke()
{
  id v0;

  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("FlexibleSmartWhitespaceEnabled"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAB0]);

}

@end
