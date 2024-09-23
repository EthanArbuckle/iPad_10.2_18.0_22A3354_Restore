@implementation KCSharingPBInternetPasswordCredential

- (BOOL)hasAccessGroup
{
  return self->_accessGroup != 0;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAccount
{
  return self->_account != 0;
}

- (BOOL)hasProtocol
{
  return self->_protocol != 0;
}

- (BOOL)hasServer
{
  return self->_server != 0;
}

- (void)setPort:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_port = a3;
}

- (void)setHasPort:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPort
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAuthenticationType
{
  return self->_authenticationType != 0;
}

- (BOOL)hasData
{
  return self->_data != 0;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (BOOL)hasComment
{
  return self->_comment != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasAccessibility
{
  return self->_accessibility != 0;
}

- (BOOL)hasViewHint
{
  return self->_viewHint != 0;
}

- (BOOL)hasSecurityDomain
{
  return self->_securityDomain != 0;
}

- (BOOL)hasNotes
{
  return self->_notes != 0;
}

- (BOOL)hasHistory
{
  return self->_history != 0;
}

- (BOOL)hasClientDefined0
{
  return self->_clientDefined0 != 0;
}

- (BOOL)hasClientDefined1
{
  return self->_clientDefined1 != 0;
}

- (BOOL)hasClientDefined2
{
  return self->_clientDefined2 != 0;
}

- (BOOL)hasClientDefined3
{
  return self->_clientDefined3 != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCSharingPBInternetPasswordCredential;
  v3 = -[KCSharingPBInternetPasswordCredential description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBInternetPasswordCredential dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *accessGroup;
  char has;
  void *v7;
  void *v8;
  NSString *account;
  NSString *protocol;
  NSString *server;
  void *v12;
  NSString *authenticationType;
  NSData *data;
  NSString *path;
  NSString *comment;
  NSString *label;
  NSString *accessibility;
  NSString *viewHint;
  NSString *securityDomain;
  NSData *notes;
  NSData *history;
  NSData *clientDefined0;
  NSData *clientDefined1;
  NSData *clientDefined2;
  NSData *clientDefined3;
  PBUnknownFields *unknownFields;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup)
    objc_msgSend(v3, "setObject:forKey:", accessGroup, CFSTR("accessGroup"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_modificationDate));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("modificationDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_creationDate));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("creationDate"));

  }
  account = self->_account;
  if (account)
    objc_msgSend(v4, "setObject:forKey:", account, CFSTR("account"));
  protocol = self->_protocol;
  if (protocol)
    objc_msgSend(v4, "setObject:forKey:", protocol, CFSTR("protocol"));
  server = self->_server;
  if (server)
    objc_msgSend(v4, "setObject:forKey:", server, CFSTR("server"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_port));
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("port"));

  }
  authenticationType = self->_authenticationType;
  if (authenticationType)
    objc_msgSend(v4, "setObject:forKey:", authenticationType, CFSTR("authenticationType"));
  data = self->_data;
  if (data)
    objc_msgSend(v4, "setObject:forKey:", data, CFSTR("data"));
  path = self->_path;
  if (path)
    objc_msgSend(v4, "setObject:forKey:", path, CFSTR("path"));
  comment = self->_comment;
  if (comment)
    objc_msgSend(v4, "setObject:forKey:", comment, CFSTR("comment"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "setObject:forKey:", label, CFSTR("label"));
  accessibility = self->_accessibility;
  if (accessibility)
    objc_msgSend(v4, "setObject:forKey:", accessibility, CFSTR("accessibility"));
  viewHint = self->_viewHint;
  if (viewHint)
    objc_msgSend(v4, "setObject:forKey:", viewHint, CFSTR("viewHint"));
  securityDomain = self->_securityDomain;
  if (securityDomain)
    objc_msgSend(v4, "setObject:forKey:", securityDomain, CFSTR("securityDomain"));
  notes = self->_notes;
  if (notes)
    objc_msgSend(v4, "setObject:forKey:", notes, CFSTR("notes"));
  history = self->_history;
  if (history)
    objc_msgSend(v4, "setObject:forKey:", history, CFSTR("history"));
  clientDefined0 = self->_clientDefined0;
  if (clientDefined0)
    objc_msgSend(v4, "setObject:forKey:", clientDefined0, CFSTR("clientDefined0"));
  clientDefined1 = self->_clientDefined1;
  if (clientDefined1)
    objc_msgSend(v4, "setObject:forKey:", clientDefined1, CFSTR("clientDefined1"));
  clientDefined2 = self->_clientDefined2;
  if (clientDefined2)
    objc_msgSend(v4, "setObject:forKey:", clientDefined2, CFSTR("clientDefined2"));
  clientDefined3 = self->_clientDefined3;
  if (clientDefined3)
    objc_msgSend(v4, "setObject:forKey:", clientDefined3, CFSTR("clientDefined3"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001600AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;
  NSString *accessGroup;
  char has;
  NSString *account;
  NSString *protocol;
  NSString *server;
  NSString *authenticationType;
  NSData *data;
  NSString *path;
  NSString *comment;
  NSString *label;
  NSString *accessibility;
  NSString *viewHint;
  NSString *securityDomain;
  NSData *notes;
  NSData *history;
  NSData *clientDefined0;
  NSData *clientDefined1;
  NSData *clientDefined2;
  NSData *clientDefined3;
  id v25;

  v4 = a3;
  v5 = v4;
  accessGroup = self->_accessGroup;
  v25 = v4;
  if (accessGroup)
  {
    PBDataWriterWriteStringField(v4, accessGroup, 1);
    v5 = v25;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 2, self->_modificationDate);
    v5 = v25;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 3, self->_creationDate);
    v5 = v25;
  }
  account = self->_account;
  if (account)
  {
    PBDataWriterWriteStringField(v5, account, 4);
    v5 = v25;
  }
  protocol = self->_protocol;
  if (protocol)
  {
    PBDataWriterWriteStringField(v5, protocol, 5);
    v5 = v25;
  }
  server = self->_server;
  if (server)
  {
    PBDataWriterWriteStringField(v5, server, 6);
    v5 = v25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_port, 7);
    v5 = v25;
  }
  authenticationType = self->_authenticationType;
  if (authenticationType)
  {
    PBDataWriterWriteStringField(v5, authenticationType, 8);
    v5 = v25;
  }
  data = self->_data;
  if (data)
  {
    PBDataWriterWriteDataField(v5, data, 9);
    v5 = v25;
  }
  path = self->_path;
  if (path)
  {
    PBDataWriterWriteStringField(v5, path, 10);
    v5 = v25;
  }
  comment = self->_comment;
  if (comment)
  {
    PBDataWriterWriteStringField(v5, comment, 11);
    v5 = v25;
  }
  label = self->_label;
  if (label)
  {
    PBDataWriterWriteStringField(v5, label, 12);
    v5 = v25;
  }
  accessibility = self->_accessibility;
  if (accessibility)
  {
    PBDataWriterWriteStringField(v5, accessibility, 13);
    v5 = v25;
  }
  viewHint = self->_viewHint;
  if (viewHint)
  {
    PBDataWriterWriteStringField(v5, viewHint, 14);
    v5 = v25;
  }
  securityDomain = self->_securityDomain;
  if (securityDomain)
  {
    PBDataWriterWriteStringField(v5, securityDomain, 15);
    v5 = v25;
  }
  notes = self->_notes;
  if (notes)
  {
    PBDataWriterWriteDataField(v5, notes, 16);
    v5 = v25;
  }
  history = self->_history;
  if (history)
  {
    PBDataWriterWriteDataField(v5, history, 17);
    v5 = v25;
  }
  clientDefined0 = self->_clientDefined0;
  if (clientDefined0)
  {
    PBDataWriterWriteDataField(v5, clientDefined0, 18);
    v5 = v25;
  }
  clientDefined1 = self->_clientDefined1;
  if (clientDefined1)
  {
    PBDataWriterWriteDataField(v5, clientDefined1, 19);
    v5 = v25;
  }
  clientDefined2 = self->_clientDefined2;
  if (clientDefined2)
  {
    PBDataWriterWriteDataField(v5, clientDefined2, 20);
    v5 = v25;
  }
  clientDefined3 = self->_clientDefined3;
  if (clientDefined3)
  {
    PBDataWriterWriteDataField(v5, clientDefined3, 21);
    v5 = v25;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accessGroup, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v5 + 184) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v5 + 184) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_account, "copyWithZone:", a3);
  v10 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v9;

  v11 = -[NSString copyWithZone:](self->_protocol, "copyWithZone:", a3);
  v12 = (void *)*((_QWORD *)v5 + 19);
  *((_QWORD *)v5 + 19) = v11;

  v13 = -[NSString copyWithZone:](self->_server, "copyWithZone:", a3);
  v14 = (void *)*((_QWORD *)v5 + 21);
  *((_QWORD *)v5 + 21) = v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_port;
    *((_BYTE *)v5 + 184) |= 4u;
  }
  v15 = -[NSString copyWithZone:](self->_authenticationType, "copyWithZone:", a3);
  v16 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v15;

  v17 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v18 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v17;

  v19 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
  v20 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v19;

  v21 = -[NSString copyWithZone:](self->_comment, "copyWithZone:", a3);
  v22 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v21;

  v23 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v24 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v23;

  v25 = -[NSString copyWithZone:](self->_accessibility, "copyWithZone:", a3);
  v26 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v25;

  v27 = -[NSString copyWithZone:](self->_viewHint, "copyWithZone:", a3);
  v28 = (void *)*((_QWORD *)v5 + 22);
  *((_QWORD *)v5 + 22) = v27;

  v29 = -[NSString copyWithZone:](self->_securityDomain, "copyWithZone:", a3);
  v30 = (void *)*((_QWORD *)v5 + 20);
  *((_QWORD *)v5 + 20) = v29;

  v31 = -[NSData copyWithZone:](self->_notes, "copyWithZone:", a3);
  v32 = (void *)*((_QWORD *)v5 + 16);
  *((_QWORD *)v5 + 16) = v31;

  v33 = -[NSData copyWithZone:](self->_history, "copyWithZone:", a3);
  v34 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v33;

  v35 = -[NSData copyWithZone:](self->_clientDefined0, "copyWithZone:", a3);
  v36 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v35;

  v37 = -[NSData copyWithZone:](self->_clientDefined1, "copyWithZone:", a3);
  v38 = (void *)*((_QWORD *)v5 + 9);
  *((_QWORD *)v5 + 9) = v37;

  v39 = -[NSData copyWithZone:](self->_clientDefined2, "copyWithZone:", a3);
  v40 = (void *)*((_QWORD *)v5 + 10);
  *((_QWORD *)v5 + 10) = v39;

  v41 = -[NSData copyWithZone:](self->_clientDefined3, "copyWithZone:", a3);
  v42 = (void *)*((_QWORD *)v5 + 11);
  *((_QWORD *)v5 + 11) = v41;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *accessGroup;
  NSString *account;
  NSString *protocol;
  NSString *server;
  NSString *authenticationType;
  NSData *data;
  NSString *path;
  NSString *comment;
  NSString *label;
  NSString *accessibility;
  NSString *viewHint;
  NSString *securityDomain;
  NSData *notes;
  NSData *history;
  NSData *clientDefined0;
  NSData *clientDefined1;
  NSData *clientDefined2;
  NSData *clientDefined3;
  unsigned __int8 v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_53;
  accessGroup = self->_accessGroup;
  if ((unint64_t)accessGroup | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](accessGroup, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 2) == 0 || self->_modificationDate != *((double *)v4 + 3))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 184) & 2) != 0)
  {
LABEL_53:
    v23 = 0;
    goto LABEL_54;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 1) == 0 || self->_creationDate != *((double *)v4 + 2))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 184) & 1) != 0)
  {
    goto LABEL_53;
  }
  account = self->_account;
  if ((unint64_t)account | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](account, "isEqual:"))
    goto LABEL_53;
  protocol = self->_protocol;
  if ((unint64_t)protocol | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](protocol, "isEqual:"))
      goto LABEL_53;
  }
  server = self->_server;
  if ((unint64_t)server | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](server, "isEqual:"))
      goto LABEL_53;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 184) & 4) == 0 || self->_port != *((_DWORD *)v4 + 36))
      goto LABEL_53;
  }
  else if ((*((_BYTE *)v4 + 184) & 4) != 0)
  {
    goto LABEL_53;
  }
  authenticationType = self->_authenticationType;
  if ((unint64_t)authenticationType | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](authenticationType, "isEqual:"))
  {
    goto LABEL_53;
  }
  data = self->_data;
  if ((unint64_t)data | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](data, "isEqual:"))
      goto LABEL_53;
  }
  path = self->_path;
  if ((unint64_t)path | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](path, "isEqual:"))
      goto LABEL_53;
  }
  comment = self->_comment;
  if ((unint64_t)comment | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](comment, "isEqual:"))
      goto LABEL_53;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_53;
  }
  accessibility = self->_accessibility;
  if ((unint64_t)accessibility | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](accessibility, "isEqual:"))
      goto LABEL_53;
  }
  viewHint = self->_viewHint;
  if ((unint64_t)viewHint | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](viewHint, "isEqual:"))
      goto LABEL_53;
  }
  securityDomain = self->_securityDomain;
  if ((unint64_t)securityDomain | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](securityDomain, "isEqual:"))
      goto LABEL_53;
  }
  notes = self->_notes;
  if ((unint64_t)notes | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](notes, "isEqual:"))
      goto LABEL_53;
  }
  history = self->_history;
  if ((unint64_t)history | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](history, "isEqual:"))
      goto LABEL_53;
  }
  clientDefined0 = self->_clientDefined0;
  if ((unint64_t)clientDefined0 | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](clientDefined0, "isEqual:"))
      goto LABEL_53;
  }
  clientDefined1 = self->_clientDefined1;
  if ((unint64_t)clientDefined1 | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](clientDefined1, "isEqual:"))
      goto LABEL_53;
  }
  clientDefined2 = self->_clientDefined2;
  if ((unint64_t)clientDefined2 | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](clientDefined2, "isEqual:"))
      goto LABEL_53;
  }
  clientDefined3 = self->_clientDefined3;
  if ((unint64_t)clientDefined3 | *((_QWORD *)v4 + 11))
    v23 = -[NSData isEqual:](clientDefined3, "isEqual:");
  else
    v23 = 1;
LABEL_54:

  return v23;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double modificationDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double creationDate;
  double v12;
  long double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  unint64_t v23;
  NSUInteger v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;

  v3 = -[NSString hash](self->_accessGroup, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    modificationDate = self->_modificationDate;
    v7 = -modificationDate;
    if (modificationDate >= 0.0)
      v7 = self->_modificationDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v12 = -creationDate;
    if (creationDate >= 0.0)
      v12 = self->_creationDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v15 = fmod(v13, 1.84467441e19);
    v16 = 2654435761u * (unint64_t)v15;
    v17 = v16 + (unint64_t)v14;
    if (v14 <= 0.0)
      v17 = 2654435761u * (unint64_t)v15;
    v18 = v16 - (unint64_t)fabs(v14);
    if (v14 < 0.0)
      v10 = v18;
    else
      v10 = v17;
  }
  else
  {
    v10 = 0;
  }
  v19 = -[NSString hash](self->_account, "hash");
  v20 = -[NSString hash](self->_protocol, "hash");
  v21 = -[NSString hash](self->_server, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v22 = 2654435761 * self->_port;
  else
    v22 = 0;
  v23 = v5 ^ v3 ^ v10 ^ v19 ^ v20 ^ v21 ^ v22;
  v24 = -[NSString hash](self->_authenticationType, "hash");
  v25 = v24 ^ (unint64_t)-[NSData hash](self->_data, "hash");
  v26 = v25 ^ -[NSString hash](self->_path, "hash");
  v27 = v23 ^ v26 ^ -[NSString hash](self->_comment, "hash");
  v28 = -[NSString hash](self->_label, "hash");
  v29 = v28 ^ -[NSString hash](self->_accessibility, "hash");
  v30 = v29 ^ -[NSString hash](self->_viewHint, "hash");
  v31 = v30 ^ -[NSString hash](self->_securityDomain, "hash");
  v32 = v27 ^ v31 ^ (unint64_t)-[NSData hash](self->_notes, "hash");
  v33 = (unint64_t)-[NSData hash](self->_history, "hash");
  v34 = v33 ^ (unint64_t)-[NSData hash](self->_clientDefined0, "hash");
  v35 = v34 ^ (unint64_t)-[NSData hash](self->_clientDefined1, "hash");
  v36 = v35 ^ (unint64_t)-[NSData hash](self->_clientDefined2, "hash");
  return v32 ^ v36 ^ (unint64_t)-[NSData hash](self->_clientDefined3, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[KCSharingPBInternetPasswordCredential setAccessGroup:](self, "setAccessGroup:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 184);
  if ((v5 & 2) != 0)
  {
    self->_modificationDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 184);
  }
  if ((v5 & 1) != 0)
  {
    self->_creationDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[KCSharingPBInternetPasswordCredential setAccount:](self, "setAccount:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[KCSharingPBInternetPasswordCredential setProtocol:](self, "setProtocol:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[KCSharingPBInternetPasswordCredential setServer:](self, "setServer:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 184) & 4) != 0)
  {
    self->_port = *((_DWORD *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[KCSharingPBInternetPasswordCredential setAuthenticationType:](self, "setAuthenticationType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[KCSharingPBInternetPasswordCredential setData:](self, "setData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[KCSharingPBInternetPasswordCredential setPath:](self, "setPath:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[KCSharingPBInternetPasswordCredential setComment:](self, "setComment:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[KCSharingPBInternetPasswordCredential setLabel:](self, "setLabel:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[KCSharingPBInternetPasswordCredential setAccessibility:](self, "setAccessibility:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 22))
  {
    -[KCSharingPBInternetPasswordCredential setViewHint:](self, "setViewHint:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[KCSharingPBInternetPasswordCredential setSecurityDomain:](self, "setSecurityDomain:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[KCSharingPBInternetPasswordCredential setNotes:](self, "setNotes:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[KCSharingPBInternetPasswordCredential setHistory:](self, "setHistory:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined0:](self, "setClientDefined0:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined1:](self, "setClientDefined1:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined2:](self, "setClientDefined2:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[KCSharingPBInternetPasswordCredential setClientDefined3:](self, "setClientDefined3:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_storeStrong((id *)&self->_accessGroup, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (int)port
{
  return self->_port;
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationType, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_storeStrong((id *)&self->_comment, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)accessibility
{
  return self->_accessibility;
}

- (void)setAccessibility:(id)a3
{
  objc_storeStrong((id *)&self->_accessibility, a3);
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setViewHint:(id)a3
{
  objc_storeStrong((id *)&self->_viewHint, a3);
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
  objc_storeStrong((id *)&self->_securityDomain, a3);
}

- (NSData)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (NSData)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (NSData)clientDefined0
{
  return self->_clientDefined0;
}

- (void)setClientDefined0:(id)a3
{
  objc_storeStrong((id *)&self->_clientDefined0, a3);
}

- (NSData)clientDefined1
{
  return self->_clientDefined1;
}

- (void)setClientDefined1:(id)a3
{
  objc_storeStrong((id *)&self->_clientDefined1, a3);
}

- (NSData)clientDefined2
{
  return self->_clientDefined2;
}

- (void)setClientDefined2:(id)a3
{
  objc_storeStrong((id *)&self->_clientDefined2, a3);
}

- (NSData)clientDefined3
{
  return self->_clientDefined3;
}

- (void)setClientDefined3:(id)a3
{
  objc_storeStrong((id *)&self->_clientDefined3, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_clientDefined3, 0);
  objc_storeStrong((id *)&self->_clientDefined2, 0);
  objc_storeStrong((id *)&self->_clientDefined1, 0);
  objc_storeStrong((id *)&self->_clientDefined0, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
