@implementation STAppMetadata

- (STAppMetadata)initWithBundleIdentifier:(id)a3 displayName:(id)a4 artworkURL:(id)a5 vendorName:(id)a6 ratingLabel:(id)a7 software:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  STAppMetadata *v19;
  uint64_t v20;
  NSString *bundleIdentifier;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  NSURL *artworkURL;
  uint64_t v26;
  NSString *vendorName;
  uint64_t v28;
  NSString *ratingLabel;
  uint64_t v30;
  NSString *software;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)STAppMetadata;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[STAppMetadata init](&v33, sel_init);
  v20 = objc_msgSend(v18, "copy", v33.receiver, v33.super_class);

  bundleIdentifier = v19->_bundleIdentifier;
  v19->_bundleIdentifier = (NSString *)v20;

  v22 = objc_msgSend(v17, "copy");
  displayName = v19->_displayName;
  v19->_displayName = (NSString *)v22;

  v24 = objc_msgSend(v16, "copy");
  artworkURL = v19->_artworkURL;
  v19->_artworkURL = (NSURL *)v24;

  v26 = objc_msgSend(v15, "copy");
  vendorName = v19->_vendorName;
  v19->_vendorName = (NSString *)v26;

  v28 = objc_msgSend(v14, "copy");
  ratingLabel = v19->_ratingLabel;
  v19->_ratingLabel = (NSString *)v28;

  v30 = objc_msgSend(v13, "copy");
  software = v19->_software;
  v19->_software = (NSString *)v30;

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleIdentifier:displayName:artworkURL:vendorName:ratingLabel:software:", self->_bundleIdentifier, self->_displayName, self->_artworkURL, self->_vendorName, self->_ratingLabel, self->_software);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
