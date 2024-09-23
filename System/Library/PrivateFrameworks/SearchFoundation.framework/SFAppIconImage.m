@implementation SFAppIconImage

- (SFAppIconImage)initWithProtobuf:(id)a3
{
  id v4;
  SFAppIconImage *v5;
  void *v6;
  void *v7;
  SFAppIconImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAppIconImage;
  v5 = -[SFAppIconImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppIconImage setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

    }
    if (objc_msgSend(v4, "iconType"))
      -[SFAppIconImage setIconType:](v5, "setIconType:", objc_msgSend(v4, "iconType"));
    v8 = v5;
  }

  return v5;
}

- (void)setIconType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iconType = a3;
}

- (BOOL)hasIconType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFAppIconImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFAppIconImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFAppIconImage;
  v7 = -[SFImage initWithProtobuf:](&v9, sel_initWithProtobuf_, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;

  v4 = a3;
  v6 = -[_SFPBImage initWithFacade:]([_SFPBImage alloc], "initWithFacade:", self);
  -[_SFPBImage data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBAppIconImage initWithFacade:]([_SFPBAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBAppIconImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAppIconImage *v2;
  void *v3;

  v2 = -[_SFPBAppIconImage initWithFacade:]([_SFPBAppIconImage alloc], "initWithFacade:", self);
  -[_SFPBAppIconImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAppIconImage;
  v4 = -[SFImage copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  objc_msgSend(v4, "setIconType:", -[SFAppIconImage iconType](self, "iconType"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SFAppIconImage *v6;
  SFAppIconImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  objc_super v14;

  v6 = (SFAppIconImage *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAppIconImage isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAppIconImage;
      if (-[SFImage isEqual:](&v14, sel_isEqual_, v6))
      {
        v7 = v6;
        -[SFAppIconImage bundleIdentifier](self, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAppIconImage bundleIdentifier](v7, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        -[SFAppIconImage bundleIdentifier](self, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[SFAppIconImage bundleIdentifier](self, "bundleIdentifier"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFAppIconImage bundleIdentifier](v7, "bundleIdentifier"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[SFAppIconImage iconType](self, "iconType");
          v11 = v12 == -[SFAppIconImage iconType](v7, "iconType");
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          v11 = 0;
        }

        goto LABEL_13;
      }
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAppIconImage;
  v3 = -[SFImage hash](&v8, sel_hash);
  -[SFAppIconImage bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFAppIconImage iconType](self, "iconType") ^ v3;

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int)iconType
{
  return self->_iconType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
