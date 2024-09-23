@implementation ICQQuotaInfoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (ICQQuotaInfoRequest)initWithAccount:(id)a3 accountStore:(id)a4 detailed:(BOOL)a5
{
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  ICQQuotaInfoRequest *v21;
  objc_super v23;

  v8 = CFSTR("quotaInfoURL");
  if (a5)
    v8 = CFSTR("storageInfoURL");
  v9 = v8;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Quota"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x24BE04BE0];
  objc_msgSend(v11, "aa_personID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x24BE04BF0];
  objc_msgSend(MEMORY[0x24BE04958], "udid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)ICQQuotaInfoRequest;
  v21 = -[ICQUsageQuotaRequest initWithAccount:accountStore:URLString:](&v23, sel_initWithAccount_accountStore_URLString_, v11, v10, v20);

  return v21;
}

- (id)urlRequest
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQQuotaInfoRequest;
  -[ICQUsageQuotaRequest urlRequest](&v4, sel_urlRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHTTPMethod:", CFSTR("GET"));
  return v2;
}

@end
