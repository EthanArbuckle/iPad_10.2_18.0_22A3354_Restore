@implementation SAMLEvidence

+ (id)createElement:(id *)a3
{
  SAMLEvidence *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLEvidence alloc], "initWithTagName:error:", CFSTR("Element"), a3);
  if (v3)
  {
    SAMLAssertionNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (NSString)assertionIdRef
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AssertionIDRef"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)assertionURIRef
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AssertionURIRef"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (SAMLAssertion)assertion
{
  return (SAMLAssertion *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Assertion"));
}

@end
