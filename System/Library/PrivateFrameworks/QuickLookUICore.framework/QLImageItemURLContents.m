@implementation QLImageItemURLContents

+ (id)imageItemContentsWithImage:(id)a3 imageURL:(id)a4
{
  id v5;
  id v6;
  QLImageItemURLContents *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[QLImageItemContents initWithImage:]([QLImageItemURLContents alloc], "initWithImage:", v6);

  -[QLImageItemURLContents setImageURL:](v7, "setImageURL:", v5);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
}

- (QLImageItemURLContents)initWithCoder:(id)a3
{
  id v4;
  QLImageItemURLContents *v5;
  uint64_t v6;
  NSURL *imageURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemURLContents;
  v5 = -[QLImageItemContents initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end
