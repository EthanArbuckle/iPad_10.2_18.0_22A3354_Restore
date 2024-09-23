@implementation WKUserContentController

- (void)be_addScriptMessageHandler:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  _BEWKUserContentControllerScriptMessageHandlerProxy *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_BEWKUserContentControllerScriptMessageHandlerProxy initWithHandler:]([_BEWKUserContentControllerScriptMessageHandlerProxy alloc], "initWithHandler:", v7);

  -[WKUserContentController addScriptMessageHandler:name:](self, "addScriptMessageHandler:name:", v8, v6);
}

@end
