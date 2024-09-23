@implementation YahooDoppelganger

+ (void)hookIntoYQLRequestIfNeeded
{
  objc_class *v2;
  objc_method *InstanceMethod;

  if ((hookIntoYQLRequestIfNeeded_swizzled & 1) == 0)
  {
    v2 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v2, sel_taskForRequest_delegate_);
    method_setImplementation(InstanceMethod, (IMP)-[objc_class instanceMethodForSelector:](v2, "instanceMethodForSelector:", sel__yahooDoppelganger_taskForRequest_delegate_));
    hookIntoYQLRequestIfNeeded_swizzled = 1;
  }
}

+ (void)setTestHarness:(id)a3
{
  objc_storeStrong((id *)&testHarness, a3);
}

+ (id)newDoppelgangerMatchingRequestPattern:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (!preppedDoppelgangers)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)preppedDoppelgangers;
    preppedDoppelgangers = (uint64_t)v4;

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setExpectedRequestPattern:", v3);
  objc_msgSend((id)preppedDoppelgangers, "addObject:", v6);

  return v6;
}

+ (id)prepDoppelgangerWithRequestPattern:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "hookIntoYQLRequestIfNeeded");
  v8 = (void *)objc_msgSend(a1, "newDoppelgangerMatchingRequestPattern:", v7);

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setResponse:", v9);
  return v8;
}

+ (id)prepDoppelgangerForQuotesResponseWithSymbols:(id)a3 includeMetdata:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v29 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  srandom(4u);
  objc_msgSend(a1, "hookIntoYQLRequestIfNeeded");
  v26 = (void *)objc_msgSend(a1, "newDoppelgangerMatchingRequestPattern:", CFSTR(".*getquotes.*"));
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getquotes\" timestamp=\"0\">"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<list count=\"%lu\" total=\"%lu\">"), objc_msgSend(v5, "count"), objc_msgSend(v5, "count"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v41;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v31 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v7);
        objc_msgSend(v6, "appendString:", CFSTR("<quote>"));
        objc_msgSend(v6, "appendFormat:", CFSTR("<symbol>%@</symbol>"), v8);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v9 = objc_msgSend(&unk_24D760A30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v37 != v11)
                objc_enumerationMutation(&unk_24D760A30);
              v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("<%@>%@</%@>"), v13, v14, v13);

            }
            v10 = objc_msgSend(&unk_24D760A30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v10);
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("<marketcap>%@</marketcap>"), v15);

        objc_msgSend(v6, "appendString:", CFSTR("<status>1</status>"));
        if (v29)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v16 = objc_msgSend(&unk_24D760A48, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(&unk_24D760A48);
                v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "appendFormat:", CFSTR("<%@>%@</%@>"), v20, v21, v20);

              }
              v17 = objc_msgSend(&unk_24D760A48, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            }
            while (v17);
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("<yearrange>%@ - %@</yearrange>"), v22, v23);

        }
        objc_msgSend(v6, "appendString:", CFSTR("</quote>"));
        v7 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v30);
  }

  objc_msgSend(v6, "appendString:", CFSTR("</list></result></response>"));
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setResponse:", v24);

  return v26;
}

+ (id)prepDoppelgangerForNewsResponseWithSymbol:(id)a3 numberOfNewsItems:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v6 = a3;
  srandom(4u);
  objc_msgSend(a1, "hookIntoYQLRequestIfNeeded");
  v7 = (void *)objc_msgSend(a1, "newDoppelgangerMatchingRequestPattern:", CFSTR(".*getnews.*"));
  v8 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
  if (!prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response)
  {
    v19 = v7;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getnews\" timestamp=\"0\"><list count=\"1\" total=\"1\">"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
    prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response = v9;

    objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendFormat:", CFSTR("<feed><symbol>%@</symbol><timestamp>0</timestamp><expires></expires><list count=\"%lu\">"), v6, a4);
    if (a4 >= 1)
    {
      do
      {
        objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendString:", CFSTR("<item>"));
        v11 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        randomStringOfLength(20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appendFormat:", CFSTR("<id>%@</id>"), v12);

        objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendString:", CFSTR("<timestamp>0</timestamp>"));
        objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendString:", CFSTR("<link>http://apple.com</link>"));
        v13 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        randomStringOfLength(40, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("<title>%@</title>"), v14);

        v15 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
        randomStringOfLength(200, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR("<summary>%@</summary>"), v16);

        objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendString:", CFSTR("</item>"));
        --a4;
      }
      while (a4);
    }
    objc_msgSend((id)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response, "appendString:", CFSTR("</list></feed></list></result></response>"));
    v8 = (void *)prepDoppelgangerForNewsResponseWithSymbol_numberOfNewsItems__response;
    v7 = v19;
  }
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResponse:", v17);

  return v7;
}

+ (id)prepDoppelgangerForChartResponseWithSymbol:(id)a3 numberOfDataPoints:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  int64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  srandom(4u);
  objc_msgSend(a1, "hookIntoYQLRequestIfNeeded");
  v7 = (void *)objc_msgSend(a1, "newDoppelgangerMatchingRequestPattern:", CFSTR(".*getchart.*"));
  v8 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
  if (!prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response)
  {
    v21 = v7;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><result type=\"getchart\" timestamp=\"0\">"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
    prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response = v9;

    objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendFormat:", CFSTR("<list count=\"%li\" total=\"%li\">"), a4, a4);
    v22 = v6;
    objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendFormat:", CFSTR("<meta><symbol>%@</symbol><marketopen>0</marketopen><marketclose>0</marketclose><gmtoffset>0</gmtoffset></meta>"), v6);
    if (a4 >= 1)
    {
      v11 = 0;
      v23 = a4;
      do
      {
        v24 = v11;
        objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendString:", CFSTR("<point"));
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = objc_msgSend(&unk_24D760A60, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(&unk_24D760A60);
              v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              v17 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), (float)((float)((float)random() / 214750000.0) + 0.0));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "appendFormat:", CFSTR(" %@=\"%@\"), v16, v18);

            }
            v13 = objc_msgSend(&unk_24D760A60, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v13);
        }
        objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendFormat:", CFSTR(" timestamp=\"%li\"></point>"), 86400 * v24);
        v11 = v24 + 1;
      }
      while (v24 + 1 != v23);
    }
    objc_msgSend((id)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response, "appendString:", CFSTR("</list></result></response>"));
    v8 = (void *)prepDoppelgangerForChartResponseWithSymbol_numberOfDataPoints__response;
    v7 = v21;
    v6 = v22;
  }
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResponse:", v19);

  return v7;
}

+ (void)_doppelgangerFinished:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = v3;
  if (!finishedDoppelgangers)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)finishedDoppelgangers;
    finishedDoppelgangers = (uint64_t)v4;

    v3 = v6;
  }
  objc_msgSend((id)activeDoppelgangers, "removeObject:", v3);
  objc_msgSend((id)finishedDoppelgangers, "addObject:", v6);

}

+ (void)_spewDoppelgangerArray:(id)a3 named:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "  %@", buf, 0xCu);
    }
    v18 = v6;
    v19 = v5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      v11 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v13;
            _os_log_impl(&dword_21736B000, v11, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
          objc_msgSend(v13, "response", v18, v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v13, "response");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v15, "initWithData:encoding:", v16, 4);
            *(_DWORD *)buf = 138412290;
            v26 = v17;
            _os_log_impl(&dword_21736B000, v11, OS_LOG_TYPE_DEFAULT, "      Response: %@", buf, 0xCu);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v6 = v18;
    v5 = v19;
  }

}

+ (void)spewDoppelgangerData
{
  uint8_t v3[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "** Beginning YahooDoppelganger dump **", buf, 2u);
  }
  objc_msgSend(a1, "_spewDoppelgangerArray:named:", preppedDoppelgangers, CFSTR("Doppelgangers that have not received a request"));
  objc_msgSend(a1, "_spewDoppelgangerArray:named:", activeDoppelgangers, CFSTR("Doppelgangers actively sending data"));
  objc_msgSend(a1, "_spewDoppelgangerArray:named:", finishedDoppelgangers, CFSTR("Doppelgangers finished sending data"));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "** YahooDoppelganger dump complete **", v3, 2u);
  }
}

+ (void)clearDoppelgangerData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)preppedDoppelgangers;
  preppedDoppelgangers = 0;

  v3 = (void *)activeDoppelgangers;
  activeDoppelgangers = 0;

  v4 = (void *)finishedDoppelgangers;
  finishedDoppelgangers = 0;

}

- (BOOL)matchesRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self matches %@"), self->_expectedRequestPattern);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "evaluateWithObject:", v5);

  return (char)v4;
}

- (YahooDoppelganger)init
{
  YahooDoppelganger *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)YahooDoppelganger;
  result = -[YahooDoppelganger init](&v3, sel_init);
  if (result)
    result->_responseChunkSize = -1;
  return result;
}

- (void)setResponseChunkSize:(unint64_t)a3
{
  self->_responseChunkSize = a3;
}

+ (BOOL)waitForAllDoppelgangersUpToTimeout:(double)a3
{
  float v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = 0.0;
  do
  {
    v5 = objc_msgSend((id)activeDoppelgangers, "count");
    if (!v5)
      break;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.100000001);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runUntilDate:", v7);

    v4 = v4 + 0.1;
  }
  while (v4 < a3);
  return v5 == 0;
}

- (void)_relayDataChunk
{
  unint64_t responseChunkSize;
  NSUInteger v4;
  unint64_t responseOffset;
  unint64_t v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  unint64_t v11;
  id v12;
  char v13;
  id v14;
  dispatch_time_t v15;
  _QWORD block[5];

  if (!self->_cancelled)
  {
    responseChunkSize = self->_responseChunkSize;
    v4 = -[NSData length](self->_response, "length");
    responseOffset = self->_responseOffset;
    if (responseChunkSize >= v4 - responseOffset)
      v6 = v4 - responseOffset;
    else
      v6 = responseChunkSize;
    -[NSData subdataWithRange:](self->_response, "subdataWithRange:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "URLSession:dataTask:didReceiveData:", self->_session, self->_dataTask, v7);

    }
    v11 = self->_responseOffset + v6;
    self->_responseOffset = v11;
    if (v11 == -[NSData length](self->_response, "length"))
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v14 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v14, "URLSession:task:didCompleteWithError:", self->_session, self->_dataTask, 0);

      }
      objc_msgSend((id)objc_opt_class(), "_doppelgangerFinished:", self);
    }
    else
    {
      v15 = dispatch_time(0, 1000000 * self->_responseChunkDelay);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__YahooDoppelganger__relayDataChunk__block_invoke;
      block[3] = &unk_24D74B7C0;
      block[4] = self;
      dispatch_after(v15, MEMORY[0x24BDAC9B8], block);
    }

  }
}

uint64_t __36__YahooDoppelganger__relayDataChunk__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_relayDataChunk");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<YahooDoppelganger at %p for pattern: %@>"), self, self->_expectedRequestPattern);
}

- (void)start
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000 * self->_responseChunkInitialDelay);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__YahooDoppelganger_start__block_invoke;
  block[3] = &unk_24D74B7C0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __26__YahooDoppelganger_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_relayDataChunk");
}

- (void)cancel
{
  self->_cancelled = 1;
}

+ (BOOL)canHandleRequest:(id)a3
{
  return 1;
}

- (NSString)expectedRequestPattern
{
  return self->_expectedRequestPattern;
}

- (void)setExpectedRequestPattern:(id)a3
{
  objc_storeStrong((id *)&self->_expectedRequestPattern, a3);
}

- (NSData)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (unint64_t)responseChunkSize
{
  return self->_responseChunkSize;
}

- (unint64_t)responseChunkDelay
{
  return self->_responseChunkDelay;
}

- (void)setResponseChunkDelay:(unint64_t)a3
{
  self->_responseChunkDelay = a3;
}

- (unint64_t)responseChunkInitialDelay
{
  return self->_responseChunkInitialDelay;
}

- (void)setResponseChunkInitialDelay:(unint64_t)a3
{
  self->_responseChunkInitialDelay = a3;
}

- (NSURLSessionDataDelegate)delegate
{
  return (NSURLSessionDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_expectedRequestPattern, 0);
}

@end
