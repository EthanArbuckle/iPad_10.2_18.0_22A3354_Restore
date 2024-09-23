@implementation PKPeerPaymentProfileAppearanceData

- (PKPeerPaymentProfileAppearanceData)initWithDisplayName:(id)a3 imageData:(id)a4
{
  id v7;
  id v8;
  PKPeerPaymentProfileAppearanceData *v9;
  PKPeerPaymentProfileAppearanceData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentProfileAppearanceData;
  v9 = -[PKPeerPaymentProfileAppearanceData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayName, a3);
    objc_storeStrong((id *)&v10->_imageData, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentProfileAppearanceData)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentProfileAppearanceData *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSData *imageData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentProfileAppearanceData;
  v5 = -[PKPeerPaymentProfileAppearanceData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *displayName;
  id v5;

  displayName = self->_displayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_imageData);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *displayName;
  NSString *v6;
  NSData *imageData;
  NSData *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  displayName = self->_displayName;
  v6 = (NSString *)v4[1];
  if (!displayName || !v6)
  {
    if (displayName == v6)
      goto LABEL_5;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0)
    goto LABEL_9;
LABEL_5:
  imageData = self->_imageData;
  v8 = (NSData *)v4[2];
  if (imageData && v8)
    v9 = -[NSData isEqual:](imageData, "isEqual:");
  else
    v9 = imageData == v8;
LABEL_10:

  return v9;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("imageData: '%@'; "), self->_imageData);
  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
