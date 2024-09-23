@implementation MSDCDNSessionTaskInfo

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSDCDNSessionTaskInfo;
  if (!-[MSDSessionTaskInfo isValid](&v9, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo serverType](self, "serverType"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getRequestForTimeout:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  MSDCDNSessionTaskInfo *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  id v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];

  v5 = objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  if (!v5
    || (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema")),
        v9 = objc_opt_class(NSString, v8),
        isKindOfClass = objc_opt_isKindOfClass(v7, v9),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v50 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BDE24();
    goto LABEL_24;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
  if (!v11
    || (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders")),
        v15 = objc_opt_class(NSArray, v14),
        v16 = objc_opt_isKindOfClass(v13, v15),
        v13,
        v12,
        (v16 & 1) == 0))
  {
    v51 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BDE50(v22, v52, v53);
    goto LABEL_24;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v18 = (char *)objc_msgSend(v17, "rangeOfString:", CFSTR("/<prefix-"));
  v20 = v19;

  if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v57 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BDEBC(self, v22);
    goto LABEL_24;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "substringFromIndex:", &v18[v20]));

  v23 = -[NSObject integerValue](v22, "integerValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  v25 = objc_msgSend(v24, "length");

  if (v25 <= v23)
  {
    v58 = sub_1000604F0();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      sub_1000BDFCC(self);

    goto LABEL_24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "substringToIndex:", v23));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo urlSchema](self, "urlSchema"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "substringToIndex:", v18));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo fileHash](self, "fileHash"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@"), v29, v27, v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v31));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v32, 1, a3));
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  if (!v34)
  {
    v60 = sub_1000604F0();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      sub_1000BDF3C();

LABEL_24:
    v49 = 0;
    goto LABEL_29;
  }
  v62 = v31;
  v63 = v27;
  v64 = v22;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v35 = self;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCDNSessionTaskInfo credentialHeaders](self, "credentialHeaders"));
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("name")));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("value")));
        if (!v42
          || (v45 = objc_opt_class(NSString, v43), (objc_opt_isKindOfClass(v42, v45) & 1) == 0)
          || !v44
          || (v47 = objc_opt_class(NSString, v46), (objc_opt_isKindOfClass(v44, v47) & 1) == 0))
        {
          v54 = sub_1000604F0();
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            sub_1000BDF68();

          v49 = 0;
          goto LABEL_28;
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](v35, "request"));
        objc_msgSend(v48, "addValue:forHTTPHeaderField:", v44, v42);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v38)
        continue;
      break;
    }
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](v35, "request"));
LABEL_28:
  v22 = v64;
LABEL_29:

  return v49;
}

- (NSDictionary)credentialHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCredentialHeaders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)urlSchema
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUrlSchema:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFileHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setServerType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverType, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_urlSchema, 0);
  objc_storeStrong((id *)&self->_credentialHeaders, 0);
}

@end
