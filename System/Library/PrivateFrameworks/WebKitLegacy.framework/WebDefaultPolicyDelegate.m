@implementation WebDefaultPolicyDelegate

+ (id)sharedPolicyDelegate
{
  id result;

  result = (id)sharedDelegate_0;
  if (!sharedDelegate_0)
  {
    result = objc_alloc_init(WebDefaultPolicyDelegate);
    sharedDelegate_0 = (uint64_t)result;
  }
  return result;
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  BOOL v11;
  char v12;

  if (objc_msgSend((id)objc_msgSend(a5, "URL"), "isFileURL"))
  {
    v12 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend((id)objc_msgSend(a5, "URL"), "path"), &v12))v11 = v12 == 0;
    else
      v11 = 0;
    if (v11 && objc_msgSend(a3, "_canShowMIMEType:", a4))
      objc_msgSend(a7, "use");
    else
      objc_msgSend(a7, "ignore");
  }
  else if (objc_msgSend(a3, "_canShowMIMEType:", a4))
  {
    objc_msgSend(a7, "use");
  }
  else
  {
    objc_msgSend(a7, "ignore");
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  int v11;

  v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", WebActionNavigationTypeKey), "intValue");
  if (+[WebView _canHandleRequest:forMainFrame:](WebView, "_canHandleRequest:forMainFrame:", a5, objc_msgSend(a3, "mainFrame") == (_QWORD)a6)|| v11 == 6)
  {
    objc_msgSend(a7, "use");
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a5, "URL"), "isFileURL");
    objc_msgSend(a7, "ignore");
  }
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
  objc_msgSend(a7, "use", a3, a4, a5, a6);
}

- (BOOL)webView:(id)a3 shouldGoToHistoryItem:(id)a4
{
  return 1;
}

@end
