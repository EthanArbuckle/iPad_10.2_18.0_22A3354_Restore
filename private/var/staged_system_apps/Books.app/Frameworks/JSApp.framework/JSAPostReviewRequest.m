@implementation JSAPostReviewRequest

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("submitURL")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("submitURL")));
    -[JSAStoreHTTPRequest setUrl:](self, "setUrl:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAPostReviewRequest _httpBody](self, "_httpBody"));
    -[JSAStoreHTTPRequest setBody:](self, "setBody:", v5);

    -[JSAStoreHTTPRequest setMethod:](self, "setMethod:", CFSTR("POST"));
    v9.receiver = self;
    v9.super_class = (Class)JSAPostReviewRequest;
    -[JSAStoreHTTPRequest send](&v9, "send");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPRequest onResponse](self, "onResponse"));

    if (v6)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[JSAStoreHTTPRequest onResponse](self, "onResponse"));
      objc_msgSend(v8, "enqueueValueCall:arguments:file:line:", v7, &off_A5C68, CFSTR("JSAPostReviewRequest.m"), 49);

    }
  }
}

- (id)_httpBody
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("rating")));

  if (v4)
  {
    v6 = objc_opt_class(NSString, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("rating")));
    v8 = BUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      v11 = objc_opt_class(NSString, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("rating")));
      v13 = BUDynamicCast(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      objc_msgSend(v14, "floatValue");
      v16 = v15;
    }
    else
    {
      v17 = objc_opt_class(NSNumber, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("rating")));
      v19 = BUDynamicCast(v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (!v20)
      {
        v16 = 0.0;
        goto LABEL_7;
      }
      v22 = objc_opt_class(NSNumber, v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("rating")));
      v23 = BUDynamicCast(v22, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v24, "floatValue");
      v16 = v25;

    }
LABEL_7:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.2f"), v16));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("rating"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("body")));

  if (v27)
  {
    v29 = objc_opt_class(NSString, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("body")));
    v31 = BUDynamicCast(v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

    if (objc_msgSend(v32, "length"))
      objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("body"));

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](AMSDevice, "deviceGUID"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](AMSDevice, "deviceGUID"));
    if (v34)
      objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("guid"));

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("nickname")));

  if (v35)
  {
    v37 = objc_opt_class(NSString, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("nickname")));
    v39 = BUDynamicCast(v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    if (objc_msgSend(v40, "length"))
      objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("nickname"));

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("title")));

  if (v41)
  {
    v43 = objc_opt_class(NSString, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->metadata, "objectForKeyedSubscript:", CFSTR("title")));
    v45 = BUDynamicCast(v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

    if (objc_msgSend(v46, "length"))
      objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("title"));

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL jsa_queryStringForParameters:escapedValues:](NSURL, "jsa_queryStringForParameters:escapedValues:", v3, 1));

  return v47;
}

- (NSDictionary)metadata
{
  return self->metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadata, 0);
}

@end
