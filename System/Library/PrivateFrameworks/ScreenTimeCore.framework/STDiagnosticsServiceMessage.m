@implementation STDiagnosticsServiceMessage

- (STDiagnosticsServiceMessage)initWithMessageType:(id)a3 sender:(id)a4 recipients:(id)a5 payloadUUID:(id)a6 idsInterface:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STDiagnosticsServiceMessage *v17;
  STDiagnosticsServiceMessage *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)STDiagnosticsServiceMessage;
  v17 = -[STDiagnosticsServiceMessage init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messageType, a3);
    objc_storeStrong((id *)&v18->_sender, a4);
    objc_storeStrong((id *)&v18->_recipients, a5);
    objc_storeStrong((id *)&v18->_payloadUUID, a6);
    v18->_idsInterface = a7;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  -[NSString stringByReplacingOccurrencesOfString:withString:](self->_messageType, "stringByReplacingOccurrencesOfString:withString:", CFSTR("RMUnifiedTransportPayloadType"), &stru_1E9372498);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet count](self->_recipients, "count"))
  {
    -[NSSet allObjects](self->_recipients, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("[]");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MessageType: %@ | Sender: %@ | Recipients: %@ | UUID: %@ | IDS Interface: %li"), v3, self->_sender, v5, self->_payloadUUID, self->_idsInterface);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *messageType;
  id v5;

  messageType = self->_messageType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageType, CFSTR("messageType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sender, CFSTR("sender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadUUID, CFSTR("payloadUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_idsInterface, CFSTR("idsInterface"));

}

- (STDiagnosticsServiceMessage)initWithCoder:(id)a3
{
  id v4;
  STDiagnosticsServiceMessage *v5;
  uint64_t v6;
  NSString *messageType;
  uint64_t v8;
  NSString *sender;
  uint64_t v10;
  NSSet *recipients;
  uint64_t v12;
  NSString *payloadUUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STDiagnosticsServiceMessage;
  v5 = -[STDiagnosticsServiceMessage init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageType"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageType = v5->_messageType;
    v5->_messageType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sender"));
    v8 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipients"));
    v10 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSSet *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    payloadUUID = v5->_payloadUUID;
    v5->_payloadUUID = (NSString *)v12;

    v5->_idsInterface = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idsInterface"));
  }

  return v5;
}

- (NSString)messageType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)sender
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSender:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSSet)recipients
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)payloadUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPayloadUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)idsInterface
{
  return self->_idsInterface;
}

- (void)setIdsInterface:(int64_t)a3
{
  self->_idsInterface = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
}

@end
