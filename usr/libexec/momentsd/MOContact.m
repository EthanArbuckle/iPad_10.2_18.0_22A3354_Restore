@implementation MOContact

- (MOContact)initWithIdentifier:(id)a3 personId:(id)a4 displayName:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOContact *v12;
  MOContact *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MOContact;
  v12 = -[MOContact init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_personId, a4);
    objc_storeStrong((id *)&v13->_displayName, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact personId](self, "personId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact displayName](self, "displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mask"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier, %@, personId, %@, name, %@"), v4, v5, v7));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOContact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  MOContact *v14;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v8), CFSTR("personId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v11), CFSTR("displayName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = -[MOContact initWithIdentifier:personId:displayName:](self, "initWithIdentifier:personId:displayName:", v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personId, CFSTR("personId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));

}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  MOContact *v5;
  uint64_t v6;
  MOContact *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v5 = (MOContact *)a3;
  if (v5 == self)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(MOContact, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact identifier](self, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact identifier](v7, "identifier"));
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact personId](self, "personId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact personId](v7, "personId"));
        if (objc_msgSend(v10, "isEqualToString:", v11))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact displayName](self, "displayName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOContact displayName](v7, "displayName"));
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_personId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_displayName, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personId
{
  return self->_personId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MOContact)initWithCDContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MOContact *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));

  v8 = -[MOContact initWithIdentifier:personId:displayName:](self, "initWithIdentifier:personId:displayName:", v5, v6, v7);
  return v8;
}

@end
