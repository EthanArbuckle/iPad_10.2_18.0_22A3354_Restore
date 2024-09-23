@implementation WebPluginContainerCheck

- (WebPluginContainerCheck)initWithRequest:(id)a3 target:(id)a4 resultObject:(id)a5 selector:(SEL)a6 controller:(id)a7 contextInfo:(id)a8
{
  WebPluginContainerCheck *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WebPluginContainerCheck;
  v14 = -[WebPluginContainerCheck init](&v16, sel_init);
  if (v14)
  {
    v14->_request = (NSURLRequest *)objc_msgSend(a3, "copy");
    v14->_target = (NSString *)objc_msgSend(a4, "copy");
    v14->_resultObject = a5;
    v14->_resultSelector = a6;
    v14->_contextInfo = a8;
    v14->_controller = (WebPluginContainerCheckController *)a7;
  }
  return v14;
}

+ (id)checkWithRequest:(id)a3 target:(id)a4 resultObject:(id)a5 selector:(SEL)a6 controller:(id)a7 contextInfo:(id)a8
{
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:target:resultObject:selector:controller:contextInfo:", a3, a4, a5, a6, a7, a8));
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebPluginContainerCheck;
  -[WebPluginContainerCheck dealloc](&v2, sel_dealloc);
}

- (void)_continueWithPolicy:(unsigned __int8)a3
{
  objc_msgSend(self->_resultObject, self->_resultSelector, a3 == 0);
  -[WebPluginContainerCheckController _webPluginContainerCancelCheckIfAllowedToLoadRequest:](self->_controller, "_webPluginContainerCancelCheckIfAllowedToLoadRequest:", self);
}

- (BOOL)_isForbiddenFileLoad
{
  WebCore::OriginAccessPatternsForWebProcess *v3;
  StringImpl *v4;
  char canDisplay;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(-[WebPluginContainerCheckController webFrame](self->_controller, "webFrame") + 8)
                                                                                              + 8)
                                                                                  + 296)
                                                                      + 192));
  v3 = (WebCore::OriginAccessPatternsForWebProcess *)MEMORY[0x1D82A38F0](&v8, -[NSURLRequest URL](self->_request, "URL"));
  WebCore::OriginAccessPatternsForWebProcess::singleton(v3);
  canDisplay = WebCore::SecurityOrigin::canDisplay();
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      if ((canDisplay & 1) != 0)
        return canDisplay ^ 1;
      goto LABEL_5;
    }
    *(_DWORD *)v6 -= 2;
  }
  if ((canDisplay & 1) == 0)
LABEL_5:
    -[WebPluginContainerCheck _continueWithPolicy:](self, "_continueWithPolicy:", 2);
  return canDisplay ^ 1;
}

- (id)_actionInformationWithURL:(id)a3
{
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = WebActionNavigationTypeKey;
  v4[1] = WebActionModifierFlagsKey;
  v5[0] = &unk_1E9D958D8;
  v5[1] = &unk_1E9D958F0;
  v4[2] = WebActionOriginalURLKey;
  v5[2] = a3;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (void)_askPolicyDelegate
{
  void *v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSURLRequest *request;

  v3 = (void *)-[WebPluginContainerCheckController webView](self->_controller, "webView");
  v4 = -[NSString length](self->_target, "length");
  v5 = (void *)-[WebPluginContainerCheckController webFrame](self->_controller, "webFrame");
  v6 = (uint64_t)v5;
  if (v4)
    v6 = objc_msgSend(v5, "findFrameNamed:", self->_target);
  v7 = -[WebPluginContainerCheck _actionInformationWithURL:](self, "_actionInformationWithURL:", -[NSURLRequest URL](self->_request, "URL"));
  self->_listener = (WebPolicyDecisionListener *)-[WebPolicyDecisionListener _initWithTarget:action:]([WebPolicyDecisionListener alloc], "_initWithTarget:action:", self, sel__continueWithPolicy_);
  v8 = (void *)objc_msgSend(v3, "_policyDelegateForwarder");
  request = self->_request;
  if (v6)
    objc_msgSend(v8, "webView:decidePolicyForNavigationAction:request:frame:decisionListener:", v3, v7, request, v6, self->_listener);
  else
    objc_msgSend(v8, "webView:decidePolicyForNewWindowAction:request:newFrameName:decisionListener:", v3, v7, request, self->_target, self->_listener);
}

- (void)start
{
  if (!-[WebPluginContainerCheck _isForbiddenFileLoad](self, "_isForbiddenFileLoad"))
    -[WebPluginContainerCheck _askPolicyDelegate](self, "_askPolicyDelegate");
}

- (void)cancel
{
  id v3;

  if (!self->_done)
  {

    self->_request = 0;
    self->_target = 0;
    -[WebPolicyDecisionListener _invalidate](self->_listener, "_invalidate");

    self->_listener = 0;
    v3 = self->_resultObject;
    self->_controller = 0;
    self->_resultObject = 0;

    self->_contextInfo = 0;
    self->_done = 1;
  }
}

- (id)contextInfo
{
  return self->_contextInfo;
}

@end
