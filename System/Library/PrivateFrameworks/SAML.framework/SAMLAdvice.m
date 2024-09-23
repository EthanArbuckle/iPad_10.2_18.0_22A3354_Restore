@implementation SAMLAdvice

+ (id)createElement:(id *)a3
{
  SAMLAdvice *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAdvice alloc], "initWithTagName:error:", CFSTR("Advice"), a3);
  if (v3)
  {
    SAMLAssertionNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (SAMLAssertion)assertion
{
  return (SAMLAssertion *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Assertion"));
}

- (NSString)assertionIDRef
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

- (void)setAssertionIDRef:(id)a3
{
  XMLWrapperElement *v4;
  uint64_t v5;

  v5 = 0;
  v4 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("AssertionIDRef"), &v5);
  -[XMLWrapperElement addChildElement:](self, "addChildElement:", v4);

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

- (void)setAssertionURIRef:(id)a3
{
  XMLWrapperElement *v4;
  uint64_t v5;

  v5 = 0;
  v4 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("AssertionURIRef"), &v5);
  -[XMLWrapperElement addChildElement:](self, "addChildElement:", v4);

}

@end
