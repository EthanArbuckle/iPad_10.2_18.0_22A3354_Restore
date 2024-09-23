@implementation VSApplicationControllerRequestFactory

- (id)silentAuthenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VSApplicationControllerRequest *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isOpaque") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_authNRequestSAMLStringWithAuthenticationToken:forced:error:", v8, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v9, "setType:", 2);
  -[VSApplicationControllerRequest setSAMLRequest:](v9, "setSAMLRequest:", v6);
  objc_msgSend(v5, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationControllerRequest setAuthenticationToken:](v9, "setAuthenticationToken:", v10);

  return v9;
}

- (id)silentAuthenticationApplicationControllerRequest
{
  VSApplicationControllerRequest *v2;

  v2 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v2, "setType:", 2);
  return v2;
}

- (id)authenticationApplicationControllerRequestWithAuthenticationToken:(id)a3 forcedAuthentication:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  VSApplicationControllerRequest *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  if ((objc_msgSend(v5, "isOpaque") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v5, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_authNRequestSAMLStringWithAuthenticationToken:forced:error:", v8, v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v9, "setType:", 1);
  -[VSApplicationControllerRequest setSAMLRequest:](v9, "setSAMLRequest:", v6);
  objc_msgSend(v5, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationControllerRequest setAuthenticationToken:](v9, "setAuthenticationToken:", v10);

  return v9;
}

- (id)accountMetadataApplicationControllerRequestWithAccountMetadataRequest:(id)a3 authenticationToken:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VSApplicationControllerRequest *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "attributeNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "channelIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verificationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isOpaque") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_opt_class();
    objc_msgSend(v5, "body");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_attributeQuerySAMLRequestStringWithAttributeNames:channelID:authenticationToken:error:", v7, v8, v12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v13, "setType:", 3);
  -[VSApplicationControllerRequest setSAMLRequest:](v13, "setSAMLRequest:", v10);
  objc_msgSend(v5, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationControllerRequest setAuthenticationToken:](v13, "setAuthenticationToken:", v14);

  -[VSApplicationControllerRequest setRequestorVerificationToken:](v13, "setRequestorVerificationToken:", v9);
  -[VSApplicationControllerRequest setAttributeNames:](v13, "setAttributeNames:", v7);

  return v13;
}

- (id)logoutApplicationControllerRequestWithAuthenticationToken:(id)a3
{
  id v3;
  void *v4;
  VSApplicationControllerRequest *v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_logoutSAMLRequestStringWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v5, "setType:", 4);
  -[VSApplicationControllerRequest setSAMLRequest:](v5, "setSAMLRequest:", v4);
  objc_msgSend(v3, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSApplicationControllerRequest setAuthenticationToken:](v5, "setAuthenticationToken:", v6);
  return v5;
}

- (id)STBOptOutApplicationControllerRequest
{
  VSApplicationControllerRequest *v2;

  v2 = objc_alloc_init(VSApplicationControllerRequest);
  -[VSApplicationControllerRequest setType:](v2, "setType:", 5);
  return v2;
}

+ (id)_authNRequestSAMLStringWithAuthenticationToken:(id)a3 forced:(BOOL)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  +[VSSAMLRequestFactory authNRequestWithResponse:forced:error:](VSSAMLRequestFactory, "authNRequestWithResponse:forced:error:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "xmlString:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_attributeQuerySAMLRequestStringWithAttributeNames:(id)a3 channelID:(id)a4 authenticationToken:(id)a5 error:(id *)a6
{
  void *v7;
  void *v8;

  +[VSSAMLRequestFactory attributeQueryWithAttributeNames:channelID:authNResponse:error:](VSSAMLRequestFactory, "attributeQueryWithAttributeNames:channelID:authNResponse:error:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "xmlString:", a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_logoutSAMLRequestStringWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[VSSAMLRequestFactory logoutRequestWithError:](VSSAMLRequestFactory, "logoutRequestWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xmlString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
