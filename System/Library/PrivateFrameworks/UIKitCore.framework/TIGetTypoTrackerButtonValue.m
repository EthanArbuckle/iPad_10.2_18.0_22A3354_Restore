@implementation TIGetTypoTrackerButtonValue

void __TIGetTypoTrackerButtonValue_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("TypoTrackerButton"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAB0]);

}

void __TIGetTypoTrackerButtonValue_block_invoke_0()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("TypoTrackerButton"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAB0]);

}

@end
