@implementation PKDiscoveryMediaRemoteAsset

- (PKDiscoveryMediaRemoteAsset)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryMediaRemoteAsset *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *sha1Hex;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryMediaRemoteAsset;
  v5 = -[PKDiscoveryMediaRemoteAsset init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKURLForKey:", CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("sha1"));
    v8 = objc_claimAutoreleasedReturnValue();
    sha1Hex = v5->_sha1Hex;
    v5->_sha1Hex = (NSString *)v8;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSURL *url;
  NSURL *v6;
  NSString *sha1Hex;
  NSString *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  url = self->_url;
  v6 = (NSURL *)v4[2];
  if (!url || !v6)
  {
    if (url == v6)
      goto LABEL_5;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
    goto LABEL_9;
LABEL_5:
  sha1Hex = self->_sha1Hex;
  v8 = (NSString *)v4[1];
  if (sha1Hex && v8)
    v9 = -[NSString isEqual:](sha1Hex, "isEqual:");
  else
    v9 = sha1Hex == v8;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_url);
  objc_msgSend(v3, "safelyAddObject:", self->_sha1Hex);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sha1Hex, CFSTR("sha1"));

}

- (PKDiscoveryMediaRemoteAsset)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryMediaRemoteAsset *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *sha1Hex;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryMediaRemoteAsset;
  v5 = -[PKDiscoveryMediaRemoteAsset init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sha1"));
    v8 = objc_claimAutoreleasedReturnValue();
    sha1Hex = v5->_sha1Hex;
    v5->_sha1Hex = (NSString *)v8;

  }
  return v5;
}

- (NSString)sha1Hex
{
  return self->_sha1Hex;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sha1Hex, 0);
}

@end
