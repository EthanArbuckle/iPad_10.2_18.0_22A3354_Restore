@implementation PKCloudStoreZoneInvitation

+ (id)cloudStoreZoneInvitationWithProtobuf:(id)a3
{
  id v3;
  PKCloudStoreZoneInvitation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(PKCloudStoreZoneInvitation);
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v3, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitation setShareURL:](v4, "setShareURL:", v7);

  objc_msgSend(v3, "shareInvitationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitation setShareInvitationToken:](v4, "setShareInvitationToken:", v8);

  objc_msgSend(v3, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitation setContainerIdentifier:](v4, "setContainerIdentifier:", v9);

  objc_msgSend(v3, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitation setZoneName:](v4, "setZoneName:", v10);

  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "dateCreated");
  v13 = v12;

  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreZoneInvitation setDateCreated:](v4, "setDateCreated:", v14);

  return v4;
}

- (id)protobuf
{
  PKProtobufCloudStoreZoneInvitation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(PKProtobufCloudStoreZoneInvitation);
  -[PKCloudStoreZoneInvitation shareURL](self, "shareURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitation setShareURL:](v3, "setShareURL:", v5);

  -[PKCloudStoreZoneInvitation shareInvitationToken](self, "shareInvitationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitation setShareInvitationToken:](v3, "setShareInvitationToken:", v6);

  -[PKCloudStoreZoneInvitation containerIdentifier](self, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitation setContainerIdentifier:](v3, "setContainerIdentifier:", v7);

  -[PKCloudStoreZoneInvitation zoneName](self, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufCloudStoreZoneInvitation setZoneName:](v3, "setZoneName:", v8);

  -[PKCloudStoreZoneInvitation dateCreated](self, "dateCreated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  -[PKProtobufCloudStoreZoneInvitation setDateCreated:](v3, "setDateCreated:");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZoneInvitation)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreZoneInvitation *v5;
  uint64_t v6;
  NSURL *shareURL;
  uint64_t v8;
  NSData *shareInvitationToken;
  uint64_t v10;
  NSString *containerIdentifier;
  uint64_t v12;
  NSString *zoneName;
  uint64_t v14;
  NSDate *dateCreated;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCloudStoreZoneInvitation;
  v5 = -[PKCloudStoreZoneInvitation init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareInvitationToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    shareInvitationToken = v5->_shareInvitationToken;
    v5->_shareInvitationToken = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
    v12 = objc_claimAutoreleasedReturnValue();
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
    v14 = objc_claimAutoreleasedReturnValue();
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *shareURL;
  id v5;

  shareURL = self->_shareURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", shareURL, CFSTR("shareURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareInvitationToken, CFSTR("shareInvitationToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("containerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneName, CFSTR("zoneName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));

}

- (BOOL)isEqual:(id)a3
{
  PKCloudStoreZoneInvitation *v4;
  PKCloudStoreZoneInvitation *v5;
  BOOL v6;

  v4 = (PKCloudStoreZoneInvitation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCloudStoreZoneInvitation isEqualToCloudStoreZoneInvitation:](self, "isEqualToCloudStoreZoneInvitation:", v5);

  return v6;
}

- (BOOL)isEqualToCloudStoreZoneInvitation:(id)a3
{
  _QWORD *v4;
  NSURL *shareURL;
  NSURL *v6;
  BOOL v7;
  NSData *shareInvitationToken;
  NSData *v9;
  NSString *containerIdentifier;
  NSString *v11;
  NSString *zoneName;
  NSString *v13;
  NSDate *dateCreated;
  NSDate *v15;
  char v16;

  v4 = a3;
  shareURL = self->_shareURL;
  v6 = (NSURL *)v4[1];
  if (shareURL)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (shareURL != v6)
      goto LABEL_26;
  }
  else if ((-[NSURL isEqual:](shareURL, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  shareInvitationToken = self->_shareInvitationToken;
  v9 = (NSData *)v4[2];
  if (shareInvitationToken && v9)
  {
    if ((-[NSData isEqual:](shareInvitationToken, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (shareInvitationToken != v9)
  {
    goto LABEL_26;
  }
  containerIdentifier = self->_containerIdentifier;
  v11 = (NSString *)v4[3];
  if (containerIdentifier && v11)
  {
    if ((-[NSString isEqual:](containerIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (containerIdentifier != v11)
  {
    goto LABEL_26;
  }
  zoneName = self->_zoneName;
  v13 = (NSString *)v4[4];
  if (!zoneName || !v13)
  {
    if (zoneName == v13)
      goto LABEL_22;
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if ((-[NSString isEqual:](zoneName, "isEqual:") & 1) == 0)
    goto LABEL_26;
LABEL_22:
  dateCreated = self->_dateCreated;
  v15 = (NSDate *)v4[5];
  if (dateCreated && v15)
    v16 = -[NSDate isEqual:](dateCreated, "isEqual:");
  else
    v16 = dateCreated == v15;
LABEL_27:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("zoneName: %@; "), self->_zoneName);
  objc_msgSend(v3, "appendFormat:", CFSTR("containerIdentifier: %@; "), self->_containerIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("shareURL: %@ "), self->_shareURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("dateCreated: %@; "), self->_dateCreated);
  objc_msgSend(v3, "appendFormat:", CFSTR("shareInvitationToken: %ld bytes; "),
    -[NSData length](self->_shareInvitationToken, "length"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_storeStrong((id *)&self->_shareURL, a3);
}

- (NSData)shareInvitationToken
{
  return self->_shareInvitationToken;
}

- (void)setShareInvitationToken:(id)a3
{
  objc_storeStrong((id *)&self->_shareInvitationToken, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_shareInvitationToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
