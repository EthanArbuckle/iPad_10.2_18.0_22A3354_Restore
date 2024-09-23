@implementation WBSRecentItem

- (WBSRecentItem)initWithIdentifier:(id)a3 url:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSRecentItem *v11;
  uint64_t v12;
  NSObject *identifier;
  WBSRecentItem *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSRecentItem;
  v11 = -[WBSRecentItem init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copyWithZone:", 0);
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_URL, a4);
    objc_storeStrong((id *)&v11->_date, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  WBSRecentItem *v4;
  id *v5;
  char v6;

  v4 = (WBSRecentItem *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (objc_msgSend(v5[2], "isEqual:", self->_URL))
        v6 = objc_msgSend(v5[1], "isEqual:", self->_identifier);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_URL, "hash");
  return -[NSObject hash](self->_identifier, "hash") ^ v3;
}

- (NSString)deviceLocationDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WBSRecentItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguatedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSRecentItem icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSItemProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (WBSCloudTabItem)cloudTab
{
  return self->_cloudTab;
}

- (void)setCloudTab:(id)a3
{
  objc_storeStrong((id *)&self->_cloudTab, a3);
}

- (WBSCloudTabProvider)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (int64_t)metadataState
{
  return self->_metadataState;
}

- (void)setMetadataState:(int64_t)a3
{
  self->_metadataState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cloudTab, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
