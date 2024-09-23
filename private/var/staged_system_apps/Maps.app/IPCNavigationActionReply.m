@implementation IPCNavigationActionReply

- (IPCNavigationActionReply)initWithDictionary:(id)a3
{
  id v4;
  IPCNavigationActionReply *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPCNavigationActionReply;
  v5 = -[IPCMessageObject initWithDictionary:](&v9, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCNavigationActionReplySuccessKey")));
    -[IPCNavigationActionReply setSuccess:](v5, "setSuccess:", objc_msgSend(v6, "BOOLValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCNavigationActionReplyNavigationActionErrorKey")));
    -[IPCNavigationActionReply setNavigationActionError:](v5, "setNavigationActionError:", objc_msgSend(v7, "unsignedIntegerValue"));

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IPCNavigationActionReply;
  v3 = -[IPCMessageObject dictionaryValue](&v10, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCNavigationActionReply success](self, "success")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCNavigationActionReplySuccessKey"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCNavigationActionReply navigationActionError](self, "navigationActionError")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCNavigationActionReplyNavigationActionErrorKey"));

  v8 = objc_msgSend(v5, "copy");
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCNavigationActionReply;
  v3 = -[IPCNavigationActionReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCNavigationActionReply dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (unint64_t)navigationActionError
{
  return self->_navigationActionError;
}

- (void)setNavigationActionError:(unint64_t)a3
{
  self->_navigationActionError = a3;
}

@end
