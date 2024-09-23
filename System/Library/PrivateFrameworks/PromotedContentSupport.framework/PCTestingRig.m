@implementation PCTestingRig

+ (void)invokeTestingRigHandlerForMessage:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  PCSupportRequester *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(PCSupportRequester);
  -[PCSupportRequester invokeTestingRigHandlerForMessage:payload:completionHandler:](v10, "invokeTestingRigHandlerForMessage:payload:completionHandler:", v9, v8, v7);

}

@end
