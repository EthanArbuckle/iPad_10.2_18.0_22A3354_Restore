@implementation SFMediaArtworkImage

- (SFMediaArtworkImage)initWithProtobuf:(id)a3
{
  id v4;
  SFMediaArtworkImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFMediaArtworkImage *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFMediaArtworkImage;
  v5 = -[SFMediaArtworkImage init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "persistentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "persistentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaArtworkImage setPersistentID:](v5, "setPersistentID:", v7);

    }
    objc_msgSend(v4, "spotlightIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "spotlightIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaArtworkImage setSpotlightIdentifier:](v5, "setSpotlightIdentifier:", v9);

    }
    if (objc_msgSend(v4, "mediaEntityType"))
      -[SFMediaArtworkImage setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "universalLibraryID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMediaArtworkImage setUniversalLibraryID:](v5, "setUniversalLibraryID:", v11);

    }
    v12 = v5;
  }

  return v5;
}

- (void)setMediaEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mediaEntityType = a3;
}

- (BOOL)hasMediaEntityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMediaArtworkImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBImage *v6;
  SFMediaArtworkImage *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBImage initWithData:]([_SFPBImage alloc], "initWithData:", v5);
  v9.receiver = self;
  v9.super_class = (Class)SFMediaArtworkImage;
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
  _SFPBMediaArtworkImage *v2;
  void *v3;

  v2 = -[_SFPBMediaArtworkImage initWithFacade:]([_SFPBMediaArtworkImage alloc], "initWithFacade:", self);
  -[_SFPBMediaArtworkImage dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMediaArtworkImage *v2;
  void *v3;

  v2 = -[_SFPBMediaArtworkImage initWithFacade:]([_SFPBMediaArtworkImage alloc], "initWithFacade:", self);
  -[_SFPBMediaArtworkImage jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFMediaArtworkImage;
  v4 = -[SFImage copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFMediaArtworkImage persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPersistentID:", v6);

  -[SFMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSpotlightIdentifier:", v8);

  objc_msgSend(v4, "setMediaEntityType:", -[SFMediaArtworkImage mediaEntityType](self, "mediaEntityType"));
  -[SFMediaArtworkImage universalLibraryID](self, "universalLibraryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUniversalLibraryID:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMediaArtworkImage *v5;
  SFMediaArtworkImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v5 = (SFMediaArtworkImage *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFMediaArtworkImage isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v32.receiver = self;
      v32.super_class = (Class)SFMediaArtworkImage;
      if (-[SFImage isEqual:](&v32, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFMediaArtworkImage persistentID](self, "persistentID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaArtworkImage persistentID](v6, "persistentID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        -[SFMediaArtworkImage persistentID](self, "persistentID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFMediaArtworkImage persistentID](self, "persistentID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaArtworkImage persistentID](v6, "persistentID");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        -[SFMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMediaArtworkImage spotlightIdentifier](v6, "spotlightIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_28;
        }
        -[SFMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v26 = v3;
          -[SFMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaArtworkImage spotlightIdentifier](v6, "spotlightIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            v11 = 0;
            v3 = v26;
            goto LABEL_26;
          }
          v28 = v15;
          v3 = v26;
        }
        else
        {
          v28 = 0;
        }
        v17 = -[SFMediaArtworkImage mediaEntityType](self, "mediaEntityType");
        if (v17 == -[SFMediaArtworkImage mediaEntityType](v6, "mediaEntityType"))
        {
          -[SFMediaArtworkImage universalLibraryID](self, "universalLibraryID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMediaArtworkImage universalLibraryID](v6, "universalLibraryID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v18 == 0) != (v19 != 0))
          {
            v25 = v19;
            v27 = v18;
            -[SFMediaArtworkImage universalLibraryID](self, "universalLibraryID");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v24 = (void *)v20;
              -[SFMediaArtworkImage universalLibraryID](self, "universalLibraryID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFMediaArtworkImage universalLibraryID](v6, "universalLibraryID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v23, "isEqual:", v21);

            }
            else
            {

              v11 = 1;
            }
LABEL_25:
            v15 = v28;
            if (!v28)
            {
LABEL_27:

LABEL_28:
              v10 = v31;
              if (!v9)
              {
LABEL_30:

                goto LABEL_31;
              }
LABEL_29:

              goto LABEL_30;
            }
LABEL_26:

            goto LABEL_27;
          }

        }
        v11 = 0;
        goto LABEL_25;
      }
    }
    v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFMediaArtworkImage;
  v3 = -[SFImage hash](&v12, sel_hash);
  -[SFMediaArtworkImage persistentID](self, "persistentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFMediaArtworkImage spotlightIdentifier](self, "spotlightIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFMediaArtworkImage mediaEntityType](self, "mediaEntityType");
  -[SFMediaArtworkImage universalLibraryID](self, "universalLibraryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v3;

  return v10;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (void)setUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
