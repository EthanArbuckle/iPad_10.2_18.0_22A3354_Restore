@implementation PKTransactionReceiptLineItem

- (PKTransactionReceiptLineItem)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKTransactionReceiptLineItem *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *subtitle;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *secondarySubtitle;
  uint64_t v23;
  NSURL *iconImageURL;
  uint64_t v25;
  NSDecimalNumber *amount;
  uint64_t v27;
  NSString *currencyCode;
  void *v29;
  uint64_t v30;
  void *image;
  NSURL *v32;
  void *v33;
  uint64_t v34;
  PKImage *v35;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PKTransactionReceiptLineItem;
  v8 = -[PKTransactionReceiptLineItem init](&v37, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      PKLocalizedReceiptStringForReceiptBundle(v11, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      title = v8->_title;
      v8->_title = (NSString *)v13;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("subtitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      PKLocalizedReceiptStringForReceiptBundle(v15, v7);
      v17 = objc_claimAutoreleasedReturnValue();
      subtitle = v8->_subtitle;
      v8->_subtitle = (NSString *)v17;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("itemDescription"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      PKLocalizedReceiptStringForReceiptBundle(v19, v7);
      v21 = objc_claimAutoreleasedReturnValue();
      secondarySubtitle = v8->_secondarySubtitle;
      v8->_secondarySubtitle = (NSString *)v21;

    }
    objc_msgSend(v6, "PKURLForKey:", CFSTR("imageURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    iconImageURL = v8->_iconImageURL;
    v8->_iconImageURL = (NSURL *)v23;

    v8->_quantity = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("quantity"));
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v25 = objc_claimAutoreleasedReturnValue();
    amount = v8->_amount;
    v8->_amount = (NSDecimalNumber *)v25;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("currencyCode"));
    v27 = objc_claimAutoreleasedReturnValue();
    currencyCode = v8->_currencyCode;
    v8->_currencyCode = (NSString *)v27;

    v8->_adamIdentifier = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("adamID"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("imageName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", v29, v7);
      v30 = objc_claimAutoreleasedReturnValue();
      image = v8->_image;
      v8->_image = (PKImage *)v30;
    }
    else
    {
      v32 = v8->_iconImageURL;
      if (!v32)
      {
LABEL_13:

        goto LABEL_14;
      }
      -[NSURL pathExtension](v32, "pathExtension");
      image = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathExtension:](v8->_identifier, "stringByAppendingPathExtension:", image);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKImage imageNamed:inBundle:](PKImage, "imageNamed:inBundle:", v33, v7);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v8->_image;
      v8->_image = (PKImage *)v34;

    }
    goto LABEL_13;
  }
LABEL_14:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("title: '%@'; "), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("subtitle: '%@'; "), self->_subtitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("image: '%@'; "), self->_image);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_quantity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("quantity: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_adamIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("adamIdentifier: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKTransactionReceiptLineItem *v4;
  PKTransactionReceiptLineItem *v5;
  BOOL v6;

  v4 = (PKTransactionReceiptLineItem *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKTransactionReceiptLineItem isEqualToTransactionReceiptLineItem:](self, "isEqualToTransactionReceiptLineItem:", v5);

  return v6;
}

- (BOOL)isEqualToTransactionReceiptLineItem:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  NSURL *iconImageURL;
  NSURL *v21;
  PKImage *image;
  PKImage *v23;
  NSDecimalNumber *amount;
  NSDecimalNumber *v25;
  void *v26;
  NSString *v27;
  _BOOL4 v28;
  BOOL v29;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_48;
  v6 = (void *)v4[1];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_47;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_48;
  }
  v11 = (void *)v5[2];
  v7 = self->_title;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_47;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_48;
  }
  v14 = (void *)v5[3];
  v7 = self->_subtitle;
  v15 = v14;
  if (v7 == v15)
  {

  }
  else
  {
    v9 = v15;
    if (!v7 || !v15)
      goto LABEL_47;
    v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_48;
  }
  v17 = (void *)v5[4];
  v7 = self->_secondarySubtitle;
  v18 = v17;
  if (v7 == v18)
  {

  }
  else
  {
    v9 = v18;
    if (!v7 || !v18)
      goto LABEL_47;
    v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_48;
  }
  iconImageURL = self->_iconImageURL;
  v21 = (NSURL *)v5[9];
  if (iconImageURL && v21)
  {
    if ((-[NSURL isEqual:](iconImageURL, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (iconImageURL != v21)
  {
    goto LABEL_48;
  }
  image = self->_image;
  v23 = (PKImage *)v5[5];
  if (image && v23)
  {
    if (!-[PKImage isEqual:](image, "isEqual:"))
      goto LABEL_48;
  }
  else if (image != v23)
  {
    goto LABEL_48;
  }
  if (self->_quantity != v5[6])
    goto LABEL_48;
  amount = self->_amount;
  v25 = (NSDecimalNumber *)v5[7];
  if (amount && v25)
  {
    if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
      goto LABEL_48;
  }
  else if (amount != v25)
  {
    goto LABEL_48;
  }
  v26 = (void *)v5[8];
  v7 = self->_currencyCode;
  v27 = v26;
  if (v7 == v27)
  {

LABEL_51:
    v29 = self->_adamIdentifier == v5[10];
    goto LABEL_49;
  }
  v9 = v27;
  if (!v7 || !v27)
  {
LABEL_47:

    goto LABEL_48;
  }
  v28 = -[NSString isEqualToString:](v7, "isEqualToString:", v27);

  if (v28)
    goto LABEL_51;
LABEL_48:
  v29 = 0;
LABEL_49:

  return v29;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_subtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_secondarySubtitle);
  objc_msgSend(v3, "safelyAddObject:", self->_iconImageURL);
  objc_msgSend(v3, "safelyAddObject:", self->_image);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_adamIdentifier - v4 + 32 * v4;
  v6 = self->_quantity - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTransactionReceiptLineItem)initWithCoder:(id)a3
{
  id v4;
  PKTransactionReceiptLineItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *secondarySubtitle;
  uint64_t v14;
  NSURL *iconImageURL;
  uint64_t v16;
  PKImage *image;
  uint64_t v18;
  NSDecimalNumber *amount;
  uint64_t v20;
  NSString *currencyCode;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKTransactionReceiptLineItem;
  v5 = -[PKTransactionReceiptLineItem init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondarySubtitle = v5->_secondarySubtitle;
    v5->_secondarySubtitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconImageURL = v5->_iconImageURL;
    v5->_iconImageURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v16 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImage *)v16;

    v5->_quantity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("quantity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v18 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v20;

    v5->_adamIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("adamID"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySubtitle, CFSTR("itemDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconImageURL, CFSTR("imageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_quantity, CFSTR("quantity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_adamIdentifier, CFSTR("adamID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_secondarySubtitle, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSURL copyWithZone:](self->_iconImageURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  objc_storeStrong((id *)(v5 + 40), self->_image);
  *(_QWORD *)(v5 + 48) = self->_quantity;
  v16 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  *(_QWORD *)(v5 + 80) = self->_adamIdentifier;
  return (id)v5;
}

- (PKCurrencyAmount)currencyAmount
{
  NSDecimalNumber *amount;
  NSString *currencyCode;

  amount = self->_amount;
  if (amount)
  {
    currencyCode = self->_currencyCode;
    if (currencyCode)
    {
      PKCurrencyAmountCreate(amount, currencyCode, 0);
      amount = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      amount = 0;
    }
  }
  return (PKCurrencyAmount *)amount;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)secondarySubtitle
{
  return self->_secondarySubtitle;
}

- (void)setSecondarySubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (unint64_t)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(unint64_t)a3
{
  self->_quantity = a3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)iconImageURL
{
  return self->_iconImageURL;
}

- (void)setIconImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageURL, a3);
}

- (unint64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(unint64_t)a3
{
  self->_adamIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageURL, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondarySubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
