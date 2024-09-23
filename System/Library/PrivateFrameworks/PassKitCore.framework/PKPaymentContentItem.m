@implementation PKPaymentContentItem

+ (PKPaymentContentItem)itemWithProtobuf:(id)a3
{
  id v3;
  PKPaymentContentItem *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSData *v10;
  CGImage *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentContentItem);
  objc_msgSend(v3, "imageRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3710];
    v7 = objc_opt_class();
    objc_msgSend(v3, "imageRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentContentItem setImageRequest:](v4, "setImageRequest:", v9);

  }
  objc_msgSend(v3, "image");
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();
  v11 = PKCreateCGImage(v10);

  if (v11)
  {
    -[PKPaymentContentItem setImage:](v4, "setImage:", v11);
    CGImageRelease(v11);
  }
  objc_msgSend(v3, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3710];
    v14 = objc_opt_class();
    objc_msgSend(v3, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unarchivedObjectOfClass:fromData:error:", v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentContentItem setLabel:](v4, "setLabel:", v16);

  }
  objc_msgSend(v3, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3710];
    v19 = objc_opt_class();
    objc_msgSend(v3, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unarchivedObjectOfClass:fromData:error:", v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentContentItem setTitle:](v4, "setTitle:", v21);

  }
  -[PKPaymentContentItem setCentered:](v4, "setCentered:", objc_msgSend(v3, "centered"));

  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentContentItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKPaymentContentItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc_init(PKProtobufPaymentContentItem);
  -[PKPaymentContentItem imageRequest](self, "imageRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentContentItem imageRequest](self, "imageRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentContentItem setImageRequest:](v3, "setImageRequest:", v7);

  }
  v8 = objc_retainAutorelease(self);
  if (-[PKPaymentContentItem image](v8, "image"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCGImage:", -[PKPaymentContentItem image](objc_retainAutorelease(v8), "image"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentContentItem setImage:](v3, "setImage:", v9);

  }
  -[PKPaymentContentItem label](v8, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentContentItem label](v8, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentContentItem setLabel:](v3, "setLabel:", v13);

  }
  -[PKPaymentContentItem title](v8, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB36F8];
    -[PKPaymentContentItem title](v8, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentContentItem setTitle:](v3, "setTitle:", v17);

  }
  -[PKProtobufPaymentContentItem setCentered:](v3, "setCentered:", -[PKPaymentContentItem isCentered](v8, "isCentered"));
  return v3;
}

- (PKPaymentContentItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentContentItem *v5;
  uint64_t v6;
  NSAttributedString *title;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSAttributedString *label;
  uint64_t v13;
  NSURLRequest *imageRequest;
  NSData *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentContentItem;
  v5 = -[PKPaymentContentItem init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSAttributedString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("label"));
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSAttributedString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageRequest"));
    v13 = objc_claimAutoreleasedReturnValue();
    imageRequest = v5->_imageRequest;
    v5->_imageRequest = (NSURLRequest *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v15 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5->_image = PKCreateCGImage(v15);
    v5->_centered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("centered"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageRequest, CFSTR("imageRequest"));
  if (self->_image)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCGImage:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("image"));

  }
  objc_msgSend(v5, "encodeBool:forKey:", self->_centered, CFSTR("centered"));

}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentContentItem;
  -[PKPaymentContentItem dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  CGImage *image;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSAttributedString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSAttributedString copyWithZone:](self->_label, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSURLRequest copyWithZone:](self->_imageRequest, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  image = self->_image;
  if (image)
    *(_QWORD *)(v5 + 24) = CGImageCreateCopy(image);
  *(_BYTE *)(v5 + 8) = self->_centered;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentContentItem *v4;
  PKPaymentContentItem *v5;
  BOOL v6;

  v4 = (PKPaymentContentItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentContentItem isEqualToPaymentContentItem:](self, "isEqualToPaymentContentItem:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentContentItem:(id)a3
{
  _QWORD *v4;
  NSAttributedString *title;
  NSAttributedString *v6;
  BOOL v7;
  NSAttributedString *label;
  NSAttributedString *v9;
  NSURLRequest *imageRequest;
  NSURLRequest *v11;
  BOOL v12;

  v4 = a3;
  title = self->_title;
  v6 = (NSAttributedString *)v4[4];
  if (title)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (title != v6)
      goto LABEL_19;
  }
  else if ((-[NSAttributedString isEqual:](title, "isEqual:") & 1) == 0)
  {
    goto LABEL_19;
  }
  label = self->_label;
  v9 = (NSAttributedString *)v4[5];
  if (label && v9)
  {
    if ((-[NSAttributedString isEqual:](label, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (label != v9)
  {
    goto LABEL_19;
  }
  imageRequest = self->_imageRequest;
  v11 = (NSURLRequest *)v4[2];
  if (!imageRequest || !v11)
  {
    if (imageRequest == v11)
      goto LABEL_17;
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSURLRequest isEqual:](imageRequest, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_17:
  v12 = self->_centered ^ (*((_BYTE *)v4 + 8) == 0);
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_imageRequest);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_centered);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash(17, v3);
  return v5;
}

- (void)setImage:(CGImage *)a3
{
  CGImage *image;

  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (NSURLRequest)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGImage)image
{
  return self->_image;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSAttributedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void)setCentered:(BOOL)a3
{
  self->_centered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
}

@end
