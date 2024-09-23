@implementation PKPassSectionDetailDrillInField

- (id)asDictionary
{
  void *v2;
  void *v3;

  -[PKPassField asMutableDictionary](self, "asMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (PKPassSectionDetailDrillInField)initWithCoder:(id)a3
{
  id v4;
  PKPassSectionDetailDrillInField *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassSectionDetailDrillInField;
  v5 = -[PKPassField initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("sectionIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSectionDetailDrillInField setSectionIdentifiers:](v5, "setSectionIdentifiers:", v6);

    -[PKPassSectionDetailDrillInField setAuthRequirement:](v5, "setAuthRequirement:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authRequirement")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSectionDetailDrillInField setLocalizedTitle:](v5, "setLocalizedTitle:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassSectionDetailDrillInField;
  v4 = a3;
  -[PKPassField encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sectionIdentifiers, CFSTR("sectionIdentifiers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_authRequirement, CFSTR("authRequirement"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedTitle, CFSTR("localizedTitle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPassSectionDetailDrillInField;
  v5 = -[PKPassField copyWithZone:](&v9, sel_copyWithZone_);
  v6 = (void *)-[NSArray copyWithZone:](self->_sectionIdentifiers, "copyWithZone:", a3);
  objc_msgSend(v5, "setSectionIdentifiers:", v6);

  objc_msgSend(v5, "setAuthRequirement:", self->_authRequirement);
  v7 = (void *)-[NSString copyWithZone:](self->_localizedTitle, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalizedTitle:", v7);

  return v5;
}

- (BOOL)isDrillInField
{
  return 1;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (void)setSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, a3);
}

- (int64_t)authRequirement
{
  return self->_authRequirement;
}

- (void)setAuthRequirement:(int64_t)a3
{
  self->_authRequirement = a3;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
}

@end
