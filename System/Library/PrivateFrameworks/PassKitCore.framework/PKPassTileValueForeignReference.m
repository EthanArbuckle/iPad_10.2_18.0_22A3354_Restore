@implementation PKPassTileValueForeignReference

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *content;
  void *v7;
  int64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassTileValueForeignReference;
  if (-[PKPassTileValue _setUpWithDictionary:](&v11, sel__setUpWithDictionary_, v4)
    && (objc_msgSend(v4, "PKStringForKey:", CFSTR("content")),
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        content = self->_content,
        self->_content = v5,
        content,
        self->_content))
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("foreignReferenceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKPassTileForeignReferenceTypeFromString(v7);
    self->_foreignReferenceType = v8;
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPassTileValueForeignReference;
  v5 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](&v7, sel_createResolvedValueWithBundle_privateBundle_, a3, a4);
  objc_storeStrong(v5 + 3, self->_content);
  v5[4] = (id)self->_foreignReferenceType;
  return v5;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (self->_foreignReferenceType == 1 && self->_content)
  {
    objc_msgSend(v6, "balanceModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balanceForIdentifier:", self->_content);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      switch(a4)
      {
        case 2:
          objc_msgSend(v9, "localizedDescription");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 1:
          objc_msgSend(v9, "formattedValue");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        case 0:
          objc_msgSend(v9, "localizedTitle");
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v11 = (void *)v10;
          goto LABEL_13;
      }
    }
    v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueForeignReference)initWithCoder:(id)a3
{
  id v4;
  PKPassTileValueForeignReference *v5;
  uint64_t v6;
  NSString *content;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileValueForeignReference;
  v5 = -[PKPassTileValue initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreignReferenceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_foreignReferenceType = PKPassTileForeignReferenceTypeFromString(v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const __CFString *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueForeignReference;
  v4 = a3;
  -[PKPassTileValue encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("content"), v6.receiver, v6.super_class);
  if (self->_foreignReferenceType == 1)
    v5 = CFSTR("balance");
  else
    v5 = 0;
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("foreignReferenceType"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  int64_t foreignReferenceType;
  objc_super v6;
  id v7;
  NSUInteger v8;
  int64_t v9;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileValueForeignReference;
  v7 = -[PKPassTileValue hash](&v6, sel_hash);
  v3 = -[NSString hash](self->_content, "hash");
  foreignReferenceType = self->_foreignReferenceType;
  v8 = v3;
  v9 = foreignReferenceType;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  id *v5;
  NSString *content;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueForeignReference;
  if (-[PKPassTileValue _isEqual:](&v14, sel__isEqual_, v4))
  {
    v5 = (id *)v4;
    content = self->_content;
    v7 = (NSString *)v5[3];
    v8 = content;
    if (v7 != v8)
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {

      }
      else
      {
        v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (v12)
          goto LABEL_12;
      }
      v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    v11 = v5[4] == (id)self->_foreignReferenceType;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)foreignReferenceType
{
  return self->_foreignReferenceType;
}

- (void)setForeignReferenceType:(int64_t)a3
{
  self->_foreignReferenceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
