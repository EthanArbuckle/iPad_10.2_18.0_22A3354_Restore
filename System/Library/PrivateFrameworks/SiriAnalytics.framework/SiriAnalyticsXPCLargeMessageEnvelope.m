@implementation SiriAnalyticsXPCLargeMessageEnvelope

- (SiriAnalyticsXPCLargeMessageEnvelope)initWithLargeMessagePath:(id)a3 serializedDataUploadMessage:(id)a4
{
  id v6;
  id v7;
  SiriAnalyticsXPCLargeMessageEnvelope *v8;
  uint64_t v9;
  NSString *largeMessagePath;
  uint64_t v11;
  NSData *serializedDataUploadMessage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SiriAnalyticsXPCLargeMessageEnvelope;
  v8 = -[SiriAnalyticsXPCLargeMessageEnvelope init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    largeMessagePath = v8->_largeMessagePath;
    v8->_largeMessagePath = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    serializedDataUploadMessage = v8->_serializedDataUploadMessage;
    v8->_serializedDataUploadMessage = (NSData *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *largeMessagePath;
  id v5;

  largeMessagePath = self->_largeMessagePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", largeMessagePath, CFSTR("largeMessagePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializedDataUploadMessage, CFSTR("serializedDataUploadMessage"));

}

- (SiriAnalyticsXPCLargeMessageEnvelope)initWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsXPCLargeMessageEnvelope *v5;
  uint64_t v6;
  NSString *largeMessagePath;
  uint64_t v8;
  NSData *serializedDataUploadMessage;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriAnalyticsXPCLargeMessageEnvelope;
  v5 = -[SiriAnalyticsXPCLargeMessageEnvelope init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("largeMessagePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    largeMessagePath = v5->_largeMessagePath;
    v5->_largeMessagePath = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedDataUploadMessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    serializedDataUploadMessage = v5->_serializedDataUploadMessage;
    v5->_serializedDataUploadMessage = (NSData *)v8;

  }
  return v5;
}

- (NSString)largeMessagePath
{
  return self->_largeMessagePath;
}

- (NSData)serializedDataUploadMessage
{
  return self->_serializedDataUploadMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDataUploadMessage, 0);
  objc_storeStrong((id *)&self->_largeMessagePath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
