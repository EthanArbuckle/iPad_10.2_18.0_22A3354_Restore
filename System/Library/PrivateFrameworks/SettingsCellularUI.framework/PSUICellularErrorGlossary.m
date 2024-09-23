@implementation PSUICellularErrorGlossary

+ (id)sharedInstance
{
  if (qword_253E97050 != -1)
    dispatch_once(&qword_253E97050, &__block_literal_global_11);
  return (id)_MergedGlobals_64;
}

void __43__PSUICellularErrorGlossary_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICellularErrorGlossary initPrivate]([PSUICellularErrorGlossary alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_64;
  _MergedGlobals_64 = (uint64_t)v0;

}

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUICellularErrorGlossary;
  return -[PSUICellularErrorGlossary init](&v3, sel_init);
}

- (PSUICellularErrorGlossary)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularErrorGlossary getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICellularErrorGlossary init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (id)messageForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GENERIC_CELLULAR_PLAN_ERROR_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GENERIC_CELLULAR_PLAN_ERROR_MESSAGE"), &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v8);

  objc_msgSend(v3, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE158B0]);

  if ((_DWORD)v8)
  {
    v10 = objc_msgSend(v3, "code");
    if (v10 == 13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_BEING_CONFIGURED_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v17);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("CELLULAR_PLAN_BEING_CONFIGURED_MESSAGE");
      goto LABEL_6;
    }
    if (v10 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INVALID_ACTIVATION_CODE_TITLE"), &stru_24D5028C8, CFSTR("Cellular"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v12);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("INVALID_ACTIVATION_CODE_MESSAGE");
LABEL_6:
      objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24D5028C8, CFSTR("Cellular"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMessage:", v18);

    }
  }

  return v4;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularErrorGlossary"));
}

@end
