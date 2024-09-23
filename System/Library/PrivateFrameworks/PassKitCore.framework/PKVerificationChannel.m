@implementation PKVerificationChannel

+ (id)verificationChannelWithDictionary:(id)a3 andOrganizationName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v9);

    objc_msgSend(v6, "objectForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setType:", objc_msgSend(v10, "unsignedIntegerValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("typeDescription"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTypeDescription:", v11);

    objc_msgSend(v8, "setOrganizationName:", v7);
    objc_msgSend(v6, "objectForKey:", CFSTR("requiresUserInteraction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresUserInteraction:", objc_msgSend(v12, "BOOLValue"));

    objc_msgSend(v6, "objectForKey:", CFSTR("contactPoint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContactPoint:", v13);

    objc_msgSend(v6, "objectForKey:", CFSTR("sourceAddress"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceAddress:", v14);

  }
  return v8;
}

- (PKVerificationChannel)initWithCoder:(id)a3
{
  id v4;
  PKVerificationChannel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKVerificationChannel;
  v5 = -[PKVerificationChannel init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationChannel setIdentifier:](v5, "setIdentifier:", v6);

    -[PKVerificationChannel setType:](v5, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationChannel setTypeDescription:](v5, "setTypeDescription:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationChannel setOrganizationName:](v5, "setOrganizationName:", v8);

    -[PKVerificationChannel setRequiresUserInteraction:](v5, "setRequiresUserInteraction:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiresUserInteraction")) != 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactPoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationChannel setContactPoint:](v5, "setContactPoint:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceAddress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKVerificationChannel setSourceAddress:](v5, "setSourceAddress:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PKVerificationChannel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationChannel type](self, "type"), CFSTR("type"));
  -[PKVerificationChannel typeDescription](self, "typeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("typeDescription"));

  -[PKVerificationChannel organizationName](self, "organizationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("organizationName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKVerificationChannel requiresUserInteraction](self, "requiresUserInteraction"), CFSTR("requiresUserInteraction"));
  -[PKVerificationChannel contactPoint](self, "contactPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contactPoint"));

  -[PKVerificationChannel sourceAddress](self, "sourceAddress");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sourceAddress"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = self->_type;
  v8 = -[NSString copyWithZone:](self->_typeDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_BYTE *)(v5 + 8) = self->_requiresUserInteraction;
  v12 = -[NSString copyWithZone:](self->_contactPoint, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_sourceAddress, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  return (id)v5;
}

- (NSString)typeDescriptionUnlocalized
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 7)
    return (NSString *)CFSTR("other");
  else
    return &off_1E2AC9820[v2]->isa;
}

- (NSString)typeDescription
{
  NSString *v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  NSString *organizationName;

  v3 = self->_typeDescription;
  switch(self->_type)
  {
    case 1uLL:
      v4 = CFSTR("VERIFICATION_CHANNEL_EMAIL");
      goto LABEL_7;
    case 2uLL:
      v4 = CFSTR("VERIFICATION_CHANNEL_SMS");
      goto LABEL_7;
    case 3uLL:
      v4 = CFSTR("VERIFICATION_CHANNEL_INBOUND_PHONE_CALL");
      goto LABEL_7;
    case 4uLL:
      organizationName = self->_organizationName;
      v5 = CFSTR("VERIFICATION_CHANNEL_OUTBOUND_PHONE_CALL");
      goto LABEL_10;
    case 5uLL:
      organizationName = self->_organizationName;
      v5 = CFSTR("VERIFICATION_CHANNEL_BANK_APP");
      goto LABEL_10;
    case 6uLL:
      v4 = CFSTR("VERIFICATION_CHANNEL_BANK_STATEMENT");
LABEL_7:
      PKLocalizedPaymentString(&v4->isa, 0);
      goto LABEL_11;
    case 8uLL:
      organizationName = self->_organizationName;
      v5 = CFSTR("VERIFICATION_CHANNEL_URL");
LABEL_10:
      PKLocalizedPaymentString(&v5->isa, CFSTR("%@"), organizationName);
LABEL_11:
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (NSString *)v6;
      break;
    default:
      return v3;
  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKVerificationChannel identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKVerificationChannel typeDescriptionUnlocalized](self, "typeDescriptionUnlocalized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKVerificationChannel organizationName](self, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKVerificationChannel requiresUserInteraction](self, "requiresUserInteraction");
  -[PKVerificationChannel contactPoint](self, "contactPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKVerificationChannel sourceAddress](self, "sourceAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("identifier: %@, typeDescription: %@, organizationName:%@ requiresUserInteraction: %d, contactPoint: %@, sourceAddress: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)needsServerRequest
{
  return (self->_type > 8) | (0xCFu >> self->_type) & 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTypeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  self->_requiresUserInteraction = a3;
}

- (NSString)contactPoint
{
  return self->_contactPoint;
}

- (void)setContactPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sourceAddress
{
  return self->_sourceAddress;
}

- (void)setSourceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAddress, 0);
  objc_storeStrong((id *)&self->_contactPoint, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_typeDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
