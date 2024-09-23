@implementation SSURLConnectionRequest(RadioAdditions)

+ (RadioURLConnectionRequest)newRadioRequestWithRequestContext:()RadioAdditions requestProperties:storeBag:
{
  id v7;
  id v8;
  id v9;
  id v10;
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
  RadioURLConnectionRequest *v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v8;
  else
    v10 = (id)objc_msgSend(v8, "mutableCopy");
  v11 = v10;
  v12 = (void *)MGCopyAnswer();
  objc_msgSend(CFSTR("2/"), "stringByAppendingString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-Radio-Client-Version"));
  if (newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatterOnceToken != -1)
    dispatch_once(&newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatterOnceToken, &__block_literal_global_661);
  v14 = (void *)newRadioRequestWithRequestContext_requestProperties_storeBag__sDateFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Apple-I-Client-Time"));
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%li"), objc_msgSend(v18, "secondsFromGMT"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v19, CFSTR("X-Apple-Tz"));
  objc_msgSend(v11, "setShouldDecodeResponse:", 0);
  objc_msgSend(v11, "setMachineDataStyle:", 2);
  objc_msgSend(v11, "HTTPBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    MSVGzipCompressData();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(v11, "setHTTPBody:", v21);
      objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Content-Encoding"));
    }

  }
  v22 = -[SSURLConnectionRequest initWithRequestProperties:]([RadioURLConnectionRequest alloc], "initWithRequestProperties:", v11);
  objc_msgSend(v9, "URLBagDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSURLConnectionRequest configureWithURLBagDictionary:](v22, "configureWithURLBagDictionary:", v23);
  -[SSURLConnectionRequest setShouldMescalSign:](v22, "setShouldMescalSign:", 1);
  if (objc_msgSend(v7, "usesLocalNetworking"))
  {
    -[SSURLConnectionRequest setRunsInProcess:](v22, "setRunsInProcess:", 1);
    objc_msgSend(v7, "SAPSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSURLConnectionRequest setSAPSession:](v22, "setSAPSession:", v24);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2068]), "initWithPolicyType:", 1);
    -[SSURLConnectionRequest setSAPSignaturePolicy:](v22, "setSAPSignaturePolicy:", v25);

  }
  return v22;
}

@end
