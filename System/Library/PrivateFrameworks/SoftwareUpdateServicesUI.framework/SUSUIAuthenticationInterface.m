@implementation SUSUIAuthenticationInterface

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance___once;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance___instance;
}

void __46__SUSUIAuthenticationInterface_sharedInstance__block_invoke()
{
  SUSUIAuthenticationInterface *v0;
  void *v1;

  v0 = objc_alloc_init(SUSUIAuthenticationInterface);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (SUSUIAuthenticationInterface)init
{
  id v4;
  SUSUIAuthenticationInterface *v5;
  SUSUIAuthenticationInterface *v6;

  v6 = self;
  v4 = (id)objc_msgSend(MEMORY[0x24BEAEC28], "sharedInstance");
  v6 = 0;
  v6 = -[SUSUIAuthenticationInterface initWithKeybag:](self, "initWithKeybag:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (SUSUIAuthenticationInterface)initWithKeybag:(id)a3
{
  SUSUIAuthenticationInterface *v3;
  uint64_t v4;
  NSUserDefaults *defaults;
  char v6;
  SUSUIAuthenticationInterface *v8;
  SUSUIAuthenticationInterface *v9;
  id v10;
  objc_super v11;
  id location[2];
  SUSUIAuthenticationInterface *v13;
  uint8_t v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)SUSUIAuthenticationInterface;
  v9 = -[SUSUIAuthenticationInterface init](&v11, sel_init);
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.softwareupdateservices.security"));
    defaults = v13->_defaults;
    v13->_defaults = (NSUserDefaults *)v4;

    objc_storeStrong((id *)&v13->_keybag, location[0]);
    -[SUKeybagInterface addObserver:](v13->_keybag, "addObserver:", v13);
    v6 = -[SUKeybagInterface isPasscodeLocked](v13->_keybag, "isPasscodeLocked");
    v13->_isPasscodeLocked = v6 & 1;
    v10 = SUSUILogKeybagInterface();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v14, v13->_isPasscodeLocked);
      _os_log_impl(&dword_218F45000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Initialized with passcode locked: %d", v14, 8u);
    }
    objc_storeStrong(&v10, 0);
  }
  v8 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (BOOL)isBlocked
{
  double v2;
  os_log_t oslog;
  unint64_t v5;
  os_log_type_t v6;
  id location;
  double v8;
  SEL v9;
  SUSUIAuthenticationInterface *v10;
  uint8_t v12[16];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  v9 = a2;
  v8 = 0.0;
  -[SUKeybagInterface backOffTime](self->_keybag, "backOffTime");
  v8 = v2;
  location = SUSUILogKeybagInterface();
  v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v13, *(uint64_t *)&v8);
    _os_log_impl(&dword_218F45000, (os_log_t)location, v6, "isBlocked: Backoff time: %f", v13, 0xCu);
  }
  objc_storeStrong(&location, 0);
  if (v8 <= 0.0)
  {
    v5 = -[SUSUIAuthenticationInterface _currentFailedAttemptsCount](v10, "_currentFailedAttemptsCount", v8);
    oslog = (os_log_t)SUSUILogKeybagInterface();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v12, v5);
      _os_log_impl(&dword_218F45000, oslog, OS_LOG_TYPE_DEFAULT, "isBlocked: currentFailedAttemptsCount: %d", v12, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return v5 >= 5;
  }
  else
  {
    return 1;
  }
}

- (BOOL)attemptAuthentication:(id)a3 outBlocked:(BOOL *)a4
{
  char v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *log;
  os_log_type_t type;
  uint8_t v11[7];
  os_log_type_t v12;
  id v13;
  uint8_t v14[15];
  os_log_type_t v15;
  id v16;
  char v17;
  char v18;
  BOOL *v19;
  id location[2];
  SUSUIAuthenticationInterface *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v18 = 0;
  v17 = -[SUSUIAuthenticationInterface isBlocked](v21, "isBlocked");
  if (!v17)
  {
    if (-[SUKeybagInterface authenticate:](v21->_keybag, "authenticate:", location[0]))
    {
      v16 = SUSUILogKeybagInterface();
      v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        log = v16;
        type = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_impl(&dword_218F45000, log, type, "attemptAuthentication: success", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
      v18 = 1;
    }
    else
    {
      v13 = SUSUILogKeybagInterface();
      v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v13;
        v7 = v12;
        __os_log_helper_16_0_0(v11);
        _os_log_impl(&dword_218F45000, v6, v7, "attemptAuthentication: failed", v11, 2u);
      }
      objc_storeStrong(&v13, 0);
      -[SUSUIAuthenticationInterface _incrementFailedAttemptsCount](v21, "_incrementFailedAttemptsCount");
      v17 = -[SUSUIAuthenticationInterface isBlocked](v21, "isBlocked");
    }
  }
  if (v19)
    *v19 = v17 & 1;
  if ((v17 & 1) != 0)
    -[SUKeybagInterface lockDevice](v21->_keybag, "lockDevice");
  v5 = v18;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)resetAttempts
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v4[7];
  os_log_type_t v5;
  id location[2];
  SUSUIAuthenticationInterface *v7;

  v7 = self;
  location[1] = (id)a2;
  if (self->_isController)
  {
    location[0] = SUSUILogKeybagInterface();
    v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      type = v5;
      __os_log_helper_16_0_0(v4);
      _os_log_impl(&dword_218F45000, log, type, "Attempts reset", v4, 2u);
    }
    objc_storeStrong(location, 0);
    -[SUSUIAuthenticationInterface _setNumberOfFailedAuthenticationAttempts:](v7, "_setNumberOfFailedAuthenticationAttempts:", 0);
    -[NSUserDefaults synchronize](v7->_defaults, "synchronize");
  }
}

- (unint64_t)_numberOfFailedAuthenticationAttempts
{
  return -[SUSUIAuthenticationInterface _currentFailedAttemptsCount](self, "_currentFailedAttemptsCount", a2, self);
}

- (void)_setNumberOfFailedAuthenticationAttempts:(unint64_t)a3
{
  NSUserDefaults *defaults;
  id v4;

  defaults = self->_defaults;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:");

  -[NSUserDefaults synchronize](self->_defaults, "synchronize");
}

- (void)_setPasscodeLocked:(BOOL)a3
{
  os_log_t oslog;
  BOOL v4;
  SEL v5;
  SUSUIAuthenticationInterface *v6;
  uint8_t v7[8];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  v5 = a2;
  v4 = a3;
  if (self->_isPasscodeLocked != a3)
  {
    v6->_isPasscodeLocked = v4;
    oslog = (os_log_t)SUSUILogKeybagInterface();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v7, v4);
      _os_log_impl(&dword_218F45000, oslog, OS_LOG_TYPE_DEFAULT, "Passcode locked state did change: %d", v7, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[SUSUIAuthenticationInterface resetAttempts](v6, "resetAttempts");
  }
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUSUIAuthenticationInterface *v11;
  BOOL v12;
  BOOL v13;
  id location[2];
  SUSUIAuthenticationInterface *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __77__SUSUIAuthenticationInterface_keybagInterface_passcodeLockedStateDidChange___block_invoke;
  v10 = &unk_24DA408D8;
  v11 = v15;
  v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __77__SUSUIAuthenticationInterface_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPasscodeLocked:", *(_BYTE *)(a1 + 40) & 1, a1, a1);
}

- (unint64_t)_currentFailedAttemptsCount
{
  id v3;
  unint64_t v4;

  v3 = -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("SUSUIFailedAttemptCountsWhileUnlocked"));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)_incrementFailedAttemptsCount
{
  -[SUSUIAuthenticationInterface _setNumberOfFailedAuthenticationAttempts:](self, "_setNumberOfFailedAuthenticationAttempts:", -[SUSUIAuthenticationInterface _currentFailedAttemptsCount](self, "_currentFailedAttemptsCount") + 1);
}

- (BOOL)isController
{
  return self->_isController;
}

- (void)setIsController:(BOOL)a3
{
  self->_isController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
