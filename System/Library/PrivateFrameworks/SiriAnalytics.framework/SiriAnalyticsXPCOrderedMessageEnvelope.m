@implementation SiriAnalyticsXPCOrderedMessageEnvelope

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  timestamp = self->_timestamp;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("timestamp"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_streamUUID, CFSTR("streamUUID"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_messageType, CFSTR("messageType"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_messageUUID, CFSTR("messageUUID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_messageBody, CFSTR("messageBody"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_streamUUID, 0);
}

- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithCoder:(id)a3
{
  id v4;
  SiriAnalyticsXPCOrderedMessageEnvelope *v5;
  void *v6;
  uint64_t v7;
  NSUUID *streamUUID;
  uint64_t v9;
  NSUUID *messageUUID;
  uint64_t v11;
  NSData *messageBody;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriAnalyticsXPCOrderedMessageEnvelope;
  v5 = -[SiriAnalyticsXPCOrderedMessageEnvelope init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timestamp = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("streamUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    streamUUID = v5->_streamUUID;
    v5->_streamUUID = (NSUUID *)v7;

    v5->_messageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("messageType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("messageUUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    messageUUID = v5->_messageUUID;
    v5->_messageUUID = (NSUUID *)v9;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("messageBody"));
    v11 = objc_claimAutoreleasedReturnValue();
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSData *)v11;

  }
  return v5;
}

- (SiriAnalyticsXPCOrderedMessageEnvelope)initWithTimestamp:(unint64_t)a3 streamUUID:(id)a4 messageType:(int64_t)a5 messageUUID:(id)a6 messageBody:(id)a7
{
  id v12;
  id v13;
  id v14;
  SiriAnalyticsXPCOrderedMessageEnvelope *v15;
  SiriAnalyticsXPCOrderedMessageEnvelope *v16;
  uint64_t v17;
  NSUUID *streamUUID;
  uint64_t v19;
  NSUUID *messageUUID;
  uint64_t v21;
  NSData *messageBody;
  objc_super v24;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SiriAnalyticsXPCOrderedMessageEnvelope;
  v15 = -[SiriAnalyticsXPCOrderedMessageEnvelope init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_timestamp = a3;
    v17 = objc_msgSend(v12, "copy");
    streamUUID = v16->_streamUUID;
    v16->_streamUUID = (NSUUID *)v17;

    v19 = objc_msgSend(v13, "copy");
    messageUUID = v16->_messageUUID;
    v16->_messageUUID = (NSUUID *)v19;

    v16->_messageType = a5;
    v21 = objc_msgSend(v14, "copy");
    messageBody = v16->_messageBody;
    v16->_messageBody = (NSData *)v21;

  }
  return v16;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (NSData)messageBody
{
  return self->_messageBody;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
