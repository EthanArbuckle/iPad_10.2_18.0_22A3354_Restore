@implementation WebCoreAuthenticationClientAsChallengeSender

- (WebCoreAuthenticationClientAsChallengeSender)initWithAuthenticationClient:(AuthenticationClient *)a3
{
  WebCoreAuthenticationClientAsChallengeSender *result;

  result = -[WebCoreAuthenticationClientAsChallengeSender init](self, "init");
  if (result)
    result->m_client = a3;
  return result;
}

- (AuthenticationClient)client
{
  return self->m_client;
}

- (void)detachClient
{
  self->m_client = 0;
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  AuthenticationClient *m_client;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  _BYTE v7[416];
  CFTypeRef v8;
  CFTypeRef cf;

  m_client = self->m_client;
  if (m_client)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v7, (NSURLAuthenticationChallenge *)a3);
    (*((void (**)(AuthenticationClient *, _BYTE *))m_client->var0 + 3))(m_client, v7);
    v5 = cf;
    cf = 0;
    if (v5)
      CFRelease(v5);
    v6 = v8;
    v8 = 0;
    if (v6)
      CFRelease(v6);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v7, v4);
  }
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  AuthenticationClient *m_client;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  _BYTE v7[416];
  CFTypeRef v8;
  CFTypeRef cf;

  m_client = self->m_client;
  if (m_client)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v7, (NSURLAuthenticationChallenge *)a3);
    (*((void (**)(AuthenticationClient *, _BYTE *))m_client->var0 + 4))(m_client, v7);
    v5 = cf;
    cf = 0;
    if (v5)
      CFRelease(v5);
    v6 = v8;
    v8 = 0;
    if (v6)
      CFRelease(v6);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v7, v4);
  }
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  AuthenticationClient *m_client;
  WTF::StringImpl *v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  CFTypeRef cf;
  _BYTE v15[416];
  CFTypeRef v16;
  CFTypeRef v17;

  m_client = self->m_client;
  if (m_client)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v15, (NSURLAuthenticationChallenge *)a4);
    WebCore::Credential::Credential((WebCore::Credential *)&v12, (NSURLCredential *)a3);
    ((void (*)(AuthenticationClient *, _BYTE *, WTF::StringImpl **))*m_client->var0)(m_client, v15, &v12);
    v7 = cf;
    cf = 0;
    if (v7)
      CFRelease(v7);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v6);
      else
        *(_DWORD *)v8 -= 2;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v6);
      else
        *(_DWORD *)v9 -= 2;
    }
    v10 = v17;
    v17 = 0;
    if (v10)
      CFRelease(v10);
    v11 = v16;
    v16 = 0;
    if (v11)
      CFRelease(v11);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v15, v6);
  }
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  AuthenticationClient *m_client;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  _BYTE v7[416];
  CFTypeRef v8;
  CFTypeRef cf;

  m_client = self->m_client;
  if (m_client)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v7, (NSURLAuthenticationChallenge *)a3);
    (*((void (**)(AuthenticationClient *, _BYTE *))m_client->var0 + 1))(m_client, v7);
    v5 = cf;
    cf = 0;
    if (v5)
      CFRelease(v5);
    v6 = v8;
    v8 = 0;
    if (v6)
      CFRelease(v6);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v7, v4);
  }
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  AuthenticationClient *m_client;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  _BYTE v7[416];
  CFTypeRef v8;
  CFTypeRef cf;

  m_client = self->m_client;
  if (m_client)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v7, (NSURLAuthenticationChallenge *)a3);
    (*((void (**)(AuthenticationClient *, _BYTE *))m_client->var0 + 2))(m_client, v7);
    v5 = cf;
    cf = 0;
    if (v5)
      CFRelease(v5);
    v6 = v8;
    v8 = 0;
    if (v6)
      CFRelease(v6);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v7, v4);
  }
}

@end
