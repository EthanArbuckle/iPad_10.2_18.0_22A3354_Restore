@implementation RadioTermsCheckRequest

- (void)cancel
{
  -[SSURLConnectionRequest cancel](self->_request, "cancel");
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  -[RadioRequest requestContext](self, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8770]), "initWithSystemApplicationType:", 0);
  v9 = (void *)objc_msgSend(v6, "initWithIdentity:clientInfo:", v7, v8);

  objc_msgSend(MEMORY[0x24BEC8A38], "sharedBagProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke;
  v13[3] = &unk_24CA2EA28;
  v13[4] = self;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "getBagForRequestContext:withCompletionHandler:", v9, v13);

}

- (unint64_t)acceptedTermsVersion
{
  return self->_acceptedTermsVersion;
}

- (void)setAcceptedTermsVersion:(unint64_t)a3
{
  self->_acceptedTermsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "stringForBagKey:", CFSTR("terms-check"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Terms check URL: %@", buf, 0xCu);

  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v5);
  v9 = (void *)MEMORY[0x24BDD1608];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v24[0] = CFSTR("accepted");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("context");
    v25[0] = v10;
    v25[1] = CFSTR("radio");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v9, "dataWithJSONObject:options:error:", v11, 0, &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;

    if (v12)
    {
      objc_msgSend(v8, "setHTTPBody:", v12);
    }
    else
    {
      v14 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl(&dword_2105F8000, v14, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Unable to serialize JSON body data (%@)", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", &unk_24CA357A0, 0, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHTTPBody:", v13);
  }

  v15 = -[RadioStoreBag _initWithURLBag:]([RadioStoreBag alloc], "_initWithURLBag:", v3);
  v16 = objc_msgSend(MEMORY[0x24BEB2000], "newRadioRequestWithRequestContext:requestProperties:storeBag:", *(_QWORD *)(a1 + 40), v8, v15);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 72);
  *(_QWORD *)(v17 + 72) = v16;

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 72);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_18;
  v21[3] = &unk_24CA2EA00;
  v21[4] = v19;
  v22 = *(id *)(a1 + 48);
  objc_msgSend(v20, "startWithConnectionResponseBlock:", v21);

}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  char v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v5, "statusCode");
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "integerValue");

  }
  v11 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v40 = v8;
    _os_log_impl(&dword_2105F8000, v11, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Status code: %lli", buf, 0xCu);
  }

  if ((unint64_t)(v8 - 300) > 0xFFFFFFFFFFFFFF9BLL)
  {
    objc_msgSend(v5, "radio_decompressedBodyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      v16 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2105F8000, v16, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] No response for terms check.", buf, 2u);
      }
      v20 = 0;
      v21 = 0;
      v22 = 0;
      goto LABEL_44;
    }
    v38 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v14, 0, &v38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v38;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v15)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }
      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      v23 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (uint64_t)v16;
        _os_log_impl(&dword_2105F8000, v23, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Unable to unserialize JSON body data (%@)", buf, 0xCu);
      }
      v20 = 0;
      v21 = 0;
      v22 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v17 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (uint64_t)v15;
      _os_log_impl(&dword_2105F8000, v17, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Terms response: %@", buf, 0xCu);
    }

    objc_msgSend(v15, "objectForKey:", CFSTR("status"));
    v18 = objc_claimAutoreleasedReturnValue();
    v31 = v18;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (!-[NSObject integerValue](v18, "integerValue"))
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("latestTermsVersionId"));
        v19 = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v22 = -[NSObject longLongValue](v19, "longLongValue");
        else
          v22 = 0;
        objc_msgSend(v15, "objectForKey:", CFSTR("isCurrent"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v21 = objc_msgSend(v27, "BOOLValue");
        else
          v21 = 0;
        v30 = v27;
        objc_msgSend(v15, "objectForKey:", CFSTR("termsContentText"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v29 = v28;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = (void *)objc_msgSend(v28, "copy");
        else
          v20 = 0;
        objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1);

        goto LABEL_38;
      }
      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      objc_msgSend(v15, "objectForKey:", CFSTR("errorNumber"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19
        && (objc_opt_respondsToSelector() & 1) != 0
        && (-[NSObject intValue](v19, "intValue") == 5300
         || -[NSObject intValue](v19, "intValue") == 5601))
      {
        objc_msgSend(*(id *)(a1 + 32), "setStatus:", 2);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      v19 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (uint64_t)v18;
        _os_log_impl(&dword_2105F8000, v19, OS_LOG_TYPE_INFO, "[RadioTermsCheckRequest] Error: Status object doesn't response to integerValue (%@)", buf, 0xCu);
      }
    }
    v20 = 0;
    v21 = 0;
    v22 = 0;
LABEL_38:

    v23 = v31;
    goto LABEL_42;
  }
  v12 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = (uint64_t)v7;
    _os_log_impl(&dword_2105F8000, v12, OS_LOG_TYPE_ERROR, "Error: Unable to fetch terms (%@)", buf, 0xCu);
  }

  if (v8 <= 399)
  {
    v13 = 1;
    if (v8 == 200 || v8 == 204)
      goto LABEL_34;
LABEL_27:
    v13 = 3;
    goto LABEL_34;
  }
  if (v8 != 404)
  {
    if (v8 == 401)
    {
      v13 = 2;
      goto LABEL_34;
    }
    if (v8 != 400)
      goto LABEL_27;
  }
  v13 = 4;
LABEL_34:
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", v13);
  v20 = 0;
  v21 = 0;
  v22 = 0;
LABEL_45:
  dispatch_get_global_queue(0, 0);
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_36;
  block[3] = &unk_24CA2E9D8;
  v35 = *(id *)(a1 + 40);
  v36 = v22;
  v37 = v21;
  v25 = *(_QWORD *)(a1 + 32);
  v33 = v20;
  v34 = v25;
  v26 = v20;
  dispatch_async(v24, block);

}

void __53__RadioTermsCheckRequest_startWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 40));

}

@end
