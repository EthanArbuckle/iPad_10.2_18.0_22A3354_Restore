@implementation IPCLoadDirectionsReply

- (IPCLoadDirectionsReply)initWithDictionary:(id)a3
{
  id v4;
  IPCLoadDirectionsReply *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IPCLoadDirectionsReply;
  v5 = -[IPCMessageObject initWithDictionary:](&v13, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsReplyState")));
    -[IPCLoadDirectionsReply setNavigationState:](v5, "setNavigationState:", objc_msgSend(v6, "unsignedIntegerValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsReplySafetyWarningType")));
    -[IPCLoadDirectionsReply setSafetyWarningType:](v5, "setSafetyWarningType:", objc_msgSend(v7, "unsignedIntegerValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsReplyError")));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsReplyError")));
      v10 = _geo_NSErrorFromDictionaryRepresentationCopy();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[IPCLoadDirectionsReply setError:](v5, "setError:", v11);

    }
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
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IPCLoadDirectionsReply;
  v3 = -[IPCMessageObject dictionaryValue](&v14, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCLoadDirectionsReply navigationState](self, "navigationState")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCLoadDirectionsReplyState"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCLoadDirectionsReply safetyWarningType](self, "safetyWarningType")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCLoadDirectionsReplySafetyWarningType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsReply error](self, "error"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsReply error](self, "error"));
    v10 = _geo_NSErrorDictionaryRepresentationCopy();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kIPCLoadDirectionsReplyError"));

  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCLoadDirectionsReply;
  v3 = -[IPCLoadDirectionsReply description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsReply dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (unint64_t)navigationState
{
  return self->_navigationState;
}

- (void)setNavigationState:(unint64_t)a3
{
  self->_navigationState = a3;
}

- (unint64_t)safetyWarningType
{
  return self->_safetyWarningType;
}

- (void)setSafetyWarningType:(unint64_t)a3
{
  self->_safetyWarningType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
