@implementation SLShareableContentActionResponse

+ (id)response
{
  return objc_alloc_init((Class)a1);
}

- (SLShareableContentActionResponse)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLShareableContentActionResponse;
  return -[SLShareableContentActionResponse init](&v3, sel_init);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
