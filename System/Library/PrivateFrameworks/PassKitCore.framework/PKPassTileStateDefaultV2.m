@implementation PKPassTileStateDefaultV2

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKPassTileValue *v6;
  PKPassTileValue *title;
  void *v8;
  PKPassTileValue *v9;
  PKPassTileValue *body;
  void *v11;
  PKPassTileImage *v12;
  PKPassTileImage *bodyImage;
  void *v14;
  PKPassTileValue *v15;
  PKPassTileValue *footer;
  void *v17;
  PKPassTileAccessory *v18;
  PKPassTileAccessory *accessory;
  void *v20;
  PKPassTileAccessory *v21;
  PKPassTileAccessory *secondaryAccessory;
  void *v23;
  BOOL v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPassTileStateDefaultV2;
  if (-[PKPassTileState _setUpWithDictionary:](&v26, sel__setUpWithDictionary_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PKPassTileValue _createForDictionary:](PKPassTileValue, "_createForDictionary:", v5);
    title = self->_title;
    self->_title = v6;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("body"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[PKPassTileValue _createForDictionary:](PKPassTileValue, "_createForDictionary:", v8);
    body = self->_body;
    self->_body = v9;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("bodyImage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[PKPassTileImage _createForDictionary:](PKPassTileImage, "_createForDictionary:", v11);
    bodyImage = self->_bodyImage;
    self->_bodyImage = v12;

    if (self->_body || self->_bodyImage)
    {
      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("footer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[PKPassTileValue _createForDictionary:](PKPassTileValue, "_createForDictionary:", v14);
      footer = self->_footer;
      self->_footer = v15;

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("accessory"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17
        && (v18 = +[PKPassTileAccessory _createForDictionary:](PKPassTileAccessory, "_createForDictionary:", v17), accessory = self->_accessory, self->_accessory = v18, accessory, !self->_accessory))
      {
        v24 = 0;
      }
      else
      {
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("secondaryAccessory"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20
          && (v21 = +[PKPassTileAccessory _createForDictionary:](PKPassTileAccessory, "_createForDictionary:", v20), secondaryAccessory = self->_secondaryAccessory, self->_secondaryAccessory = v21, secondaryAccessory, !self->_secondaryAccessory))
        {
          v24 = 0;
        }
        else
        {
          objc_msgSend(v4, "PKStringForKey:", CFSTR("preferredStyle"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          self->_preferredStyle = PKPassTileStateStyleFromString(v23);

          v24 = 1;
        }

      }
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileStateDefaultV2;
  v4 = -[PKPassTileState copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 8, self->_title);
  objc_storeStrong(v4 + 9, self->_body);
  objc_storeStrong(v4 + 10, self->_bodyImage);
  objc_storeStrong(v4 + 11, self->_footer);
  v4[12] = (id)self->_preferredStyle;
  objc_storeStrong(v4 + 13, self->_accessory);
  objc_storeStrong(v4 + 14, self->_secondaryAccessory);
  return v4;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPassTileStateDefaultV2;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileState createResolvedStateWithBundle:privateBundle:](&v22, sel_createResolvedStateWithBundle_privateBundle_, v7, v6);
  v9 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](self->_title, "createResolvedValueWithBundle:privateBundle:", v7, v6, v22.receiver, v22.super_class);
  v10 = (void *)v8[8];
  v8[8] = v9;

  v11 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](self->_body, "createResolvedValueWithBundle:privateBundle:", v7, v6);
  v12 = (void *)v8[9];
  v8[9] = v11;

  v13 = -[PKPassTileImage createResolvedImageWithBundle:privateBundle:](self->_bodyImage, "createResolvedImageWithBundle:privateBundle:", v7, v6);
  v14 = (void *)v8[10];
  v8[10] = v13;

  v15 = -[PKPassTileValue createResolvedValueWithBundle:privateBundle:](self->_footer, "createResolvedValueWithBundle:privateBundle:", v7, v6);
  v16 = (void *)v8[11];
  v8[11] = v15;

  v8[12] = self->_preferredStyle;
  v17 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_accessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6);
  v18 = (void *)v8[13];
  v8[13] = v17;

  v19 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](self->_secondaryAccessory, "createResolvedAccessoryWithBundle:privateBundle:", v7, v6);
  v20 = (void *)v8[14];
  v8[14] = v19;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileStateDefaultV2)initWithCoder:(id)a3
{
  id v4;
  PKPassTileStateDefaultV2 *v5;
  uint64_t v6;
  PKPassTileValue *title;
  uint64_t v8;
  PKPassTileValue *body;
  uint64_t v10;
  PKPassTileImage *bodyImage;
  uint64_t v12;
  PKPassTileValue *footer;
  void *v14;
  uint64_t v15;
  PKPassTileAccessory *accessory;
  uint64_t v17;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassTileStateDefaultV2;
  v5 = -[PKPassTileState initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (PKPassTileValue *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (PKPassTileValue *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bodyImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    bodyImage = v5->_bodyImage;
    v5->_bodyImage = (PKPassTileImage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footer"));
    v12 = objc_claimAutoreleasedReturnValue();
    footer = v5->_footer;
    v5->_footer = (PKPassTileValue *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferredStyle = PKPassTileStateStyleFromString(v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v15 = objc_claimAutoreleasedReturnValue();
    accessory = v5->_accessory;
    v5->_accessory = (PKPassTileAccessory *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryAccessory"));
    v17 = objc_claimAutoreleasedReturnValue();
    secondaryAccessory = v5->_secondaryAccessory;
    v5->_secondaryAccessory = (PKPassTileAccessory *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  const __CFString *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileStateDefaultV2;
  -[PKPassTileState encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodyImage, CFSTR("bodyImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_footer, CFSTR("footer"));
  v5 = self->_preferredStyle - 1;
  if (v5 > 4)
    v6 = CFSTR("twoLineDefault");
  else
    v6 = off_1E2AC7750[v5];
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferredStyle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessory, CFSTR("accessory"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryAccessory, CFSTR("secondaryAccessory"));

}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4;
  _QWORD *v5;
  PKPassTileValue *v6;
  PKPassTileValue *title;
  BOOL v8;
  BOOL v9;
  PKPassTileValue *v10;
  PKPassTileValue *body;
  BOOL v12;
  PKPassTileImage *v13;
  PKPassTileImage *bodyImage;
  BOOL v15;
  PKPassTileValue *v16;
  PKPassTileValue *footer;
  void *v18;
  PKPassTileAccessory *accessory;
  PKPassTileAccessory *v20;
  PKPassTileAccessory *secondaryAccessory;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPassTileStateDefaultV2;
  if (-[PKPassTileState isEqualToUnresolvedState:](&v23, sel_isEqualToUnresolvedState_, v4))
  {
    v5 = v4;
    v6 = (PKPassTileValue *)v5[8];
    title = self->_title;
    if (v6)
      v8 = title == 0;
    else
      v8 = 1;
    if (v8)
    {
      if (v6 != title)
        goto LABEL_40;
    }
    else if (!-[PKPassTileValue isEqual:](v6, "isEqual:"))
    {
      goto LABEL_40;
    }
    v10 = (PKPassTileValue *)v5[9];
    body = self->_body;
    if (v10)
      v12 = body == 0;
    else
      v12 = 1;
    if (v12)
    {
      if (v10 != body)
        goto LABEL_40;
    }
    else if (!-[PKPassTileValue isEqual:](v10, "isEqual:"))
    {
      goto LABEL_40;
    }
    v13 = (PKPassTileImage *)v5[10];
    bodyImage = self->_bodyImage;
    if (v13)
      v15 = bodyImage == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (v13 != bodyImage)
        goto LABEL_40;
    }
    else if (!-[PKPassTileImage isEqual:](v13, "isEqual:"))
    {
      goto LABEL_40;
    }
    v16 = (PKPassTileValue *)v5[11];
    footer = self->_footer;
    if (v16 && footer)
    {
      if (!-[PKPassTileValue isEqual:](v16, "isEqual:"))
        goto LABEL_40;
    }
    else if (v16 != footer)
    {
      goto LABEL_40;
    }
    if (v5[12] == self->_preferredStyle)
    {
      v18 = (void *)v5[13];
      accessory = self->_accessory;
      if (v18)
      {
        if (!accessory || (objc_msgSend(v18, "isEqualToUnresolvedAccessory:") & 1) == 0)
          goto LABEL_40;
LABEL_36:
        v20 = (PKPassTileAccessory *)v5[14];
        secondaryAccessory = self->_secondaryAccessory;
        if (v20 && secondaryAccessory)
          v9 = -[PKPassTileAccessory isEqualToUnresolvedAccessory:](v20, "isEqualToUnresolvedAccessory:");
        else
          v9 = v20 == secondaryAccessory;
        goto LABEL_41;
      }
      if (!accessory)
        goto LABEL_36;
    }
LABEL_40:
    v9 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v9 = 0;
LABEL_42:

  return v9;
}

- (PKPassTileValue)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (PKPassTileValue)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (PKPassTileImage)bodyImage
{
  return self->_bodyImage;
}

- (void)setBodyImage:(id)a3
{
  objc_storeStrong((id *)&self->_bodyImage, a3);
}

- (PKPassTileValue)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
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
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
