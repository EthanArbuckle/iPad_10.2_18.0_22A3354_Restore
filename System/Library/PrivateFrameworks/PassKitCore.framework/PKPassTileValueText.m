@implementation PKPassTileValueText

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *content;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileValueText;
  if (-[PKPassTileValue _setUpWithDictionary:](&v9, sel__setUpWithDictionary_, v4))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("content"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    content = self->_content;
    self->_content = v5;

    v7 = self->_content != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createWithContent:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  if (v4)
  {
    v5 = +[PKPassTileValue _createForType:resolved:](PKPassTileValue, "_createForType:resolved:", 0, 1);
    objc_storeStrong(v5 + 3, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createResolvedValueWithBundle:(id)a3 privateBundle:(id)a4
{
  NSString *content;
  NSString *v7;
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  content = self->_content;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileValueText;
  v7 = content;
  v8 = a4;
  v9 = a3;
  v10 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](&v14, sel_createResolvedValueWithBundle_privateBundle_, v9, v8);
  PKLocalizedPassStringForPassBundle(v7, v9, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v10[3];
  v10[3] = v11;

  return v10;
}

- (id)displayableStringWithPassState:(id)a3 inContext:(int64_t)a4
{
  return self->_content;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileValueText)initWithCoder:(id)a3
{
  id v4;
  PKPassTileValueText *v5;
  uint64_t v6;
  NSString *content;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileValueText;
  v5 = -[PKPassTileValue initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v6 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileValueText;
  v4 = a3;
  -[PKPassTileValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_content, CFSTR("content"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  objc_super v4;
  id v5;
  NSUInteger v6;

  v4.receiver = self;
  v4.super_class = (Class)PKPassTileValueText;
  v5 = -[PKPassTileValue hash](&v4, sel_hash);
  v6 = -[NSString hash](self->_content, "hash");
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
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassTileValueText;
  if (-[PKPassTileValue _isEqual:](&v13, sel__isEqual_, v4))
  {
    v5 = (id *)v4;
    content = self->_content;
    v7 = (NSString *)v5[3];
    v8 = content;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        v11 = 0;
      else
        v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
