@implementation UIWebViewWebViewDelegate

- (UIWebViewWebViewDelegate)initWithUIWebView:(id)a3
{
  UIWebViewWebViewDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebViewWebViewDelegate;
  result = -[UIWebViewWebViewDelegate init](&v5, sel_init);
  if (result)
    result->uiWebView = (UIWebView *)a3;
  return result;
}

- (id)webView:(id)a3 createWebViewWithRequest:(id)a4
{
  return (id)objc_msgSend(-[UIWebView _browserView](self->uiWebView, "_browserView", a3, a4), "webView");
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
  -[UIWebView webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:](self->uiWebView, "webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:", a3, a4, a5, a6, a7);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  -[UIWebView webView:decidePolicyForNavigationAction:request:frame:decisionListener:](self->uiWebView, "webView:decidePolicyForNavigationAction:request:frame:decisionListener:", a3, a4, a5, a6, a7);
}

- (void)webView:(id)a3 unableToImplementPolicyWithError:(id)a4 frame:(id)a5
{
  -[UIWebView webView:unableToImplementPolicyWithError:frame:](self->uiWebView, "webView:unableToImplementPolicyWithError:frame:", a3, a4, a5);
}

- (void)webView:(id)a3 frame:(id)a4 exceededDatabaseQuotaForSecurityOrigin:(id)a5 database:(id)a6
{
  -[UIWebView webView:frame:exceededDatabaseQuotaForSecurityOrigin:database:](self->uiWebView, "webView:frame:exceededDatabaseQuotaForSecurityOrigin:database:", a3, a4, a5, a6);
}

- (void)webView:(id)a3 exceededApplicationCacheOriginQuotaForSecurityOrigin:(id)a4 totalSpaceNeeded:(unint64_t)a5
{
  -[UIWebView webView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:](self->uiWebView, "webView:exceededApplicationCacheOriginQuotaForSecurityOrigin:totalSpaceNeeded:", a3, a4, a5);
}

- (void)webView:(id)a3 printFrameView:(id)a4
{
  -[UIWebView webView:printFrameView:](self->uiWebView, "webView:printFrameView:", a3, a4);
}

- (void)webView:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  -[UIWebView webView:didStartProvisionalLoadForFrame:](self->uiWebView, "webView:didStartProvisionalLoadForFrame:", a3, a4);
}

- (void)webView:(id)a3 didCommitLoadForFrame:(id)a4
{
  -[UIWebView webView:didCommitLoadForFrame:](self->uiWebView, "webView:didCommitLoadForFrame:", a3, a4);
}

- (void)webView:(id)a3 didReceiveTitle:(id)a4 forFrame:(id)a5
{
  -[UIWebView webView:didReceiveTitle:forFrame:](self->uiWebView, "webView:didReceiveTitle:forFrame:", a3, a4, a5);
}

- (void)webViewSupportedOrientationsUpdated:(id)a3
{
  -[UIWebView webViewSupportedOrientationsUpdated:](self->uiWebView, "webViewSupportedOrientationsUpdated:", a3);
}

- (id)webView:(id)a3 connectionPropertiesForResource:(id)a4 dataSource:(id)a5
{
  return -[UIWebView webView:connectionPropertiesForResource:dataSource:](self->uiWebView, "webView:connectionPropertiesForResource:dataSource:", a3, a4, a5);
}

- (id)webThreadWebView:(id)a3 resource:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6 fromDataSource:(id)a7
{
  return -[UIWebView webThreadWebView:resource:willSendRequest:redirectResponse:fromDataSource:](self->uiWebView, "webThreadWebView:resource:willSendRequest:redirectResponse:fromDataSource:", a3, a4, a5, a6, a7);
}

- (void)webView:(id)a3 didClearWindowObject:(id)a4 forFrame:(id)a5
{
  -[UIWebView webView:didClearWindowObject:forFrame:](self->uiWebView, "webView:didClearWindowObject:forFrame:", a3, a4, a5);
}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalLoadForFrame:(id)a4
{
  -[UIWebView webView:didReceiveServerRedirectForProvisionalLoadForFrame:](self->uiWebView, "webView:didReceiveServerRedirectForProvisionalLoadForFrame:", a3, a4);
}

- (void)webView:(id)a3 didFailProvisionalLoadWithError:(id)a4 forFrame:(id)a5
{
  -[UIWebView webView:didFailProvisionalLoadWithError:forFrame:](self->uiWebView, "webView:didFailProvisionalLoadWithError:forFrame:", a3, a4, a5);
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  -[UIWebView webView:decidePolicyForMIMEType:request:frame:decisionListener:](self->uiWebView, "webView:decidePolicyForMIMEType:request:frame:decisionListener:", a3, a4, a5, a6, a7);
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  -[UIWebView webView:didFinishLoadForFrame:](self->uiWebView, "webView:didFinishLoadForFrame:", a3, a4);
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4 forFrame:(id)a5
{
  -[UIWebView webView:didFailLoadWithError:forFrame:](self->uiWebView, "webView:didFailLoadWithError:forFrame:", a3, a4, a5);
}

- (void)webView:(id)a3 didFirstLayoutInFrame:(id)a4
{
  -[UIWebView webView:didFirstLayoutInFrame:](self->uiWebView, "webView:didFirstLayoutInFrame:", a3, a4);
}

- (void)webViewClose:(id)a3
{
  -[UIWebView webViewClose:](self->uiWebView, "webViewClose:", a3);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  -[UIWebView webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:](self->uiWebView, "webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:", a3, a4, a5);
}

- (BOOL)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5
{
  return -[UIWebView webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:](self->uiWebView, "webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:", a3, a4, a5);
}

- (id)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6
{
  return -[UIWebView webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:](self->uiWebView, "webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:", a3, a4, a5, a6);
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  -[UIWebView webView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:](self->uiWebView, "webView:decidePolicyForGeolocationRequestFromOrigin:frame:listener:", a3, a4, a5, a6);
}

- (id)webView:(id)a3 identifierForInitialRequest:(id)a4 fromDataSource:(id)a5
{
  return -[UIWebView webView:identifierForInitialRequest:fromDataSource:](self->uiWebView, "webView:identifierForInitialRequest:fromDataSource:", a3, a4, a5);
}

- (void)webView:(id)a3 resource:(id)a4 didFinishLoadingFromDataSource:(id)a5
{
  -[UIWebView webView:resource:didFinishLoadingFromDataSource:](self->uiWebView, "webView:resource:didFinishLoadingFromDataSource:", a3, a4, a5);
}

- (void)webView:(id)a3 resource:(id)a4 didFailLoadingWithError:(id)a5 fromDataSource:(id)a6
{
  -[UIWebView webView:resource:didFailLoadingWithError:fromDataSource:](self->uiWebView, "webView:resource:didFailLoadingWithError:fromDataSource:", a3, a4, a5, a6);
}

- (void)webView:(id)a3 resource:(id)a4 didReceiveAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  -[UIWebView webView:resource:didReceiveAuthenticationChallenge:fromDataSource:](self->uiWebView, "webView:resource:didReceiveAuthenticationChallenge:fromDataSource:", a3, a4, a5, a6);
}

- (void)webView:(id)a3 resource:(id)a4 didCancelAuthenticationChallenge:(id)a5 fromDataSource:(id)a6
{
  -[UIWebView webView:resource:didCancelAuthenticationChallenge:fromDataSource:](self->uiWebView, "webView:resource:didCancelAuthenticationChallenge:fromDataSource:", a3, a4, a5, a6);
}

- (BOOL)webView:(id)a3 resource:(id)a4 canAuthenticateAgainstProtectionSpace:(id)a5 forDataSource:(id)a6
{
  return -[UIWebView webView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:](self->uiWebView, "webView:resource:canAuthenticateAgainstProtectionSpace:forDataSource:", a3, a4, a5, a6);
}

- (void)webView:(id)a3 didChangeLocationWithinPageForFrame:(id)a4
{
  -[UIWebView webView:didChangeLocationWithinPageForFrame:](self->uiWebView, "webView:didChangeLocationWithinPageForFrame:", a3, a4);
}

- (void)_clearUIWebView
{
  self->uiWebView = 0;
}

@end
