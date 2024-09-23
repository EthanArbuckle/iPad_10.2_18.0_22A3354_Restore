@implementation VIThirdPartyObject

- (VIThirdPartyObject)initWithObjectIdentifier:(id)a3 imageURL:(id)a4 thumbnailURL:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  VIThirdPartyObject *v14;
  uint64_t v15;
  NSString *objectIdentifier;
  uint64_t v17;
  NSString *imageURL;
  uint64_t v19;
  NSString *thumbnailURL;
  uint64_t v21;
  NSData *metadata;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VIThirdPartyObject;
  v14 = -[VIThirdPartyObject init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    objectIdentifier = v14->_objectIdentifier;
    v14->_objectIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    imageURL = v14->_imageURL;
    v14->_imageURL = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    thumbnailURL = v14->_thumbnailURL;
    v14->_thumbnailURL = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    metadata = v14->_metadata;
    v14->_metadata = (NSData *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  VIThirdPartyObject *v4;
  VIThirdPartyObject *v5;
  VIThirdPartyObject *v6;
  NSString *objectIdentifier;
  void *v8;
  NSString *imageURL;
  void *v10;
  NSString *thumbnailURL;
  void *v12;
  NSData *metadata;
  void *v14;
  char IsEqual;

  v4 = (VIThirdPartyObject *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    objectIdentifier = self->_objectIdentifier;
    -[VIThirdPartyObject objectIdentifier](v6, "objectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)objectIdentifier, (uint64_t)v8))
    {
      imageURL = self->_imageURL;
      -[VIThirdPartyObject imageURL](v6, "imageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)imageURL, (uint64_t)v10))
      {
        thumbnailURL = self->_thumbnailURL;
        -[VIThirdPartyObject thumbnailURL](v6, "thumbnailURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (VIObjectIsEqual((unint64_t)thumbnailURL, (uint64_t)v12))
        {
          metadata = self->_metadata;
          -[VIThirdPartyObject metadata](v6, "metadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          IsEqual = VIObjectIsEqual((unint64_t)metadata, (uint64_t)v14);

        }
        else
        {
          IsEqual = 0;
        }

      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_objectIdentifier, "hash");
  v4 = -[NSString hash](self->_imageURL, "hash") ^ v3;
  v5 = -[NSString hash](self->_thumbnailURL, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_metadata, "hash");
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
