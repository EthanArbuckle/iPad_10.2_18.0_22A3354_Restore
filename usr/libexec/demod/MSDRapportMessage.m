@implementation MSDRapportMessage

- (MSDRapportMessage)initWithIdentifier:(id)a3 andPayload:(id)a4 usingOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSDRapportMessage *v11;
  MSDRapportMessage *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MSDRapportMessage;
  v11 = -[MSDRapportMessage init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[MSDRapportMessage setIdentifier:](v11, "setIdentifier:", v8);
    -[MSDRapportMessage setPayload:](v12, "setPayload:", v9);
    -[MSDRapportMessage setOptions:](v12, "setOptions:", v10);
  }

  return v12;
}

- (unint64_t)extractProtocolVersion
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[MSDRapportMessage payload](self, "payload"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessage payload](self, "payload"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ProtocolVersion")));

    if (v5)
      v3 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue");
    else
      v3 = 1;

  }
  return v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDRapportMessage identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Identifier=%@>"), v5, self, v6));

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
