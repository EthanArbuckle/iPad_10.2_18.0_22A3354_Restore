@implementation TILoginCredential

- (TILoginCredential)initWithUsername:(id)a3 password:(id)a4 site:(id)a5
{
  id v9;
  id v10;
  id v11;
  TILoginCredential *v12;
  TILoginCredential *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TILoginCredential;
  v12 = -[TILoginCredential init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_username, a3);
    objc_storeStrong((id *)&v13->_password, a4);
    objc_storeStrong((id *)&v13->_site, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_username, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = -[NSString copy](self->_password, "copy");
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = -[NSString copy](self->_site, "copy");
    v10 = (void *)v4[3];
    v4[3] = v9;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TILoginCredential username](self, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TILoginCredential username](self, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILoginCredential username](self, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[TILoginCredential password](self, "password");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[TILoginCredential password](self, "password");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILoginCredential password](self, "password");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[TILoginCredential site](self, "site");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "site");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == v20)
    {
      v12 = 1;
    }
    else
    {
      -[TILoginCredential site](self, "site");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILoginCredential site](self, "site");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v21, "isEqual:", v22);

    }
    goto LABEL_15;
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TILoginCredential username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; username = %@"), v4);

  -[TILoginCredential password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; password = %@"), v5);

  -[TILoginCredential site](self, "site");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; site = %@"), v6);

  return v3;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)site
{
  return self->_site;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
