@implementation SFShortcutsImage

- (SFShortcutsImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFShortcutsImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFShortcutsImage;
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
  _SFPBShortcutsImage *v2;
  void *v3;

  v2 = -[_SFPBShortcutsImage initWithFacade:]([_SFPBShortcutsImage alloc], "initWithFacade:", self);
  -[_SFPBShortcutsImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBShortcutsImage *v2;
  void *v3;

  v2 = -[_SFPBShortcutsImage initWithFacade:]([_SFPBShortcutsImage alloc], "initWithFacade:", self);
  -[_SFPBShortcutsImage jsonData](v2, "jsonData");
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
  v8.super_class = (Class)SFShortcutsImage;
  v4 = -[SFImage copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFShortcutsImage lnPropertyIdentifier](self, "lnPropertyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLnPropertyIdentifier:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFShortcutsImage *v4;
  SFShortcutsImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFShortcutsImage *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFShortcutsImage isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFShortcutsImage,
             -[SFImage isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFShortcutsImage lnPropertyIdentifier](self, "lnPropertyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShortcutsImage lnPropertyIdentifier](v5, "lnPropertyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFShortcutsImage lnPropertyIdentifier](self, "lnPropertyIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFShortcutsImage lnPropertyIdentifier](self, "lnPropertyIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFShortcutsImage lnPropertyIdentifier](v5, "lnPropertyIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFShortcutsImage;
  v3 = -[SFImage hash](&v7, sel_hash);
  -[SFShortcutsImage lnPropertyIdentifier](self, "lnPropertyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (void)setLnPropertyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShortcutsImage)initWithProtobuf:(id)a3
{
  id v4;
  SFShortcutsImage *v5;
  void *v6;
  void *v7;
  SFShortcutsImage *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFShortcutsImage;
  v5 = -[SFShortcutsImage init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "lnPropertyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "lnPropertyIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFShortcutsImage setLnPropertyIdentifier:](v5, "setLnPropertyIdentifier:", v7);

    }
    v8 = v5;
  }

  return v5;
}

@end
