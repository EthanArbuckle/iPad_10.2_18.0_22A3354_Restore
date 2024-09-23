@implementation STUIAuthenticationSession

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__STUIAuthenticationSession_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_singleton;
}

void __35__STUIAuthenticationSession_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_singleton;
  shared_singleton = v0;

}

- (STUIAuthenticationSession)init
{
  STUIAuthenticationSession *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIAuthenticationSession;
  v2 = -[STUIAuthenticationSession init](&v5, sel_init);
  v2->_hasAlreadyEnteredPINForSession = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__passcodeSessionHasEnded_, *MEMORY[0x24BEBE010], 0);

  return v2;
}

- (void)_passcodeSessionHasEnded:(id)a3
{
  -[STUIAuthenticationSession setHasAlreadyEnteredPINForSession:](self, "setHasAlreadyEnteredPINForSession:", 0);
}

- (BOOL)hasAlreadyEnteredPINForSession
{
  return self->_hasAlreadyEnteredPINForSession;
}

- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3
{
  self->_hasAlreadyEnteredPINForSession = a3;
}

@end
