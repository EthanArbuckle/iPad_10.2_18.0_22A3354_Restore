@implementation PKAMSLookupItem

- (PKAMSLookupItem)init
{

  return 0;
}

- (PKAMSLookupItem)initWithDict:(id)a3
{
  id v4;
  PKAMSLookupItem *v5;
  void *v6;
  uint64_t v7;
  NSNumber *appStoreIdentifier;
  uint64_t v9;
  ASCArtwork *artwork;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSString *distributionIdentifier;
  PKAMSLookupItem *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)PKAMSLookupItem;
    v5 = -[PKAMSLookupItem init](&v17, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9C00]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberValue");
      v7 = objc_claimAutoreleasedReturnValue();
      appStoreIdentifier = v5->_appStoreIdentifier;
      v5->_appStoreIdentifier = (NSNumber *)v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9C10]);
      v9 = objc_claimAutoreleasedReturnValue();
      artwork = v5->_artwork;
      v5->_artwork = (ASCArtwork *)v9;

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9C28]);
      v11 = objc_claimAutoreleasedReturnValue();
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF9C08]);
      v13 = objc_claimAutoreleasedReturnValue();
      distributionIdentifier = v5->_distributionIdentifier;
      v5->_distributionIdentifier = (NSString *)v13;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSNumber)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (NSString)distributionIdentifier
{
  return self->_distributionIdentifier;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_distributionIdentifier, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
}

@end
