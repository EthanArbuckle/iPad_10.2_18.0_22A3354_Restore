@implementation NotificationAttentionBasedSettingsChanged

void ___NotificationAttentionBasedSettingsChanged_block_invoke()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_attentionAwareSettingChanged");

}

@end
