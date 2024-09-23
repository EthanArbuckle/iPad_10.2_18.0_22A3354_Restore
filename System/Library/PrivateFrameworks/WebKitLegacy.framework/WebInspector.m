@implementation WebInspector

- (WebInspector)initWithInspectedWebView:(id)a3
{
  WebInspector *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebInspector;
  result = -[WebInspector init](&v5, sel_init);
  if (result)
    result->_inspectedWebView = (WebView *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebInspector;
  -[WebInspector dealloc](&v3, sel_dealloc);
}

- (void)inspectedWebViewClosed
{
  -[WebInspector close:](self, "close:", 0);
  self->_inspectedWebView = 0;
}

- (void)showWindow
{
  WebView *inspectedWebView;
  uint64_t v3;

  inspectedWebView = self->_inspectedWebView;
  if (inspectedWebView)
  {
    -[WebView page](inspectedWebView, "page");
    if (v3)
      WebCore::InspectorController::show(*(WebCore::InspectorController **)(v3 + 80));
  }
}

- (void)showConsole:(id)a3
{
  -[WebInspector showWindow](self, "showWindow", a3);
  -[WebInspectorFrontend showConsole](self->_frontend, "showConsole");
}

- (BOOL)isDebuggingJavaScript
{
  WebInspectorFrontend *frontend;

  frontend = self->_frontend;
  if (frontend)
    LOBYTE(frontend) = -[WebInspectorFrontend isDebuggingEnabled](frontend, "isDebuggingEnabled");
  return (char)frontend;
}

- (void)toggleDebuggingJavaScript:(id)a3
{
  -[WebInspector showWindow](self, "showWindow", a3);
  -[WebInspectorFrontend setDebuggingEnabled:](self->_frontend, "setDebuggingEnabled:", -[WebInspector isDebuggingJavaScript](self, "isDebuggingJavaScript") ^ 1);
}

- (void)startDebuggingJavaScript:(id)a3
{
  WebInspectorFrontend *frontend;

  frontend = self->_frontend;
  if (frontend)
    -[WebInspectorFrontend setDebuggingEnabled:](frontend, "setDebuggingEnabled:", 1);
}

- (void)stopDebuggingJavaScript:(id)a3
{
  WebInspectorFrontend *frontend;

  frontend = self->_frontend;
  if (frontend)
    -[WebInspectorFrontend setDebuggingEnabled:](frontend, "setDebuggingEnabled:", 0);
}

- (BOOL)isProfilingJavaScript
{
  return 0;
}

- (BOOL)isJavaScriptProfilingEnabled
{
  return 0;
}

- (BOOL)isTimelineProfilingEnabled
{
  WebInspectorFrontend *frontend;

  frontend = self->_frontend;
  if (frontend)
    LOBYTE(frontend) = -[WebInspectorFrontend isTimelineProfilingEnabled](frontend, "isTimelineProfilingEnabled");
  return (char)frontend;
}

- (void)setTimelineProfilingEnabled:(BOOL)a3
{
  WebInspectorFrontend *frontend;

  frontend = self->_frontend;
  if (frontend)
    -[WebInspectorFrontend setTimelineProfilingEnabled:](frontend, "setTimelineProfilingEnabled:", a3);
}

- (BOOL)isOpen
{
  return self->_frontend != 0;
}

- (void)close:(id)a3
{
  -[WebInspectorFrontend close](self->_frontend, "close", a3);
}

- (void)attach:(id)a3
{
  -[WebInspectorFrontend attach](self->_frontend, "attach", a3);
}

- (void)detach:(id)a3
{
  -[WebInspectorFrontend detach](self->_frontend, "detach", a3);
}

- (void)evaluateInFrontend:(id)a3 script:(id)a4
{
  WebView *inspectedWebView;
  WebCore::InspectorController *v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  inspectedWebView = self->_inspectedWebView;
  if (inspectedWebView)
  {
    -[WebView page](inspectedWebView, "page", a3);
    if (v9)
    {
      v6 = (WebCore::InspectorController *)*((_QWORD *)v9 + 10);
      MEMORY[0x1D82A3998](&v9, a4);
      WebCore::InspectorController::evaluateForTestInFrontend(v6, (const WTF::String *)&v9);
      v8 = v9;
      v9 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2)
          WTF::StringImpl::destroy(v8, v7);
        else
          *(_DWORD *)v8 -= 2;
      }
    }
  }
}

- (void)setFrontend:(id)a3
{
  self->_frontend = (WebInspectorFrontend *)a3;
}

- (void)releaseFrontend
{

  self->_frontend = 0;
}

@end
