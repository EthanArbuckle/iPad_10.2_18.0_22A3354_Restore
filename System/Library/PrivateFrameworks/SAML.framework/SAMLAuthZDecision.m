@implementation SAMLAuthZDecision

+ (id)createElement:(id *)a3
{
  SAMLAuthZDecision *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAuthZDecision alloc], "initWithTagName:error:", CFSTR("AuthzDecisiontStatement"), a3);
  if (v3)
  {
    SAMLAssertionNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (NSString)decision
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Decision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)resource
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Resource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)actions
{
  return (NSArray *)-[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Action"));
}

- (SAMLEvidence)evidence
{
  return (SAMLEvidence *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Element"));
}

@end
