@implementation git3vZFAfTws6rT8

- (git3vZFAfTws6rT8)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  git3vZFAfTws6rT8 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  pnVJs93OcjCilNjA *v15;
  void *v16;
  pnVJs93OcjCilNjA *v17;
  git3vZFAfTws6rT8 *v18;
  objc_super v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_classType")));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("settings"));

  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)git3vZFAfTws6rT8;
    v7 = -[git3vZFAfTws6rT8 init](&v20, "init");
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("endpointIdentifier")));
      -[git3vZFAfTws6rT8 setEndpointIdentifier:](v7, "setEndpointIdentifier:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("endpointID")));
      -[git3vZFAfTws6rT8 setEndpointID:](v7, "setEndpointID:", objc_msgSend(v9, "intValue"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("settingsType")));
      -[git3vZFAfTws6rT8 setSettingsType:](v7, "setSettingsType:", (int)objc_msgSend(v10, "intValue"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("pEmail")));
      -[git3vZFAfTws6rT8 setPEmail:](v7, "setPEmail:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("pPhone")));
      -[git3vZFAfTws6rT8 setPPhone:](v7, "setPPhone:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("phone")));
      -[git3vZFAfTws6rT8 setPhone:](v7, "setPhone:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("email")));
      -[git3vZFAfTws6rT8 setEmail:](v7, "setEmail:", v14);

      v15 = [pnVJs93OcjCilNjA alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("name")));
      v17 = -[pnVJs93OcjCilNjA initWithDictionary:](v15, "initWithDictionary:", v16);
      -[git3vZFAfTws6rT8 setName:](v7, "setName:", v17);

    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)toDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("settings"), CFSTR("_classType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[git3vZFAfTws6rT8 endpointID](self, "endpointID")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("endpointID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[git3vZFAfTws6rT8 settingsType](self, "settingsType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("settingsType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 endpointIdentifier](self, "endpointIdentifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 endpointIdentifier](self, "endpointIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("endpointIdentifier"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 pEmail](self, "pEmail"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 pEmail](self, "pEmail"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, CFSTR("pEmail"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 pPhone](self, "pPhone"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 pPhone](self, "pPhone"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, CFSTR("pPhone"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 phone](self, "phone"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 phone](self, "phone"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, CFSTR("phone"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 email](self, "email"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 email](self, "email"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("email"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 name](self, "name"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "toDictionary"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 name](self, "name"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toDictionary"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, CFSTR("name"));

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@, %p> {\n"), objc_opt_class(self), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 endpointIdentifier](self, "endpointIdentifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\tendpointID: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (pnVJs93OcjCilNjA)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
  objc_storeStrong((id *)&self->_phone, a3);
}

- (NSString)pPhone
{
  return self->_pPhone;
}

- (void)setPPhone:(id)a3
{
  objc_storeStrong((id *)&self->_pPhone, a3);
}

- (NSString)pEmail
{
  return self->_pEmail;
}

- (void)setPEmail:(id)a3
{
  objc_storeStrong((id *)&self->_pEmail, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endpointIdentifier, a3);
}

- (int)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(int)a3
{
  self->_endpointID = a3;
}

- (unint64_t)settingsType
{
  return self->_settingsType;
}

- (void)setSettingsType:(unint64_t)a3
{
  self->_settingsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_pEmail, 0);
  objc_storeStrong((id *)&self->_pPhone, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
