@implementation TUVideoEffect

- (TUVideoEffect)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUVideoEffect.m"), 20, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUVideoEffect init]");

  return 0;
}

- (TUVideoEffect)initWithName:(id)a3 thumbnailImage:(id)a4
{
  id v6;
  id v7;
  TUVideoEffect *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUVideoEffect;
  v8 = -[TUVideoEffect init](&v12, sel_init);
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_4:
        v9 = objc_msgSend(v6, "copy");
        name = v8->_name;
        v8->_name = (NSString *)v9;

        objc_storeStrong((id *)&v8->_thumbnailImage, a4);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUVideoEffect initWithName:thumbnailImage:]", CFSTR("name"));
      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUVideoEffect initWithName:thumbnailImage:]", CFSTR("thumbnailImage"));
    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUVideoEffect isEqualToEffect:](self, "isEqualToEffect:", v4);

  return v5;
}

- (BOOL)isEqualToEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[TUVideoEffect name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TUVideoEffect thumbnailImage](self, "thumbnailImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TUVideoEffect name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUVideoEffect thumbnailImage](self, "thumbnailImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
