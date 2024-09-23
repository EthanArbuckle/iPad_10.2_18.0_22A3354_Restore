@implementation PKAccountUserInfoUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserInfoUpdate)initWithCoder:(id)a3
{
  id v4;
  PKAccountUserInfoUpdate *v5;
  uint64_t v6;
  NSDate *updatedDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserInfoUpdate;
  v5 = -[PKAccountUserInfoUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfoUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    updatedDate = v5->_updatedDate;
    v5->_updatedDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_updatedDate, CFSTR("userInfoUpdatedDate"));
}

- (PKAccountUserInfoUpdate)initWithRecord:(id)a3
{
  id v4;
  PKAccountUserInfoUpdate *v5;
  uint64_t v6;
  NSDate *updatedDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserInfoUpdate;
  v5 = -[PKAccountUserInfoUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("userInfoUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    updatedDate = v5->_updatedDate;
    v5->_updatedDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v4;

  objc_msgSend(a3, "encryptedValues");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", self->_updatedDate, CFSTR("userInfoUpdatedDate"));

}

+ (id)recordType
{
  return CFSTR("UserInfo");
}

+ (id)recordNamePrefix
{
  return CFSTR("userInfo-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *updatedDate;
  NSDate *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    updatedDate = self->_updatedDate;
    v6 = (NSDate *)v4[1];
    if (updatedDate && v6)
      v7 = -[NSDate isEqual:](updatedDate, "isEqual:");
    else
      v7 = updatedDate == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_updatedDate);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_updatedDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("updateDate: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
}

@end
