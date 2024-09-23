@implementation PPPBLabeledSocialProfile

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPPBLabeledSocialProfile;
  -[PPPBLabeledSocialProfile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBLabeledSocialProfile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  NSString *urlString;
  NSString *username;
  NSString *userIdentifier;
  NSString *service;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  urlString = self->_urlString;
  if (urlString)
    objc_msgSend(v4, "setObject:forKey:", urlString, CFSTR("urlString"));
  username = self->_username;
  if (username)
    objc_msgSend(v4, "setObject:forKey:", username, CFSTR("username"));
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
    objc_msgSend(v4, "setObject:forKey:", userIdentifier, CFSTR("userIdentifier"));
  service = self->_service;
  if (service)
    objc_msgSend(v4, "setObject:forKey:", service, CFSTR("service"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBLabeledSocialProfileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_urlString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_userIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_service)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v5;
  }
  if (self->_urlString)
  {
    objc_msgSend(v5, "setUrlString:");
    v4 = v5;
  }
  if (self->_username)
  {
    objc_msgSend(v5, "setUsername:");
    v4 = v5;
  }
  if (self->_userIdentifier)
  {
    objc_msgSend(v5, "setUserIdentifier:");
    v4 = v5;
  }
  if (self->_service)
  {
    objc_msgSend(v5, "setService:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_urlString, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_userIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_service, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *label;
  NSString *urlString;
  NSString *username;
  NSString *userIdentifier;
  NSString *service;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((label = self->_label, !((unint64_t)label | v4[1]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((urlString = self->_urlString, !((unint64_t)urlString | v4[3]))
     || -[NSString isEqual:](urlString, "isEqual:"))
    && ((username = self->_username, !((unint64_t)username | v4[5]))
     || -[NSString isEqual:](username, "isEqual:"))
    && ((userIdentifier = self->_userIdentifier, !((unint64_t)userIdentifier | v4[4]))
     || -[NSString isEqual:](userIdentifier, "isEqual:")))
  {
    service = self->_service;
    if ((unint64_t)service | v4[2])
      v10 = -[NSString isEqual:](service, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_label, "hash");
  v4 = -[NSString hash](self->_urlString, "hash") ^ v3;
  v5 = -[NSString hash](self->_username, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_userIdentifier, "hash");
  return v6 ^ -[NSString hash](self->_service, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[PPPBLabeledSocialProfile setLabel:](self, "setLabel:");
  if (v4[3])
    -[PPPBLabeledSocialProfile setUrlString:](self, "setUrlString:");
  if (v4[5])
    -[PPPBLabeledSocialProfile setUsername:](self, "setUsername:");
  if (v4[4])
    -[PPPBLabeledSocialProfile setUserIdentifier:](self, "setUserIdentifier:");
  if (v4[2])
    -[PPPBLabeledSocialProfile setService:](self, "setService:");

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentifier, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
