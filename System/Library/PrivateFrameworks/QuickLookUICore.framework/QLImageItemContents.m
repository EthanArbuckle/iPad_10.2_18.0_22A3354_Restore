@implementation QLImageItemContents

- (QLImageItemContents)initWithImage:(id)a3
{
  id v5;
  QLImageItemContents *v6;
  QLImageItemContents *v7;
  QLImageItemContents *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLImageItemContents;
  v6 = -[QLImageItemContents init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_image, CFSTR("image"));
}

- (QLImageItemContents)initWithCoder:(id)a3
{
  id v4;
  QLImageItemContents *v5;
  uint64_t v6;
  UIImage *image;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLImageItemContents;
  v5 = -[QLImageItemContents init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v6;

  }
  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
