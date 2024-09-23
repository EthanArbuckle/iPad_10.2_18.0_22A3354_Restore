@implementation PKSharingMessageExtensionViewProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessageExtensionViewProperties)initWithCoder:(id)a3
{
  id v4;
  PKSharingMessageExtensionViewProperties *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *buttonText;
  uint64_t v12;
  NSString *leftTitleText;
  uint64_t v14;
  NSString *rightTitleText;
  uint64_t v16;
  UIImage *cardImage;
  uint64_t v18;
  NSString *fallbackCardImageName;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKSharingMessageExtensionViewProperties;
  v5 = -[PKSharingMessageExtensionViewProperties init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonText"));
    v10 = objc_claimAutoreleasedReturnValue();
    buttonText = v5->_buttonText;
    v5->_buttonText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leftTitleText"));
    v12 = objc_claimAutoreleasedReturnValue();
    leftTitleText = v5->_leftTitleText;
    v5->_leftTitleText = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rightTitleText"));
    v14 = objc_claimAutoreleasedReturnValue();
    rightTitleText = v5->_rightTitleText;
    v5->_rightTitleText = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardImage"));
    v16 = objc_claimAutoreleasedReturnValue();
    cardImage = v5->_cardImage;
    v5->_cardImage = (UIImage *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fallbackCardImageName"));
    v18 = objc_claimAutoreleasedReturnValue();
    fallbackCardImageName = v5->_fallbackCardImageName;
    v5->_fallbackCardImageName = (NSString *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonText, CFSTR("buttonText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_leftTitleText, CFSTR("leftTitleText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rightTitleText, CFSTR("rightTitleText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardImage, CFSTR("cardImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fallbackCardImageName, CFSTR("fallbackCardImageName"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v6, "appendFormat:", CFSTR("subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v6, "appendFormat:", CFSTR("buttonText: '%@'; "), self->_buttonText);
  objc_msgSend(v6, "appendFormat:", CFSTR("leftTitleText: '%@'; "), self->_leftTitleText);
  objc_msgSend(v6, "appendFormat:", CFSTR("rightTitleText: '%@'; "), self->_rightTitleText);
  objc_msgSend(v6, "appendFormat:", CFSTR("cardImage: '%@'; "), self->_cardImage);
  objc_msgSend(v6, "appendFormat:", CFSTR("fallbackCardImageName: '%@'; "), self->_fallbackCardImageName);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_title)
    objc_msgSend(v3, "addObject:");
  if (self->_subtitle)
    objc_msgSend(v4, "addObject:");
  if (self->_buttonText)
    objc_msgSend(v4, "addObject:");
  if (self->_leftTitleText)
    objc_msgSend(v4, "addObject:");
  if (self->_rightTitleText)
    objc_msgSend(v4, "addObject:");
  if (self->_cardImage)
    objc_msgSend(v4, "addObject:");
  if (self->_fallbackCardImageName)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingMessageExtensionViewProperties *v4;
  PKSharingMessageExtensionViewProperties *v5;
  BOOL v6;

  v4 = (PKSharingMessageExtensionViewProperties *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSharingMessageExtensionViewProperties isEqualToSharingMessageExtensionViewProperties:](self, "isEqualToSharingMessageExtensionViewProperties:", v5);

  return v6;
}

- (BOOL)isEqualToSharingMessageExtensionViewProperties:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (v3
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects())
  {
    v4 = PKEqualObjects();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_buttonText, a3);
}

- (NSString)leftTitleText
{
  return self->_leftTitleText;
}

- (void)setLeftTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_leftTitleText, a3);
}

- (NSString)rightTitleText
{
  return self->_rightTitleText;
}

- (void)setRightTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_rightTitleText, a3);
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardImage, a3);
}

- (NSString)fallbackCardImageName
{
  return self->_fallbackCardImageName;
}

- (void)setFallbackCardImageName:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackCardImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackCardImageName, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_rightTitleText, 0);
  objc_storeStrong((id *)&self->_leftTitleText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
