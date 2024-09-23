@implementation MRUPersonalizedFirmware

- (MRUPersonalizedFirmware)initWithPayload:(id)a3 manifest:(id)a4
{
  id v7;
  id v8;
  MRUPersonalizedFirmware *v9;
  MRUPersonalizedFirmware *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRUPersonalizedFirmware;
  v9 = -[MRUPersonalizedFirmware init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeStrong((id *)&v10->_manifest, a4);
  }

  return v10;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@(\n"), v5));

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData description](self->_payload, "description")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\tpayload: %s\n"), objc_msgSend(v7, "UTF8String"));

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSData description](self->_manifest, "description")));
  objc_msgSend(v6, "appendFormat:", CFSTR("\tmanifest: %s\n"), objc_msgSend(v8, "UTF8String"));

  objc_msgSend(v6, "appendString:", CFSTR(")"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v6));

  return v9;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
