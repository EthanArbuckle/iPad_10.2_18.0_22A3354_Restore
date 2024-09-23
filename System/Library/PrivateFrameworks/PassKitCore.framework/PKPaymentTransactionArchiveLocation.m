@implementation PKPaymentTransactionArchiveLocation

- (PKPaymentTransactionArchiveLocation)initWithType:(unint64_t)a3 archived:(BOOL)a4 cloudStoreZone:(id)a5
{
  id v9;
  PKPaymentTransactionArchiveLocation *v10;
  PKPaymentTransactionArchiveLocation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentTransactionArchiveLocation;
  v10 = -[PKPaymentTransactionArchiveLocation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_archived = a4;
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_cloudStoreZone, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionArchiveLocation *v4;
  PKPaymentTransactionArchiveLocation *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionArchiveLocation *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionArchiveLocation isEqualToArchiveLocation:](self, "isEqualToArchiveLocation:", v5);

  return v6;
}

- (BOOL)isEqualToArchiveLocation:(id)a3
{
  _QWORD *v4;
  PKCloudStoreZone *cloudStoreZone;
  PKCloudStoreZone *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  if (!v4)
    goto LABEL_12;
  cloudStoreZone = self->_cloudStoreZone;
  v6 = (PKCloudStoreZone *)v4[3];
  if (cloudStoreZone)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKCloudStoreZone isEqual:](cloudStoreZone, "isEqual:"))
      goto LABEL_10;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if (cloudStoreZone != v6)
    goto LABEL_12;
LABEL_10:
  if (self->_archived != *((unsigned __int8 *)v4 + 8))
    goto LABEL_12;
  v8 = self->_type == v4[2];
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_cloudStoreZone);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_archived - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), CFSTR("cloudStore"));
  if (self->_archived)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("archived: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("cloudStoreZone: '%@'; "), self->_cloudStoreZone);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionArchiveLocation)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionArchiveLocation *v5;
  uint64_t v6;
  PKCloudStoreZone *cloudStoreZone;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionArchiveLocation;
  v5 = -[PKPaymentTransactionArchiveLocation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudStoreZone"));
    v6 = objc_claimAutoreleasedReturnValue();
    cloudStoreZone = v5->_cloudStoreZone;
    v5->_cloudStoreZone = (PKCloudStoreZone *)v6;

    v5->_archived = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("archived"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCloudStoreZone *cloudStoreZone;
  id v5;

  cloudStoreZone = self->_cloudStoreZone;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", cloudStoreZone, CFSTR("cloudStoreZone"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_archived, CFSTR("archived"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentTransactionArchiveLocation *v5;
  PKCloudStoreZone *v6;
  PKCloudStoreZone *cloudStoreZone;

  v5 = -[PKPaymentTransactionArchiveLocation init](+[PKPaymentTransactionArchiveLocation allocWithZone:](PKPaymentTransactionArchiveLocation, "allocWithZone:"), "init");
  v6 = -[PKCloudStoreZone copyWithZone:](self->_cloudStoreZone, "copyWithZone:", a3);
  cloudStoreZone = v5->_cloudStoreZone;
  v5->_cloudStoreZone = v6;

  v5->_archived = self->_archived;
  v5->_type = self->_type;
  return v5;
}

- (BOOL)isArchived
{
  return self->_archived;
}

- (void)setArchived:(BOOL)a3
{
  self->_archived = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
  objc_storeStrong((id *)&self->_cloudStoreZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreZone, 0);
}

@end
