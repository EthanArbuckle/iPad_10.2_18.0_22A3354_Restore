uint64_t sub_22ACB2FA4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_propertyForKey_inRequest_(MEMORY[0x24BDB7498], a2, (uint64_t)CFSTR("com.apple.ap.pc.proxy-is-recursive"), a1, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_BOOLValue(v5, v6, v7, v8, v9);

  return v10;
}

void sub_22ACB3444()
{
  APProxyProtocolProperties *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  APProxySessionConfigurationProvider *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  APNSURLSessionDemultiplexerManager *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  APProxyURLCredentialService *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(APProxyProtocolProperties);
  v1 = (void *)qword_253DE25B0;
  qword_253DE25B0 = (uint64_t)v0;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v2, (uint64_t)CFSTR("https://webproxy.advp.apple.com:443"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [APProxySessionConfigurationProvider alloc];
  v10 = (void *)objc_msgSend_initWithDefaultProxyURL_(v6, v7, (uint64_t)v5, v8, v9);
  v32[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, (uint64_t)v32, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProtocolClasses_(v10, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setProxySessionConfigurationProvider_((void *)qword_253DE25B0, v17, (uint64_t)v10, v18, v19);
  v20 = [APNSURLSessionDemultiplexerManager alloc];
  v24 = (void *)objc_msgSend_initWithProxySessionConfigProvider_(v20, v21, (uint64_t)v10, v22, v23);
  objc_msgSend_setSessionDemultiplexerManager_((void *)qword_253DE25B0, v25, (uint64_t)v24, v26, v27);

  v28 = objc_alloc_init(APProxyURLCredentialService);
  objc_msgSend_setProxyURLCredentialService_((void *)qword_253DE25B0, v29, (uint64_t)v28, v30, v31);

}

void sub_22ACB378C(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  objc_msgSend__userAgent(a1, v7, v8, v9, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_composeUserAgentString_adIdentifier_maxRequestCount_(APProxyURLUtilities, v11, (uint64_t)v16, (uint64_t)v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setCustomUserAgent_(a1, v13, (uint64_t)v12, v14, v15);
}

void sub_22ACB3C90(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_lock(*(void **)(a1 + 32), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9, v10);
  objc_msgSend_sessionDemultiplexerForIdentifier(*(void **)(a1 + 32), v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v15, v16, *(_QWORD *)(a1 + 40), v17, v18);

  objc_msgSend__unregisterOldSessionIfRequired(*(void **)(a1 + 32), v19, v20, v21, v22);
  objc_msgSend_unlock(v6, v23, v24, v25, v26);
  APLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = *(_QWORD *)(a1 + 40);
    v29 = 138543362;
    v30 = v28;
    _os_log_impl(&dword_22ACB2000, v27, OS_LOG_TYPE_INFO, "Removed demultiplexer session '%{public}@'.", (uint8_t *)&v29, 0xCu);
  }

}

void sub_22ACB6CD4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_dataTask_didReceiveResponse_completionHandler_(v7, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void sub_22ACB6E30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_dataTask_didReceiveData_(v7, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t sub_22ACB701C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_task_didCompleteWithError_(v6, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return objc_msgSend_invalidate(*(void **)(a1 + 32), v8, v9, v10, v11);
}

void sub_22ACB71D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler_(v7, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

void sub_22ACB73E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  id v7;

  objc_msgSend_delegate(*(void **)(a1 + 32), a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLSession_task_didReceiveChallenge_completionHandler_(v7, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

id sub_22ACB750C(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;

  v6 = a3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = objc_opt_class();
    objc_msgSend_raise_format_(v7, v10, v8, (uint64_t)CFSTR("%@ key cannot be nil"), v11, v9);
  }
  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x24BDD1808], v4, a1, 1, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItems(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v18, (uint64_t)CFSTR("name = %@"), v19, v20, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v17, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_value(v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

id sub_22ACB7614(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;

  v6 = a3;
  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    v9 = objc_opt_class();
    objc_msgSend_raise_format_(v7, v10, v8, (uint64_t)CFSTR("%@ key cannot be nil"), v11, v9);
  }
  objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x24BDD1808], v4, a1, 0, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryItems(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v18, (uint64_t)CFSTR("name != %@"), v19, v20, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v17, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v25, v26, v27, v28, v29))
    objc_msgSend_setQueryItems_(v12, v30, (uint64_t)v25, v31, v32);
  else
    objc_msgSend_setQueryItems_(v12, v30, 0, v31, v32);
  objc_msgSend_URL(v12, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

id sub_22ACB7720(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v6 = a3;
  v11 = a4;
  if (v11)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    v26 = *MEMORY[0x24BDBCAB8];
    v27 = objc_opt_class();
    objc_msgSend_raise_format_(v25, v28, v26, (uint64_t)CFSTR("%@ key cannot be nil"), v29, v27);
    if (v6)
      goto LABEL_3;
  }
  v30 = (void *)MEMORY[0x24BDBCE88];
  v31 = *MEMORY[0x24BDBCAB8];
  v32 = objc_opt_class();
  objc_msgSend_raise_format_(v30, v33, v31, (uint64_t)CFSTR("%@ value cannot be nil"), v34, v32);
LABEL_3:
  if (objc_msgSend_length(v11, v7, v8, v9, v10))
  {
    objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x24BDD1808], v12, (uint64_t)a1, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queryItems(v14, v15, v16, v17, v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend_queryItems(v14, v19, v20, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = (void *)MEMORY[0x24BDBD1A8];
    }

    objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v36, (uint64_t)CFSTR("name != %@"), v37, v38, v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_filteredArrayUsingPredicate_(v24, v40, (uint64_t)v39, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queryItemWithName_value_(MEMORY[0x24BDD1838], v44, (uint64_t)v11, (uint64_t)v6, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v43, v47, (uint64_t)v46, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setQueryItems_(v14, v51, (uint64_t)v50, v52, v53);

    objc_msgSend_URL(v14, v54, v55, v56, v57);
    v35 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = a1;
  }

  return v35;
}

uint64_t sub_22ACB78F0(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x24BDB7498], a2, a3, (uint64_t)CFSTR("maximumRequestCount"), a1);
  else
    return MEMORY[0x24BEDD108](MEMORY[0x24BDB7498], sel_removePropertyForKey_inRequest_, CFSTR("maximumRequestCount"), a1, a1);
}

uint64_t sub_22ACB791C(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x24BDB7498], a2, a3, (uint64_t)CFSTR("adIdentifier"), a1);
  else
    return MEMORY[0x24BEDD108](MEMORY[0x24BDB7498], sel_removePropertyForKey_inRequest_, CFSTR("adIdentifier"), a1, a1);
}

void sub_22ACB7948(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDB7498];
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProperty_forKey_inRequest_(v6, v7, (uint64_t)v8, (uint64_t)CFSTR("requestType"), a1);

}

uint64_t sub_22ACB79A8(uint64_t a1, const char *a2)
{
  return objc_msgSend_setProperty_forKey_inRequest_(MEMORY[0x24BDB7498], a2, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("com.apple.ap.pc.proxy-is-recursive"), a1);
}

uint64_t sub_22ACB79CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDB7498], sel_removePropertyForKey_inRequest_, CFSTR("com.apple.ap.pc.proxy-is-recursive"), a1, a5);
}

uint64_t sub_22ACB79E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_propertyForKey_inRequest_(MEMORY[0x24BDB7498], a2, (uint64_t)CFSTR("maximumRequestCount"), a1, a5);
}

uint64_t sub_22ACB7A04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_propertyForKey_inRequest_(MEMORY[0x24BDB7498], a2, (uint64_t)CFSTR("adIdentifier"), a1, a5);
}

BOOL sub_22ACB7A20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend_propertyForKey_inRequest_(MEMORY[0x24BDB7498], a2, (uint64_t)CFSTR("com.apple.ap.pc.proxy-is-recursive"), a1, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

uint64_t sub_22ACB7A68(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend_propertyForKey_inRequest_(MEMORY[0x24BDB7498], a2, (uint64_t)CFSTR("requestType"), a1, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
    v11 = objc_msgSend_integerValue(v5, v6, v7, v8, v9);
  else
    v11 = 0;

  return v11;
}

uint64_t sub_22ACB7AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a1, sel_queryItemForKey_, CFSTR("videoAdvertisingIdentifier"), a4, a5);
}

uint64_t sub_22ACB7AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a1, sel_removeQueryItemForKey_, CFSTR("videoAdvertisingIdentifier"), a4, a5);
}

uint64_t sub_22ACB7AE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isEqualToString;

  objc_msgSend_scheme(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)CFSTR("http"), v7, v8);

  return isEqualToString;
}

id sub_22ACB7B20(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CFString **v5;
  id v6;

  if (a3)
  {
    if (a3 == 1)
    {
      v5 = &off_24F4E1960;
    }
    else
    {
      if (a3 != 2)
      {
        v6 = a1;
        return v6;
      }
      v5 = &off_24F4E1968;
    }
  }
  else
  {
    v5 = &off_24F4E1958;
  }
  objc_msgSend_changeSchemeToString_(a1, a2, (uint64_t)*v5, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  return v6;
}

id sub_22ACB7B78(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7, v8))
  {
    objc_msgSend_absoluteString(a1, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheme(a1, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_length(v18, v19, v20, v21, v22);
    objc_msgSend_substringFromIndex_(v13, v24, v23, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_stringByAppendingString_(v4, v29, (uint64_t)v27, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(v28, v33, (uint64_t)v32, v34, v35);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = a1;
  }

  return v36;
}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

