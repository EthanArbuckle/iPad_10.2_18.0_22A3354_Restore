@implementation TISupplementalItem

- (TISupplementalItem)init
{
  TISupplementalItem *v2;
  TISupplementalItem *v3;
  TISupplementalItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TISupplementalItem;
  v2 = -[TISupplementalItem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_identifier = ++generateIdentifier_count;
    v4 = v2;
  }

  return v3;
}

- (BOOL)isEqualToSupplementalItem:(id)a3
{
  return self->_identifier == *((_QWORD *)a3 + 1);
}

- (TISupplementalItem)initWithCoder:(id)a3
{
  id v4;
  TISupplementalItem *v5;
  void *v6;
  TISupplementalItem *v7;

  v4 = a3;
  v5 = -[TISupplementalItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v6, "unsignedLongLongValue");

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t identifier;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", identifier);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  TISupplementalItem *v4;
  BOOL v5;

  v4 = (TISupplementalItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TISupplementalItem isEqualToSupplementalItem:](self, "isEqualToSupplementalItem:", v4);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; identifier=%llu>"),
               objc_opt_class(),
               self,
               self->_identifier);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
