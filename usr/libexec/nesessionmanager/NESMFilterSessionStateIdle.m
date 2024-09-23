@implementation NESMFilterSessionStateIdle

- (NESMFilterSessionStateIdle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateIdle;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 1, 0);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  id Property;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v7.receiver = self;
  v7.super_class = (Class)NESMFilterSessionStateIdle;
  -[NESMFilterSessionState enterWithSession:](&v7, "enterWithSession:", a3);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "policySession"));
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002F294;
    v8[3] = &unk_1000BDA50;
    v8[4] = v6;
    sub_10002C9C8((uint64_t)NESMPolicyMasterSession, v8);
  }

}

- (void)handleStartMessage:(id)a3
{
  const char *v4;
  id Property;
  const char *v6;
  _BOOL4 v7;
  SEL v8;
  id v9;
  uint64_t v10;
  SEL v11;
  BOOL v12;
  id v13;

  v13 = a3;
  if (!self)
  {
    v12 = sub_1000719F4(0, v4);
    v9 = 0;
    if (v12)
      goto LABEL_3;
    objc_msgSend(0, "setLastStopReason:", 6);
    v9 = 0;
LABEL_5:
    v10 = 4;
    goto LABEL_6;
  }
  Property = objc_getProperty(self, v4, 16, 1);
  v7 = sub_1000719F4(Property, v6);
  v9 = objc_getProperty(self, v8, 16, 1);
  if (!v7)
  {
    objc_msgSend(v9, "setLastStopReason:", 6);
    v9 = objc_getProperty(self, v11, 16, 1);
    goto LABEL_5;
  }
LABEL_3:
  v10 = 2;
LABEL_6:
  sub_100070FD8((id *)v9, (const char *)v10);

}

@end
