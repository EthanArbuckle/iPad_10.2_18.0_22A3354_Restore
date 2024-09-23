@implementation SSDownloadAuthenticationChallengeSender

- (SSDownloadAuthenticationChallengeSender)initWithAuthenticationSession:(id)a3
{
  SSDownloadAuthenticationChallengeSender *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadAuthenticationChallengeSender;
  v4 = -[SSDownloadAuthenticationChallengeSender init](&v6, sel_init);
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDownloadAuthenticationChallengeSender", 0);
    v4->_session = (SSDownloadAuthenticationSession *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_dispatchQueue);

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAuthenticationChallengeSender;
  -[SSDownloadAuthenticationChallengeSender dealloc](&v3, sel_dealloc);
}

- (SSDownloadAuthenticationSession)authenticationSession
{
  NSObject *dispatchQueue;
  SSDownloadAuthenticationSession *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SSDownloadAuthenticationChallengeSender_authenticationSession__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadAuthenticationSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __64__SSDownloadAuthenticationChallengeSender_authenticationSession__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  -[SSDownloadAuthenticationSession _finishWithType:credential:](-[SSDownloadAuthenticationChallengeSender authenticationSession](self, "authenticationSession", a3), "_finishWithType:credential:", 1000, 0);
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  -[SSDownloadAuthenticationSession _finishWithType:credential:](-[SSDownloadAuthenticationChallengeSender authenticationSession](self, "authenticationSession", a3), "_finishWithType:credential:", 1001, 0);
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  -[SSDownloadAuthenticationSession _finishWithType:credential:](-[SSDownloadAuthenticationChallengeSender authenticationSession](self, "authenticationSession", a3), "_finishWithType:credential:", 1003, 0);
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  -[SSDownloadAuthenticationSession _finishWithType:credential:](-[SSDownloadAuthenticationChallengeSender authenticationSession](self, "authenticationSession", a3), "_finishWithType:credential:", 1004, 0);
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  -[SSDownloadAuthenticationSession _finishWithType:credential:](-[SSDownloadAuthenticationChallengeSender authenticationSession](self, "authenticationSession", a3, a4), "_finishWithType:credential:", 1002, a3);
}

@end
