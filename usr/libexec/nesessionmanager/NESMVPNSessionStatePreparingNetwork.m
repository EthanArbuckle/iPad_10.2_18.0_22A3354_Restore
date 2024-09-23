@implementation NESMVPNSessionStatePreparingNetwork

- (NESMVPNSessionStatePreparingNetwork)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  return -[NESMVPNSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 2, 0);
}

- (void)enterWithSession:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  kdebug_trace(726990908, 0, 0, 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState enterWithSession:](&v5, "enterWithSession:", v4);
  objc_msgSend(v4, "prepareNetwork");

}

- (void)handleNetworkPrepareResult:(id)a3
{
  const char *v5;
  const char *v6;
  unsigned int v7;
  SEL v8;
  id Property;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  SEL v27;
  unsigned __int8 v28;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState handleNetworkPrepareResult:](&v30, "handleNetworkPrepareResult:");
  if (!a3)
  {
    if (self)
    {
      Property = objc_getProperty(self, v5, 16, 1);
      v26 = 4;
LABEL_20:
      objc_msgSend(Property, "setLastStopReason:", v26);
      v24 = objc_getProperty(self, v27, 16, 1);
LABEL_21:
      v25 = 5;
      goto LABEL_22;
    }
    v29 = 4;
LABEL_31:
    objc_msgSend(0, "setLastStopReason:", v29);
    v24 = 0;
    goto LABEL_21;
  }
  kdebug_trace(726990920, 0, 0, 0, 0);
  if (self)
  {
    v7 = objc_msgSend(objc_getProperty(self, v6, 16, 1), "initializePlugins");
    Property = objc_getProperty(self, v8, 16, 1);
    if (v7)
      goto LABEL_4;
    v26 = 6;
    goto LABEL_20;
  }
  v28 = objc_msgSend(0, "initializePlugins");
  Property = 0;
  if ((v28 & 1) == 0)
  {
    v29 = 6;
    goto LABEL_31;
  }
LABEL_4:
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "authenticationPlugin"));
  if (!v10)
  {
LABEL_14:
    if (self)
      v24 = objc_getProperty(self, v11, 16, 1);
    else
      v24 = 0;
    v25 = 3;
    goto LABEL_22;
  }
  v12 = (void *)v10;
  if (self)
    v13 = objc_getProperty(self, v11, 16, 1);
  else
    v13 = 0;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectParameters"));
  if (!v14)
    goto LABEL_24;
  v16 = (void *)v14;
  if (self)
    v17 = objc_getProperty(self, v15, 16, 1);
  else
    v17 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectParameters"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Password")));
  if (!v19)
  {

LABEL_24:
    goto LABEL_25;
  }
  v21 = (void *)v19;
  if (self)
    v22 = objc_getProperty(self, v20, 16, 1);
  else
    v22 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "extensibleSSOProvider"));

  if (!v23)
    goto LABEL_14;
LABEL_25:
  if (self)
    v24 = objc_getProperty(self, v11, 16, 1);
  else
    v24 = 0;
  v25 = 7;
LABEL_22:
  objc_msgSend(v24, "setState:", v25);
}

- (void)handleTimeout
{
  const char *v3;
  SEL v4;
  id Property;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStatePreparingNetwork;
  -[NESMVPNSessionState handleTimeout](&v6, "handleTimeout");
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 16, 1), "setLastStopReason:", 41);
    Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    objc_msgSend(0, "setLastStopReason:", 41);
    Property = 0;
  }
  objc_msgSend(Property, "setState:", 5);
}

@end
