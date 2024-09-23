@implementation PDSEntry

- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5
{
  return -[PDSEntry initWithUser:registration:clientID:state:](self, "initWithUser:registration:clientID:state:", a3, a4, a5, 1);
}

- (PDSEntry)initWithUser:(id)a3 registration:(id)a4 clientID:(id)a5 state:(unsigned __int8)a6
{
  unsigned int v6;
  id v12;
  id v13;
  id v14;
  PDSEntry *v15;
  PDSEntry *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v6 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntry.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v14)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntry.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

  if (!v13)
    goto LABEL_10;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntry.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

LABEL_4:
  if (v6 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntry.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state <= PDSEntryStateHeartbeat"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PDSEntry;
  v15 = -[PDSEntry init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_user, a3);
    objc_storeStrong((id *)&v16->_registration, a4);
    objc_storeStrong((id *)&v16->_clientID, a5);
    v16->_state = v6;
  }

  return v16;
}

- (PDSEntry)entryWithUpdatedState:(unsigned __int8)a3
{
  uint64_t v3;
  void *v7;

  v3 = a3;
  if (a3 >= 4u)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSEntry.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state <= PDSEntryStateHeartbeat"));

  }
  return (PDSEntry *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUser:registration:clientID:state:", self->_user, self->_registration, self->_clientID, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUser:registration:clientID:state:", self->_user, self->_registration, self->_clientID, self->_state);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PDSEntry isEqualToEntry:](self, "isEqualToEntry:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[PDSEntry user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PDSEntry registration](self, "registration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[PDSEntry state](self, "state");
  -[PDSEntry clientID](self, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqualToEntry:(id)a3
{
  PDSEntry *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (PDSEntry *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v5 = -[PDSEntry state](self, "state");
    if (v5 == -[PDSEntry state](v4, "state"))
    {
      -[PDSEntry user](self, "user");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSEntry user](v4, "user");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToUser:", v7))
      {
        -[PDSEntry registration](self, "registration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDSEntry registration](v4, "registration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToRegistration:", v9))
        {
          -[PDSEntry clientID](self, "clientID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDSEntry clientID](v4, "clientID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PDSEntry user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("user"));

  -[PDSEntry clientID](self, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("clientID"));

  -[PDSEntry registration](self, "registration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("registration"));

  objc_msgSend(v7, "encodeInt32:forKey:", -[PDSEntry state](self, "state"), CFSTR("state"));
}

- (PDSEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  PDSEntry *v9;
  PDSEntry *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));

  v9 = -[PDSEntry initWithUser:registration:clientID:](self, "initWithUser:registration:clientID:", v5, v7, v6);
  v10 = v9;
  if (v9)
    v9->_state = v8;

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  PDSStringForEntryState(-[PDSEntry state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSEntry user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSEntry registration](self, "registration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSEntry clientID](self, "clientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state = %@; user = %@; registration = %@; clientID = %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PDSUser)user
{
  return self->_user;
}

- (PDSRegistration)registration
{
  return self->_registration;
}

- (unsigned)state
{
  return self->_state;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
