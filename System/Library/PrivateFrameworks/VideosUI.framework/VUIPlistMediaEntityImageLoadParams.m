@implementation VUIPlistMediaEntityImageLoadParams

- (VUIPlistMediaEntityImageLoadParams)initWithImageURL:(id)a3 baseImageIdentifier:(id)a4 imageType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  VUIPlistMediaEntityImageLoadParams *v11;
  uint64_t v12;
  NSURL *imageURL;
  uint64_t v14;
  NSString *baseImageIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("imageURL"));
    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("baseImageIdentifier"));
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)VUIPlistMediaEntityImageLoadParams;
  v11 = -[VUIPlistMediaEntityImageLoadParams init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    imageURL = v11->_imageURL;
    v11->_imageURL = (NSURL *)v12;

    v14 = objc_msgSend(v10, "copy");
    baseImageIdentifier = v11->_baseImageIdentifier;
    v11->_baseImageIdentifier = (NSString *)v14;

    v11->_imageType = a5;
  }

  return v11;
}

- (VUIPlistMediaEntityImageLoadParams)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (NSString)imageIdentifier
{
  NSString *imageIdentifier;
  unint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  imageIdentifier = self->_imageIdentifier;
  if (!imageIdentifier)
  {
    v4 = -[VUIPlistMediaEntityImageLoadParams imageType](self, "imageType");
    v5 = CFSTR("previewFrame");
    if (v4 != 1)
      v5 = 0;
    if (v4)
      v6 = v5;
    else
      v6 = CFSTR("covertArt");
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[VUIPlistMediaEntityImageLoadParams baseImageIdentifier](self, "baseImageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@_%@"), v8, v6);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_imageIdentifier;
    self->_imageIdentifier = v9;

    imageIdentifier = self->_imageIdentifier;
  }
  return imageIdentifier;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[VUIPlistMediaEntityImageLoadParams imageType](self, "imageType");
  -[VUIPlistMediaEntityImageLoadParams baseImageIdentifier](self, "baseImageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  -[VUIPlistMediaEntityImageLoadParams imageURL](self, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaEntityImageLoadParams *v4;
  VUIPlistMediaEntityImageLoadParams *v5;
  VUIPlistMediaEntityImageLoadParams *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (VUIPlistMediaEntityImageLoadParams *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = -[VUIPlistMediaEntityImageLoadParams imageType](self, "imageType");
        if (v7 != -[VUIPlistMediaEntityImageLoadParams imageType](v6, "imageType"))
        {
LABEL_9:
          v13 = 0;
LABEL_19:

          goto LABEL_20;
        }
        -[VUIPlistMediaEntityImageLoadParams baseImageIdentifier](self, "baseImageIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaEntityImageLoadParams baseImageIdentifier](v6, "baseImageIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        if (v10 == v11)
        {

        }
        else
        {
          v12 = v11;
          v13 = 0;
          if (!v10 || !v11)
          {
LABEL_18:

            goto LABEL_19;
          }
          v14 = objc_msgSend(v10, "isEqual:", v11);

          if ((v14 & 1) == 0)
            goto LABEL_9;
        }
        -[VUIPlistMediaEntityImageLoadParams imageURL](self, "imageURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaEntityImageLoadParams imageURL](v6, "imageURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v15;
        v17 = v16;
        v12 = v17;
        if (v10 == v17)
        {
          v13 = 1;
        }
        else
        {
          v13 = 0;
          if (v10 && v17)
            v13 = objc_msgSend(v10, "isEqual:", v17);
        }
        goto LABEL_18;
      }
    }
    v13 = 0;
  }
LABEL_20:

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaEntityImageLoadParams;
  -[VUIPlistMediaEntityImageLoadParams description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIImageTypeLogString(-[VUIPlistMediaEntityImageLoadParams imageType](self, "imageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("imageType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaEntityImageLoadParams baseImageIdentifier](self, "baseImageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("baseImageIdentifier"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIPlistMediaEntityImageLoadParams imageURL](self, "imageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("imageURL"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@>"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)baseImageIdentifier
{
  return self->_baseImageIdentifier;
}

- (void)setBaseImageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageIdentifier, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end
