@implementation TIGetCandidateViewExperimentsValue

void __TIGetCandidateViewExperimentsValue_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("CandidateViewExperiments"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAA0]);

}

@end
