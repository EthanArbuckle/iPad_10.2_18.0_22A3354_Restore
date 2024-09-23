@implementation DataComparisonByBits

+ (id)dataComparisonByBitsWithData1:(id)a3 data2:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  +[WiFiUsagePrivacyFilter toBinString:](WiFiUsagePrivacyFilter, "toBinString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter toBinString:](WiFiUsagePrivacyFilter, "toBinString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString1:string2:reference:", v10, v11, v8);
  return v12;
}

+ (id)dataComparisonByBitsWithData1:(id)a3 string2:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  +[WiFiUsagePrivacyFilter toBinString:](WiFiUsagePrivacyFilter, "toBinString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString1:string2:reference:", v10, v9, v8);

  return v11;
}

@end
