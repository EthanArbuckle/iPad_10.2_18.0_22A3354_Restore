@implementation JSACookie

- (JSACookie)initWithNativeCookie:(id)a3
{
  id v4;
  JSACookie *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *value;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *originURL;
  void *v14;
  uint64_t v15;
  NSString *domain;
  uint64_t v17;
  NSString *path;
  uint64_t v19;
  NSString *comment;
  void *v21;
  uint64_t v22;
  NSString *commentURL;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)JSACookie;
  v5 = -[JSACookie init](&v31, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    value = v5->_value;
    v5->_value = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsa_validURLValueForProperty:", NSHTTPCookieOriginURL));
    v11 = v10;
    if (v10)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
      originURL = v5->_originURL;
      v5->_originURL = (NSString *)v12;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsa_validIntegerValueForProperty:", NSHTTPCookieVersion));
    if (v14)
      objc_storeStrong((id *)&v5->_version, v14);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    domain = v5->_domain;
    v5->_domain = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    path = v5->_path;
    v5->_path = (NSString *)v17;

    v5->_isSecure = objc_msgSend(v4, "isSecure");
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "comment"));
    comment = v5->_comment;
    v5->_comment = (NSString *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commentURL"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "absoluteString"));
    commentURL = v5->_commentURL;
    v5->_commentURL = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsa_validBooleanValueForProperty:", NSHTTPCookieDiscard));
    v25 = v24;
    if (v24)
      v5->_isSessionOnly = objc_msgSend(v24, "BOOLValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsa_validIntegerValueForProperty:", NSHTTPCookieMaximumAge));
    if (v26)
      objc_storeStrong((id *)&v5->_maximumAge, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "portList"));
    v28 = v27;
    if (v27 && objc_msgSend(v27, "count"))
      objc_storeStrong((id *)&v5->_portList, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expiresDate"));
    if (v29)
      objc_storeStrong((id *)&v5->_expirationDate, v29);

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (void)setIsSecure:(BOOL)a3
{
  self->_isSecure = a3;
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)commentURL
{
  return self->_commentURL;
}

- (void)setCommentURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isSessionOnly
{
  return self->_isSessionOnly;
}

- (void)setIsSessionOnly:(BOOL)a3
{
  self->_isSessionOnly = a3;
}

- (NSNumber)maximumAge
{
  return self->_maximumAge;
}

- (void)setMaximumAge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)portList
{
  return self->_portList;
}

- (void)setPortList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_portList, 0);
  objc_storeStrong((id *)&self->_maximumAge, 0);
  objc_storeStrong((id *)&self->_commentURL, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
