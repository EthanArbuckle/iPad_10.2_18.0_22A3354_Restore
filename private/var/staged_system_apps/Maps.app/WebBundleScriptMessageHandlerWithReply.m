@implementation WebBundleScriptMessageHandlerWithReply

- (WebBundleScriptMessageHandlerWithReply)initWithDelegate:(id)a3
{
  id v4;
  WebBundleScriptMessageHandlerWithReply *v5;
  WebBundleScriptMessageHandlerWithReply *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WebBundleScriptMessageHandlerWithReply;
  v5 = -[WebBundleScriptMessageHandlerWithReply init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *WeakRetained;
  id v15;
  int v16;
  uint64_t v17;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "body"));
  v11 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject didReceiveMessageFromUserContentController:message:replyHandler:](WeakRetained, "didReceiveMessageFromUserContentController:message:replyHandler:", v8, v13, v9);
  }
  else
  {
    v15 = sub_10043292C();
    WeakRetained = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Incorrect message from web module: %@", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
