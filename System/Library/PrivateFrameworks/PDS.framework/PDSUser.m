@implementation PDSUser

+ (PDSUser)userWithDSID:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PDSUser.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("DSID"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserID:userType:", v5, 1);

  return (PDSUser *)v6;
}

- (PDSUser)initWithUserID:(id)a3 userType:(char)a4
{
  int v4;
  id v8;
  PDSUser *v9;
  PDSUser *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a4;
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUser.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userID"));

  }
  if (v4 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSUser.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userType == PDSUserTypeDSID"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PDSUser;
  v9 = -[PDSUser init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userID, a3);
    v10->_userType = v4;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PDSUser isEqualToUser:](self, "isEqualToUser:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[PDSUser userID](self, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[PDSUser userType](self, "userType");

  return v5;
}

- (BOOL)isEqualToUser:(id)a3
{
  PDSUser *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PDSUser *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[PDSUser userType](self, "userType");
    if (v5 == -[PDSUser userType](v4, "userType"))
    {
      -[PDSUser userID](self, "userID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSUser userID](v4, "userID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PDSUser userID](self, "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("userID"));

  objc_msgSend(v5, "encodeInt32:forKey:", -[PDSUser userType](self, "userType"), CFSTR("userType"));
}

- (PDSUser)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  PDSUser *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("userType"));

  v7 = -[PDSUser initWithUserID:userType:](self, "initWithUserID:userType:", v5, v6);
  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[PDSUser userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; userID = \"%@\"; userType = %d>"),
    v4,
    self,
    v5,
    -[PDSUser userType](self, "userType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)userID
{
  return self->_userID;
}

- (char)userType
{
  return self->_userType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
