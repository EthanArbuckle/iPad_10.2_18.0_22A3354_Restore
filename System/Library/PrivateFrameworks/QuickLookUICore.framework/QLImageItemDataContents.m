@implementation QLImageItemDataContents

+ (id)imageItemContentsWithImage:(id)a3 imageData:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(v7, "setImageData:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
}

- (QLImageItemDataContents)initWithCoder:(id)a3
{
  id v4;
  QLImageItemDataContents *v5;
  uint64_t v6;
  NSData *imageData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemDataContents;
  v5 = -[QLImageItemContents initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

  }
  return v5;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
