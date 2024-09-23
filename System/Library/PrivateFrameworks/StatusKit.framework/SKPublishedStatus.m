@implementation SKPublishedStatus

- (SKPublishedStatus)initWithStatusPayload:(id)a3 statusUniqueIdentifier:(id)a4 datePublished:(id)a5 dateCreated:(id)a6 dateReceived:(id)a7 invitationPayload:(id)a8
{
  id v15;
  id v16;
  id v17;
  SKPublishedStatus *v18;
  SKPublishedStatus *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SKPublishedStatus;
  v18 = -[SKPublishedStatus init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_statusPayload, a3);
    objc_storeStrong((id *)&v19->_statusUniqueIdentifier, a4);
    objc_storeStrong((id *)&v19->_datePublished, a5);
    objc_storeStrong((id *)&v19->_dateCreated, a6);
    objc_storeStrong((id *)&v19->_dateReceived, a7);
    objc_storeStrong((id *)&v19->_invitationPayload, a8);
  }

  return v19;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_datePublished, CFSTR("datePublished"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateReceived, CFSTR("dateReceived"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationPayload, CFSTR("invitationPayload"));

}

- (SKPublishedStatus)initWithCoder:(id)a3
{
  id v4;
  SKPublishedStatus *v5;
  uint64_t v6;
  SKStatusPayload *statusPayload;
  uint64_t v8;
  NSString *statusUniqueIdentifier;
  uint64_t v10;
  NSDate *datePublished;
  uint64_t v12;
  NSDate *dateCreated;
  uint64_t v14;
  NSDate *dateReceived;
  uint64_t v16;
  SKInvitationPayload *invitationPayload;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SKPublishedStatus;
  v5 = -[SKPublishedStatus init](&v19, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("datePublished"));
    v10 = objc_claimAutoreleasedReturnValue();
    datePublished = v5->_datePublished;
    v5->_datePublished = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
    v12 = objc_claimAutoreleasedReturnValue();
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateReceived"));
    v14 = objc_claimAutoreleasedReturnValue();
    dateReceived = v5->_dateReceived;
    v5->_dateReceived = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invitationPayload"));
    v16 = objc_claimAutoreleasedReturnValue();
    invitationPayload = v5->_invitationPayload;
    v5->_invitationPayload = (SKInvitationPayload *)v16;

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
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKPublishedStatus statusUniqueIdentifier](self, "statusUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPublishedStatus statusPayload](self, "statusPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPublishedStatus datePublished](self, "datePublished");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPublishedStatus dateReceived](self, "dateReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKPublishedStatus dateCreated](self, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = \"%@\"; payload = \"%@\"; datePublished = \"%@\"; dateReceived = \"%@\"; dateCreated = \"%@\">"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (SKStatusPayload)statusPayload
{
  return self->_statusPayload;
}

- (NSString)statusUniqueIdentifier
{
  return self->_statusUniqueIdentifier;
}

- (NSDate)datePublished
{
  return self->_datePublished;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (SKInvitationPayload)invitationPayload
{
  return self->_invitationPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationPayload, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_datePublished, 0);
  objc_storeStrong((id *)&self->_statusUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_statusPayload, 0);
}

@end
