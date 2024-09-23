@implementation PKPhysicalCardArtworkOption

- (PKPhysicalCardArtworkOption)initWithDictionary:(id)a3
{
  id v4;
  PKPhysicalCardArtworkOption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *frontFaceImageURL;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPhysicalCardArtworkOption;
  v5 = -[PKPhysicalCardArtworkOption init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("frontFaceImageURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v8;

    v5->_minimumEstimatedShippingTime = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("minimumEstimatedShippingTime"));
    v5->_maximumEstimatedShippingTime = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("maximumEstimatedShippingTime"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("deliveryUnit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 0;
    if (v11 == CFSTR("days") || !v11)
      goto LABEL_12;
    v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("days"));

    if ((v14 & 1) == 0)
    {
      v15 = v12;
      if (v15 == CFSTR("weeks")
        || (v16 = v15,
            v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("weeks")),
            v16,
            (v17 & 1) != 0))
      {
        v13 = 1;
        goto LABEL_12;
      }
      v18 = v16;
      if (v18 == CFSTR("months")
        || (v19 = v18,
            v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("months")),
            v19,
            v20))
      {
        v13 = 2;
        goto LABEL_12;
      }
    }
    v13 = 0;
LABEL_12:

    v5->_shippingTimeUnit = v13;
    v5->_optionUnavailable = objc_msgSend(v4, "PKBoolForKey:", CFSTR("notAvailable"));
  }

  return v5;
}

- (void)setFrontFaceImage:(id)a3
{
  PKImage *v5;
  PKImage **p_frontFaceImage;
  PKImage *frontFaceImage;
  PKImage *v8;

  v5 = (PKImage *)a3;
  frontFaceImage = self->_frontFaceImage;
  p_frontFaceImage = &self->_frontFaceImage;
  if (frontFaceImage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_frontFaceImage, a3);
    v5 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCardArtworkOption)initWithCoder:(id)a3
{
  id v4;
  PKPhysicalCardArtworkOption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *frontFaceImageURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicalCardArtworkOption;
  v5 = -[PKPhysicalCardArtworkOption init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frontFaceImageURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v8;

    v5->_minimumEstimatedShippingTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumEstimatedShippingTime"));
    v5->_maximumEstimatedShippingTime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumEstimatedShippingTime"));
    v5->_shippingTimeUnit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deliveryUnit"));
    v5->_optionUnavailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notAvailable"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_frontFaceImageURL, CFSTR("frontFaceImageURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minimumEstimatedShippingTime, CFSTR("minimumEstimatedShippingTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumEstimatedShippingTime, CFSTR("maximumEstimatedShippingTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shippingTimeUnit, CFSTR("deliveryUnit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_optionUnavailable, CFSTR("notAvailable"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSURL *frontFaceImageURL;
  NSURL *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_16;
  }
  else if (identifier != v6)
  {
    goto LABEL_16;
  }
  frontFaceImageURL = self->_frontFaceImageURL;
  v8 = (NSURL *)v4[3];
  if (!frontFaceImageURL || !v8)
  {
    if (frontFaceImageURL == v8)
      goto LABEL_12;
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if ((-[NSURL isEqual:](frontFaceImageURL, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_12:
  if (self->_minimumEstimatedShippingTime != v4[4]
    || self->_maximumEstimatedShippingTime != v4[5]
    || self->_shippingTimeUnit != v4[6])
  {
    goto LABEL_16;
  }
  v9 = self->_optionUnavailable == *((unsigned __int8 *)v4 + 8);
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_frontFaceImageURL);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_minimumEstimatedShippingTime - v4 + 32 * v4;
  v6 = self->_maximumEstimatedShippingTime - v5 + 32 * v5;
  v7 = self->_shippingTimeUnit - v6 + 32 * v6;
  v8 = self->_optionUnavailable - v7 + 32 * v7;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)frontFaceImageURL
{
  return self->_frontFaceImageURL;
}

- (void)setFrontFaceImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_frontFaceImageURL, a3);
}

- (unint64_t)minimumEstimatedShippingTime
{
  return self->_minimumEstimatedShippingTime;
}

- (unint64_t)maximumEstimatedShippingTime
{
  return self->_maximumEstimatedShippingTime;
}

- (int64_t)shippingTimeUnit
{
  return self->_shippingTimeUnit;
}

- (BOOL)optionUnavailable
{
  return self->_optionUnavailable;
}

- (PKImage)frontFaceImage
{
  return self->_frontFaceImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontFaceImage, 0);
  objc_storeStrong((id *)&self->_frontFaceImageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
