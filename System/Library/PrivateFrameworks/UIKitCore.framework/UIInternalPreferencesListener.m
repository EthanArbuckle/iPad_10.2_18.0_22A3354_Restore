@implementation UIInternalPreferencesListener

void _UIInternalPreferencesListener___COUNTER___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_UIVisualEffectViewPreferenceUpdate"), 0);

}

void _UIInternalPreferencesListener___COUNTER___block_invoke_0()
{
  id v0;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "postNotificationName:object:", CFSTR("_UIFocusBehaviorDidChangeNotification"), 0);

  }
}

@end
