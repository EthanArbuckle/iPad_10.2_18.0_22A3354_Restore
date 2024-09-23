@implementation SBStateDumpService

- (SBStateDumpService)init
{
  SBStateDumpService *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBStateDumpService;
  v2 = -[SBStateDumpService init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.statedump"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStateDumpDelegate:", v2);

  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 withCompletion:(id)a6
{
  id v9;

  v9 = a6;
  if (-[SBStateDumpService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    if (a5 == 1)
      objc_msgSend((id)SBApp, "_dumpLoggingStateCaptureWithCompletion:", v9);
    else
      (*((void (**)(id, _QWORD, _QWORD, const __CFString *))v9 + 2))(v9, 0, 0, CFSTR("Unrecognized state dump type."));
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 toTextFileAtPath:(id)a6
{
  _BOOL4 v9;
  id v10;

  v10 = a6;
  v9 = -[SBStateDumpService _authenticateClient:](self, "_authenticateClient:", a4);
  if (a5 == 1 && v9)
    objc_msgSend((id)SBApp, "_dumpLoggingStateCaptureToTextFileAtPath:", v10);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 enableRemoteStateDumpWithTimeout:(int64_t)a5 completion:(id)a6
{
  id v9;

  v9 = a6;
  if (-[SBStateDumpService _authenticateClient:](self, "_authenticateClient:", a4))
    objc_msgSend((id)SBApp, "_enableRemoteStateDumpWithTimeout:withCompletion:", a5, v9);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 disableRemoteStateDumpWithCompletion:(id)a5
{
  id v7;

  v7 = a5;
  if (-[SBStateDumpService _authenticateClient:](self, "_authenticateClient:", a4))
    objc_msgSend((id)SBApp, "_disableRemoteStateDumpWithCompletion:", v7);

}

- (BOOL)_authenticateClient:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[FBServiceClientAuthenticator authenticateClient:](self->_clientAuthenticator, "authenticateClient:", v4);
  if ((v5 & 1) == 0)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBStateDumpService _authenticateClient:].cold.1(v4, v6);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

- (void)_authenticateClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[SBStateDumpService] Rejecting request because client '%@' does not have the required entitlement.", (uint8_t *)&v4, 0xCu);

}

@end
