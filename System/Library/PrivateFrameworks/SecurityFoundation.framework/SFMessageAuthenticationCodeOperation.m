@implementation SFMessageAuthenticationCodeOperation

+ (id)_defaultMacOperation
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMessageAuthenticationCodeOperation)init
{

  return 0;
}

- (SFMessageAuthenticationCodeOperation)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFMessageAuthenticationCodeOperation;
  return -[SFMessageAuthenticationCodeOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageAuthenticationCodeOperationInternal, 0);
}

@end
