@implementation ContactsURLParser

+ (OS_os_log)log
{
  if (qword_100025B48 != -1)
    dispatch_once(&qword_100025B48, &stru_10001C460);
  return (OS_os_log *)(id)qword_100025B50;
}

- (ContactsURLParser)initWithURL:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  ContactsURLParser *v9;
  ContactsURLParser *v10;
  ContactsURLParser *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ContactsURLParser;
  v9 = -[ContactsURLParser init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
    -[ContactsURLParser readURL:](v10, "readURL:", v7);
    v11 = v10;
  }

  return v10;
}

- (void)readURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("contact"));

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("search"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchResultIdentifier"));
      -[ContactsURLParser setLegacyIdenifier:](self, "setLegacyIdenifier:", v9);

      -[ContactsURLParser setAction:](self, "setAction:", 1);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("show"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsURLParser identifierFromShowCommandURL:](self, "identifierFromShowCommandURL:", v4));
      -[ContactsURLParser setIdentifier:](self, "setIdentifier:", v12);

      -[ContactsURLParser setAction:](self, "setAction:", 1);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("edit"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsURLParser identifierFromShowCommandURL:](self, "identifierFromShowCommandURL:", v4));
      -[ContactsURLParser setIdentifier:](self, "setIdentifier:", v15);

      -[ContactsURLParser setAction:](self, "setAction:", 2);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("add"));

    if (v17)
    {
      -[ContactsURLParser setIdentifier:](self, "setIdentifier:", 0);
      -[ContactsURLParser setAction:](self, "setAction:", 3);
    }
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_class(self), "log");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10000F0D0(v4, v19);

  }
}

- (id)identifierFromShowCommandURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
  v7 = (char *)objc_msgSend(v6, "rangeOfString:", CFSTR("="));
  if (v7)
  {
    v8 = v7;
    if (v7 < (char *)objc_msgSend(v6, "length") - 1)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", v8 + 1));
      if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("id")))
      {
        v11 = v10;
LABEL_16:

        goto LABEL_17;
      }
      if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("ref")))
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("me")))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsURLParser dataSource](self, "dataSource"));
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "preferredForNameMeContactIdentifier"));

          goto LABEL_16;
        }
        v16 = objc_msgSend((id)objc_opt_class(self), "log");
        v15 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10000F17C();
      }
      else
      {
        v14 = objc_msgSend((id)objc_opt_class(self), "log");
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10000F1E0();
      }

      v11 = 0;
      goto LABEL_16;
    }
  }
  v12 = objc_msgSend((id)objc_opt_class(self), "log");
  v9 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v18 = 138412802;
    v19 = v6;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid query '%@' for command '%@' in URL %@.", (uint8_t *)&v18, 0x20u);
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)identifierFound
{
  return -[ContactsURLParser identifier](self, "identifier");
}

- (id)legacyIdentifierFound
{
  return -[ContactsURLParser legacyIdenifier](self, "legacyIdenifier");
}

- (int64_t)actionFound
{
  return -[ContactsURLParser action](self, "action");
}

- (NSURL)url
{
  return self->_url;
}

- (CNContactDataSource_Internal)dataSource
{
  return (CNContactDataSource_Internal *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)legacyIdenifier
{
  return self->_legacyIdenifier;
}

- (void)setLegacyIdenifier:(id)a3
{
  objc_storeStrong((id *)&self->_legacyIdenifier, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyIdenifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
