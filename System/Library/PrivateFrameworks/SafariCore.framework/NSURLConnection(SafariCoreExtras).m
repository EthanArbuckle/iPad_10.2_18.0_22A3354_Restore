@implementation NSURLConnection(SafariCoreExtras)

+ (WBSAsynchronousRequestHelper)safari_sendAsynchronousRequest:()SafariCoreExtras queue:completionHandler:
{
  id v7;
  id v8;
  id v9;
  WBSAsynchronousRequestHelper *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WBSAsynchronousRequestHelper initWithRequest:queue:completionHandler:]([WBSAsynchronousRequestHelper alloc], "initWithRequest:queue:completionHandler:", v9, v8, v7);

  -[WBSAsynchronousRequestHelper sendRequest](v10, "sendRequest");
  return v10;
}

@end
