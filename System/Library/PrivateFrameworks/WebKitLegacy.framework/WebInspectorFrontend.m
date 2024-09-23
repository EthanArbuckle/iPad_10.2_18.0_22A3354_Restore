@implementation WebInspectorFrontend

- (WebInspectorFrontend)initWithFrontendClient:(NakedPtr<WebInspectorFrontendClient>)a3
{
  WebInspectorFrontend *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebInspectorFrontend;
  result = -[WebInspectorFrontend init](&v5, sel_init);
  if (result)
    result->m_frontendClient.m_ptr = *(WebInspectorFrontendClient **)a3.m_ptr;
  return result;
}

- (void)attach
{
  (*(void (**)(WebInspectorFrontendClient *, uint64_t))(*(_QWORD *)self->m_frontendClient.m_ptr + 368))(self->m_frontendClient.m_ptr, 3);
}

- (void)detach
{
  (*(void (**)(WebInspectorFrontendClient *))(*(_QWORD *)self->m_frontendClient.m_ptr + 376))(self->m_frontendClient.m_ptr);
}

- (void)close
{
  (*(void (**)(WebInspectorFrontendClient *))(*(_QWORD *)self->m_frontendClient.m_ptr + 144))(self->m_frontendClient.m_ptr);
}

- (BOOL)isDebuggingEnabled
{
  return WebCore::InspectorFrontendClientLocal::isDebuggingEnabled((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (void)setDebuggingEnabled:(BOOL)a3
{
  WebCore::InspectorFrontendClientLocal::setDebuggingEnabled((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (BOOL)isProfilingJavaScript
{
  return WebCore::InspectorFrontendClientLocal::isProfilingJavaScript((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (void)startProfilingJavaScript
{
  WebCore::InspectorFrontendClientLocal::startProfilingJavaScript((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (void)stopProfilingJavaScript
{
  WebCore::InspectorFrontendClientLocal::stopProfilingJavaScript((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (BOOL)isTimelineProfilingEnabled
{
  return WebCore::InspectorFrontendClientLocal::isTimelineProfilingEnabled((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (void)setTimelineProfilingEnabled:(BOOL)a3
{
  WebCore::InspectorFrontendClientLocal::setTimelineProfilingEnabled((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (void)showConsole
{
  WebCore::InspectorFrontendClientLocal::showConsole((WebCore::InspectorFrontendClientLocal *)self->m_frontendClient.m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
