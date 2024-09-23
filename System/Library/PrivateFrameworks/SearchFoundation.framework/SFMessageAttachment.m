@implementation SFMessageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFMessageAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMessageAttachment *v6;
  SFMessageAttachment *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBMessageAttachment initWithData:]([_SFPBMessageAttachment alloc], "initWithData:", v5);
  v7 = -[SFMessageAttachment initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBMessageAttachment *v6;

  v4 = a3;
  v6 = -[_SFPBMessageAttachment initWithFacade:]([_SFPBMessageAttachment alloc], "initWithFacade:", self);
  -[_SFPBMessageAttachment data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBMessageAttachment *v2;
  void *v3;

  v2 = -[_SFPBMessageAttachment initWithFacade:]([_SFPBMessageAttachment alloc], "initWithFacade:", self);
  -[_SFPBMessageAttachment dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBMessageAttachment *v2;
  void *v3;

  v2 = -[_SFPBMessageAttachment initWithFacade:]([_SFPBMessageAttachment alloc], "initWithFacade:", self);
  -[_SFPBMessageAttachment jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[SFMessageAttachment type](self, "type"));
  -[SFMessageAttachment url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setUrl:", v6);

  -[SFMessageAttachment linkMetadata](self, "linkMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLinkMetadata:", v8);

  -[SFMessageAttachment photosLibraryImage](self, "photosLibraryImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPhotosLibraryImage:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFMessageAttachment *v5;
  SFMessageAttachment *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v32;

  v5 = (SFMessageAttachment *)a3;
  if (self == v5)
  {
    v12 = 1;
  }
  else
  {
    if (-[SFMessageAttachment isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      v7 = -[SFMessageAttachment type](self, "type");
      if (v7 != -[SFMessageAttachment type](v6, "type"))
      {
        v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[SFMessageAttachment url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageAttachment url](v6, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 == 0) == (v9 != 0))
      {
        v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      -[SFMessageAttachment url](self, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[SFMessageAttachment url](self, "url");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMessageAttachment url](v6, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v11))
        {
          v12 = 0;
          goto LABEL_30;
        }
        v32 = v11;
      }
      -[SFMessageAttachment linkMetadata](self, "linkMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageAttachment linkMetadata](v6, "linkMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        v12 = 0;
        goto LABEL_29;
      }
      -[SFMessageAttachment linkMetadata](self, "linkMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v26 = v13;
        -[SFMessageAttachment linkMetadata](self, "linkMetadata");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFMessageAttachment linkMetadata](v6, "linkMetadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v12 = 0;
          v13 = v26;
          goto LABEL_27;
        }
        v30 = v16;
        v31 = v3;
        v13 = v26;
      }
      else
      {
        v30 = 0;
        v31 = v3;
      }
      -[SFMessageAttachment photosLibraryImage](self, "photosLibraryImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageAttachment photosLibraryImage](v6, "photosLibraryImage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v18 == 0) == (v19 != 0))
      {

        v12 = 0;
        v16 = v30;
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
      else
      {
        v25 = v18;
        v27 = v19;
        -[SFMessageAttachment photosLibraryImage](self, "photosLibraryImage");
        v20 = objc_claimAutoreleasedReturnValue();
        v16 = v30;
        if (v20)
        {
          v24 = (void *)v20;
          -[SFMessageAttachment photosLibraryImage](self, "photosLibraryImage");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFMessageAttachment photosLibraryImage](v6, "photosLibraryImage");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v23, "isEqual:");

        }
        else
        {

          v12 = 1;
        }
        v3 = v31;
        if (!v30)
          goto LABEL_28;
      }
LABEL_27:

LABEL_28:
LABEL_29:
      v11 = v32;
      if (!v10)
      {
LABEL_31:

        goto LABEL_32;
      }
LABEL_30:

      goto LABEL_31;
    }
    v12 = 0;
  }
LABEL_34:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SFMessageAttachment type](self, "type");
  -[SFMessageAttachment url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFMessageAttachment linkMetadata](self, "linkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFMessageAttachment photosLibraryImage](self, "photosLibraryImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (int)type
{
  return self->_type;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFPhotosLibraryImage)photosLibraryImage
{
  return self->_photosLibraryImage;
}

- (void)setPhotosLibraryImage:(id)a3
{
  objc_storeStrong((id *)&self->_photosLibraryImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibraryImage, 0);
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (SFMessageAttachment)initWithProtobuf:(id)a3
{
  id v4;
  SFMessageAttachment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFPhotosLibraryImage *v12;
  void *v13;
  SFPhotosLibraryImage *v14;
  SFMessageAttachment *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFMessageAttachment;
  v5 = -[SFMessageAttachment init](&v17, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "type"))
      -[SFMessageAttachment setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageAttachment setUrl:](v5, "setUrl:", v8);

    }
    objc_msgSend(v4, "linkMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "linkMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessageAttachment setLinkMetadata:](v5, "setLinkMetadata:", v10);

    }
    objc_msgSend(v4, "photosLibraryImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [SFPhotosLibraryImage alloc];
      objc_msgSend(v4, "photosLibraryImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SFPhotosLibraryImage initWithProtobuf:](v12, "initWithProtobuf:", v13);
      -[SFMessageAttachment setPhotosLibraryImage:](v5, "setPhotosLibraryImage:", v14);

    }
    v15 = v5;
  }

  return v5;
}

@end
