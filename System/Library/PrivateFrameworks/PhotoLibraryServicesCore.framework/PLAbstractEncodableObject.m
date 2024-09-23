@implementation PLAbstractEncodableObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PLAbstractEncodableObject *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PFAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (PLAbstractEncodableObject)initWithCoder:(id)a3
{
  id v4;
  PLAbstractEncodableObject *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PFAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end
