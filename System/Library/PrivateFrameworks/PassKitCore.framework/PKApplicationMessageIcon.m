@implementation PKApplicationMessageIcon

+ (CGSize)maximumSizeForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  if (a3)
  {
    if (a3 == 1)
    {
      PKGetMaxPassWidth();
      v4 = round(v3 / 375.0 * 236.0);
      v5 = 45.0 / v3;
      if (v3 == 0.0)
        v5 = 1.0;
      v6 = 45.0 / v4;
      if (v4 == 0.0)
        v6 = 1.0;
      if (fmin(v5, v6) != 1.0)
      {
        if (v5 >= v6)
        {
          v3 = v3 / v4 * 45.0;
          v4 = 45.0;
        }
        else
        {
          v7 = v4 / v3;
          v3 = 45.0;
          v4 = v7 * 45.0;
        }
      }
    }
    else
    {
      v3 = *MEMORY[0x1E0C9D820];
      v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    v3 = 45.0;
    v4 = 45.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)createWithImage:(id)a3 style:(int64_t)a4
{
  id v6;
  PKApplicationMessageIcon *v7;
  id v8;
  void *v9;
  id *v10;
  id *v11;
  PKApplicationMessageIcon *v12;
  objc_super v14;

  v6 = a3;
  v7 = [PKApplicationMessageIcon alloc];
  v8 = v6;
  v9 = v8;
  if (v7 && v8)
  {
    v14.receiver = v7;
    v14.super_class = (Class)PKApplicationMessageIcon;
    v10 = objc_msgSendSuper2(&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a3);
      v11[2] = (id)a4;
    }
    v7 = v11;
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKApplicationMessageIcon)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageIcon)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageIcon *v5;
  uint64_t v6;
  PKImageDescriptor *image;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageIcon;
  v5 = -[PKApplicationMessageIcon init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImageDescriptor *)v6;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKImageDescriptor *image;
  id v5;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", image, CFSTR("image"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_style, CFSTR("style"));

}

- (BOOL)isEqual:(id)a3
{
  PKApplicationMessageIcon *v4;
  char isKindOfClass;
  char v6;
  PKApplicationMessageIcon *v7;
  PKApplicationMessageIcon *v8;
  PKImageDescriptor *image;
  PKImageDescriptor *v10;

  v4 = (PKApplicationMessageIcon *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = v7;
      if (self && v7->_style == self->_style)
      {
        image = self->_image;
        v10 = v8->_image;
        if (image && v10)
          v6 = -[PKImageDescriptor isEqual:](image, "isEqual:");
        else
          v6 = image == v10;
      }
      else
      {
        v6 = 0;
      }

    }
  }

  return v6;
}

- (unint64_t)hash
{
  -[PKImageDescriptor hash](self->_image, "hash");
  return SipHash();
}

- (PKImageDescriptor)image
{
  return self->_image;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
