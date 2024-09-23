@implementation STUConcreteUserDefaultsPrimitives

- (BOOL)shouldAutoAcceptRemoteInvitations
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ClassroomAutoAcceptRemoteInvitations"));

  return v3;
}

@end
