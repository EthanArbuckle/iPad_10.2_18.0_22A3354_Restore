@implementation APAttributionPayloadSerializer

+ (id)serializePayload:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_11;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "header"));
  if (!v7)
    goto LABEL_11;
  v8 = (void *)v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "body"));
  if (!v9)
  {
LABEL_10:

    goto LABEL_11;
  }
  v10 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  if (!v11)
  {
LABEL_9:

    goto LABEL_10;
  }
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  if (!v14)
  {

    goto LABEL_9;
  }
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "header"));
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("header"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "body"));
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("body"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
    objc_msgSend(v17, "setObject:forKey:", v21, CFSTR("url"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
    objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("bundleID"));

    a4 = (id *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v17, 0, a4));
    goto LABEL_13;
  }
LABEL_11:
  if (a4)
  {
    v25 = NSLocalizedDescriptionKey;
    v26 = CFSTR("error serializing payload one or more parameter is nil");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v23));

    a4 = 0;
  }
LABEL_13:

  return a4;
}

+ (id)deserializePayload:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  char v27;
  AttributionPayload *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString **v34;
  NSErrorUserInfoKey *v35;
  void *v36;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  NSErrorUserInfoKey v46;
  const __CFString *v47;
  NSErrorUserInfoKey v48;
  const __CFString *v49;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, a4));
    v8 = v7;
    if (!v7)
    {
LABEL_22:
      a4 = 0;
      goto LABEL_23;
    }
    if (objc_msgSend(v7, "count") != (id)4)
    {
      if (!a4)
        goto LABEL_23;
      v48 = NSLocalizedDescriptionKey;
      v49 = CFSTR("error deserializing the payload in correct parameters found");
      v34 = &v49;
      v35 = &v48;
      goto LABEL_21;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url")));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleID")));
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("header")));
        if (v13)
        {
          v14 = (void *)v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("body")));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("header")));
            v17 = objc_opt_class(NSDictionary);
            isKindOfClass = objc_opt_isKindOfClass(v16, v17);

            if ((isKindOfClass & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("body")));
              v20 = objc_opt_class(NSDictionary);
              v21 = objc_opt_isKindOfClass(v19, v20);

              if ((v21 & 1) != 0)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url")));
                v23 = objc_opt_class(NSString);
                v24 = objc_opt_isKindOfClass(v22, v23);

                if ((v24 & 1) != 0)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleID")));
                  v26 = objc_opt_class(NSString);
                  v27 = objc_opt_isKindOfClass(v25, v26);

                  if ((v27 & 1) != 0)
                  {
                    v28 = [AttributionPayload alloc];
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url")));
                    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v29));
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleID")));
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("header")));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("body")));
                    a4 = -[AttributionPayload initWithURL:bundleID:header:body:](v28, "initWithURL:bundleID:header:body:", v30, v31, v32, v33);

LABEL_23:
                    goto LABEL_24;
                  }
                  if (!a4)
                    goto LABEL_23;
                  v38 = NSLocalizedDescriptionKey;
                  v39 = CFSTR("error deserializing incorrect class type found");
                  v34 = &v39;
                  v35 = &v38;
                }
                else
                {
                  if (!a4)
                    goto LABEL_23;
                  v40 = NSLocalizedDescriptionKey;
                  v41 = CFSTR("error deserializing incorrect class type found");
                  v34 = &v41;
                  v35 = &v40;
                }
              }
              else
              {
                if (!a4)
                  goto LABEL_23;
                v42 = NSLocalizedDescriptionKey;
                v43 = CFSTR("error deserializing incorrect class type found");
                v34 = &v43;
                v35 = &v42;
              }
            }
            else
            {
              if (!a4)
                goto LABEL_23;
              v44 = NSLocalizedDescriptionKey;
              v45 = CFSTR("error deserializing incorrect class type found");
              v34 = &v45;
              v35 = &v44;
            }
            goto LABEL_21;
          }
          goto LABEL_19;
        }

      }
    }
LABEL_19:
    if (!a4)
      goto LABEL_23;
    v46 = NSLocalizedDescriptionKey;
    v47 = CFSTR("error deserializing the payload one or more parameters is nil");
    v34 = &v47;
    v35 = &v46;
LABEL_21:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v35, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.adservices.attributionError"), 2, v36));

    goto LABEL_22;
  }
  a4 = 0;
LABEL_24:

  return a4;
}

@end
