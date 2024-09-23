@implementation WBSSafariSandboxBroker

- (WBSSafariSandboxBroker)initWithPID:(int)a3 auditToken:(id *)a4
{
  char *v6;
  WBSSafariSandboxBroker *v7;
  __int128 v8;
  void *v9;
  id v10;
  os_log_t v11;
  OS_os_log *log;
  WBSSafariSandboxBroker *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBSSafariSandboxBroker;
  v6 = -[WBSSafariSandboxBroker init](&v15, sel_init);
  v7 = (WBSSafariSandboxBroker *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = a3;
    v8 = *(_OWORD *)a4->var0;
    *(_OWORD *)(v6 + 40) = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)(v6 + 24) = v8;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = os_log_create((const char *)objc_msgSend(v10, "UTF8String"), "Sandbox");
    log = v7->_log;
    v7->_log = (OS_os_log *)v11;

    v13 = v7;
  }

  return v7;
}

- (int)pid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
