@implementation PKApplicationMessageActionURL

+ (id)createWithURL:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = +[PKApplicationMessageAction _createForType:]((uint64_t)PKApplicationMessageAction, 0);
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (id)createWithSensitiveURL:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = +[PKApplicationMessageAction _createForType:]((uint64_t)PKApplicationMessageAction, 1);
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageActionURL)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageActionURL *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplicationMessageActionURL;
  v5 = -[PKApplicationMessageAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageActionURL;
  v4 = a3;
  -[PKApplicationMessageAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_url, CFSTR("url"), v5.receiver, v5.super_class);

}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
