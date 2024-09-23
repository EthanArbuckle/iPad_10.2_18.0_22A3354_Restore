@implementation SKStatusPublishRequest

- (SKStatusPublishRequest)initWithStatusPayload:(id)a3
{
  id v5;
  SKStatusPublishRequest *v6;
  SKStatusPublishRequest *v7;
  void *v8;
  uint64_t v9;
  NSString *statusUniqueIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SKStatusPublishRequest;
  v6 = -[SKStatusPublishRequest init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statusPayload, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    statusUniqueIdentifier = v7->_statusUniqueIdentifier;
    v7->_statusUniqueIdentifier = (NSString *)v9;

    *(_WORD *)&v7->_isScheduledRequest = 0;
  }

  return v7;
}

- (SKStatusPublishRequest)initWithStatusPayload:(id)a3 isScheduledRequest:(BOOL)a4
{
  SKStatusPublishRequest *result;

  result = -[SKStatusPublishRequest initWithStatusPayload:](self, "initWithStatusPayload:", a3);
  if (result)
    result->_isScheduledRequest = a4;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  SKStatusPayload *statusPayload;
  id v5;

  statusPayload = self->_statusPayload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statusPayload, CFSTR("statusPayload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statusUniqueIdentifier, CFSTR("statusUniqueIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isScheduledRequest, CFSTR("scheduledRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSecondaryDeviceRepublish, CFSTR("secondaryDeviceRepublish"));

}

- (SKStatusPublishRequest)initWithCoder:(id)a3
{
  id v4;
  SKStatusPublishRequest *v5;
  uint64_t v6;
  SKStatusPayload *statusPayload;
  uint64_t v8;
  NSString *statusUniqueIdentifier;
  uint64_t v10;
  NSDate *dateCreated;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKStatusPublishRequest;
  v5 = -[SKStatusPublishRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusPayload"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusPayload = v5->_statusPayload;
    v5->_statusPayload = (SKStatusPayload *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    statusUniqueIdentifier = v5->_statusUniqueIdentifier;
    v5->_statusUniqueIdentifier = (NSString *)v8;

    v5->_isScheduledRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("scheduledRequest"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v10;

    v5->_isSecondaryDeviceRepublish = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryDeviceRepublish"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKStatusPublishRequest statusUniqueIdentifier](self, "statusUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusPublishRequest statusPayload](self, "statusPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStatusPublishRequest dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\"; payload = \"%@\"; dateCreated = \"%@\"; scheduled=%ld, republish=%ld>"),
    v4,
    self,
    v5,
    v6,
    v7,
    -[SKStatusPublishRequest isScheduledRequest](self, "isScheduledRequest"),
    -[SKStatusPublishRequest isSecondaryDeviceRepublish](self, "isSecondaryDeviceRepublish"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (BOOL)isScheduledRequest
{
  return self->_isScheduledRequest;
}

- (void)setIsScheduledRequest:(BOOL)a3
{
  self->_isScheduledRequest = a3;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (void)setStatusUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, a3);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (BOOL)isSecondaryDeviceRepublish
{
  return self->_isSecondaryDeviceRepublish;
}

- (void)setIsSecondaryDeviceRepublish:(BOOL)a3
{
  self->_isSecondaryDeviceRepublish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end
