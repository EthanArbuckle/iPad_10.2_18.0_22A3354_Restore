@implementation MSDKVStoreRequest

- (BOOL)isValid
{
  unsigned __int8 v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDKVStoreRequest;
  v3 = -[MSDCommandServerRequest isValid](&v10, "isValid");
  v4 = -[MSDKVStoreRequest isPost](self, "isPost");
  v5 = objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest key](self, "key"));
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest value](self, "value"));
      if (v7)
        v8 = v3;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }
  else if (v5)
  {
    v8 = v3;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest value](self, "value"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("value"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest ttl](self, "ttl"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest ttl](self, "ttl"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ttl"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "convertToNSData"));

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDKVStoreResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  id v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v63;
  id v64;
  objc_super v65;

  v6 = a3;
  v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)MSDKVStoreRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v65, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v11 = 0;
    v12 = v6;
    goto LABEL_29;
  }
  if (!-[MSDKVStoreRequest isPost](self, "isPost"))
  {
    v64 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v64));
    v12 = v64;

    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value")));
      objc_msgSend(v9, "setValue:", v13);

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
        v18 = objc_opt_class(NSString, v17);
        isKindOfClass = objc_opt_isKindOfClass(v16, v18);

        if ((isKindOfClass & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("creationDate")));
          objc_msgSend(v9, "setCreationDate:", v20);

          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate"));
          if (v21)
          {
            v22 = (void *)v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate"));
            v25 = objc_opt_class(NSString, v24);
            v26 = objc_opt_isKindOfClass(v23, v25);

            if ((v26 & 1) == 0)
            {
              v27 = sub_1000604F0();
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                sub_1000BA4B8();

              objc_msgSend(v9, "setCreationDate:", 0);
            }
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("setBy")));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("serial")));
          objc_msgSend(v9, "setCreatorSN:", v30);

          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creatorSN"));
          if (v31)
          {
            v32 = (void *)v31;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate"));
            v35 = objc_opt_class(NSString, v34);
            v36 = objc_opt_isKindOfClass(v33, v35);

            if ((v36 & 1) == 0)
            {
              v37 = sub_1000604F0();
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                sub_1000BA430();

              objc_msgSend(v9, "setCreatorSN:", 0);
            }
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("setBy")));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("udid")));
          objc_msgSend(v9, "setCreatorUDID:", v40);

          v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creatorUDID"));
          if (v41)
          {
            v42 = (void *)v41;
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDate"));
            v45 = objc_opt_class(NSString, v44);
            v46 = objc_opt_isKindOfClass(v43, v45);

            if ((v46 & 1) == 0)
            {
              v47 = sub_1000604F0();
              v48 = objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                sub_1000BA3A8();

              objc_msgSend(v9, "setCreatorUDID:", 0);
            }
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("modificationDate")));
          objc_msgSend(v9, "setModificationDate:", v49);

          v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modificationDate"));
          if (v50)
          {
            v51 = (void *)v50;
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modificationDate"));
            v54 = objc_opt_class(NSString, v53);
            v55 = objc_opt_isKindOfClass(v52, v54);

            if ((v55 & 1) == 0)
            {
              v56 = sub_1000604F0();
              v57 = objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                sub_1000BA320();

              objc_msgSend(v9, "setModificationDate:", 0);
            }
          }
LABEL_31:

          v6 = v12;
          goto LABEL_32;
        }
      }
      v58 = sub_1000604F0();
      v59 = objc_claimAutoreleasedReturnValue(v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        sub_1000BA284();

    }
LABEL_29:
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

    if (!v60)
    {
      v63 = v12;
      sub_1000B63A4(&v63, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
      v61 = v63;

      objc_msgSend(v9, "setError:", v61);
      v12 = v61;
    }
    goto LABEL_31;
  }
LABEL_32:

  return v9;
}

- (id)getEndpoint
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKVStoreRequest key](self, "key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/KVStore"), v2));

  return v3;
}

- (BOOL)isPost
{
  return self->_isPost;
}

- (void)setIsPost:(BOOL)a3
{
  self->_isPost = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSNumber)ttl
{
  return self->_ttl;
}

- (void)setTtl:(id)a3
{
  objc_storeStrong((id *)&self->_ttl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttl, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
