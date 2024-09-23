@implementation OAURLRequestSigner

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OAURLRequestSigner;
  -[OAURLRequestSigner dealloc](&v3, sel_dealloc);
}

- (id)timestamp:(id)a3
{
  id v3;
  void *v4;
  double v5;

  v3 = a3;
  if (!a3)
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "timeIntervalSince1970");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%d"), (int)v5);
}

- (OAURLRequestSigner)initWithCredential:(id)a3
{
  OAURLRequestSigner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OAURLRequestSigner;
  v4 = -[OAURLRequestSigner init](&v6, sel_init);
  if (v4)
  {
    v4->_credential = (OACredential *)a3;
    v4->_signatureMethod = 0;
  }
  return v4;
}

- (id)signatureMethodString
{
  if (!-[OAURLRequestSigner signatureMethod](self, "signatureMethod"))
    return CFSTR("HMAC-SHA1");
  if (-[OAURLRequestSigner signatureMethod](self, "signatureMethod") == 1)
    return CFSTR("RSA-SHA1");
  if (-[OAURLRequestSigner signatureMethod](self, "signatureMethod") == 2)
    return CFSTR("PLAINTEXT");
  return 0;
}

- (Class)signer
{
  if (-[OAURLRequestSigner signatureMethod](self, "signatureMethod")
    && (-[OAURLRequestSigner signatureMethod](self, "signatureMethod") == 1
     || -[OAURLRequestSigner signatureMethod](self, "signatureMethod") != 2))
  {
    return 0;
  }
  else
  {
    return (Class)objc_opt_class();
  }
}

- (id)oauthNonce
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  __CFString *v4;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  CFRelease(v3);
  return v4;
}

- (id)oauthParametersWithNonce:(id)a3 timeStamp:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSString *v12;

  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OAConsumerKeyKey, -[OACredential consumerKey](self->_credential, "consumerKey"));
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OASignatureMethodKey, -[OAURLRequestSigner signatureMethodString](self, "signatureMethodString"));
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OATimestampKey, a4);
  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OANonceKey, a3);
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OAVersionKey, oauth_version);
  v12 = -[OACredential oauthToken](self->_credential, "oauthToken");
  if (v12)
    v12 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), OAAuthTokenKey, -[OACredential oauthToken](self->_credential, "oauthToken"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, v8, v9, v10, v11, v12, 0);
}

- (id)oauthAuthorizationHeaderWithSignature:(id)a3 nonce:(id)a4 timestamp:(id)a5
{
  id v9;
  uint64_t v10;
  void *v11;

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OANonceKey, a4));
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OASignatureMethodKey, -[OAURLRequestSigner signatureMethodString](self, "signatureMethodString")));
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OATimestampKey, a5));
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OAConsumerKeyKey, -[OACredential consumerKey](self->_credential, "consumerKey")));
  if (-[OACredential oauthToken](self->_credential, "oauthToken"))
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OAAuthTokenKey, -[OACredential oauthToken](self->_credential, "oauthToken")));
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OASignatureKey, a3));
  objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), OAVersionKey, oauth_version));
  v10 = objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("OAuth %@"), v10);

  return v11;
}

- (id)applyApplicationID:(id)a3 toRequest:(id)a4 containsMultiPartData:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;

  v5 = a5;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  v8 = (void *)objc_msgSend(v7, "HTTPMethod");
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("GET")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("DELETE")) & 1) != 0
    || v5)
  {
    v13 = (void *)objc_msgSend(v7, "URL");
    v14 = (void *)objc_msgSend(v13, "absoluteString");
    v15 = objc_msgSend((id)objc_msgSend(v13, "query"), "length");
    v16 = objc_msgSend(a3, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v17 = CFSTR("&");
    if (!v15)
      v17 = CFSTR("?");
    v18 = objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("%@application_id=%@"), v17, v16);
    objc_msgSend(v7, "setURL:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18));
  }
  else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POST")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("PUT")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("PROPFIND")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("REPORT")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("OPTIONS")) & 1) != 0
         || objc_msgSend(v8, "isEqualToString:", CFSTR("PROPPATCH")))
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "bytes"), objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "length"), 4);
    v10 = objc_msgSend(v9, "length");
    v11 = objc_msgSend(a3, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v12 = CFSTR("&");
    if (!v10)
      v12 = &stru_24C456880;
    objc_msgSend(v7, "setHTTPBody:", objc_msgSend((id)objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@application_id=%@"), v12, v11), "dataUsingEncoding:", 4));
  }
  return v7;
}

- (id)signedURLRequestWithRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5
{
  id v7;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v7 = a3;
  v49 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(a3, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v10 = v9;
  if (!v9)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = objc_msgSend(v9, "rangeOfString:options:", CFSTR("multipart"), 1) != 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
LABEL_3:
    v7 = -[OAURLRequestSigner applyApplicationID:toRequest:containsMultiPartData:](self, "applyApplicationID:toRequest:containsMultiPartData:", a4, v7, v11);
LABEL_4:
  v12 = -[OAURLRequestSigner oauthNonce](self, "oauthNonce");
  v13 = -[OAURLRequestSigner timestamp:](self, "timestamp:", a5);
  v14 = -[OAURLRequestSigner oauthParametersWithNonce:timeStamp:](self, "oauthParametersWithNonce:timeStamp:", v12, v13);
  v15 = (void *)objc_msgSend(v7, "URL");
  if (objc_msgSend(v15, "user") || objc_msgSend(v15, "password"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v15, 0);
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "setUser:", 0);
      objc_msgSend(v17, "setPassword:", 0);
    }
    v15 = (void *)objc_msgSend(v17, "URL");

  }
  v18 = (void *)objc_msgSend(v7, "mutableCopy");
  v19 = (void *)objc_msgSend(v7, "HTTPMethod");
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("GET")) & 1) != 0
    || objc_msgSend(v19, "isEqualToString:", CFSTR("DELETE")) | v11)
  {
    v20 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "arrayByAddingObjectsFromArray:", objc_msgSend((id)objc_msgSend(v15, "query"), "componentsSeparatedByString:", CFSTR("&"))), "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", CFSTR("&"));
    v21 = (void *)objc_msgSend(v15, "absoluteString");
    if (objc_msgSend(v15, "query"))
    {
      v22 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "rangeOfString:", objc_msgSend(v15, "query"));
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
        v21 = (void *)objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "substringToIndex:", v22 - 1);
    }
    v23 = (__CFString *)objc_msgSend(v7, "HTTPMethod");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&%@&%@"), objc_msgSend(v21, "oauth_urlEncodedString"), objc_msgSend(v20, "oauth_urlEncodedString"));
    goto LABEL_59;
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("POST")) & 1) == 0
    && (objc_msgSend(v19, "isEqualToString:", CFSTR("PUT")) & 1) == 0
    && (objc_msgSend(v19, "isEqualToString:", CFSTR("PROPFIND")) & 1) == 0
    && (objc_msgSend(v19, "isEqualToString:", CFSTR("REPORT")) & 1) == 0
    && (objc_msgSend(v19, "isEqualToString:", CFSTR("OPTIONS")) & 1) == 0
    && !objc_msgSend(v19, "isEqualToString:", CFSTR("PROPPATCH")))
  {
    v40 = 0;
    if (!v18)
      return v18;
    goto LABEL_61;
  }
  v25 = 0x24BDD1000uLL;
  if (v10 && (objc_msgSend(v10, "isEqualToString:", CFSTR("application/x-www-form-urlencoded")) & 1) != 0
    || !objc_msgSend((id)objc_msgSend(v7, "allHTTPHeaderFields"), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "bytes"), objc_msgSend((id)objc_msgSend(v7, "HTTPBody"), "length"), 4);
    if (v26)
    {
      v27 = v26;
      v25 = 0x24BDD1000;
      if (objc_msgSend(v26, "length"))
      {
        v28 = objc_msgSend(v27, "componentsSeparatedByString:", CFSTR("&"));

        if (v28)
          v14 = (id)objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v28);
      }
      else
      {

      }
    }
    else
    {
      v25 = 0x24BDD1000;
    }
  }
  v29 = (void *)objc_msgSend(v15, "query");
  if (objc_msgSend(v29, "length"))
  {
    v30 = (void *)objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("&"));
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v14);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v31)
    {
      v32 = v31;
      v42 = v13;
      v43 = v12;
      v33 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((objc_msgSend(v14, "containsObject:", v35) & 1) == 0)
            objc_msgSend(v14, "addObject:", v35);
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v32);
      v13 = v42;
      v12 = v43;
      v25 = 0x24BDD1000uLL;
    }
  }
  v36 = (void *)objc_msgSend((id)objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_), "componentsJoinedByString:", CFSTR("&"));
  v37 = (void *)objc_msgSend(v15, "absoluteString");
  if (objc_msgSend(v15, "query"))
  {
    v38 = objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "rangeOfString:", objc_msgSend(v15, "query"));
    if (v38 != 0x7FFFFFFFFFFFFFFFLL)
      v37 = (void *)objc_msgSend((id)objc_msgSend(v15, "absoluteString"), "substringToIndex:", v38 - 1);
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("POST")) & 1) != 0)
  {
    v23 = CFSTR("POST&");
LABEL_58:
    v24 = objc_msgSend(*(id *)(v25 + 1992), "stringWithFormat:", CFSTR("%@&%@"), objc_msgSend(v37, "oauth_urlEncodedString"), objc_msgSend(v36, "oauth_urlEncodedString"));
LABEL_59:
    v39 = -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v24);
    goto LABEL_60;
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PUT")) & 1) != 0)
  {
    v23 = CFSTR("PUT&");
    goto LABEL_58;
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("PROPFIND")) & 1) != 0)
  {
    v23 = CFSTR("PROPFIND&");
    goto LABEL_58;
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("REPORT")) & 1) != 0)
  {
    v23 = CFSTR("REPORT&");
    goto LABEL_58;
  }
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("OPTIONS")) & 1) != 0)
  {
    v23 = CFSTR("OPTIONS&");
    goto LABEL_58;
  }
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("PROPPATCH")))
  {
    v23 = CFSTR("PROPPATCH&");
    goto LABEL_58;
  }
  v39 = 0;
LABEL_60:
  v40 = (void *)-[objc_class signatureForText:withKey:](-[OAURLRequestSigner signer](self, "signer"), "signatureForText:withKey:", v39, -[OACredential signingKey](self->_credential, "signingKey"));
  if (v18)
LABEL_61:
    objc_msgSend(v18, "setValue:forHTTPHeaderField:", -[OAURLRequestSigner oauthAuthorizationHeaderWithSignature:nonce:timestamp:](self, "oauthAuthorizationHeaderWithSignature:nonce:timestamp:", objc_msgSend(v40, "oauth_urlEncodedString"), v12, v13), CFSTR("Authorization"));
  return v18;
}

- (id)signedURLRequestWithRequest:(id)a3
{
  return -[OAURLRequestSigner signedURLRequestWithRequest:applicationID:timestamp:](self, "signedURLRequestWithRequest:applicationID:timestamp:", a3, 0, 0);
}

- (int)signatureMethod
{
  return self->_signatureMethod;
}

- (void)setSignatureMethod:(int)a3
{
  self->_signatureMethod = a3;
}

@end
