@implementation _UIORequestKeyShortcutHUDDismissalAction

+ (id)dismissalAction
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInfo:responder:", 0, 0);
}

- (BOOL)isPermitted
{
  return +[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled");
}

- (void)performActionFromConnection:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[_UIKeyShortcutHUDServer sharedHUDServer](_UIKeyShortcutHUDServer, "sharedHUDServer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissHUDForConnection:", v3);

}

@end
