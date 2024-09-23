@implementation SFClientSubCredentialParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientSubCredentialParams)initWithCoder:(id)a3
{
  id v4;
  SFClientSubCredentialParams *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SFClientSubCredentialParams *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFClientSubCredentialParams;
  v5 = -[SFClientSubCredentialParams init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *adamID;
  NSArray *adamIDs;
  NSString *title;
  NSString *subtitle;
  NSString *issuerID;
  id v10;

  v4 = a3;
  adamID = self->_adamID;
  v10 = v4;
  if (adamID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", adamID, CFSTR("aID"));
    v4 = v10;
  }
  adamIDs = self->_adamIDs;
  if (adamIDs)
  {
    objc_msgSend(v10, "encodeObject:forKey:", adamIDs, CFSTR("aIDs"));
    v4 = v10;
  }
  title = self->_title;
  if (title)
  {
    objc_msgSend(v10, "encodeObject:forKey:", title, CFSTR("tle"));
    v4 = v10;
  }
  subtitle = self->_subtitle;
  if (subtitle)
  {
    objc_msgSend(v10, "encodeObject:forKey:", subtitle, CFSTR("subt"));
    v4 = v10;
  }
  issuerID = self->_issuerID;
  if (issuerID)
  {
    objc_msgSend(v10, "encodeObject:forKey:", issuerID, CFSTR("issID"));
    v4 = v10;
  }

}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)issuerID
{
  return self->_issuerID;
}

- (void)setIssuerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
