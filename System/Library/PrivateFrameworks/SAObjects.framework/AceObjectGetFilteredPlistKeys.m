@implementation AceObjectGetFilteredPlistKeys

void __AceObjectGetFilteredPlistKeys_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("$group"), CFSTR("$class"), CFSTR("aceId"), CFSTR("refId"), CFSTR("usefulnessScore"), CFSTR("mutatingCommand"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED010DE0;
  qword_1ED010DE0 = v0;

}

@end
