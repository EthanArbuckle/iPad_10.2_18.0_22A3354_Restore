@implementation AVContentKeyResponse(Private)

+ (id)smu_contentKeyResponseWithFairPlayStreamingKeyResponseData:()Private renewalDate:
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "contentKeyResponseWithFairPlayStreamingKeyResponseData:renewalDate:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
