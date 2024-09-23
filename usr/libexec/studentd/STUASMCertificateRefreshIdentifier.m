@implementation STUASMCertificateRefreshIdentifier

- (STUASMCertificateRefreshIdentifier)initWithSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STUASMCertificateRefreshIdentifier *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crk_stringWithIPAddress:](NSString, "crk_stringWithIPAddress:", objc_msgSend(v4, "leaderIP")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));

  v7 = -[STUASMCertificateRefreshIdentifier initWithCourseIdentifier:IPAddress:](self, "initWithCourseIdentifier:IPAddress:", v6, v5);
  return v7;
}

- (STUASMCertificateRefreshIdentifier)initWithCourseIdentifier:(id)a3 IPAddress:(id)a4
{
  id v7;
  id v8;
  STUASMCertificateRefreshIdentifier *v9;
  STUASMCertificateRefreshIdentifier *v10;
  NSString *v11;
  NSString *targetIPAddress;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUASMCertificateRefreshIdentifier;
  v9 = -[STUASMCertificateRefreshIdentifier init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_courseIdentifier, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    targetIPAddress = v10->_targetIPAddress;
    v10->_targetIPAddress = v11;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier courseIdentifier](self, "courseIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier targetIPAddress](self, "targetIPAddress"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  STUASMCertificateRefreshIdentifier *v8;
  STUASMCertificateRefreshIdentifier *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  STUASMCertificateRefreshIdentifier *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("courseIdentifier, targetIPAddress"), "componentsSeparatedByString:", CFSTR(",")));
  v6 = objc_msgSend(v5, "mutableCopy");

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001391C;
  v28[3] = &unk_1000C9E08;
  v7 = v6;
  v29 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v28);

  v8 = self;
  v9 = (STUASMCertificateRefreshIdentifier *)v4;
  v10 = v7;
  if (v8 == v9)
  {
    v21 = 1;
  }
  else if (-[STUASMCertificateRefreshIdentifier isMemberOfClass:](v9, "isMemberOfClass:", objc_opt_class(v8)))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v23 = v10;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v17 = v9;
          v18 = objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier valueForKey:](v8, "valueForKey:", v16));
          v19 = objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier valueForKey:](v17, "valueForKey:", v16));

          if (v18 | v19)
          {
            v20 = objc_msgSend((id)v18, "isEqual:", v19);

            if (!v20)
            {
              v21 = 0;
              goto LABEL_16;
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
      v21 = 1;
LABEL_16:
      v10 = v23;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier courseIdentifier](self, "courseIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefreshIdentifier targetIPAddress](self, "targetIPAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { courseIdentifier = %@, targetIPAddress = %@ }>"), v3, self, v5, v6));

  return v7;
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (NSString)targetIPAddress
{
  return self->_targetIPAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIPAddress, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
