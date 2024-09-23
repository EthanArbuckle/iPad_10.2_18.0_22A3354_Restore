@implementation SAPathInfo

- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4 bundleID:(id)a5
{
  id v9;
  id v10;
  SAPathInfo *v11;
  SAPathInfo *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SAPathInfo;
  v11 = -[SAPathInfo init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    v12->_exclusive = a4;
    objc_storeStrong((id *)&v12->_bundleID, a5);
  }

  return v12;
}

- (SAPathInfo)initWithURL:(id)a3
{
  return -[SAPathInfo initWithURL:exclusive:bundleID:](self, "initWithURL:exclusive:bundleID:", a3, 1, 0);
}

- (SAPathInfo)initWithURL:(id)a3 exclusive:(BOOL)a4
{
  return -[SAPathInfo initWithURL:exclusive:bundleID:](self, "initWithURL:exclusive:bundleID:", a3, a4, 0);
}

+ (id)pathInfoWithURL:(id)a3 exclusive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:exclusive:bundleID:", v6, v4, 0);

  return v7;
}

+ (id)pathInfoWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:exclusive:bundleID:", v4, 1, 0);

  return v5;
}

+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:exclusive:bundleID:", v7, 1, v6);

  return v8;
}

+ (id)pathInfoWithURL:(id)a3 bundleID:(id)a4 exclusive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:exclusive:bundleID:", v9, v5, v8);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_exclusive, CFSTR("exclusive"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle"));

}

- (SAPathInfo)initWithCoder:(id)a3
{
  id v4;
  SAPathInfo *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *bundleID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAPathInfo;
  v5 = -[SAPathInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v5->_exclusive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("exclusive"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
