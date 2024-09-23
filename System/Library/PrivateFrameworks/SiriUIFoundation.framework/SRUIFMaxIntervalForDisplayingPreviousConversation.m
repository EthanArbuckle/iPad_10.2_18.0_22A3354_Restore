@implementation SRUIFMaxIntervalForDisplayingPreviousConversation

void __SRUIFMaxIntervalForDisplayingPreviousConversation_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  SRUIFPreferences *v2;

  v2 = -[SRUIFPreferences initWithSuiteName:]([SRUIFPreferences alloc], "initWithSuiteName:", CFSTR("com.apple.SiriViewService"));
  v0 = -[SRUIFPreferences integerForKey:](v2, "integerForKey:", CFSTR("MaxIntervalForDisplayingPreviousConversation"));
  v1 = 30;
  if (v0 > 0)
    v1 = v0;
  if (v0 == -1)
    v1 = -1;
  SRUIFMaxIntervalForDisplayingPreviousConversation_maxInterval = v1;

}

@end
