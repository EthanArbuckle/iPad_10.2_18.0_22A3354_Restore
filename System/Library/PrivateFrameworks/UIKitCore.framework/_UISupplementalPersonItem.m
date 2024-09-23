@implementation _UISupplementalPersonItem

+ (id)new
{
  return (id)objc_msgSend(a1, "init");
}

- (_UISupplementalPersonItem)init
{
  void *v3;
  _UISupplementalPersonItem *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:](self, "initWithTISupplementalPersonItem:icon:", v3, 0);

  return v4;
}

- (_UISupplementalPersonItem)initWithTISupplementalPersonItem:(id)a3 icon:(id)a4
{
  id v7;
  id v8;
  id *v9;
  _UISupplementalPersonItem *v10;
  void *v11;
  _UISupplementalPersonItem *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISupplementalPersonItem;
  v9 = -[_UISupplementalItem _init](&v14, sel__init);
  v10 = (_UISupplementalPersonItem *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    v11 = (void *)objc_msgSend(v8, "copy");
    -[_UISupplementalItem setIcon:](v10, "setIcon:", v11);

    v12 = v10;
  }

  return v10;
}

- (_UISupplementalPersonItem)initWithContact:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  _UISupplementalPersonItem *v7;

  v4 = (objc_class *)MEMORY[0x1E0DBDD08];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContact:", v5);

  v7 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:](self, "initWithTISupplementalPersonItem:icon:", v6, 0);
  return v7;
}

- (_UISupplementalPersonItem)initWithContact:(id)a3 icon:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _UISupplementalPersonItem *v10;

  v6 = (objc_class *)MEMORY[0x1E0DBDD08];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithContact:", v8);

  v10 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:](self, "initWithTISupplementalPersonItem:icon:", v9, v7);
  return v10;
}

- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  _UISupplementalPersonItem *v7;

  v4 = (objc_class *)MEMORY[0x1E0DBDD08];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPersonNameComponents:", v5);

  v7 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:](self, "initWithTISupplementalPersonItem:icon:", v6, 0);
  return v7;
}

- (_UISupplementalPersonItem)initWithPersonNameComponents:(id)a3 icon:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  _UISupplementalPersonItem *v10;

  v6 = (objc_class *)MEMORY[0x1E0DBDD08];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPersonNameComponents:", v8);

  v10 = -[_UISupplementalPersonItem initWithTISupplementalPersonItem:icon:](self, "initWithTISupplementalPersonItem:icon:", v9, v7);
  return v10;
}

- (unint64_t)_identifier
{
  return objc_msgSend(self->super._internal, "identifier");
}

- (NSString)givenName
{
  return (NSString *)objc_msgSend(self->super._internal, "givenName");
}

- (void)setGivenName:(id)a3
{
  objc_msgSend(self->super._internal, "setGivenName:", a3);
}

- (NSString)phoneticGivenName
{
  return (NSString *)objc_msgSend(self->super._internal, "phoneticGivenName");
}

- (void)setPhoneticGivenName:(id)a3
{
  objc_msgSend(self->super._internal, "setPhoneticGivenName:", a3);
}

- (NSString)familyName
{
  return (NSString *)objc_msgSend(self->super._internal, "familyName");
}

- (void)setFamilyName:(id)a3
{
  objc_msgSend(self->super._internal, "setFamilyName:", a3);
}

- (NSString)phoneticFamilyName
{
  return (NSString *)objc_msgSend(self->super._internal, "phoneticFamilyName");
}

- (void)setPhoneticFamilyName:(id)a3
{
  objc_msgSend(self->super._internal, "setPhoneticFamilyName:", a3);
}

- (NSString)organizationName
{
  return (NSString *)objc_msgSend(self->super._internal, "organizationName");
}

- (void)setOrganizationName:(id)a3
{
  objc_msgSend(self->super._internal, "setOrganizationName:", a3);
}

- (NSString)phoneticOrganizationName
{
  return (NSString *)objc_msgSend(self->super._internal, "phoneticOrganizationName");
}

- (void)setPhoneticOrganizationName:(id)a3
{
  objc_msgSend(self->super._internal, "setPhoneticOrganizationName:", a3);
}

- (NSString)nickname
{
  return (NSString *)objc_msgSend(self->super._internal, "nickname");
}

- (void)setNickname:(id)a3
{
  objc_msgSend(self->super._internal, "setNickname:", a3);
}

- (_UISupplementalPersonItem)initWithCoder:(id)a3
{
  id v4;
  _UISupplementalPersonItem *v5;
  uint64_t v6;
  id internal;
  _UISupplementalPersonItem *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISupplementalPersonItem;
  v5 = -[_UISupplementalItem initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unwrappedObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    internal = v5->super._internal;
    v5->super._internal = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalPersonItem;
  v4 = a3;
  -[_UISupplementalItem encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->super._internal, CFSTR("unwrappedObject"), v5.receiver, v5.super_class);

}

- (id)description
{
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[15];

  v13[14] = *MEMORY[0x1E0C80C00];
  v13[0] = "givenName";
  v13[1] = -[_UISupplementalPersonItem givenName](self, "givenName");
  v13[2] = "phoneticGivenName";
  v13[3] = -[_UISupplementalPersonItem phoneticGivenName](self, "phoneticGivenName");
  v13[4] = "familyName";
  v13[5] = -[_UISupplementalPersonItem familyName](self, "familyName");
  v13[6] = "phoneticFamilyName";
  v13[7] = -[_UISupplementalPersonItem phoneticFamilyName](self, "phoneticFamilyName");
  v13[8] = "organizationName";
  v13[9] = -[_UISupplementalPersonItem organizationName](self, "organizationName");
  v13[10] = "phoneticOrganizationName";
  v13[11] = -[_UISupplementalPersonItem phoneticOrganizationName](self, "phoneticOrganizationName");
  v13[12] = "nickname";
  v13[13] = -[_UISupplementalPersonItem nickname](self, "nickname");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  for (i = 0; i != 14; i += 2)
  {
    v6 = v13[i];
    v5 = (void *)v13[i + 1];
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s=\"%@\"), v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p; %@, identifier=%llu>"),
    v9,
    self,
    v10,
    objc_msgSend(self->super._internal, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
