@implementation VD9LmqazgfzMqjuy

- (VD9LmqazgfzMqjuy)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  VD9LmqazgfzMqjuy *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ODEF66BPvkL9lz2w *v15;
  void *v16;
  ODEF66BPvkL9lz2w *v17;
  VD9LmqazgfzMqjuy *v18;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_classType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("settings"));

  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)VD9LmqazgfzMqjuy;
    v7 = -[VD9LmqazgfzMqjuy init](&v20, sel_init);
    if (v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("endpointIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setEndpointIdentifier:](v7, "setEndpointIdentifier:", v8);

      objc_msgSend(v4, "objectForKey:", CFSTR("endpointID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setEndpointID:](v7, "setEndpointID:", objc_msgSend(v9, "intValue"));

      objc_msgSend(v4, "objectForKey:", CFSTR("settingsType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setSettingsType:](v7, "setSettingsType:", (int)objc_msgSend(v10, "intValue"));

      objc_msgSend(v4, "objectForKey:", CFSTR("pEmail"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setPEmail:](v7, "setPEmail:", v11);

      objc_msgSend(v4, "objectForKey:", CFSTR("pPhone"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setPPhone:](v7, "setPPhone:", v12);

      objc_msgSend(v4, "objectForKey:", CFSTR("phone"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setPhone:](v7, "setPhone:", v13);

      objc_msgSend(v4, "objectForKey:", CFSTR("email"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VD9LmqazgfzMqjuy setEmail:](v7, "setEmail:", v14);

      v15 = [ODEF66BPvkL9lz2w alloc];
      objc_msgSend(v4, "objectForKey:", CFSTR("name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[ODEF66BPvkL9lz2w initWithDictionary:](v15, "initWithDictionary:", v16);
      -[VD9LmqazgfzMqjuy setName:](v7, "setName:", v17);

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
  void *v3;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("settings"), CFSTR("_classType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VD9LmqazgfzMqjuy endpointID](self, "endpointID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endpointID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VD9LmqazgfzMqjuy settingsType](self, "settingsType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("settingsType"));

  -[VD9LmqazgfzMqjuy endpointIdentifier](self, "endpointIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VD9LmqazgfzMqjuy endpointIdentifier](self, "endpointIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("endpointIdentifier"));

  }
  -[VD9LmqazgfzMqjuy pEmail](self, "pEmail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VD9LmqazgfzMqjuy pEmail](self, "pEmail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pEmail"));

  }
  -[VD9LmqazgfzMqjuy pPhone](self, "pPhone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[VD9LmqazgfzMqjuy pPhone](self, "pPhone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("pPhone"));

  }
  -[VD9LmqazgfzMqjuy phone](self, "phone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[VD9LmqazgfzMqjuy phone](self, "phone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("phone"));

  }
  -[VD9LmqazgfzMqjuy email](self, "email");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[VD9LmqazgfzMqjuy email](self, "email");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("email"));

  }
  -[VD9LmqazgfzMqjuy name](self, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "toDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[VD9LmqazgfzMqjuy name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "toDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("name"));

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@, %p> {\n"), objc_opt_class(), self);
  -[VD9LmqazgfzMqjuy endpointIdentifier](self, "endpointIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tendpointID: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (ODEF66BPvkL9lz2w)name
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
