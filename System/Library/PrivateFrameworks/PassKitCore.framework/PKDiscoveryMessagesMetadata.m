@implementation PKDiscoveryMessagesMetadata

- (PKDiscoveryMessagesMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryMessagesMetadata *v5;
  uint64_t v6;
  NSURL *messagesBundleURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryMessagesMetadata;
  v5 = -[PKDiscoveryMessagesMetadata init](&v9, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "PKURLForKey:", CFSTR("messagesBundleURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    messagesBundleURL = v5->_messagesBundleURL;
    v5->_messagesBundleURL = (NSURL *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDiscoveryMessagesMetadata)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryMessagesMetadata *v5;
  uint64_t v6;
  NSURL *messagesBundleURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryMessagesMetadata;
  v5 = -[PKDiscoveryMessagesMetadata init](&v9, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messagesBundleURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    messagesBundleURL = v5->_messagesBundleURL;
    v5->_messagesBundleURL = (NSURL *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_messagesBundleURL, CFSTR("messagesBundleURL"));

}

- (int64_t)version
{
  return self->_version;
}

- (NSURL)messagesBundleURL
{
  return self->_messagesBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesBundleURL, 0);
}

@end
