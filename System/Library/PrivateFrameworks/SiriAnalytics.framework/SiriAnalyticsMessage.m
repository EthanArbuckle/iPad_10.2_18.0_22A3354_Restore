@implementation SiriAnalyticsMessage

- (SiriAnalyticsMessage)init
{

  return 0;
}

- (SiriAnalyticsMessage)initWithMessageUUID:(id)a3 logicalTimestamp:(id)a4 underlying:(id)a5
{
  id v9;
  id v10;
  id v11;
  SiriAnalyticsMessage *v12;
  SiriAnalyticsMessage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsMessage;
  v12 = -[SiriAnalyticsMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageUUID, a3);
    objc_storeStrong((id *)&v13->_logicalTimestamp, a4);
    objc_storeStrong((id *)&v13->_underlyingMessage, a5);
  }

  return v13;
}

- (SiriAnalyticsLogicalTimeStamp)logicalTimestamp
{
  return self->_logicalTimestamp;
}

- (void)setLogicalTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_logicalTimestamp, a3);
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SISchemaTopLevelUnionType)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void)setUnderlyingMessage:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
  objc_storeStrong((id *)&self->_logicalTimestamp, 0);
}

- (id)storageRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[SiriAnalyticsMessage underlyingMessage](self, "underlyingMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wrapAsAnyEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriAnalyticsMessage logicalTimestamp](self, "logicalTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D9A460]);
    v7 = objc_alloc_init(MEMORY[0x1E0D9A410]);
    objc_msgSend(v6, "setMetadata:", v7);

    objc_msgSend(v6, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriAnalyticsMessage logicalTimestamp](self, "logicalTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimestamp:", v10);

    objc_msgSend(v6, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D9A500]);
    -[SiriAnalyticsMessage messageUUID](self, "messageUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithNSUUID:", v13);
    objc_msgSend(v11, "setEventId:", v14);

    objc_msgSend(v6, "setEvent:", v4);
    objc_msgSend(v6, "wrapAsAnyEvent");
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v4;
  }

  return v15;
}

@end
