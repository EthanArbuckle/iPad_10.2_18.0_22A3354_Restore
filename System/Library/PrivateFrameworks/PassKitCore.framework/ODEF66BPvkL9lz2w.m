@implementation ODEF66BPvkL9lz2w

- (ODEF66BPvkL9lz2w)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  int v6;
  ODEF66BPvkL9lz2w *v7;
  void *v8;
  void *v9;
  void *v10;
  ODEF66BPvkL9lz2w *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_classType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("name"));

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)ODEF66BPvkL9lz2w;
    v7 = -[ODEF66BPvkL9lz2w init](&v13, sel_init);
    if (v7)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("firstName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODEF66BPvkL9lz2w setFirstName:](v7, "setFirstName:", v8);

      objc_msgSend(v4, "objectForKey:", CFSTR("lastName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODEF66BPvkL9lz2w setLastName:](v7, "setLastName:", v9);

      objc_msgSend(v4, "objectForKey:", CFSTR("fullName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODEF66BPvkL9lz2w setFullName:](v7, "setFullName:", v10);

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
  void *v3;
  NSString *firstName;
  NSString *lastName;
  NSString *fullName;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("name"), CFSTR("_classType"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", lastName, CFSTR("lastName"));
  fullName = self->_fullName;
  if (fullName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", fullName, CFSTR("fullName"));
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
