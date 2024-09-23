@implementation SALCMShowModalView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("ShowModalView");
}

+ (id)showModalView
{
  return objc_alloc_init((Class)a1);
}

- (SAAceView)view
{
  return (SAAceView *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("view"));
}

- (void)setView:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("view"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
