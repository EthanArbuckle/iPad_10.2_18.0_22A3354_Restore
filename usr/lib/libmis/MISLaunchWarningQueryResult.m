@implementation MISLaunchWarningQueryResult

- (MISLaunchWarningQueryResult)initWithWarningState:(int64_t)a3 withUserOverridden:(BOOL)a4 withKBURL:(id)a5
{
  id v9;
  MISLaunchWarningQueryResult *v10;
  MISLaunchWarningQueryResult *v11;
  void **p_kbURL;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MISLaunchWarningQueryResult;
  v10 = -[MISLaunchWarningQueryResult init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->warningState = a3;
    v10->isUserOverridden = a4;
    if (a3)
    {
      p_kbURL = (void **)&v10->kbURL;
      objc_storeStrong((id *)&v10->kbURL, a5);
      if (!v11->kbURL)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99E98]);
        v16 = objc_msgSend_initWithString_(v13, v14, (uint64_t)CFSTR("https://support.apple.com/116947"), v15);
        v17 = *p_kbURL;
        *p_kbURL = (void *)v16;

      }
    }
  }

  return v11;
}

- (int64_t)warningState
{
  return self->warningState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->kbURL, 0);
}

- (BOOL)isUserOverridden
{
  return self->isUserOverridden;
}

- (NSURL)kbURL
{
  return self->kbURL;
}

@end
