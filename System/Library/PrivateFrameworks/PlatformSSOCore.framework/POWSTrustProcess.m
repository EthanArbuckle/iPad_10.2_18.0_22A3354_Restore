@implementation POWSTrustProcess

- (POWSTrustProcess)init
{
  POWSTrustProcess *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POWSTrustProcess;
  result = -[POWSTrustProcess init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_parseWSTrust13 = 257;
  return result;
}

- (id)createWSTrust13Request:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFAllocator *v18;
  id v19;
  const UInt8 *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[6];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "endpointURN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v4, "setAddress:", v5);

  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setEndpointReference:", v4);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setKeyType:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Bearer"));
  objc_msgSend(v6, "setRequestType:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue"));
  objc_msgSend(v6, "setAppliesTo:", v31);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStringValue:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"));
  objc_msgSend(v7, "setMustUnderstand:", CFSTR("1"));
  v30 = (void *)objc_opt_new();
  objc_msgSend(v3, "nonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStringValue:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setAddress:", CFSTR("http://www.w3.org/2005/08/addressing/anonymous"));
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setMustUnderstand:", CFSTR("1"));
  objc_msgSend(v3, "to");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStringValue:", v11);

  v12 = (void *)objc_opt_new();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("uuid-%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setId:", v16);

  objc_msgSend(v3, "userName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsername:", v17);

  v18 = (const __CFAllocator *)SecCFAllocatorZeroize();
  objc_msgSend(v3, "password");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const UInt8 *)objc_msgSend(v19, "mutableBytes");
  objc_msgSend(v3, "password");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (__CFString *)CFStringCreateWithBytes(v18, v20, objc_msgSend(v21, "length"), 0x8000100u, 0);
  objc_msgSend(v12, "setPassword:", v22);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setMustUnderstand:", CFSTR("1"));
  objc_msgSend(v23, "setUsernameToken:", v12);
  v24 = (void *)objc_opt_new();
  v34[0] = v7;
  v34[1] = v30;
  v34[2] = v9;
  v34[3] = v10;
  v34[4] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHeader:", v25);

  v33 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBody:", v26);

  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setEnvelope:", v24);
  objc_msgSend(v27, "XMLDataWithOptions:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)createWSTrust2005Request:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFAllocator *v18;
  id v19;
  const UInt8 *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[6];

  v34[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "endpointURN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v4;
  objc_msgSend(v4, "setAddress:", v5);

  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setEndpointReference:", v4);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setKeyType:", CFSTR("http://schemas.xmlsoap.org/ws/2005/05/identity/NoProofKey"));
  objc_msgSend(v6, "setRequestType:", CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/Issue"));
  objc_msgSend(v6, "setAppliesTo:", v31);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStringValue:", CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue"));
  objc_msgSend(v7, "setMustUnderstand:", CFSTR("1"));
  v30 = (void *)objc_opt_new();
  objc_msgSend(v3, "nonce");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setStringValue:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setAddress:", CFSTR("http://www.w3.org/2005/08/addressing/anonymous"));
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setMustUnderstand:", CFSTR("1"));
  objc_msgSend(v3, "to");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStringValue:", v11);

  v12 = (void *)objc_opt_new();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("uuid-%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setId:", v16);

  objc_msgSend(v3, "userName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsername:", v17);

  v18 = (const __CFAllocator *)SecCFAllocatorZeroize();
  objc_msgSend(v3, "password");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const UInt8 *)objc_msgSend(v19, "mutableBytes");
  objc_msgSend(v3, "password");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (__CFString *)CFStringCreateWithBytes(v18, v20, objc_msgSend(v21, "length"), 0x8000100u, 0);
  objc_msgSend(v12, "setPassword:", v22);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setMustUnderstand:", CFSTR("1"));
  objc_msgSend(v23, "setUsernameToken:", v12);
  v24 = (void *)objc_opt_new();
  v34[0] = v7;
  v34[1] = v30;
  v34[2] = v9;
  v34[3] = v10;
  v34[4] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHeader:", v25);

  v33 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBody:", v26);

  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setEnvelope:", v24);
  objc_msgSend(v27, "XMLDataWithOptions:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)parseWSTrustRequest:(id)a3 version:(unint64_t)a4
{
  id v5;
  POWSTrustRequest *v6;
  void *v7;
  POXMLXPathContext *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  POWSTrustRequest *v35;
  void *v37;
  void *v38;

  if (a4)
  {
    v5 = a3;
    v6 = objc_alloc_init(POWSTrustRequest);
    +[POXMLHelper loadXMLDocument:](POXMLHelper, "loadXMLDocument:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[POXMLXPathContext initWithXMLContext:]([POXMLXPathContext alloc], "initWithXMLContext:", v7);
      -[POXMLXPathContext registerNamespaces:](v8, "registerNamespaces:", CFSTR("s=http://www.w3.org/2003/05/soap-envelope a=http://www.w3.org/2005/08/addressing u=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd o=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd  wsu=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd wsp=http://schemas.xmlsoap.org/ws/2004/09/policy saml=urn:oasis:names:tc:SAML:1.0:assertion"));
      v9 = CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust");
      if (a4 == 1)
        v9 = CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("trust"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[POXMLXPathContext registerNamespaces:](v8, "registerNamespaces:", v10);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/a:Action"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "nodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustRequest setAction:](v6, "setAction:", v13);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/a:To"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "nodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "content");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustRequest setTo:](v6, "setTo:", v16);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/a:MessageID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "nodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "content");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustRequest setNonce:](v6, "setNonce:", v20);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/trust:RequestSecurityToken/wsp:AppliesTo/a:EndpointReference/a:Address"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "nodes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "content");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustRequest setEndpointURN:](v6, "setEndpointURN:", v24);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/o:Security/o:UsernameToken/o:Username"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "nodes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "content");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustRequest setUserName:](v6, "setUserName:", v28);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/o:Security/o:UsernameToken/o:Password"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "nodes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "content");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "dataUsingEncoding:", 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "mutableCopy");
      -[POWSTrustRequest setPassword:](v6, "setPassword:", v34);

      v35 = v6;
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (id)createWSTrust13Response:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[3];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v5;
  objc_msgSend(v5, "setTimeZone:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStringValue:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RSTRC/IssueFinal"));
  v55 = v7;
  objc_msgSend(v7, "setMustUnderstand:", CFSTR("1"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v3, "nonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v8;
  objc_msgSend(v8, "setStringValue:", v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setId:", CFSTR("_0"));
  objc_msgSend(v3, "created");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCreated:", v11);

  objc_msgSend(v3, "expires");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExpires:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setMustUnderstand:", CFSTR("1"));
  v52 = v13;
  v53 = v10;
  objc_msgSend(v13, "setTimestamp:", v10);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v3, "created");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCreated:", v15);

  objc_msgSend(v3, "tokenExpires");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpires:", v16);

  v17 = (void *)objc_opt_new();
  objc_msgSend(v3, "endpointURN");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAddress:", v18);

  v19 = (void *)objc_opt_new();
  v51 = v17;
  objc_msgSend(v19, "setEndpointReference:", v17);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v3, "assertion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStringValue:", v21);

  v22 = (void *)objc_opt_new();
  objc_msgSend(v3, "keyIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStringValue:", v23);

  objc_msgSend(v22, "setValueType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"));
  v24 = (void *)objc_opt_new();
  v50 = v22;
  objc_msgSend(v24, "setKeyIdentifier:", v22);
  objc_msgSend(v3, "tokenType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = objc_msgSend(v25, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:1.0:assertion"));

  if ((_DWORD)v22)
    objc_msgSend(v24, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"));
  objc_msgSend(v3, "tokenType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));

  if (v27)
    objc_msgSend(v24, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"));
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setSecurityTokenReference:", v24);
  v29 = (void *)objc_opt_new();
  objc_msgSend(v3, "keyIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStringValue:", v30);

  objc_msgSend(v29, "setValueType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"));
  v31 = (void *)objc_opt_new();
  v49 = v29;
  objc_msgSend(v31, "setKeyIdentifier:", v29);
  objc_msgSend(v3, "tokenType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v32, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:1.0:assertion"));

  if ((_DWORD)v29)
    objc_msgSend(v31, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"));
  objc_msgSend(v3, "tokenType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));

  if (v34)
    objc_msgSend(v31, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"));
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setSecurityTokenReference:", v31);
  v48 = v31;
  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setLifetime:", v14);
  objc_msgSend(v36, "setAppliesTo:", v19);
  objc_msgSend(v36, "setRequestedSecurityToken:", v20);
  v47 = v28;
  objc_msgSend(v36, "setRequestedAttachedReference:", v28);
  objc_msgSend(v36, "setRequestedUnattachedReference:", v35);
  objc_msgSend(v3, "tokenType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTokenType:", v37);

  objc_msgSend(v36, "setKeyType:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Bearer"));
  objc_msgSend(v36, "setRequestType:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue"));
  v46 = v19;
  v38 = (void *)objc_opt_new();
  v59[0] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRequestSecurityTokenResponse:", v39);

  v40 = (void *)objc_opt_new();
  v58[0] = v55;
  v58[1] = v54;
  v58[2] = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setHeader:", v41);

  v57 = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBody:", v42);

  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "setEnvelope:", v40);
  objc_msgSend(v43, "XMLDataWithOptions:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)createWSTrust2005Response:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];

  v55[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v5;
  objc_msgSend(v5, "setTimeZone:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStringValue:", CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/RSTR/Issue"));
  v51 = v7;
  objc_msgSend(v7, "setMustUnderstand:", CFSTR("1"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v3, "nonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v8;
  objc_msgSend(v8, "setStringValue:", v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setId:", CFSTR("_0"));
  objc_msgSend(v3, "created");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCreated:", v11);

  objc_msgSend(v3, "expires");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExpires:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setMustUnderstand:", CFSTR("1"));
  v48 = v13;
  v49 = v10;
  objc_msgSend(v13, "setTimestamp:", v10);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v3, "created");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCreated:", v15);

  objc_msgSend(v3, "tokenExpires");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExpires:", v16);

  v17 = (void *)objc_opt_new();
  objc_msgSend(v3, "endpointURN");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAddress:", v18);

  v19 = (void *)objc_opt_new();
  v47 = v17;
  objc_msgSend(v19, "setEndpointReference:", v17);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v3, "assertion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v20;
  objc_msgSend(v20, "setStringValue:", v21);

  v22 = (void *)objc_opt_new();
  objc_msgSend(v3, "keyIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStringValue:", v23);

  objc_msgSend(v22, "setValueType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"));
  v24 = (void *)objc_opt_new();
  v46 = v22;
  objc_msgSend(v24, "setKeyIdentifier:", v22);
  objc_msgSend(v3, "tokenType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v25, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:1.0:assertion"));

  if ((_DWORD)v10)
    objc_msgSend(v24, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"));
  objc_msgSend(v3, "tokenType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));

  if (v27)
    objc_msgSend(v24, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"));
  v28 = (void *)objc_opt_new();
  v45 = v24;
  objc_msgSend(v28, "setSecurityTokenReference:", v24);
  v29 = (void *)objc_opt_new();
  objc_msgSend(v3, "keyIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStringValue:", v30);

  objc_msgSend(v29, "setValueType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"));
  v31 = (void *)objc_opt_new();
  v44 = v29;
  objc_msgSend(v31, "setKeyIdentifier:", v29);
  objc_msgSend(v3, "tokenType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v32, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:1.0:assertion"));

  if ((_DWORD)v29)
    objc_msgSend(v31, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"));
  objc_msgSend(v3, "tokenType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));

  if (v34)
    objc_msgSend(v31, "setTokenType:", CFSTR("http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"));
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setSecurityTokenReference:", v31);
  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setLifetime:", v14);
  objc_msgSend(v36, "setAppliesTo:", v19);
  objc_msgSend(v36, "setRequestedSecurityToken:", v53);
  objc_msgSend(v36, "setRequestedAttachedReference:", v28);
  objc_msgSend(v36, "setRequestedUnattachedReference:", v35);
  objc_msgSend(v3, "tokenType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTokenType:", v37);

  objc_msgSend(v36, "setKeyType:", CFSTR("http://schemas.xmlsoap.org/ws/2005/05/identity/NoProofKey"));
  objc_msgSend(v36, "setRequestType:", CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/Issue"));
  v38 = (void *)objc_opt_new();
  v55[0] = v51;
  v55[1] = v50;
  v55[2] = v48;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setHeader:", v39);

  v54 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBody:", v40);

  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setEnvelope:", v38);
  objc_msgSend(v41, "XMLDataWithOptions:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)createWSTrustFault:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v5;
  objc_msgSend(v5, "setTimeZone:", v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setStringValue:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RSTRC/IssueFinal"));
  objc_msgSend(v7, "setMustUnderstand:", CFSTR("1"));
  v8 = (void *)objc_opt_new();
  objc_msgSend(v3, "nonce");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStringValue:", v9);

  objc_msgSend(v3, "created");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_4:
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setId:", CFSTR("_0"));
    objc_msgSend(v3, "created");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCreated:", v13);

    objc_msgSend(v3, "expires");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExpires:", v14);

    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setMustUnderstand:", CFSTR("1"));
    objc_msgSend(v15, "setTimestamp:", v12);

    goto LABEL_5;
  }
  objc_msgSend(v3, "expires");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  v15 = 0;
LABEL_5:
  v16 = (void *)objc_opt_new();
  objc_msgSend(v3, "created");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCreated:", v17);

  objc_msgSend(v3, "tokenExpires");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v16;
  objc_msgSend(v16, "setExpires:", v18);

  v19 = (void *)objc_opt_new();
  objc_msgSend(v3, "endpointURN");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAddress:", v20);

  v39 = (void *)objc_opt_new();
  v40 = v19;
  objc_msgSend(v39, "setEndpointReference:", v19);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v3, "faultSubCodeValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:", v22);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v3, "faultCodeValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:", v24);

  v38 = v21;
  objc_msgSend(v23, "setSubcode:", v21);
  v25 = (void *)objc_opt_new();
  objc_msgSend(v3, "faultReason");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setStringValue:", v26);

  v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "setText:", v25);
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setCode:", v23);
  objc_msgSend(v28, "setReason:", v27);
  v29 = (void *)objc_opt_new();
  v42 = v8;
  v45[0] = v7;
  v45[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHeader:", v30);

  v31 = v15;
  if (v15)
  {
    objc_msgSend(v29, "Header");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayByAddingObject:", v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHeader:", v33);

  }
  v44 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBody:", v34);

  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setEnvelope:", v29);
  objc_msgSend(v35, "XMLDataWithOptions:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)parseWSTrustResponse:(id)a3 version:(unint64_t)a4
{
  id v5;
  POWSTrustResponse *v6;
  void *v7;
  POXMLXPathContext *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  if (a4)
  {
    v5 = a3;
    v6 = objc_alloc_init(POWSTrustResponse);
    +[POXMLHelper loadXMLDocument:](POXMLHelper, "loadXMLDocument:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[POXMLXPathContext initWithXMLContext:]([POXMLXPathContext alloc], "initWithXMLContext:", v7);
    -[POXMLXPathContext registerNamespaces:](v8, "registerNamespaces:", CFSTR("s=http://www.w3.org/2003/05/soap-envelope a=http://www.w3.org/2005/08/addressing u=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd o=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd  wsu=http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd saml=urn:oasis:names:tc:SAML:1.0:assertion saml2=urn:oasis:names:tc:SAML:2.0:assertion"));
    v9 = CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust");
    if (a4 == 1)
      v9 = CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), CFSTR("trust"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[POXMLXPathContext registerNamespaces:](v8, "registerNamespaces:", v10);

    -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/a:RelatesTo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[POWSTrustResponse setNonce:](v6, "setNonce:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDD15D0]);
    objc_msgSend(v15, "setFormatOptions:", 3955);
    -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/o:Security/u:Timestamp/u:Created"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "nodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "content");
    v18 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v18;
    objc_msgSend(v15, "dateFromString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[POWSTrustResponse setCreated:](v6, "setCreated:", v19);

    -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Header/o:Security/u:Timestamp/u:Expires"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "nodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "content");
    v22 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)v22;
    objc_msgSend(v15, "dateFromString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[POWSTrustResponse setExpires:](v6, "setExpires:", v23);

    -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/s:Fault"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[POWSTrustResponse setFault:](v6, "setFault:", (int)objc_msgSend(v50, "nodeCount") > 0);
    if (-[POWSTrustResponse isFault](v6, "isFault"))
    {
      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/s:Fault/s:Reason/s:Text"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "nodes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "content");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setFaultReason:](v6, "setFaultReason:", v26);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/s:Fault/s:Code/s:Value"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nodes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "content");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setFaultCodeValue:](v6, "setFaultCodeValue:", v30);

      -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("/s:Envelope/s:Body/s:Fault/s:Code/s:Subcode/s:Value"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "nodes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "content");
      v34 = v15;
      v35 = v11;
      v36 = v7;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setFaultSubCodeValue:](v6, "setFaultSubCodeValue:", v37);

      v7 = v36;
      v11 = v35;
      v15 = v34;
      v38 = v49;

      objc_msgSend(v7, "nameSpacePrefixForHref:", CFSTR("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setSecurityExtensionPrefix:](v6, "setSecurityExtensionPrefix:", v39);
    }
    else
    {
      if (a4 == 1)
      {
        -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:TokenType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "nodes");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "firstObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "content");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v42, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion")))
          v43 = CFSTR("//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml2:Assertion");
        else
          v43 = CFSTR("//s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml:Assertion");
        -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/trust:RequestSecurityTokenResponse/trust:RequestedSecurityToken/saml:Assertion"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[POXMLXPathContext evaluateXPath:](v8, "evaluateXPath:", CFSTR("//s:Envelope/s:Body/trust:RequestSecurityTokenResponse/trust:TokenType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v38, "nodes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "rawXMLString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setAssertion:](v6, "setAssertion:", v46);

      objc_msgSend(v27, "nodes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "content");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[POWSTrustResponse setTokenType:](v6, "setTokenType:", v47);

    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)parseWSTrustMexResponse:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  uint8_t buf[2];
  __int16 v15;

  v6 = a3;
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      v12 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@=%@"), CFSTR("wsdl=http://schemas.xmlsoap.org/wsdl/ wsp=http://schemas.xmlsoap.org/ws/2004/09/policy soap12=http://schemas.xmlsoap.org/wsdl/soap12/ wsa10=http://www.w3.org/2005/08/addressing"), CFSTR("sp"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-securitypolicy/200702"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[POWSTrustProcess parseMexResponse:namespaces:policyXPath:action:](self, "parseMexResponse:namespaces:policyXPath:action:", v6, v7, CFSTR("sp:SignedEncryptedSupportingTokens/wsp:Policy/sp:UsernameToken/wsp:Policy/sp:WssUsernameToken10"), CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (-[POWSTrustProcess parseWSTrust13](self, "parseWSTrust13") && v8 && objc_msgSend(v8, "version") == 1)
    {
      PO_LOG_POWSTrustProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v15 = 0;
        v10 = "WSTrust 1.3 found";
        v11 = (uint8_t *)&v15;
LABEL_13:
        _os_log_impl(&dword_24440D000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_15:

    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@=%@"), CFSTR("wsdl=http://schemas.xmlsoap.org/wsdl/ wsp=http://schemas.xmlsoap.org/ws/2004/09/policy soap12=http://schemas.xmlsoap.org/wsdl/soap12/ wsa10=http://www.w3.org/2005/08/addressing"), CFSTR("sp"), CFSTR("http://schemas.xmlsoap.org/ws/2005/07/securitypolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[POWSTrustProcess parseMexResponse:namespaces:policyXPath:action:](self, "parseMexResponse:namespaces:policyXPath:action:", v6, v7, CFSTR("sp:SignedSupportingTokens/wsp:Policy/sp:UsernameToken/wsp:Policy/sp:WssUsernameToken10"), CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[POWSTrustProcess parseWSTrust2005](self, "parseWSTrust2005") || !v8 || objc_msgSend(v8, "version") != 2)
    goto LABEL_15;
  PO_LOG_POWSTrustProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v10 = "WSTrust 2005 found";
    v11 = buf;
    goto LABEL_13;
  }
LABEL_14:

  v8 = v8;
  v12 = v8;
LABEL_16:

LABEL_18:
  return v12;
}

- (id)parseMexResponse:(id)a3 namespaces:(id)a4 policyXPath:(id)a5 action:(id)a6
{
  id v9;
  id v10;
  POWSTrustMexResponse *v11;
  void *v12;
  POXMLXPathContext *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t j;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t k;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  uint64_t v70;
  NSObject *v71;
  POWSTrustMexResponse *v72;
  NSObject *v73;
  id v74;
  id v76;
  void *v77;
  void *v78;
  POWSTrustMexResponse *v79;
  NSObject *obj;
  void *v81;
  POWSTrustMexResponse *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  POXMLXPathContext *v88;
  void *v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  uint64_t v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v96 = a5;
  v93 = a6;
  v11 = objc_alloc_init(POWSTrustMexResponse);
  v78 = v9;
  +[POXMLHelper loadXMLDocument:](POXMLHelper, "loadXMLDocument:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v74 = __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke();
    v72 = 0;
    goto LABEL_86;
  }
  v79 = v11;
  v81 = v12;
  v13 = -[POXMLXPathContext initWithXMLContext:]([POXMLXPathContext alloc], "initWithXMLContext:", v12);
  v76 = v10;
  -[POXMLXPathContext registerNamespaces:](v13, "registerNamespaces:", v10);
  v88 = v13;
  -[POXMLXPathContext evaluateXPath:](v13, "evaluateXPath:", CFSTR("//wsdl:definitions/wsp:Policy/wsp:ExactlyOne/wsp:All"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v77 = v14;
  objc_msgSend(v14, "nodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v110;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v110 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
        objc_msgSend(v20, "parent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "parent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForProperty:", CFSTR("Id"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "evaluateXPath:", v96);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend(v24, "nodeCount") >= 1)
          objc_msgSend(v92, "addObject:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    }
    while (v17);
  }

  if (!objc_msgSend(v92, "count"))
  {
    PO_LOG_POWSTrustProcess();
    v73 = objc_claimAutoreleasedReturnValue();
    v10 = v76;
    v11 = v79;
    v12 = v81;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24440D000, v73, OS_LOG_TYPE_INFO, "no WSTrust policies found", buf, 2u);
    }
    v72 = 0;
    goto LABEL_85;
  }
  v12 = v81;
  if ((unint64_t)objc_msgSend(v92, "count") >= 2)
  {
    PO_LOG_POWSTrustProcess();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24440D000, v25, OS_LOG_TYPE_INFO, "more than one wstrust policy found", buf, 2u);
    }

  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v92;
  v85 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (!v85)
    goto LABEL_79;
  v84 = *(_QWORD *)v106;
  while (2)
  {
    for (j = 0; j != v85; ++j)
    {
      if (*(_QWORD *)v106 != v84)
        objc_enumerationMutation(obj);
      v27 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * j);
      PO_LOG_POWSTrustProcess();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v116 = v27;
        _os_log_impl(&dword_24440D000, v28, OS_LOG_TYPE_INFO, "checking %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//wsdl:definitions/wsdl:binding/wsp:PolicyReference[@URI=\"#%@\"]"), v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[POXMLXPathContext evaluateXPath:](v88, "evaluateXPath:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v89 = v30;
      objc_msgSend(v30, "nodes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      if (!v32)
      {

        v44 = 0;
        v49 = 0;
LABEL_57:
        PO_LOG_POWSTrustProcess();
        v34 = objc_claimAutoreleasedReturnValue();
        v63 = 1;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24440D000, v34, OS_LOG_TYPE_INFO, "no binding for found", buf, 2u);
        }
        v82 = 0;
        goto LABEL_75;
      }
      v33 = v32;
      v94 = v31;
      v91 = v27;
      v86 = v29;
      v87 = j;
      v34 = 0;
      v35 = *(_QWORD *)v102;
      do
      {
        v36 = 0;
        v37 = v34;
        do
        {
          if (*(_QWORD *)v102 != v35)
            objc_enumerationMutation(v94);
          v38 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v36);
          objc_msgSend(v38, "parent");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForProperty:", CFSTR("name"));
          v34 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "parent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "evaluateXPath:", CFSTR("soap12:binding"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if ((int)objc_msgSend(v41, "nodeCount") < 1)
          {
            v44 = 0;
          }
          else
          {
            objc_msgSend(v41, "nodes");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "valueForProperty:", CFSTR("transport"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v38, "parent");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "evaluateXPath:", CFSTR("wsdl:operation/soap12:operation"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if ((int)objc_msgSend(v46, "nodeCount") < 1)
          {
            v49 = 0;
          }
          else
          {
            objc_msgSend(v46, "nodes");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "firstObject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "valueForProperty:", CFSTR("soapAction"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if ((objc_msgSend(v44, "isEqualToString:", CFSTR("http://schemas.xmlsoap.org/soap/http")) & 1) != 0)
          {
            if (objc_msgSend(v49, "isEqualToString:", v93))
            {

              goto LABEL_43;
            }
          }
          else
          {
            PO_LOG_POWSTrustProcess();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              v116 = v91;
              _os_log_impl(&dword_24440D000, v50, OS_LOG_TYPE_INFO, "transport for %{public}@ not http, skipping", buf, 0xCu);
            }

          }
          ++v36;
          v37 = v34;
        }
        while (v33 != v36);
        v33 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      }
      while (v33);
      v49 = 0;
      v44 = 0;
LABEL_43:

      if (!v34)
      {
        v12 = v81;
        v29 = v86;
        j = v87;
        goto LABEL_57;
      }
      -[POXMLXPathContext evaluateXPath:](v88, "evaluateXPath:", CFSTR("//wsdl:definitions/wsdl:service/wsdl:port"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v83 = v51;
      objc_msgSend(v51, "nodes");
      v90 = (id)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      if (v52)
      {
        v53 = v52;
        v54 = 0;
        v95 = *(id *)v98;
        while (2)
        {
          for (k = 0; k != v53; ++k)
          {
            if (*(id *)v98 != v95)
              objc_enumerationMutation(v90);
            v56 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
            objc_msgSend(v56, "valueForProperty:", CFSTR("binding"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":%@"), v34);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = objc_msgSend(v57, "hasSuffix:", v58);

            if (v59)
            {
              objc_msgSend(v56, "valueForProperty:", CFSTR("name"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v56, "evaluateXPath:", CFSTR("wsa10:EndpointReference/wsa10:Address"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if ((int)objc_msgSend(v61, "nodeCount") > 0)
              {
                objc_msgSend(v61, "nodes");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "firstObject");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "content");
                v66 = objc_claimAutoreleasedReturnValue();

                v62 = (void *)v66;
                goto LABEL_62;
              }

              v54 = v60;
            }

          }
          v53 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
          if (v53)
            continue;
          break;
        }
        v62 = 0;
        v60 = v54;
      }
      else
      {
        v60 = 0;
        v62 = 0;
      }
LABEL_62:

      objc_msgSend(v62, "lowercaseString");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "hasPrefix:", CFSTR("https://"));

      v12 = v81;
      if ((v68 & 1) != 0)
      {
        v63 = 0;
        j = v87;
        v69 = v83;
        if (v62 && v49)
        {
          -[POWSTrustMexResponse setEndpointURLString:](v79, "setEndpointURLString:", v62);
          -[POWSTrustMexResponse setPolicyName:](v79, "setPolicyName:", v91);
          -[POWSTrustMexResponse setBindingName:](v79, "setBindingName:", v34);
          -[POWSTrustMexResponse setPortName:](v79, "setPortName:", v60);
          -[POWSTrustMexResponse setTransport:](v79, "setTransport:", v44);
          if ((objc_msgSend(v49, "isEqualToString:", CFSTR("http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue")) & 1) != 0)
          {
            v70 = 1;
          }
          else if (objc_msgSend(v49, "isEqualToString:", CFSTR("http://schemas.xmlsoap.org/ws/2005/02/trust/RST/Issue")))
          {
            v70 = 2;
          }
          else
          {
            v70 = 0;
          }
          -[POWSTrustMexResponse setVersion:](v79, "setVersion:", v70);
          v82 = v79;
          v63 = 1;
        }
      }
      else
      {
        PO_LOG_POWSTrustProcess();
        v71 = objc_claimAutoreleasedReturnValue();
        j = v87;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v116 = v91;
          _os_log_impl(&dword_24440D000, v71, OS_LOG_TYPE_INFO, "url for %{public}@ not https, skipping", buf, 0xCu);
        }

        v63 = 5;
        v69 = v83;
      }

      v29 = v86;
LABEL_75:

      if (v63 != 5 && v63)
      {
        v10 = v76;
        v11 = v79;
        v73 = obj;
        v72 = v82;
        goto LABEL_85;
      }
    }
    v85 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
    if (v85)
      continue;
    break;
  }
LABEL_79:
  v72 = 0;
  v10 = v76;
  v11 = v79;
  v73 = obj;
LABEL_85:

LABEL_86:
  return v72;
}

id __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to load mex response as XML."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POWSTrustProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke_cold_1((uint64_t)v0, v1);

  return v0;
}

- (BOOL)parseWSTrust13
{
  return self->_parseWSTrust13;
}

- (void)setParseWSTrust13:(BOOL)a3
{
  self->_parseWSTrust13 = a3;
}

- (BOOL)parseWSTrust2005
{
  return self->_parseWSTrust2005;
}

- (void)setParseWSTrust2005:(BOOL)a3
{
  self->_parseWSTrust2005 = a3;
}

void __67__POWSTrustProcess_parseMexResponse_namespaces_policyXPath_action___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_24440D000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
