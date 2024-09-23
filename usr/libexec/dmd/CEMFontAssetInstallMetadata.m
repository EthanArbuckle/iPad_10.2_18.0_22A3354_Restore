@implementation CEMFontAssetInstallMetadata

- (id)dataRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CEMFontAssetInstallMetadata fontURL](self, "fontURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v2));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CEMFontAssetInstallMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CEMFontAssetInstallMetadata *v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSURL *fontURL;

  v4 = a3;
  v6 = -[CEMFontAssetInstallMetadata init](self, "init");
  if (v6)
  {
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSURL, v5), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("fontURL")));
    fontURL = v6->_fontURL;
    v6->_fontURL = (NSURL *)v9;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CEMFontAssetInstallMetadata fontURL](self, "fontURL"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontURL"));

}

- (NSURL)fontURL
{
  return self->_fontURL;
}

- (void)setFontURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontURL, 0);
}

@end
