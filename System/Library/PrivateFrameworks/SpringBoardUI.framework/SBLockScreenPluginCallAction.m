@implementation SBLockScreenPluginCallAction

- (SBLockScreenPluginCallAction)initWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  SBLockScreenPluginCallAction *v7;
  SBLockScreenPluginCallAction *v8;
  SBLockScreenPluginCallAction *v9;
  objc_super v11;

  v4 = (objc_class *)MEMORY[0x24BEB49D0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  if (objc_msgSend(v6, "isValid"))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBLockScreenPluginCallAction;
    v7 = -[SBLockScreenPluginAction init](&v11, sel_init);
    v8 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_dialRequest, v6);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSURL)url
{
  return (NSURL *)-[TUDialRequest URL](self->_dialRequest, "URL");
}

- (BOOL)isCallAction
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialRequest, 0);
}

@end
