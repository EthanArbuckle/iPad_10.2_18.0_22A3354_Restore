@implementation NESMFilterSessionStateStarting

- (NESMFilterSessionStateStarting)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateStarting;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 2, 120);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  id Property;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  ptrdiff_t v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  _BYTE *v16;
  SEL v17;
  id v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NESMFilterSessionStateStarting;
  -[NESMFilterSessionState enterWithSession:](&v20, "enterWithSession:", a3);
  if (self)
  {
    Property = objc_getProperty(self, v4, 16, 1);
    if (Property)
      Property = objc_getProperty(Property, v6, 400, 1);
  }
  else
  {
    Property = 0;
  }
  v7 = Property;

  if (v7)
  {
    if (self)
    {
      v9 = objc_getProperty(self, v8, 16, 1);
      if (v9)
      {
        v11 = 400;
LABEL_15:
        v9 = objc_getProperty(v9, v10, v11, 1);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  if (self)
  {
    v12 = objc_getProperty(self, v8, 16, 1);
    if (v12)
      v12 = objc_getProperty(v12, v13, 408, 1);
  }
  else
  {
    v12 = 0;
  }
  v14 = v12;

  if (v14)
  {
    if (self)
    {
      v9 = objc_getProperty(self, v15, 16, 1);
      if (v9)
      {
        v11 = 408;
        goto LABEL_15;
      }
LABEL_16:
      v16 = v9;
      v18 = objc_getProperty(self, v17, 16, 1);
LABEL_17:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
      sub_100015D40(v16, v19);

      return;
    }
LABEL_20:
    v16 = 0;
    v18 = 0;
    goto LABEL_17;
  }
}

- (void)handlePluginStatusDidChangeToRunning:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  const char *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  _BYTE *v19;
  SEL v20;
  id v21;
  void *v22;
  id *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NESMFilterSessionStateStarting;
  -[NESMFilterSessionState handlePluginStatusDidChangeToRunning:](&v24, "handlePluginStatusDidChangeToRunning:", v4);
  if (self)
  {
    Property = objc_getProperty(self, v5, 16, 1);
    if (Property)
      Property = objc_getProperty(Property, v7, 400, 1);
  }
  else
  {
    Property = 0;
  }
  v8 = Property;

  if (v8 == v4)
  {
    if (self)
    {
      v14 = objc_getProperty(self, v9, 16, 1);
      if (v14)
        v14 = objc_getProperty(v14, v15, 408, 1);
    }
    else
    {
      v14 = 0;
    }
    v16 = v14;

    if (!v16)
      goto LABEL_19;
    if (self)
    {
      v17 = objc_getProperty(self, v13, 16, 1);
      if (v17)
        v17 = objc_getProperty(v17, v18, 408, 1);
      v19 = v17;
      v21 = objc_getProperty(self, v20, 16, 1);
    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "configuration"));
    sub_100015D40(v19, v22);

  }
  else
  {
    if (self)
    {
      v10 = objc_getProperty(self, v9, 16, 1);
      if (v10)
        v10 = objc_getProperty(v10, v11, 408, 1);
    }
    else
    {
      v10 = 0;
    }
    v12 = v10;

    if (v12 == v4)
    {
LABEL_19:
      if (self)
        v23 = (id *)objc_getProperty(self, v13, 16, 1);
      else
        v23 = 0;
      sub_100070FD8(v23, (const char *)3);
    }
  }

}

@end
