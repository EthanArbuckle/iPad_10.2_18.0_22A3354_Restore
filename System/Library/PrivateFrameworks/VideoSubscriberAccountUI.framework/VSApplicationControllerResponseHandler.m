@implementation VSApplicationControllerResponseHandler

- (void)handleJavascriptResponse:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  objc_msgSend(v8, "authN");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v15 = 0;
    -[VSApplicationControllerResponseHandler _accountAuthenticationWithJavascriptResponse:error:](self, "_accountAuthenticationWithJavascriptResponse:error:", v8, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = v12;
    if (v11)
    {
      -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:](self, "_handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:", v8, a4, v11, v9);
    }
    else
    {
      if (!v12)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
      objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v14);

    }
  }
  else
  {
    -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:](self, "_handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:", v8, a4, 0, v9);
  }

}

- (id)_accountAuthenticationWithJavascriptResponse:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  VSAccountAuthentication *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;

  v5 = a3;
  objc_msgSend(v5, "authenticationScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDF8DD8]);

  if (v7)
  {
    objc_msgSend(v5, "authN");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    VSSharedSAMLParserController();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v9, "parseResponse:error:", v8, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;

    if (v10)
    {
      v12 = objc_alloc_init(VSAccountAuthentication);
      objc_msgSend(v10, "userName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountAuthentication setUsername:](v12, "setUsername:", v13);

      if (objc_msgSend(v10, "expectedAction") == 1 && objc_msgSend(v10, "hasValidAuthentication"))
      {
        v14 = objc_alloc_init(MEMORY[0x24BDF8C68]);
        objc_msgSend(v14, "setBody:", v8);
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountAuthentication setAuthenticationToken:](v12, "setAuthenticationToken:", v31);

      v21 = 0;
    }
    else
    {
      VSPublicError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(v5, "expectedAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 != 1)
    {
      VSErrorLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[VSApplicationControllerResponseHandler _accountAuthenticationWithJavascriptResponse:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      VSPrivateError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      VSPublicError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 0;
      if (a4)
        goto LABEL_20;
      goto LABEL_21;
    }
    v8 = objc_alloc_init(MEMORY[0x24BDF8C30]);
    objc_msgSend(v5, "expirationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExpirationDate:", v17);

    objc_msgSend(v5, "authN");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v18);

    if (objc_msgSend(v8, "isValid"))
    {
      v12 = objc_alloc_init(VSAccountAuthentication);
      objc_msgSend(v5, "username");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountAuthentication setUsername:](v12, "setUsername:", v19);

      objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAccountAuthentication setAuthenticationToken:](v12, "setAuthenticationToken:", v20);
      v21 = 0;
    }
    else
    {
      VSPrivateError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      VSPublicError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
    }

  }
  if (a4)
LABEL_20:
    *a4 = objc_retainAutorelease(v21);
LABEL_21:
  objc_msgSend(v5, "appBundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAccountAuthentication setAppBundleIdentifier:](v12, "setAppBundleIdentifier:", v32);

  -[VSAccountAuthentication setSynchronizable:](v12, "setSynchronizable:", objc_msgSend(v5, "isSynchronizable"));
  return v12;
}

- (void)_handleJavascriptResponseInternal:(id)a3 requestType:(int64_t)a4 accountAuthentication:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  VSApplicationControllerResponse *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  VSApplicationControllerResponse *v39;
  VSApplicationControllerResponse *v40;
  id v41;
  VSApplicationControllerResponse *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  VSApplicationControllerResponseHandler *v65;
  void *v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v67 = a5;
  v11 = (void (**)(id, void *))a6;
  switch(a4)
  {
    case 1:
    case 2:
      objc_msgSend(v10, "authN");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_9;
      goto LABEL_34;
    case 3:
      objc_msgSend(v10, "userMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_34;
      goto LABEL_9;
    case 4:
      objc_msgSend(v10, "logout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_34;
LABEL_9:
      v21 = v12;
      objc_msgSend(v10, "authenticationScheme");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (uint64_t *)MEMORY[0x24BDF8DD8];
      if (!v22)
        v22 = (id)*MEMORY[0x24BDF8DD8];
      objc_msgSend(v10, "userChannelList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = self;
      v66 = v24;
      if (objc_msgSend(v24, "count"))
      {
        v63 = v22;
        v25 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v26 = v24;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v70 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v25, "addObject:", v31);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          }
          while (v28);
        }

        v22 = v63;
        v23 = (uint64_t *)MEMORY[0x24BDF8DD8];
      }
      else
      {
        v25 = 0;
      }
      v37 = *v23;
      if (objc_msgSend(v22, "isEqual:", v37))
      {
        v68 = 0;
        -[VSApplicationControllerResponseHandler _parseSAMLResponseString:error:](self, "_parseSAMLResponseString:error:", v21, &v68);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (VSApplicationControllerResponse *)v68;
        v40 = v39;
        if (v38)
        {
          v64 = v38;
          v41 = v38;
          v42 = objc_alloc_init(VSApplicationControllerResponse);
          -[VSApplicationControllerResponse setAuthenticationScheme:](v42, "setAuthenticationScheme:", v37);
          objc_msgSend(v41, "primaryStatusCode");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSApplicationControllerResponse setResponseStatusCode:](v42, "setResponseStatusCode:", v43);

          -[VSApplicationControllerResponse setResponseString:](v42, "setResponseString:", v21);
          v62 = (void *)MEMORY[0x24BDD16E0];
          v44 = v22;
          v45 = objc_msgSend(v41, "expectedAction");

          v46 = v45;
          v22 = v44;
          objc_msgSend(v62, "numberWithInteger:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSApplicationControllerResponse setExpectedAction:](v42, "setExpectedAction:", v47);

          -[VSApplicationControllerResponse setAccountChannelIDs:](v42, "setAccountChannelIDs:", v25);
          -[VSApplicationControllerResponse setAccountAuthentication:](v42, "setAccountAuthentication:", v67);
          objc_msgSend(v10, "userAccounts");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSApplicationControllerResponse setApplicationUserAccounts:](v42, "setApplicationUserAccounts:", v48);

          -[VSApplicationControllerResponseHandler _setSubscriptionDataWithResponse:forJavascriptResponse:](v65, "_setSubscriptionDataWithResponse:forJavascriptResponse:", v42, v10);
          objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v42);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v64;
        }
        else
        {
          v50 = 0;
          if (!v39)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The parseErrorOrNil parameter must not be nil."));
          objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v40);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v54 = v66;

      }
      else
      {
        v40 = objc_alloc_init(VSApplicationControllerResponse);
        -[VSApplicationControllerResponse setAuthenticationScheme:](v40, "setAuthenticationScheme:", v22);
        -[VSApplicationControllerResponse setResponseString:](v40, "setResponseString:", v21);
        objc_msgSend(v10, "statusCode");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerResponse setResponseStatusCode:](v40, "setResponseStatusCode:", v51);

        objc_msgSend(v10, "expectedAction");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerResponse setExpectedAction:](v40, "setExpectedAction:", v52);

        -[VSApplicationControllerResponse setAccountChannelIDs:](v40, "setAccountChannelIDs:", v25);
        -[VSApplicationControllerResponse setAccountAuthentication:](v40, "setAccountAuthentication:", v67);
        objc_msgSend(v10, "userAccounts");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerResponse setApplicationUserAccounts:](v40, "setApplicationUserAccounts:", v53);

        -[VSApplicationControllerResponseHandler _setSubscriptionDataWithResponse:forJavascriptResponse:](self, "_setSubscriptionDataWithResponse:forJavascriptResponse:", v40, v10);
        objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v40);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v66;
      }

      if (!v49)
        goto LABEL_40;
      goto LABEL_41;
    case 5:
      objc_msgSend(v10, "expectedAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "integerValue");

      if (v33 == 1)
      {
        v34 = objc_alloc_init(VSApplicationControllerResponse);
        objc_msgSend(v10, "expectedAction");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSApplicationControllerResponse setExpectedAction:](v34, "setExpectedAction:", v35);

        objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v34);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        VSErrorLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:].cold.2(v13, v55, v56, v57, v58, v59, v60, v61);
LABEL_31:

        VSPublicError();
        v34 = (VSApplicationControllerResponse *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v34);
        v36 = objc_claimAutoreleasedReturnValue();
      }
      v49 = (void *)v36;

      if (v49)
      {
        v21 = 0;
      }
      else
      {
LABEL_34:
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("No result nor error to return for request."));
        v21 = 0;
LABEL_40:
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The resultOrNil parameter must not be nil."));
        v49 = 0;
      }
LABEL_41:
      v11[2](v11, v49);

      return;
    default:
      VSErrorLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[VSApplicationControllerResponseHandler _handleJavascriptResponseInternal:requestType:accountAuthentication:completionHandler:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      goto LABEL_31;
  }
}

- (id)_parseSAMLResponseString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v5 = a3;
  VSSharedSAMLParserController();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v6, "parseResponse:error:", v5, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  v9 = 0;
  if (!v7)
  {
    VSPublicError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v9);
LABEL_4:

  return v7;
}

- (void)_setSubscriptionDataWithResponse:(id)a3 forJavascriptResponse:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v5, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "subscriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [javascriptResponse subscriptions] parameter must not be nil."));
    objc_msgSend(v5, "subscriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSJSSubscription toVSSubscriptions:](VSJSSubscription, "toVSSubscriptions:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubscriptionsToAdd:", v10);

  }
  objc_msgSend(v5, "clearSubscriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSubscriptionsToRemoveByBundleID:", v11);

}

- (void)_accountAuthenticationWithJavascriptResponse:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Could not set authN because expectedAction was not Proceed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_handleJavascriptResponseInternal:(uint64_t)a3 requestType:(uint64_t)a4 accountAuthentication:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Unexpected request type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_handleJavascriptResponseInternal:(uint64_t)a3 requestType:(uint64_t)a4 accountAuthentication:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2303C5000, a1, a3, "Unexpected expectedAction for Opt Out", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
