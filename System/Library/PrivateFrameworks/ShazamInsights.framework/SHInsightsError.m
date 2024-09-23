@implementation SHInsightsError

+ (id)messageForCode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("There was a problem fetching the data");
  if (a3 == 200)
    v3 = CFSTR("The requested data was not found, please amend your query");
  if (a3 == 201)
    return CFSTR("The data was found but it was invalid");
  else
    return (id)v3;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingError:keyOverrides:", a3, a4, MEMORY[0x24BDBD1B8]);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, *MEMORY[0x24BDD1398]);

  objc_msgSend(a1, "messageForCode:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, *MEMORY[0x24BDD0BA0]);

  objc_msgSend(v11, "setValuesForKeysWithDictionary:", v9);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamInsights"), a3, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
