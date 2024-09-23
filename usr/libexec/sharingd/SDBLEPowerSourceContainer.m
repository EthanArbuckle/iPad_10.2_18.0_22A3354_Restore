@implementation SDBLEPowerSourceContainer

- (SDBLEPowerSourceContainer)initWithPowerSource:(id)a3
{
  id v5;
  SDBLEPowerSourceContainer *v6;
  SDBLEPowerSourceContainer *v7;
  CUCoalescer *v8;
  CUCoalescer *powerSourceIdleCoalescer;
  int *p_var0;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  void *v17;
  int v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SDBLEPowerSourceContainer;
  v6 = -[SDBLEPowerSourceContainer init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v18 = 0;
    v17 = 0;
    ASPrintF(&v17, "SDBLEPowerSourceContainer-%{ptr}", v6);
    v7->_ucat = (LogCategory *)LogCategoryCreateEx("com.apple.sharing", v17, 10, 512, 0, &v18);
    if (v18)
      v7->_ucat = (LogCategory *)LogCategoryCreateEx("com.apple.sharing", "SDBLEPowerSourceContainer", 10, 512, 0, &v18);
    if (v17)
      free(v17);
    objc_storeStrong((id *)&v7->_powerSource, a3);
    v8 = objc_opt_new(CUCoalescer);
    powerSourceIdleCoalescer = v7->_powerSourceIdleCoalescer;
    v7->_powerSourceIdleCoalescer = v8;

    -[CUCoalescer setMinDelay:](v7->_powerSourceIdleCoalescer, "setMinDelay:", 30.0);
    location = 0;
    objc_initWeak(&location, v7);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100047288;
    v14[3] = &unk_1007145D0;
    objc_copyWeak(&v15, &location);
    -[CUCoalescer setActionHandler:](v7->_powerSourceIdleCoalescer, "setActionHandler:", v14);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100047304;
    v12[3] = &unk_1007145D0;
    objc_copyWeak(&v13, &location);
    -[CUCoalescer setInvalidationHandler:](v7->_powerSourceIdleCoalescer, "setInvalidationHandler:", v12);
    p_var0 = &v7->_ucat->var0;
    if (*p_var0 > 10)
      goto LABEL_10;
    if (*p_var0 == -1)
    {
      if (!_LogCategory_Initialize(p_var0, 10))
        goto LABEL_10;
      p_var0 = &v7->_ucat->var0;
    }
    LogPrintF(p_var0, "-[SDBLEPowerSourceContainer initWithPowerSource:]", 10, "%s %@", "-[SDBLEPowerSourceContainer initWithPowerSource:]", v7->_powerSource);
LABEL_10:
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  LogCategory *ucat;
  void *v4;
  LogCategory *v5;
  objc_super v6;

  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize(self->_ucat, 10))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
    LogPrintF(ucat, "-[SDBLEPowerSourceContainer dealloc]", 10, "%s %@", "-[SDBLEPowerSourceContainer dealloc]", v4);

  }
LABEL_5:
  -[SDBLEPowerSourceContainer _invalidate](self, "_invalidate");
  v5 = self->_ucat;
  if (v5 && (v5->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(v5);
    self->_ucat = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SDBLEPowerSourceContainer;
  -[SDBLEPowerSourceContainer dealloc](&v6, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "powerSource"));
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else if ((v9 == 0) == (v10 != 0))
    {
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)-[SFPowerSource hash](self->_powerSource, "hash");
}

- (id)description
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v9;
  id v10;
  id v11;

  v11 = 0;
  v3 = objc_opt_class(self, a2);
  NSAppendPrintF(&v11, "<%@: %{ptr}", v3, self);
  v4 = v11;
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
  NSAppendPrintF(&v10, ", %@", v5);
  v6 = v10;

  v9 = v6;
  NSAppendPrintF(&v9, ">");
  v7 = v9;

  return v7;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4;
  id invalidationHandler;

  if (self->_invalidationHandler != a3)
  {
    v4 = objc_msgSend(a3, "copy");
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = v4;

  }
}

- (void)trigger
{
  LogCategory *ucat;
  void *v4;

  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 10)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize(self->_ucat, 10))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
      LogPrintF(ucat, "-[SDBLEPowerSourceContainer trigger]", 10, "%s %@", "-[SDBLEPowerSourceContainer trigger]", v4);

    }
LABEL_6:
    -[CUCoalescer trigger](self->_powerSourceIdleCoalescer, "trigger");
  }
}

- (int)publish
{
  LogCategory *ucat;
  int var0;
  void *v5;
  int v6;
  void *v7;

  ucat = self->_ucat;
  var0 = ucat->var0;
  if (!self->_invalidateCalled)
  {
    if (var0 <= 10)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize(self->_ucat, 10))
          goto LABEL_11;
        ucat = self->_ucat;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
      LogPrintF(ucat, "-[SDBLEPowerSourceContainer publish]", 10, "%s %@", "-[SDBLEPowerSourceContainer publish]", v7);

    }
LABEL_11:
    -[SDBLEPowerSourceContainer trigger](self, "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
    v6 = objc_msgSend(v5, "publish");
    goto LABEL_12;
  }
  if (var0 <= 90)
  {
    if (var0 != -1)
    {
LABEL_4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
      LogPrintF(ucat, "-[SDBLEPowerSourceContainer publish]", 90, "%s not publishing, already invalidated %@", "-[SDBLEPowerSourceContainer publish]", v5);
      v6 = -6703;
LABEL_12:

      return v6;
    }
    if (_LogCategory_Initialize(self->_ucat, 90))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
  return -6703;
}

- (void)invalidate
{
  LogCategory *ucat;
  void *v4;

  ucat = self->_ucat;
  if (ucat->var0 <= 10)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize(self->_ucat, 10))
        goto LABEL_5;
      ucat = self->_ucat;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
    LogPrintF(ucat, "-[SDBLEPowerSourceContainer invalidate]", 10, "%s %@", "-[SDBLEPowerSourceContainer invalidate]", v4);

  }
LABEL_5:
  -[SDBLEPowerSourceContainer _invalidate](self, "_invalidate");
}

- (void)_invalidate
{
  LogCategory *ucat;
  void *v4;
  CUCoalescer *powerSourceIdleCoalescer;
  void *v6;
  void *v7;
  void (**v8)(void);

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 > 10)
      goto LABEL_7;
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize(self->_ucat, 10))
      {
LABEL_7:
        -[CUCoalescer setActionHandler:](self->_powerSourceIdleCoalescer, "setActionHandler:", 0);
        -[CUCoalescer setInvalidationHandler:](self->_powerSourceIdleCoalescer, "setInvalidationHandler:", 0);
        -[CUCoalescer invalidate](self->_powerSourceIdleCoalescer, "invalidate");
        powerSourceIdleCoalescer = self->_powerSourceIdleCoalescer;
        self->_powerSourceIdleCoalescer = 0;

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
        objc_msgSend(v6, "invalidate");

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer invalidationHandler](self, "invalidationHandler"));
        if (v7)
        {
          v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer invalidationHandler](self, "invalidationHandler"));
          v8[2]();

          -[SDBLEPowerSourceContainer setInvalidationHandler:](self, "setInvalidationHandler:", 0);
        }
        return;
      }
      ucat = self->_ucat;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEPowerSourceContainer powerSource](self, "powerSource"));
    LogPrintF(ucat, "-[SDBLEPowerSourceContainer _invalidate]", 10, "%s %@", "-[SDBLEPowerSourceContainer _invalidate]", v4);

    goto LABEL_7;
  }
}

- (SFPowerSource)powerSource
{
  return self->_powerSource;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_powerSource, 0);
  objc_storeStrong((id *)&self->_powerSourceIdleCoalescer, 0);
}

@end
