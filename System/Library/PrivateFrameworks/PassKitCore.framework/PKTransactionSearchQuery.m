@implementation PKTransactionSearchQuery

- (PKTransactionSearchQuery)initWithIdentifier:(id)a3 keyboardLanguage:(id)a4 passUniqueIdentifier:(id)a5
{
  id v9;
  PKTransactionSearchQuery *v10;
  PKTransactionSearchQuery *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionSearchQuery;
  v10 = -[PKSearchQuery initWithIdentifier:keyboardLanguage:](&v13, sel_initWithIdentifier_keyboardLanguage_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_passUniqueIdentifier, a5);

  return v11;
}

- (unint64_t)domain
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionSearchQuery;
  v4 = a3;
  -[PKSearchQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"), v5.receiver, v5.super_class);

}

- (PKTransactionSearchQuery)initWithCoder:(id)a3
{
  id v4;
  PKTransactionSearchQuery *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionSearchQuery;
  v5 = -[PKSearchQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *passUniqueIdentifier;
  NSString *v6;
  BOOL v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    v6 = (NSString *)v4[7];
    if (passUniqueIdentifier)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (passUniqueIdentifier == v6)
      {
LABEL_10:
        v10.receiver = self;
        v10.super_class = (Class)PKTransactionSearchQuery;
        v8 = -[PKSearchQuery isEqual:](&v10, sel_isEqual_, v4);
        goto LABEL_11;
      }
    }
    else if ((-[NSString isEqual:](passUniqueIdentifier, "isEqual:") & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionSearchQuery;
  v4 = -[PKSearchQuery hash](&v7, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTransactionSearchQuery;
  -[PKSearchQuery description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("passUniqueIdentifier: '%@'; "), self->_passUniqueIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
