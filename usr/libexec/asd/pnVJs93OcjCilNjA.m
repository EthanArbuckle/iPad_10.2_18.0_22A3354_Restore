@implementation pnVJs93OcjCilNjA

- (pnVJs93OcjCilNjA)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  pnVJs93OcjCilNjA *v7;
  void *v8;
  void *v9;
  void *v10;
  pnVJs93OcjCilNjA *v11;
  objc_super v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_classType")));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("name"));

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)pnVJs93OcjCilNjA;
    v7 = -[pnVJs93OcjCilNjA init](&v13, "init");
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("firstName")));
      -[pnVJs93OcjCilNjA setFirstName:](v7, "setFirstName:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lastName")));
      -[pnVJs93OcjCilNjA setLastName:](v7, "setLastName:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("fullName")));
      -[pnVJs93OcjCilNjA setFullName:](v7, "setFullName:", v10);

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)toDictionary
{
  NSMutableDictionary *v3;
  NSString *firstName;
  NSString *lastName;
  NSString *fullName;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("name"), CFSTR("_classType"));
  firstName = self->_firstName;
  if (firstName)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", lastName, CFSTR("lastName"));
  fullName = self->_fullName;
  if (fullName)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", fullName, CFSTR("fullName"));
  return v3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_storeStrong((id *)&self->_fullName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
