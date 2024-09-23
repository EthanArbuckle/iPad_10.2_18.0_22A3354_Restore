@implementation PKIdentityElement

- (PKIdentityElement)initWithDIIdentityElement:(id)a3
{
  DIIdentityElement *v4;
  PKIdentityElement *v5;
  DIIdentityElement *wrapped;
  objc_super v8;

  v4 = (DIIdentityElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PKIdentityElement;
  v5 = -[PKIdentityElement init](&v8, sel_init);
  wrapped = v5->_wrapped;
  v5->_wrapped = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKIdentityElement *v5;
  void *v6;
  PKIdentityElement *v7;

  v5 = [PKIdentityElement alloc];
  v6 = (void *)-[DIIdentityElement copyWithZone:](self->_wrapped, "copyWithZone:", a3);
  v7 = -[PKIdentityElement initWithDIIdentityElement:](v5, "initWithDIIdentityElement:", v6);

  return v7;
}

- (id)description
{
  return (id)-[DIIdentityElement description](self->_wrapped, "description");
}

+ (PKIdentityElement)givenNameElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "givenNameElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)familyNameElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "familyNameElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)portraitElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "portraitElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)addressElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "addressElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)issuingAuthorityElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "issuingAuthorityElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)ageElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "ageElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)dateOfBirthElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "dateOfBirthElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)sexElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "sexElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)documentIssueDateElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "documentIssueDateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)documentExpirationDateElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "documentExpirationDateElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)documentDHSComplianceStatusElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "documentDHSComplianceStatusElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)documentNumberElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "documentNumberElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)drivingPrivilegesElement
{
  PKIdentityElement *v2;
  void *v3;
  PKIdentityElement *v4;

  v2 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "drivingPrivilegesElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKIdentityElement initWithDIIdentityElement:](v2, "initWithDIIdentityElement:", v3);

  return v4;
}

+ (PKIdentityElement)ageThresholdElementWithAge:(NSInteger)age
{
  PKIdentityElement *v4;
  void *v5;
  PKIdentityElement *v6;

  v4 = [PKIdentityElement alloc];
  objc_msgSend(MEMORY[0x1E0D16A08], "ageThresholdElementWithAge:", age);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKIdentityElement initWithDIIdentityElement:](v4, "initWithDIIdentityElement:", v5);

  return v6;
}

- (id)asDIIdentityElement
{
  return self->_wrapped;
}

- (DIIdentityElement)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
  objc_storeStrong((id *)&self->_wrapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
