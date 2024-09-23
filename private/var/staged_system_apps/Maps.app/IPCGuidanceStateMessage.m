@implementation IPCGuidanceStateMessage

- (IPCGuidanceStateMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCGuidanceStateMessage *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IPCGuidanceStateMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v8, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCGuidanceStateMessageIncludeRouteKey")));
    -[IPCGuidanceStateMessage setIncludeRoute:](v5, "setIncludeRoute:", objc_msgSend(v6, "BOOLValue"));

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPCGuidanceStateMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v9, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCGuidanceStateMessage includeRoute](self, "includeRoute")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kIPCGuidanceStateMessageIncludeRouteKey"));

  v7 = objc_msgSend(v5, "copy");
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCGuidanceStateMessage;
  v3 = -[IPCGuidanceStateMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCGuidanceStateMessage dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)includeRoute
{
  return self->_includeRoute;
}

- (void)setIncludeRoute:(BOOL)a3
{
  self->_includeRoute = a3;
}

@end
