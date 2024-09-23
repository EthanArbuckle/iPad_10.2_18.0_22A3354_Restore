@implementation PSGSEIDDetailsController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterEventListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGSEIDDetailsController;
  -[PSGSEIDDetailsController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerEventListener:", self);
  -[PSGSEIDDetailsController setHwState:](self, "setHwState:", objc_msgSend(v3, "getHwSupport"));
  v4.receiver = self;
  v4.super_class = (Class)PSGSEIDDetailsController;
  -[PSGSEIDDetailsController viewDidLoad](&v4, sel_viewDidLoad);

}

- (id)specifiers
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  -[PSGSEIDDetailsController _updateHwStateChange](self, "_updateHwStateChange");
  v3 = -[PSGSEIDDetailsController hwState](self, "hwState");
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (v5)
    return v5;
  if (v3 == 2)
  {
    -[PSGSEIDDetailsController _setupSEIDSpecifier](self, "_setupSEIDSpecifier");
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    return v5;
  }
  _PSGLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22E024000, v7, OS_LOG_TYPE_DEFAULT, "HW not ready yet", v8, 2u);
  }

  return MEMORY[0x24BDBD1A8];
}

- (NSString)SEIDString
{
  NSString *SEIDString;
  void *v4;
  NSString *v5;
  NSString *v6;

  SEIDString = self->_SEIDString;
  if (!SEIDString)
  {
    objc_msgSend(MEMORY[0x24BE6B5C0], "embeddedSecureElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_SEIDString;
    self->_SEIDString = v5;

    SEIDString = self->_SEIDString;
  }
  return SEIDString;
}

- (void)hardwareStateDidChange
{
  NSObject *v3;
  unsigned int v4;
  _QWORD block[5];
  uint8_t buf[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "HW state updated", buf, 2u);
  }

  v4 = -[PSGSEIDDetailsController hwState](self, "hwState");
  -[PSGSEIDDetailsController _updateHwStateChange](self, "_updateHwStateChange");
  if (v4 != 4 && v4 != -[PSGSEIDDetailsController hwState](self, "hwState"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PSGSEIDDetailsController_hardwareStateDidChange__block_invoke;
    block[3] = &unk_24F9C7C88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __50__PSGSEIDDetailsController_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setupSEIDSpecifier");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return result;
}

- (void)_updateHwStateChange
{
  id v3;

  if (-[PSGSEIDDetailsController hwState](self, "hwState") != 4
    && -[PSGSEIDDetailsController hwState](self, "hwState") != 2)
  {
    objc_msgSend(MEMORY[0x24BE6B598], "sharedHardwareManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PSGSEIDDetailsController setHwState:](self, "setHwState:", objc_msgSend(v3, "getHwSupport"));

  }
}

- (BOOL)_setupSEIDSpecifier
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint8_t buf[16];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "count");
  if (v4)
  {
    _PSGLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "Already initialized", buf, 2u);
    }
  }
  else
  {
    -[PSGSEIDDetailsController SEIDString](self, "SEIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[PSGSEIDDetailsController _setupSEIDSpecifier].cold.1();
    v5 = v6;
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, sel_SEIDString_, 0, 4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v8 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
    objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75D70]);
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;

  }
  return v4 == 0;
}

- (void)setSEIDString:(id)a3
{
  objc_storeStrong((id *)&self->_SEIDString, a3);
}

- (unsigned)hwState
{
  return self->_hwState;
}

- (void)setHwState:(unsigned int)a3
{
  self->_hwState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SEIDString, 0);
}

- (void)_setupSEIDSpecifier
{
  NSObject *v0;
  uint8_t v1[16];

  _PSGLoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22E024000, v0, OS_LOG_TYPE_DEFAULT, "We should never hit this since we're supposed to wait until the secure element id is returned.", v1, 2u);
  }

  __assert_rtn("-[PSGSEIDDetailsController _setupSEIDSpecifier]", "PSGAboutController.m", 715, "0");
}

@end
