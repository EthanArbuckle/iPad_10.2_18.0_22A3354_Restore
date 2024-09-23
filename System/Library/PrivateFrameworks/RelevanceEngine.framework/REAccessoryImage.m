@implementation REAccessoryImage

- (REAccessoryImage)initWithCoder:(id)a3
{
  id v4;
  REAccessoryImage *v5;
  uint64_t v6;
  REImage *image;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REAccessoryImage;
  v5 = -[REAccessoryImage init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (REImage *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_image, CFSTR("_image"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  REAccessoryImage *v5;
  REImage *v6;
  REImage *image;

  v5 = -[REAccessoryImage init](+[REAccessoryImage allocWithZone:](REAccessoryImage, "allocWithZone:"), "init");
  v6 = -[REImage copyWithZone:](self->_image, "copyWithZone:", a3);
  image = v5->_image;
  v5->_image = v6;

  return v5;
}

- (unint64_t)hash
{
  return -[REImage hash](self->_image, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  REImage *image;
  REImage *v6;
  REImage *v7;
  REImage *v8;
  unsigned __int8 v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    image = self->_image;
    v6 = (REImage *)v4[1];
    v7 = image;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[REImage isEqual:](v7, "isEqual:", v6);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REAccessoryImage;
    v9 = -[REAccessoryImage isEqual:](&v11, sel_isEqual_, v4);
  }

  return v9;
}

- (REImage)image
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
