@implementation ICQQuotaAppDetailsRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (ICQQuotaAppDetailsRequest)initWithAccount:(id)a3 accountStore:(id)a4 bundleIDs:(id)a5 quotaInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  ICQQuotaAppDetailsRequest *v14;
  objc_super v16;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a6, "appDetailsURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)ICQQuotaAppDetailsRequest;
  v14 = -[ICQUsageQuotaRequest initWithAccount:accountStore:URLString:](&v16, sel_initWithAccount_accountStore_URLString_, v12, v11, v13);

  if (v14)
    -[ICQQuotaAppDetailsRequest setBundleIDs:](v14, "setBundleIDs:", v10);

  return v14;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICQQuotaAppDetailsRequest;
  -[ICQUsageQuotaRequest urlRequest](&v11, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v3, "addValue:forHTTPHeaderField:", CFSTR("application/vnd.apple.xmlplist"), CFSTR("Content-Type"));
  v4 = (void *)MEMORY[0x24BDBCE70];
  -[ICQQuotaAppDetailsRequest bundleIDs](self, "bundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("bundle_ids"), v6, CFSTR("adam_ids"), v7, CFSTR("collection_ids"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 100, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHTTPBody:", v9);

  return v3;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end
