@implementation ICQIconSpecification

- (ICQIconSpecification)initWithDictionary:(id)a3
{
  id v4;
  ICQIconSpecification *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *assetID;
  ICQImageURL *v10;
  void *v11;
  uint64_t v12;
  ICQImageURL *imageURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQIconSpecification;
  v5 = -[ICQIconSpecification init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetId"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v8;

    v10 = [ICQImageURL alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urls"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICQImageURL initFromDictionary:](v10, "initFromDictionary:", v11);
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ICQIconSpecification bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleId"));

  -[ICQIconSpecification assetID](self, "assetID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetId"));

  -[ICQIconSpecification imageURL](self, "imageURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("urls"));

}

- (ICQIconSpecification)initWithCoder:(id)a3
{
  id v4;
  ICQIconSpecification *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *assetID;
  uint64_t v10;
  ICQImageURL *imageURL;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQIconSpecification;
  v5 = -[ICQIconSpecification init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetId"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("urls"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v10;

  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
