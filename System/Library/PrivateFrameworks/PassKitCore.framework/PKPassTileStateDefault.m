@implementation PKPassTileStateDefault

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  NSString *v7;
  NSString *body;
  void *v9;
  PKPassTileAccessory *v10;
  PKPassTileAccessory *accessory;
  void *v12;
  PKPassTileAccessory *v13;
  PKPassTileAccessory *secondaryAccessory;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPassTileStateDefault;
  if (!-[PKPassTileState _setUpWithDictionary:](&v17, sel__setUpWithDictionary_, v4))
    goto LABEL_8;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v5;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("body"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  body = self->_body;
  self->_body = v7;

  if (self->_body)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("accessory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      && (v10 = +[PKPassTileAccessory _createForDictionary:](PKPassTileAccessory, "_createForDictionary:", v9), accessory = self->_accessory, self->_accessory = v10, accessory, !self->_accessory))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("secondaryAccessory"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if (v12)
      {
        v13 = +[PKPassTileAccessory _createForDictionary:](PKPassTileAccessory, "_createForDictionary:", v12);
        secondaryAccessory = self->_secondaryAccessory;
        self->_secondaryAccessory = v13;

        if (!self->_secondaryAccessory)
          v15 = 0;
      }

    }
  }
  else
  {
LABEL_8:
    v15 = 0;
  }

  return v15;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKPassTileStateDefault;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileState createResolvedStateWithBundle:privateBundle:](&v18, sel_createResolvedStateWithBundle_privateBundle_, v7, v6);
  PKLocalizedPassStringForPassBundle(self->_title, v7, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v8[8];
  v8[8] = v9;

  PKLocalizedPassStringForPassBundle(self->_body, v7, v6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v8[9];
  v8[9] = v11;

  v13 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_accessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6, v18.receiver, v18.super_class);
  v14 = (void *)v8[10];
  v8[10] = v13;

  v15 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_secondaryAccessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6);
  v16 = (void *)v8[11];
  v8[11] = v15;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateDefault)initWithCoder:(id)a3
{
  id v4;
  PKPassTileStateDefault *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  PKPassTileAccessory *accessory;
  uint64_t v12;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassTileStateDefault;
  v5 = -[PKPassTileState initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessory = v5->_accessory;
    v5->_accessory = (PKPassTileAccessory *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryAccessory"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileStateDefault;
  v4 = a3;
  -[PKPassTileState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessory, CFSTR("accessory"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryAccessory, CFSTR("secondaryAccessory"));

}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4;
  id *v5;
  NSString *title;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *body;
  NSString *v14;
  BOOL v15;
  _BOOL4 v17;
  id v18;
  PKPassTileAccessory *accessory;
  PKPassTileAccessory *v20;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPassTileStateDefault;
  if (-[PKPassTileState isEqualToUnresolvedState:](&v22, sel_isEqualToUnresolvedState_, v4))
  {
    v5 = (id *)v4;
    title = self->_title;
    v7 = (NSString *)v5[8];
    v8 = title;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        goto LABEL_17;
      v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v11)
        goto LABEL_18;
    }
    body = self->_body;
    v7 = (NSString *)v5[9];
    v14 = body;
    if (v7 == v14)
    {

LABEL_23:
      v18 = v5[10];
      accessory = self->_accessory;
      if (v18)
      {
        if (!accessory || (objc_msgSend(v18, "isEqualToUnresolvedAccessory:") & 1) == 0)
          goto LABEL_18;
LABEL_28:
        v20 = (PKPassTileAccessory *)v5[11];
        secondaryAccessory = self->_secondaryAccessory;
        if (v20 && secondaryAccessory)
          v12 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v20, "isEqualToUnresolvedAccessory:");
        else
          v12 = v20 == secondaryAccessory;
        goto LABEL_19;
      }
      if (!accessory)
        goto LABEL_28;
LABEL_18:
      v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v9 = v14;
    if (v7)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v17 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);

      if (!v17)
        goto LABEL_18;
      goto LABEL_23;
    }
LABEL_17:

    goto LABEL_18;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PKPassTileAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (PKPassTileAccessory)secondaryAccessory
{
  return self->_secondaryAccessory;
}

- (void)setSecondaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
