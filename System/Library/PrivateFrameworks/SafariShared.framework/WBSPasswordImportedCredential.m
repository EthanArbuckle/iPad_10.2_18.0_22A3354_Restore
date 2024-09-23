@implementation WBSPasswordImportedCredential

- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5
{
  return -[WBSPasswordImportedCredential initWithUser:password:url:sidecarData:lineNumberFromSourceFile:](self, "initWithUser:password:url:sidecarData:lineNumberFromSourceFile:", a3, a4, a5, 0, 0);
}

- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5 sidecarData:(id)a6
{
  return -[WBSPasswordImportedCredential initWithUser:password:url:sidecarData:lineNumberFromSourceFile:](self, "initWithUser:password:url:sidecarData:lineNumberFromSourceFile:", a3, a4, a5, a6, 0);
}

- (WBSPasswordImportedCredential)initWithUser:(id)a3 password:(id)a4 url:(id)a5 sidecarData:(id)a6 lineNumberFromSourceFile:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  WBSPasswordImportedCredential *v16;
  uint64_t v17;
  NSString *user;
  uint64_t v19;
  NSString *password;
  void *v21;
  uint64_t v22;
  NSURL *otpAuthURL;
  void *v24;
  uint64_t v25;
  NSString *notesEntry;
  void *v27;
  uint64_t v28;
  NSString *title;
  WBSPasswordImportedCredential *v30;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v32.receiver = self;
  v32.super_class = (Class)WBSPasswordImportedCredential;
  v16 = -[WBSPasswordImportedCredential init](&v32, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    user = v16->_user;
    v16->_user = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    password = v16->_password;
    v16->_password = (NSString *)v19;

    objc_storeStrong((id *)&v16->_url, a5);
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("otpAuthURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "copy");
      otpAuthURL = v16->_otpAuthURL;
      v16->_otpAuthURL = (NSURL *)v22;

    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("notesEntry"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = objc_msgSend(v24, "copy");
      notesEntry = v16->_notesEntry;
      v16->_notesEntry = (NSString *)v25;

    }
    objc_msgSend(v15, "safari_stringForKey:", CFSTR("title"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v28;

    v16->_lineNumberFromSourceFile = a7;
    v30 = v16;

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordImportedCredential *v4;
  WBSPasswordImportedCredential *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t lineNumberFromSourceFile;
  BOOL v13;

  v4 = (WBSPasswordImportedCredential *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSPasswordImportedCredential user](v5, "user");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        -[WBSPasswordImportedCredential otpAuthURL](v5, "otpAuthURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          -[WBSPasswordImportedCredential notesEntry](v5, "notesEntry");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual())
          {
            -[WBSPasswordImportedCredential title](v5, "title");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual())
            {
              -[WBSPasswordImportedCredential password](v5, "password");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual())
              {
                -[WBSPasswordImportedCredential url](v5, "url");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual())
                {
                  lineNumberFromSourceFile = self->_lineNumberFromSourceFile;
                  v13 = lineNumberFromSourceFile == -[WBSPasswordImportedCredential lineNumberFromSourceFile](v5, "lineNumberFromSourceFile");
                }
                else
                {
                  v13 = 0;
                }

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_user, "hash");
  v4 = -[NSString hash](self->_password, "hash") ^ v3;
  v5 = -[NSURL hash](self->_url, "hash");
  v6 = v4 ^ v5 ^ -[NSURL hash](self->_otpAuthURL, "hash");
  v7 = -[NSString hash](self->_notesEntry, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_title, "hash") ^ self->_lineNumberFromSourceFile;
}

- (id)urlCredentialWithPersistence:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", self->_user, self->_password, a3);
}

- (id)encryptedURLCredentialWithPersistence:(unint64_t)a3
{
  return 0;
}

- (WBSPasswordImportedCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WBSPasswordImportedCredential *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("otpAuthURL"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("notesEntry"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("title"));

  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lineNumberFromSourceFile"));
  v13 = -[WBSPasswordImportedCredential initWithUser:password:url:sidecarData:lineNumberFromSourceFile:](self, "initWithUser:password:url:sidecarData:lineNumberFromSourceFile:", v5, v6, v7, v8, v12);

  return v13;
}

- (WBSPasswordImportedCredential)init
{
  return -[WBSPasswordImportedCredential initWithUser:password:url:](self, "initWithUser:password:url:", 0, 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *user;
  id v5;

  user = self->_user;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", user, CFSTR("user"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("password"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otpAuthURL, CFSTR("otp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notesEntry, CFSTR("notes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_lineNumberFromSourceFile), CFSTR("lineNumberFromSourceFile"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; url = \"%@\"; user = \"%@\">; otpAuthURL = \"%@\">; title = \"%@\"; hash(notesEntry) = \"%lu\">"),
               objc_opt_class(),
               self,
               self->_url,
               self->_user,
               self->_otpAuthURL,
               self->_title,
               -[NSString hash](self->_notesEntry, "hash"));
}

- (int64_t)compare:(id)a3
{
  unint64_t lineNumberFromSourceFile;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  lineNumberFromSourceFile = self->_lineNumberFromSourceFile;
  v4 = *((_QWORD *)a3 + 7);
  v5 = lineNumberFromSourceFile >= v4;
  v6 = lineNumberFromSourceFile > v4;
  if (v5)
    return v6;
  else
    return -1;
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)otpAuthURL
{
  return self->_otpAuthURL;
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)lineNumberFromSourceFile
{
  return self->_lineNumberFromSourceFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_otpAuthURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
