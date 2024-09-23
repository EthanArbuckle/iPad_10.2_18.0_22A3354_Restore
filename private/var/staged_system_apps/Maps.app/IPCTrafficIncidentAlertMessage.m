@implementation IPCTrafficIncidentAlertMessage

- (IPCTrafficIncidentAlertMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCTrafficIncidentAlertMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v12, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCTrafficIncidentAlertMessageTypeKey")));
    -[IPCTrafficIncidentAlertMessage setType:](v5, "setType:", objc_msgSend(v6, "unsignedIntegerValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCTrafficIncidentAlertMessageTitleKey")));
    -[IPCTrafficIncidentAlertMessage setTitle:](v5, "setTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCTrafficIncidentAlertMessageSubtitleKey")));
    -[IPCTrafficIncidentAlertMessage setSubtitle:](v5, "setSubtitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCTrafficIncidentAlertMessageIdentifierKey")));
    -[IPCTrafficIncidentAlertMessage setIdentifier:](v5, "setIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCTrafficIncidentAlertMessageIncidentKey")));
    -[IPCTrafficIncidentAlertMessage setIncident:](v5, "setIncident:", v10);

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v17, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCTrafficIncidentAlertMessage type](self, "type")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCTrafficIncidentAlertMessageTypeKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage title](self, "title"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kIPCTrafficIncidentAlertMessageTitleKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage subtitle](self, "subtitle"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kIPCTrafficIncidentAlertMessageSubtitleKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage identifier](self, "identifier"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kIPCTrafficIncidentAlertMessageIdentifierKey"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage incident](self, "incident"));
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("kIPCTrafficIncidentAlertMessageIncidentKey"));

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v3 = -[IPCTrafficIncidentAlertMessage description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCTrafficIncidentAlertMessage type](self, "type")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage subtitle](self, "subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCTrafficIncidentAlertMessage incident](self, "incident"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@             type : {%@}             title : {%@}             subtitle : {%@}             identifier : {%@}             incident : {%@}"), v4, v5, v6, v7, v8, v9));

  return v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
  objc_storeStrong((id *)&self->_incident, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
