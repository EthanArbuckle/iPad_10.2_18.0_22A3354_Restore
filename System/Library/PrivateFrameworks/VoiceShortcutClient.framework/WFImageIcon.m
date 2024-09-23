@implementation WFImageIcon

- (WFImageIcon)initWithImage:(id)a3
{
  id v6;
  id *v7;
  WFImageIcon *v8;
  WFImageIcon *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFImageIcon;
  v7 = -[WFIcon _init](&v12, sel__init);
  v8 = (WFImageIcon *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[WFImage hash](self->_image, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFImageIcon image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (WFImageIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFImageIcon *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFImageIcon initWithImage:](self, "initWithImage:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_image, CFSTR("image"));
}

- (WFImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
