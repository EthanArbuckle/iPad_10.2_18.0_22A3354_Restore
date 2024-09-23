@implementation NESMFilterSessionStateStopping

- (NESMFilterSessionStateStopping)init
{
  NESMFilterSessionStateStopping *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateStopping;
  result = -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 4, 20);
  if (result)
    result->_pendingDisposeCount = 0;
  return result;
}

- (void)enterWithSession:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  void *v7;
  const char *v8;
  void *v9;
  SEL v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  _BYTE *v17;
  const char *v18;
  id v19;
  const char *v20;
  id v21;
  const char *v22;
  id v23;
  const char *v24;
  _BYTE *v25;
  const char *v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  _QWORD block[5];
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NESMFilterSessionStateStopping;
  -[NESMFilterSessionState enterWithSession:](&v33, "enterWithSession:", v4);
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "server"));
  v9 = v7;
  if (self)
  {
    objc_msgSend(v7, "requestUninstallForSession:", objc_getProperty(self, v8, 16, 1));

    self->_pendingDisposeCount = 0;
    v11 = objc_getProperty(self, v10, 16, 1);
    if (v11)
      v11 = objc_getProperty(v11, v12, 400, 1);
  }
  else
  {
    objc_msgSend(v7, "requestUninstallForSession:", 0);

    v11 = 0;
  }
  v13 = v11;

  if (v13)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      v15 = objc_getProperty(self, v14, 16, 1);
      if (v15)
        v15 = objc_getProperty(v15, v16, 400, 1);
    }
    else
    {
      v15 = 0;
    }
    v17 = v15;
    sub_100016D0C(v17, v18);

  }
  if (self)
  {
    v19 = objc_getProperty(self, v14, 16, 1);
    if (v19)
      v19 = objc_getProperty(v19, v20, 408, 1);
  }
  else
  {
    v19 = 0;
  }
  v21 = v19;

  if (v21)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      v23 = objc_getProperty(self, v22, 16, 1);
      if (v23)
        v23 = objc_getProperty(v23, v24, 408, 1);
    }
    else
    {
      v23 = 0;
    }
    v25 = v23;
    sub_100016D0C(v25, v26);

  }
  if (!self)
    goto LABEL_25;
  if (!self->_pendingDisposeCount)
  {
    v27 = objc_getProperty(self, v22, 16, 1);
    if (v27)
      objc_setProperty_atomic(v27, v28, 0, 400);
    v29 = objc_getProperty(self, v28, 16, 1);
    if (v29)
      objc_setProperty_atomic(v29, v30, 0, 408);
LABEL_25:
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005D100;
    block[3] = &unk_1000BEB80;
    block[4] = self;
    dispatch_async(v31, block);

  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  const char *v4;
  id Property;
  const char *v6;
  id v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NESMFilterSessionStateStopping;
  -[NESMFilterSessionState handlePluginDisposeComplete:](&v9, "handlePluginDisposeComplete:", a3);
  if (self)
  {
    if (!--self->_pendingDisposeCount)
    {
      Property = objc_getProperty(self, v4, 16, 1);
      if (Property)
        objc_setProperty_atomic(Property, v6, 0, 400);
      v7 = objc_getProperty(self, v6, 16, 1);
      if (v7)
        objc_setProperty_atomic(v7, v8, 0, 408);
      sub_10005CF70(self, v8);
    }
  }
}

- (void)handleTimeout
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  SEL v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  const char *v20;
  id v21;
  const char *v22;
  id v23;
  const char *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v25 = 138412546;
    v26 = Property;
    v27 = 2112;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: timed out", (uint8_t *)&v25, 0x16u);

  }
  if (self)
  {
    v11 = objc_getProperty(self, v10, 16, 1);
    if (v11)
      v11 = objc_getProperty(v11, v12, 400, 1);
    v13 = v11;
    sub_100017538(v13, v14);

    v16 = objc_getProperty(self, v15, 16, 1);
    if (v16)
      v16 = objc_getProperty(v16, v17, 408, 1);
  }
  else
  {
    v16 = 0;
  }
  v18 = v16;
  sub_100017538(v18, v19);

  if (self)
  {
    v21 = objc_getProperty(self, v20, 16, 1);
    if (v21)
      objc_setProperty_atomic(v21, v22, 0, 400);
    v23 = objc_getProperty(self, v22, 16, 1);
    if (v23)
      objc_setProperty_atomic(v23, v24, 0, 408);
    sub_10005CF70(self, v24);
  }
}

@end
