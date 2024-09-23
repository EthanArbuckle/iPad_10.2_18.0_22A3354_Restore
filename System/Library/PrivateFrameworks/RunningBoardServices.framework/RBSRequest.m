@implementation RBSRequest

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSRequest;
  return -[RBSRequest init](&v3, sel_init);
}

- (RBSRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSRequest.m"), 23, CFSTR("-init is not allowed on RBSRequest"));

  return 0;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
