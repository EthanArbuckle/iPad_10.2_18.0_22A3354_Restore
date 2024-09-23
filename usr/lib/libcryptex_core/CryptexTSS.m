@implementation CryptexTSS

- (CryptexTSS)initWithFlags:(unint64_t)a3
{
  CryptexTSS *v4;
  CryptexTSS *v5;
  NSString *tssURL;
  os_log_t v7;
  OS_os_log *log;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dq;
  NSError *nserr;
  OS_xpc_object *v13;
  OS_xpc_object *tss_request;
  OS_cryptex_signature *tssp_sign;
  NSDictionary *response;
  NSString *tssUsage;
  NSData *c411_content;
  OS_xpc_object *im4m_array;
  NSString *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CryptexTSS;
  v4 = -[CryptexTSS init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_flags = a3;
    tssURL = v4->_tssURL;
    v4->_tssURL = (NSString *)CFSTR("http://gs.apple.com");

    v7 = os_log_create("com.apple.libcryptex", "tss");
    log = v5->_log;
    v5->_log = (OS_os_log *)v7;

    dispatch_queue_attr_make_initially_inactive(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.security.libcryptex.core.tss", v9);

    dq = v5->_dq;
    v5->_dq = (OS_dispatch_queue *)v10;

    nserr = v5->_nserr;
    v5->_nserr = 0;

    v13 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    tss_request = v5->_tss_request;
    v5->_tss_request = v13;

    tssp_sign = v5->_tssp_sign;
    v5->_tssp_sign = 0;

    response = v5->_response;
    v5->_response = 0;

    tssUsage = v5->_tssUsage;
    v5->_tssUsage = (NSString *)&stru_24CCE3AE0;

    c411_content = v5->_c411_content;
    v5->_c411_content = 0;

    im4m_array = v5->_im4m_array;
    v5->_im4m_array = 0;

    if ((a3 & 1) != 0)
    {
      v20 = v5->_tssURL;
      v5->_tssURL = (NSString *)CFSTR("https://gs.apple.com:443");

    }
  }
  return v5;
}

- (void)tssStampRequest
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  _BYTE v7[40];
  uuid_t out;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, sizeof(out));
  memset(v7, 0, 37);
  uuid_generate_random(out);
  uuid_unparse_lower(out, v7);
  -[CryptexTSS tss_request](self, "tss_request", *(_OWORD *)v7, *(_QWORD *)&v7[16], *(_OWORD *)&v7[24]);
  v3 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_string((xpc_object_t)v3, "@UUID", v7);

  LOBYTE(v3) = -[CryptexTSS flags](self, "flags");
  -[CryptexTSS tss_request](self, "tss_request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 4) != 0)
    v6 = "@Cryptex1,Ticket";
  else
    v6 = "@ApImg4Ticket";
  xpc_dictionary_set_BOOL(v4, v6, 1);

}

- (id)generatePackedSignatures
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char *v8;
  CFErrorRef Error;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  size_t count;
  id v19;
  void *v20;
  NSObject *v21;
  char *v22;
  CFErrorRef v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  int v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CryptexTSS im4m_array](self, "im4m_array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  if (!v5)
  {
    -[CryptexTSS log](self, "log");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CryptexTSS log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      v31 = 67109120;
      v32 = 22;
      LODWORD(v25) = 8;
      v8 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = 67109120;
      v32 = 22;
      LODWORD(v25) = 8;
      v8 = (char *)_os_log_send_and_compose_impl();
    }
    Error = createError("-[CryptexTSS generatePackedSignatures]", "tss.m", 178, "com.apple.security.cryptex.posix", 22, 0, v8);
    free(v8);
    -[CryptexTSS setNserr:](self, "setNserr:", Error, &v31, v25);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v16);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  -[CryptexTSS im4m_array](self, "im4m_array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  count = xpc_array_get_count(v17);
  LOBYTE(count) = count == objc_msgSend(v3, "count");

  if ((count & 1) != 0)
  {
    v19 = v3;
  }
  else
  {
    -[CryptexTSS log](self, "log");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[CryptexTSS log](self, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      v31 = 67109120;
      v32 = 33;
      LODWORD(v25) = 8;
      v22 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v31 = 67109120;
      v32 = 33;
      LODWORD(v25) = 8;
      v22 = (char *)_os_log_send_and_compose_impl();
    }
    v23 = createError("-[CryptexTSS generatePackedSignatures]", "tss.m", 190, "com.apple.security.cryptex.posix", 33, 0, v22);
    free(v22);
    -[CryptexTSS setNserr:](self, "setNserr:", v23, &v31, v25, (_QWORD)v26);

    v19 = 0;
  }

  return v19;
}

- (id)generateDiavloRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char *v17;
  id v18;
  void *v19;
  CFErrorRef Error;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[CryptexTSS generatePackedSignatures](self, "generatePackedSignatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CryptexTSS c411_content](self, "c411_content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("info"));

  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("sign_request"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("signatures"));
  -[CryptexTSS tssUsage](self, "tssUsage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("usage"));

  -[CryptexTSS log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CryptexTSS generateDiavloRequest:].cold.1();

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 2, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (!v12)
  {
    -[CryptexTSS log](self, "log");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CryptexTSS log](self, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      objc_msgSend(v13, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v16;
      v26 = 1024;
      v27 = 22;
      LODWORD(v22) = 18;
      v17 = (char *)_os_log_send_and_compose_impl();

    }
    else
    {
      v18 = MEMORY[0x24BDACB70];
      objc_msgSend(v13, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v19;
      v26 = 1024;
      v27 = 22;
      LODWORD(v22) = 18;
      v17 = (char *)_os_log_send_and_compose_impl();

      v15 = MEMORY[0x24BDACB70];
    }

    Error = createError("-[CryptexTSS generateDiavloRequest:]", "tss.m", 217, "com.apple.security.cryptex.posix", 22, 0, v17);
    free(v17);
    -[CryptexTSS setNserr:](self, "setNserr:", Error, &v24, v22);

  }
  return v12;
}

- (id)tssSerializeRequest
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CryptexTSS tss_request](self, "tss_request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  -[CryptexTSS log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v4;
    _os_log_impl(&dword_211A95000, v5, OS_LOG_TYPE_INFO, "tss request dictionary:\n%@", buf, 0xCu);
  }

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v4;
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (!v7)
    {
      -[CryptexTSS log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CryptexTSS tssSerializeRequest].cold.2((uint64_t)v6, v8, v9);

    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  if ((-[CryptexTSS flags](self, "flags") & 2) != 0)
  {
    -[CryptexTSS generateDiavloRequest:](self, "generateDiavloRequest:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;
  -[CryptexTSS log](self, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CryptexTSS tssSerializeRequest].cold.1();

  v13 = v11;
  return v13;
}

- (id)tssFormatRequest:(id)a3 withHeaders:(id)a4 withURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v10, "appendFormat:", CFSTR("---------REQUEST START---------\n"));
  objc_msgSend(v10, "appendFormat:", CFSTR("URL: %@\n"), v9);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("BODY:\n%@\n"), v16);

  objc_msgSend(v10, "appendFormat:", CFSTR("---------REQUEST END---------\n"));
  v17 = (void *)objc_msgSend(v10, "copy");

  return v17;
}

- (id)tssFormatResponse:(id)a3 withHeaderData:(id)a4 withCode:(int64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x24BDD16A8];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "appendFormat:", CFSTR("---------RESPONSE START---------\n"));
  objc_msgSend(v10, "appendFormat:", CFSTR("HTTP Status Code: %ld\n"), a5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);

  objc_msgSend(v10, "appendFormat:", CFSTR("%@\n"), v11);
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendFormat:", CFSTR("BODY:\n%@\n"), v12);
  objc_msgSend(v10, "appendFormat:", CFSTR("---------RESPONSE END---------\n"));
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

- (id)tssSendRequest
{
  void *v3;
  NSObject *v4;
  char *v5;
  CFErrorRef Error;

  -[CryptexTSS log](self, "log");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CryptexTSS log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    v5 = (char *)_os_log_send_and_compose_impl();

  }
  else
  {
    v5 = (char *)_os_log_send_and_compose_impl();
  }
  Error = createError("-[CryptexTSS tssSendRequest]", "tss.m", 400, "com.apple.security.cryptex", 10, 0, v5);
  free(v5);
  return Error;
}

- (BOOL)isSSOAvailable
{
  return 0;
}

- (void)tssSubmit
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "flags");
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_211A95000, a2, v3, "tss flags = %#llx", v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)activate
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[CryptexTSS dq](self, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v3);

  -[CryptexTSS dq](self, "dq");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__CryptexTSS_activate__block_invoke;
  block[3] = &unk_24CCE3140;
  block[4] = self;
  dispatch_barrier_sync(v4, block);

}

void __22__CryptexTSS_activate__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "log");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_211A95000, v1, OS_LOG_TYPE_DEFAULT, "Drained queue", v2, 2u);
  }

}

- (unint64_t)flags
{
  return self->_flags;
}

- (OS_os_log)log
{
  return self->_log;
}

- (NSError)nserr
{
  return self->_nserr;
}

- (void)setNserr:(id)a3
{
  objc_storeStrong((id *)&self->_nserr, a3);
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (NSString)tssUsage
{
  return self->_tssUsage;
}

- (NSString)tssURL
{
  return self->_tssURL;
}

- (void)setTssURL:(id)a3
{
  objc_storeStrong((id *)&self->_tssURL, a3);
}

- (OS_xpc_object)tss_request
{
  return self->_tss_request;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (OS_cryptex_signature)tssp_sign
{
  return self->_tssp_sign;
}

- (void)setTssp_sign:(id)a3
{
  objc_storeStrong((id *)&self->_tssp_sign, a3);
}

- (OS_xpc_object)im4m_array
{
  return self->_im4m_array;
}

- (void)setIm4m_array:(id)a3
{
  objc_storeStrong((id *)&self->_im4m_array, a3);
}

- (NSData)c411_content
{
  return self->_c411_content;
}

- (void)setC411_content:(id)a3
{
  objc_storeStrong((id *)&self->_c411_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c411_content, 0);
  objc_storeStrong((id *)&self->_im4m_array, 0);
  objc_storeStrong((id *)&self->_tssp_sign, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_tss_request, 0);
  objc_storeStrong((id *)&self->_tssURL, 0);
  objc_storeStrong((id *)&self->_tssUsage, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_nserr, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)generateDiavloRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_3(&dword_211A95000, v0, v1, "tss request=%@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)tssSerializeRequest
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_211A95000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize %@ with error %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
