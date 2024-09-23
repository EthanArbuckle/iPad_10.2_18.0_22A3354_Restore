@implementation NESMVPNSessionStateAuthenticating

- (NESMVPNSessionStateAuthenticating)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateAuthenticating;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 7, 120);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  const char *v5;
  id v6;
  const char *v7;
  _BYTE *v8;
  id v9;
  void *v10;
  BOOL v11;
  SEL v12;
  id Property;
  unsigned __int8 v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NESMVPNSessionStateAuthenticating;
  -[NESMVPNSessionState enterWithSession:](&v15, "enterWithSession:", a3);
  if (self)
  {
    if (!objc_msgSend(objc_getProperty(self, v4, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      objc_msgSend(objc_getProperty(self, v5, 16, 1), "setLastStopReason:", 7);
      Property = objc_getProperty(self, v12, 16, 1);
LABEL_9:
      objc_msgSend(Property, "setState:", 5);
      return;
    }
    v6 = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    v14 = objc_msgSend(0, "prepareConfigurationForStart");
    v6 = 0;
    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authenticationPlugin"));
  if (self)
    v9 = objc_getProperty(self, v7, 16, 1);
  else
    v9 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
  v11 = sub_100015D40(v8, v10);

  if (!v11)
  {
    if (self)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(0, "setLastStopReason:", 7);
    Property = 0;
    goto LABEL_9;
  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  const char *v10;
  id Property;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];
  _QWORD v30[5];

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)NESMVPNSessionStateAuthenticating;
  v9 = a3;
  -[NESMVPNSessionState handlePlugin:didStartWithPID:error:](&v28, "handlePlugin:didStartWithPID:error:", v9, v5, v8);
  if (self)
    Property = objc_getProperty(self, v10, 16, 1);
  else
    Property = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "authenticationPlugin", v28.receiver, v28.super_class));

  if (v12 != v9)
    goto LABEL_25;
  if ((int)v5 <= 0)
  {
    if (v8)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("NEAgentErrorDomain")) & 1) != 0)
      {
        v15 = objc_msgSend(v8, "code");

        if (v15 == (id)2)
        {
          if (self)
            v16 = objc_getProperty(self, v13, 16, 1);
          else
            v16 = 0;
          v17 = 6;
LABEL_15:
          objc_msgSend(v16, "setLastStopReason:", v17);
          if (self)
            v19 = objc_getProperty(self, v18, 16, 1);
          else
            v19 = 0;
          objc_msgSend(v19, "setState:", 5);
          goto LABEL_18;
        }
      }
      else
      {

      }
    }
    if (self)
      v16 = objc_getProperty(self, v13, 16, 1);
    else
      v16 = 0;
    v17 = 7;
    goto LABEL_15;
  }
LABEL_18:
  if (self)
    v20 = objc_getProperty(self, v13, 16, 1);
  else
    v20 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "authenticationPlugin"));
  if (self)
    v23 = objc_getProperty(self, v21, 16, 1);
  else
    v23 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "connectParameters"));
  v25 = v24;
  if (v22)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000175AC;
    v30[3] = &unk_1000BEA00;
    v30[4] = v22;
    v26 = v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "remotePluginObjectWithErrorHandler:", v30));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100017648;
    v29[3] = &unk_1000BD758;
    v29[4] = v22;
    objc_msgSend(v27, "authenticateWithParameters:completionHandler:", v26, v29);

  }
LABEL_25:

}

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  uint64_t v7;
  id v10;
  _BYTE *v11;
  const char *v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  SEL v23;
  id v24;
  uint64_t v25;
  id Property;
  SEL v27;
  SEL v28;
  id v29;
  void *v30;
  int v31;
  const char *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  const char *v38;
  id v39;
  objc_super v40;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)NESMVPNSessionStateAuthenticating;
  v11 = a3;
  -[NESMVPNSessionState handlePlugin:authenticationCompleteWithResults:status:andError:](&v40, "handlePlugin:authenticationCompleteWithResults:status:andError:", v11, v10, v7, a6);
  sub_100016D0C(v11, v12);

  if ((_DWORD)v7 && !a6)
  {
    if (!v10)
    {
      if ((_DWORD)v7 == 2)
      {
        if (self)
        {
          Property = objc_getProperty(self, v13, 16, 1);
          objc_msgSend(Property, "setLastStopReason:", 8, v40.receiver, v40.super_class);
          objc_msgSend(objc_getProperty(self, v27, 16, 1), "setState:", 5);
          v29 = objc_getProperty(self, v28, 16, 1);
        }
        else
        {
          objc_msgSend(0, "setLastStopReason:", 8, v40.receiver, v40.super_class);
          objc_msgSend(0, "setState:", 5);
          v29 = 0;
        }
        sub_10007C090(v29, (id)2);
      }
      goto LABEL_27;
    }
    if (self)
      v14 = objc_getProperty(self, v13, 16, 1);
    else
      v14 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensibleSSOProvider", v40.receiver, v40.super_class));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensible-sso-credential-certificate")));
      v17 = isa_nsdata();

      if (!v17)
      {
LABEL_27:
        if (self)
          v24 = objc_getProperty(self, v13, 16, 1);
        else
          v24 = 0;
        v25 = 3;
        goto LABEL_30;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensible-sso-credential-certificate")));
      if (self)
        v20 = objc_getProperty(self, v18, 16, 1);
      else
        v20 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "protocol"));
      objc_msgSend(v21, "setIdentityReferenceInternal:", v19);
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AuthName")));
      v31 = isa_nsstring(v30);

      if (v31)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AuthName")));
        if (self)
          v34 = objc_getProperty(self, v32, 16, 1);
        else
          v34 = 0;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "connectParameters"));
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("AccountName"));

      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AuthCredentialPassword")));
      v37 = isa_nsstring(v36);

      if (!v37)
        goto LABEL_27;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AuthCredentialPassword")));
      if (self)
        v39 = objc_getProperty(self, v38, 16, 1);
      else
        v39 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "connectParameters"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("Password"));
    }

    goto LABEL_27;
  }
  if (self)
  {
    v22 = objc_getProperty(self, v13, 16, 1);
    objc_msgSend(v22, "setLastStopReason:", 7, v40.receiver, v40.super_class);
    v24 = objc_getProperty(self, v23, 16, 1);
  }
  else
  {
    objc_msgSend(0, "setLastStopReason:", 7, v40.receiver, v40.super_class);
    v24 = 0;
  }
  v25 = 5;
LABEL_30:
  objc_msgSend(v24, "setState:", v25, v40.receiver, v40.super_class);

}

- (void)handleTimeout
{
  const char *v3;
  id v4;
  _BYTE *v5;
  const char *v6;
  SEL v7;
  SEL v8;
  id Property;
  _BYTE *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NESMVPNSessionStateAuthenticating;
  -[NESMVPNSessionState handleTimeout](&v12, "handleTimeout");
  if (self)
  {
    v4 = objc_msgSend(objc_getProperty(self, v3, 16, 1), "authenticationPlugin");
    v5 = (_BYTE *)objc_claimAutoreleasedReturnValue(v4);
    sub_100016D0C(v5, v6);

    objc_msgSend(objc_getProperty(self, v7, 16, 1), "setLastStopReason:", 11);
    Property = objc_getProperty(self, v8, 16, 1);
  }
  else
  {
    v10 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "authenticationPlugin"));
    sub_100016D0C(v10, v11);

    objc_msgSend(0, "setLastStopReason:", 11);
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 5);
}

@end
