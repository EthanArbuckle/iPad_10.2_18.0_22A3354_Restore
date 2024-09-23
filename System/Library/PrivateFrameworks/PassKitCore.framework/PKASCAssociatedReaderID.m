@implementation PKASCAssociatedReaderID

- (PKASCAssociatedReaderID)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKASCAssociatedReaderID *v7;
  PKASCAssociatedReaderID *v8;
  void *v9;
  PKASCAssociatedReaderIDReaderCA *v10;
  void *v11;
  uint64_t v12;
  PKASCAssociatedReaderIDReaderCA *readerCA;
  PKASCAssociatedReaderID *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("readerID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_decodeHexadecimal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKASCAssociatedReaderID;
    v7 = -[PKASCAssociatedReaderID init](&v16, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_readerID, v6);
      objc_msgSend(v4, "PKNumberForKey:", CFSTR("priority"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_priority = objc_msgSend(v9, "unsignedIntegerValue");

      v10 = [PKASCAssociatedReaderIDReaderCA alloc];
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("readerCA"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PKASCAssociatedReaderIDReaderCA initWithDictionary:](v10, "initWithDictionary:", v11);
      readerCA = v8->_readerCA;
      v8->_readerCA = (PKASCAssociatedReaderIDReaderCA *)v12;

    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSData hexEncoding](self->_readerID, "hexEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("readerID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("priority"));

  -[PKASCAssociatedReaderIDReaderCA asDictionary](self->_readerCA, "asDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("readerCA"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKASCAssociatedReaderID)initWithCoder:(id)a3
{
  id v4;
  PKASCAssociatedReaderID *v5;
  uint64_t v6;
  NSData *readerID;
  void *v8;
  uint64_t v9;
  PKASCAssociatedReaderIDReaderCA *readerCA;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKASCAssociatedReaderID;
  v5 = -[PKASCAssociatedReaderID init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerID"));
    v6 = objc_claimAutoreleasedReturnValue();
    readerID = v5->_readerID;
    v5->_readerID = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_priority = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerCA"));
    v9 = objc_claimAutoreleasedReturnValue();
    readerCA = v5->_readerCA;
    v5->_readerCA = (PKASCAssociatedReaderIDReaderCA *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *readerID;
  void *v5;
  id v6;

  readerID = self->_readerID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", readerID, CFSTR("readerID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_priority);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("priority"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_readerCA, CFSTR("readerCA"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("readerID: '%@'; "), self->_readerID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_priority);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("priority: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("readerCA: '%@'; "), self->_readerCA);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_readerID)
    objc_msgSend(v3, "addObject:");
  if (self->_readerCA)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_priority - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKASCAssociatedReaderID *v4;
  PKASCAssociatedReaderID *v5;
  BOOL v6;

  v4 = (PKASCAssociatedReaderID *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKASCAssociatedReaderID isEqualToASCAssociatedReaderID:](self, "isEqualToASCAssociatedReaderID:", v5);

  return v6;
}

- (BOOL)isEqualToASCAssociatedReaderID:(id)a3
{
  _QWORD *v4;
  NSData *readerID;
  NSData *v6;
  BOOL v7;
  PKASCAssociatedReaderIDReaderCA *readerCA;
  PKASCAssociatedReaderIDReaderCA *v9;
  BOOL v10;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  readerID = self->_readerID;
  v6 = (NSData *)v4[1];
  if (readerID)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSData isEqual:](readerID, "isEqual:") & 1) != 0)
      goto LABEL_10;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (readerID != v6)
    goto LABEL_14;
LABEL_10:
  if (self->_priority != v4[2])
    goto LABEL_14;
  readerCA = self->_readerCA;
  v9 = (PKASCAssociatedReaderIDReaderCA *)v4[3];
  if (readerCA && v9)
    v10 = -[PKASCAssociatedReaderIDReaderCA isEqual:](readerCA, "isEqual:");
  else
    v10 = readerCA == v9;
LABEL_15:

  return v10;
}

- (NSData)readerID
{
  return self->_readerID;
}

- (void)setReaderID:(id)a3
{
  objc_storeStrong((id *)&self->_readerID, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (PKASCAssociatedReaderIDReaderCA)readerCA
{
  return self->_readerCA;
}

- (void)setReaderCA:(id)a3
{
  objc_storeStrong((id *)&self->_readerCA, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerCA, 0);
  objc_storeStrong((id *)&self->_readerID, 0);
}

@end
