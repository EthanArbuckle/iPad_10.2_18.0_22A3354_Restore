@implementation WFWeatherDataServiceRequestSigner

+ (void)signRequest:(id)a3 withDate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "signRequest:withSecret:andDate:", v6, CFSTR("m7K5xE7hT9lf4luzWj6CO9PDWdtkoNQbI3akfwHNu+A="), v5);

}

+ (void)signRequest:(id)a3 withSecret:(id)a4 andDate:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a5;
  objc_msgSend(v9, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "buildAuthHeader:withSecret:andDate:", v7, CFSTR("m7K5xE7hT9lf4luzWj6CO9PDWdtkoNQbI3akfwHNu+A="), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addValue:forHTTPHeaderField:", v8, CFSTR("Authorization"));

  }
}

+ (id)buildAuthHeader:(id)a3 withSecret:(id)a4 andDate:(id)a5
{
  objc_class *v7;
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
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  CCHmacContext ctx;
  _BYTE macOut[32];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDBCE50];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithBase64EncodedString:options:", v9, 0);

  objc_msgSend(CFSTR("GET"), "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);

  objc_msgSend(v13, "setScheme:", 0);
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("//"), &stru_24CCA55E8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v15;
  if (buildAuthHeader_withSecret_andDate__onceToken != -1)
    dispatch_once(&buildAuthHeader_withSecret_andDate__onceToken, &__block_literal_global_17);
  objc_msgSend((id)objc_opt_class(), "roundDate:toMinutes:", v8, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)buildAuthHeader_withSecret_andDate__formatter, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&ctx, 0, sizeof(ctx));
  v20 = objc_retainAutorelease(v11);
  CCHmacInit(&ctx, 2u, (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
  v21 = objc_retainAutorelease(v12);
  CCHmacUpdate(&ctx, (const void *)objc_msgSend(v21, "bytes"), objc_msgSend(v21, "length"));
  v22 = objc_retainAutorelease(v16);
  CCHmacUpdate(&ctx, (const void *)objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"));
  v23 = objc_retainAutorelease(v19);
  CCHmacUpdate(&ctx, (const void *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
  CCHmacFinal(&ctx, macOut);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", macOut, 32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "base64EncodedStringWithOptions:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HHMAC;date=\"%@\";signature=\"%@\"), v18, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __72__WFWeatherDataServiceRequestSigner_buildAuthHeader_withSecret_andDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)buildAuthHeader_withSecret_andDate__formatter;
  buildAuthHeader_withSecret_andDate__formatter = v0;

}

+ (id)roundDate:(id)a3 toMinutes:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 3145852, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCalendar:", v7);
  objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a4 * a4);
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
