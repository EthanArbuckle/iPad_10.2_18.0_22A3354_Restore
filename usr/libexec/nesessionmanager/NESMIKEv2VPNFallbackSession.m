@implementation NESMIKEv2VPNFallbackSession

- (void)handleChangeEventForFallback:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085770;
  v6[3] = &unk_1000BEC58;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  NESMIKEv2VPNFallbackSession *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084E58;
  block[3] = &unk_1000BE878;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

}

- (int)type
{
  return 1;
}

- (void)handleInitializeState
{
  const char *v3;
  id Property;
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NESMIKEv2VPNFallbackSession;
  -[NESMSession handleInitializeState](&v17, "handleInitializeState");
  if (self)
    Property = objc_getProperty(self, v3, 360, 1);
  else
    Property = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
  v7 = v5;
  if (v5)
    v5 = objc_getProperty(v5, v6, 24, 1);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084DA8;
  block[3] = &unk_1000BEB80;
  block[4] = self;
  dispatch_async(v8, block);

  if (self)
    v10 = objc_getProperty(self, v9, 360, 1);
  else
    v10 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v13 = v11;
  if (v11)
    v11 = objc_getProperty(v11, v12, 24, 1);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100084E00;
  v15[3] = &unk_1000BEB80;
  v15[4] = self;
  dispatch_async(v14, v15);

}

- (void)handleStartMessage:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 360, 1);
  else
    Property = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
  v9 = v7;
  if (v7)
    v7 = objc_getProperty(v7, v8, 24, 1);
  v10 = objc_msgSend(v7, "state");

  if (v10 == (id)1)
  {
    if (self)
      v12 = objc_getProperty(self, v11, 360, 1);
    else
      v12 = 0;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
    v15 = v13;
    if (v13)
      v13 = objc_getProperty(v13, v14, 24, 1);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100084D40;
    v17[3] = &unk_1000BEB58;
    v17[4] = self;
    v18 = v5;
    dispatch_async(v16, v17);

  }
}

- (void)handleStopMessageWithReason:(int)a3
{
  const char *v5;
  id Property;
  id v7;
  const char *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  int v18;
  _QWORD block[5];
  int v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NESMIKEv2VPNFallbackSession;
  -[NESMSession handleStopMessageWithReason:](&v21, "handleStopMessageWithReason:");
  if (self)
    Property = objc_getProperty(self, v5, 360, 1);
  else
    Property = 0;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
  v9 = v7;
  if (v7)
    v7 = objc_getProperty(v7, v8, 24, 1);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084C70;
  block[3] = &unk_1000BECF8;
  block[4] = self;
  v20 = a3;
  dispatch_async(v10, block);

  if (self)
    v12 = objc_getProperty(self, v11, 360, 1);
  else
    v12 = 0;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
  v15 = v13;
  if (v13)
    v13 = objc_getProperty(v13, v14, 24, 1);
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "queue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100084CD8;
  v17[3] = &unk_1000BECF8;
  v17[4] = self;
  v18 = a3;
  dispatch_async(v16, v17);

}

- (void)handleWakeup
{
  NESMIKEv2VPNFallbackSession *v2;
  id Property;
  const char *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 24, 1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084BC0;
  block[3] = &unk_1000BEB80;
  block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
    v8 = objc_getProperty(v2, v7, 360, 1);
  else
    v8 = 0;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
  v11 = v9;
  if (v9)
    v9 = objc_getProperty(v9, v10, 24, 1);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100084C18;
  v13[3] = &unk_1000BEB80;
  v13[4] = v2;
  dispatch_async(v12, v13);

}

- (BOOL)handleSleep
{
  NESMIKEv2VPNFallbackSession *v2;
  id Property;
  const char *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[5];
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 24, 1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084B10;
  block[3] = &unk_1000BEB80;
  block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
  {
    ++v2->_sleepAckCount;
    v8 = objc_getProperty(v2, v7, 360, 1);
  }
  else
  {
    v8 = 0;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
  v11 = v9;
  if (v9)
    v9 = objc_getProperty(v9, v10, 24, 1);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100084B68;
  v14[3] = &unk_1000BEB80;
  v14[4] = v2;
  dispatch_async(v12, v14);

  if (v2)
    ++v2->_sleepAckCount;
  return 1;
}

- (void)handleSleepTime:(double)a3
{
  NESMIKEv2VPNFallbackSession *v4;
  id Property;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  _QWORD block[6];

  v4 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v7 = Property;
  if (Property)
    Property = objc_getProperty(Property, v6, 24, 1);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084A40;
  block[3] = &unk_1000BEA98;
  block[4] = v4;
  *(double *)&block[5] = a3;
  dispatch_async(v8, block);

  if (v4)
    v10 = objc_getProperty(v4, v9, 360, 1);
  else
    v10 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v13 = v11;
  if (v11)
    v11 = objc_getProperty(v11, v12, 24, 1);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100084AA8;
  v15[3] = &unk_1000BEA98;
  v15[4] = v4;
  *(double *)&v15[5] = a3;
  dispatch_async(v14, v15);

}

- (void)handleUserLogout
{
  NESMIKEv2VPNFallbackSession *v2;
  id Property;
  const char *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 24, 1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084990;
  block[3] = &unk_1000BEB80;
  block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
    v8 = objc_getProperty(v2, v7, 360, 1);
  else
    v8 = 0;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
  v11 = v9;
  if (v9)
    v9 = objc_getProperty(v9, v10, 24, 1);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000849E8;
  v13[3] = &unk_1000BEB80;
  v13[4] = v2;
  dispatch_async(v12, v13);

}

- (void)handleUserSwitch
{
  NESMIKEv2VPNFallbackSession *v2;
  id Property;
  const char *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v5 = Property;
  if (Property)
    Property = objc_getProperty(Property, v4, 24, 1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000848E0;
  block[3] = &unk_1000BEB80;
  block[4] = v2;
  dispatch_async(v6, block);

  if (v2)
    v8 = objc_getProperty(v2, v7, 360, 1);
  else
    v8 = 0;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
  v11 = v9;
  if (v9)
    v9 = objc_getProperty(v9, v10, 24, 1);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100084938;
  v13[3] = &unk_1000BEB80;
  v13[4] = v2;
  dispatch_async(v12, v13);

}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  const char *v4;
  id v5;
  const char *v6;
  id Property;
  id v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  id v12;
  const char *v13;
  id v14;
  id v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  BOOL v30;
  _QWORD v32[4];
  id v33;
  NESMIKEv2VPNFallbackSession *v34;
  _QWORD block[4];
  id v36;
  NESMIKEv2VPNFallbackSession *v37;
  objc_super v38;
  _QWORD v39[5];
  _QWORD v40[5];

  v5 = a3;
  if (v5)
  {
    v38.receiver = self;
    v38.super_class = (Class)NESMIKEv2VPNFallbackSession;
    if (!-[NESMSession handleUpdateConfiguration:](&v38, "handleUpdateConfiguration:", v5))
    {
      v30 = 0;
      goto LABEL_23;
    }
    if (self)
      Property = objc_getProperty(self, v6, 360, 1);
    else
      Property = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
    v10 = v8;
    if (v8)
      v8 = objc_getProperty(v8, v9, 24, 1);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100084730;
    block[3] = &unk_1000BEB58;
    v12 = v5;
    v36 = v12;
    v37 = self;
    dispatch_async(v11, block);

    if (self)
      v14 = objc_getProperty(self, v13, 360, 1);
    else
      v14 = 0;
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 1));
    v17 = v15;
    if (v15)
      v15 = objc_getProperty(v15, v16, 24, 1);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "queue"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100084808;
    v32[3] = &unk_1000BEB58;
    v33 = v12;
    v34 = self;
    dispatch_async(v18, v32);

  }
  else
  {
    if (self)
      v19 = objc_getProperty(self, v4, 360, 1);
    else
      v19 = 0;
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
    v22 = v20;
    if (v20)
      v20 = objc_getProperty(v20, v21, 24, 1);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "queue"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000844D0;
    v40[3] = &unk_1000BEB80;
    v40[4] = self;
    dispatch_async(v23, v40);

    if (self)
      v25 = objc_getProperty(self, v24, 360, 1);
    else
      v25 = 0;
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", 1));
    v28 = v26;
    if (v26)
      v26 = objc_getProperty(v26, v27, 24, 1);
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "queue"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100084600;
    v39[3] = &unk_1000BEB80;
    v39[4] = self;
    dispatch_async(v29, v39);

  }
  v30 = 1;
LABEL_23:

  return v30;
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  const char *v6;
  xpc_object_t reply;
  void *v8;
  char **v9;
  id v10;
  id Property;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  char *v24;
  void *v25;
  char *v26;
  void *v27;
  char *v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v52;
  id v53;
  char *v54;
  void *v55;
  xpc_object_t v56;
  xpc_object_t xdict;
  _QWORD v58[6];
  _QWORD v59[6];
  uint64_t v60;
  void *v61;

  xdict = a3;
  reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    v29 = -[NESMIKEv2VPNFallbackSession copyExtendedStatus](self, "copyExtendedStatus");
    v8 = xdict;
    if (!v29)
      goto LABEL_23;
    goto LABEL_22;
  }
  v8 = xdict;
  if (a4 == 1)
  {
    v56 = reply;
    if (!self)
    {
      v29 = 0;
LABEL_21:
      reply = v56;
      v8 = xdict;
      if (v29)
      {
LABEL_22:
        v50 = (void *)_CFXPCCreateXPCObjectFromCFObject(v29);
        xpc_dictionary_set_value(reply, "SessionInfo", v50);

        v8 = xdict;
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    v9 = &selRef_sharedConnection;
    v10 = objc_msgSend(objc_getProperty(self, v6, 360, 1), "objectAtIndexedSubscript:", 0);
    Property = (id)objc_claimAutoreleasedReturnValue(v10);
    v13 = Property;
    if (Property)
      Property = objc_getProperty(Property, v12, 24, 1);
    v14 = objc_msgSend(Property, "copyStatistics");

    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VPN")));
      v17 = v16;
      if (v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BytesIn")));
        v19 = (char *)objc_msgSend(v18, "unsignedLongLongValue");

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BytesOut")));
        v21 = (char *)objc_msgSend(v20, "unsignedLongLongValue");

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PacketsIn")));
        v53 = objc_msgSend(v22, "unsignedLongLongValue");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PacketsOut")));
        v24 = (char *)objc_msgSend(v23, "unsignedLongLongValue");

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ErrorsIn")));
        v26 = (char *)objc_msgSend(v25, "unsignedLongLongValue");

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ErrorsOut")));
        v28 = (char *)objc_msgSend(v27, "unsignedLongLongValue");

        v9 = &selRef_sharedConnection;
        goto LABEL_13;
      }
    }
    else
    {
      v17 = 0;
    }
    v19 = 0;
    v21 = 0;
    v53 = 0;
    v24 = 0;
    v26 = 0;
    v28 = 0;
LABEL_13:
    v30 = objc_msgSend(objc_getProperty(self, v15, *((int *)v9 + 530), 1), "objectAtIndexedSubscript:", 1);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    v33 = v31;
    if (v31)
      v31 = objc_getProperty(v31, v32, 24, 1);
    v34 = objc_msgSend(v31, "copyStatistics", v53);

    v55 = v34;
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("VPN")));

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BytesIn")));
        v19 = &v19[(_QWORD)objc_msgSend(v36, "unsignedLongLongValue")];

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BytesOut")));
        v21 = &v21[(_QWORD)objc_msgSend(v37, "unsignedLongLongValue")];

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PacketsIn")));
        v39 = &v54[(_QWORD)objc_msgSend(v38, "unsignedLongLongValue")];

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PacketsOut")));
        v24 = &v24[(_QWORD)objc_msgSend(v40, "unsignedLongLongValue")];

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ErrorsIn")));
        v26 = &v26[(_QWORD)objc_msgSend(v41, "unsignedLongLongValue")];

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ErrorsOut")));
        v28 = &v28[(_QWORD)objc_msgSend(v42, "unsignedLongLongValue")];

        v17 = v35;
LABEL_20:
        v60 = kSCEntNetVPN;
        v58[0] = CFSTR("BytesIn");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v19));
        v59[0] = v43;
        v58[1] = CFSTR("BytesOut");
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21));
        v59[1] = v44;
        v58[2] = CFSTR("PacketsIn");
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v39));
        v59[2] = v45;
        v58[3] = CFSTR("PacketsOut");
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v24));
        v59[3] = v46;
        v58[4] = CFSTR("ErrorsIn");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v26));
        v59[4] = v47;
        v58[5] = CFSTR("ErrorsOut");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v28));
        v59[5] = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 6));
        v61 = v49;
        v29 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));

        goto LABEL_21;
      }
      v17 = 0;
    }
    v39 = v54;
    goto LABEL_20;
  }
LABEL_23:
  remote_connection = xpc_dictionary_get_remote_connection(v8);
  v52 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v52, reply);

}

- (id)copyExtendedStatus
{
  NESMIKEv2VPNFallbackSession *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  id v7;
  _DWORD *v8;
  int v9;
  id Property;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v43;
  uint8_t buf[4];
  void *v45;

  v2 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  v3 = objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v5 = (void *)v3;
  if (v3 && *(_DWORD *)(v3 + 8) == 3
    || (!v2 ? (v7 = 0) : (v7 = objc_getProperty(v2, v4, 360, 1)),
        (v8 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1))) == 0))
  {

LABEL_13:
    if (v2)
      Property = objc_getProperty(v2, v6, 360, 1);
    else
      Property = 0;
    v11 = 0;
    goto LABEL_16;
  }
  v9 = v8[2];

  if (v9 != 3)
    goto LABEL_13;
  if (v2)
    Property = objc_getProperty(v2, v6, 360, 1);
  else
    Property = 0;
  v11 = 1;
LABEL_16:
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", v11));
  v14 = v12;
  if (v12)
    v12 = objc_getProperty(v12, v13, 24, 1);
  v15 = objc_msgSend(v12, "copyExtendedStatus");

  if (!v15)
  {
    v16 = 0;
    goto LABEL_41;
  }
  v16 = objc_msgSend(v15, "mutableCopy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VPN")));
  v18 = isa_nsdictionary(v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VPN")));
    v20 = objc_msgSend(v19, "mutableCopy");

  }
  else
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (-[NESMSession status](v2, "status") == 3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NESMSession connectTime](v2, "connectTime")));
    v22 = CFSTR("ConnectTime");
LABEL_27:
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v22);

    goto LABEL_28;
  }
  if (-[NESMSession status](v2, "status") != 2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession lastStopReason](v2, "lastStopReason")));
    v22 = CFSTR("LastCause");
    goto LABEL_27;
  }
LABEL_28:
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("VPN"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ConnectionStatistics")));
  v24 = isa_nsdictionary(v23);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ConnectionStatistics")));
    v26 = objc_msgSend(v25, "mutableCopy");

  }
  else
  {
    v26 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession connectCount](v2, "connectCount")));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("ConnectCount"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession connectedCount](v2, "connectedCount")));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("ConnectedCount"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NESMSession disconnectedCount](v2, "disconnectedCount")));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("DisconnectedCount"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NESMSession maxConnectTime](v2, "maxConnectTime")));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("MaxConnectTime"));

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("ConnectionStatistics"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession status](v2, "status")));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("NEStatus"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[NESMSession SCNCStatus](v2, "SCNCStatus")));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v32, CFSTR("Status"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](v2, "lastDisconnectError"));
  if (v33)
  {
    v43 = 0;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v43));
    v35 = v43;
    v37 = v35;
    if (v34)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, CFSTR("LastDisconnectError"));
    }
    else
    {
      v38 = ne_log_obj(v35, v36);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to serialize the last disconnect error: %@", buf, 0xCu);
      }

    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](v2, "lastStatusChangeTime"));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastStatusChangeTime](v2, "lastStatusChangeTime"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v41, CFSTR("LastStatusChangeTime"));

  }
LABEL_41:

  return v16;
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  id Property;
  id v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t buf[4];
  NESMIKEv2VPNFallbackSession *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;

  v8 = a3;
  v10 = ne_log_obj(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v24 = self;
    v25 = 2080;
    v26 = "-[NESMIKEv2VPNFallbackSession handleChangeEventForInterface:newFlags:previousFlags:]";
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@:%s: Enter (ifName %@, flags %X)", buf, 0x26u);
  }

  if (self)
    Property = objc_getProperty(self, v12, 360, 1);
  else
    Property = 0;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
  v16 = v14;
  if (v14)
    v14 = objc_getProperty(v14, v15, 24, 1);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "queue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100084464;
  v19[3] = &unk_1000BE8A0;
  v19[4] = self;
  v20 = v8;
  v21 = a4;
  v22 = a5;
  v18 = v8;
  dispatch_async(v17, v19);

}

- (void)handleNetworkDetectionNotification:(int)a3
{
  NESMIKEv2VPNFallbackSession *v4;
  id Property;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  int v16;
  _QWORD block[5];
  int v18;

  v4 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v7 = Property;
  if (Property)
    Property = objc_getProperty(Property, v6, 24, 1);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084394;
  block[3] = &unk_1000BECF8;
  block[4] = v4;
  v18 = a3;
  dispatch_async(v8, block);

  if (v4)
    v10 = objc_getProperty(v4, v9, 360, 1);
  else
    v10 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v13 = v11;
  if (v11)
    v11 = objc_getProperty(v11, v12, 24, 1);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000843FC;
  v15[3] = &unk_1000BECF8;
  v15[4] = v4;
  v16 = a3;
  dispatch_async(v14, v15);

}

- (void)setStatus:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id Property;
  _DWORD *v9;
  int v10;
  const char *v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  objc_super v21;
  uint8_t buf[4];
  NESMIKEv2VPNFallbackSession *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v5 = ne_log_obj(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v23 = self;
    v24 = 2080;
    v25 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    v26 = 2080;
    v27 = ne_session_status_to_string(v3);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@:%s: Enter (new status %s)", buf, 0x20u);
  }

  if (self)
    Property = objc_getProperty(self, v7, 360, 1);
  else
    Property = 0;
  v9 = (_DWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "objectAtIndexedSubscript:", 0));
  if (v9)
    v10 = v9[2];
  else
    v10 = 0;

  if (self)
    v12 = objc_getProperty(self, v11, 360, 1);
  else
    v12 = 0;
  v13 = (unsigned int *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
  if (v13)
    v14 = v13[2];
  else
    v14 = 0;

  v15 = sub_1000841D8((uint64_t)self, v10, v14);
  v16 = sub_1000841D8((uint64_t)self, v3, v15);
  v18 = ne_log_obj(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = ne_session_status_to_string(v16);
    *(_DWORD *)buf = 138412802;
    v23 = self;
    v24 = 2080;
    v25 = "-[NESMIKEv2VPNFallbackSession setStatus:]";
    v26 = 2080;
    v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@:%s: Status to Client: %s", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)NESMIKEv2VPNFallbackSession;
  -[NESMSession setStatus:](&v21, "setStatus:", v16);
}

- (void)install
{
  NESMIKEv2VPNFallbackSession *v2;
  const char *v3;
  __int128 v4;
  id v5;
  _QWORD *v6;
  const char *v7;
  void *v8;
  id Property;
  const char *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  id v18;
  SEL v19;
  _QWORD *v20;
  const char *v21;
  SEL v22;
  const char *v23;
  id v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  id v38;
  id v39;
  const char *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  id v48;
  void *v49;
  SEL v50;
  id v51;
  _QWORD *v52;
  __int128 v53;
  _QWORD block[4];
  id v55;
  _QWORD v56[6];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;

  if (self && (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408, 1)) != 0))
  {
    if (objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
    {
      v5 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
      v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(v5);
      v8 = v6;
      if (v6 && v6[2] == 3)
      {
        Property = objc_getProperty(v6, v7, 24, 1);
        if (Property)
          Property = objc_getProperty(Property, v10, 24, 1);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100084180;
        block[3] = &unk_1000BEB80;
        v12 = v8;
        v55 = v12;
        dispatch_async(v11, block);

        v15 = ne_log_obj(v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_getProperty(v12, v17, 24, 1);
          *(_DWORD *)buf = 138412546;
          v58 = (const char *)v2;
          v59 = 2112;
          v60 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@, installed session %@", buf, 0x16u);
        }

        v20 = objc_getProperty(v12, v19, 24, 1);
        if (v20)
          v20[4] = 5;
        objc_msgSend(objc_getProperty(v2, v21, 408, 1), "removeObject:", v12);

        v2->_installState = 5;
        if (!objc_msgSend(objc_getProperty(v2, v22, 408, 1), "count"))
          goto LABEL_23;
        v24 = objc_msgSend(objc_getProperty(v2, v23, 408, 1), "objectAtIndexedSubscript:", 0);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        v27 = v25;
        if (v25)
        {
          v28 = *(_QWORD *)(v25 + 16);
          if (v28 == 2)
          {
            sub_100083B2C(v2, v26);
          }
          else if (v28 == 3)
          {
            sub_10008363C(v2, v26);
          }
        }
      }
      else
      {
        v31 = ne_log_obj(v6, v7);
        v27 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
        }
      }

LABEL_23:
      return;
    }
    v32 = 0;
    v33 = 1;
    *(_QWORD *)&v4 = 138412546;
    v53 = v4;
    do
    {
      v34 = v33;
      v35 = objc_msgSend(objc_getProperty(v2, v3, 360, 1), "objectAtIndexedSubscript:", v32);
      v36 = (_QWORD *)objc_claimAutoreleasedReturnValue(v35);
      if (v36)
      {
        v37 = v36[4];

        if (v37 == 4)
        {
          v38 = objc_msgSend(objc_getProperty(v2, v3, 360, 1), "objectAtIndexedSubscript:", v32);
          v39 = (id)objc_claimAutoreleasedReturnValue(v38);
          v41 = v39;
          if (v39)
            v39 = objc_getProperty(v39, v40, 24, 1);
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "queue", v53));
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_10008411C;
          v56[3] = &unk_1000BEA98;
          v56[4] = v2;
          v56[5] = v32;
          dispatch_async(v42, v56);

          v45 = ne_log_obj(v43, v44);
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v48 = objc_msgSend(objc_getProperty(v2, v47, 360, 1), "objectAtIndexedSubscript:", v32);
            v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
            *(_DWORD *)buf = v53;
            v58 = (const char *)v2;
            v59 = 2112;
            v60 = v49;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@ installing pending session %@", buf, 0x16u);

          }
          v51 = objc_msgSend(objc_getProperty(v2, v50, 360, 1), "objectAtIndexedSubscript:", v32);
          v52 = (_QWORD *)objc_claimAutoreleasedReturnValue(v51);
          if (v52)
            v52[4] = 5;

        }
      }
      v33 = 0;
      v32 = 1;
    }
    while ((v34 & 1) != 0);
    v2->_installState = 5;
  }
  else
  {
    v29 = ne_log_obj(self, a2);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NESMIKEv2VPNFallbackSession install]";
      _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "%s called with null self.configurationOperationArray", buf, 0xCu);
    }

  }
}

- (void)installPended
{
  NESMIKEv2VPNFallbackSession *v2;
  const char *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  id Property;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  SEL v18;
  _QWORD *v19;
  const char *v20;
  SEL v21;
  const char *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD block[4];
  NSObject *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;

  if (!self || (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408, 1)) == 0))
  {
    v28 = ne_log_obj(self, a2);
    v11 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 136315138;
    v37 = "-[NESMIKEv2VPNFallbackSession installPended]";
    v29 = "%s called with null self.configurationOperationArray";
    v30 = v11;
    v31 = 12;
LABEL_21:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_25;
  }
  if (!objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
  {
    v32 = ne_log_obj(0, v3);
    v11 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v29 = "request install configuration operation array is empty";
    v30 = v11;
    v31 = 2;
    goto LABEL_21;
  }
  v4 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v7 = v5;
  if (!v5 || v5[2].isa != (Class)3)
  {
    v33 = ne_log_obj(v5, v6);
    v26 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }
    goto LABEL_24;
  }
  Property = objc_getProperty(v5, v6, 24, 1);
  if (Property)
    Property = objc_getProperty(Property, v9, 24, 1);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000840C4;
  block[3] = &unk_1000BEB80;
  v11 = v7;
  v35 = v11;
  dispatch_async(v10, block);

  v14 = ne_log_obj(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_getProperty(v11, v16, 24, 1);
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v2;
    v38 = 2112;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@, pending session %@", buf, 0x16u);
  }

  v19 = objc_getProperty(v11, v18, 24, 1);
  if (v19)
    v19[4] = 4;
  objc_msgSend(objc_getProperty(v2, v20, 408, 1), "removeObject:", v11);

  v2->_installState = 4;
  if (objc_msgSend(objc_getProperty(v2, v21, 408, 1), "count"))
  {
    v23 = objc_msgSend(objc_getProperty(v2, v22, 408, 1), "objectAtIndexedSubscript:", 0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v26 = v24;
    if (v24)
    {
      v27 = *(_QWORD *)(v24 + 16);
      if (v27 == 2)
      {
        sub_100083B2C(v2, v25);
      }
      else if (v27 == 3)
      {
        sub_10008363C(v2, v25);
      }
    }
LABEL_24:

    v11 = v7;
  }
LABEL_25:

}

- (void)uninstall
{
  NESMIKEv2VPNFallbackSession *v2;
  const char *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  id Property;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  SEL v18;
  _QWORD *v19;
  const char *v20;
  SEL v21;
  const char *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD block[4];
  NSObject *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;

  if (!self || (v2 = self, (self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 408, 1)) == 0))
  {
    v28 = ne_log_obj(self, a2);
    v11 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 136315138;
    v37 = "-[NESMIKEv2VPNFallbackSession uninstall]";
    v29 = "%s called with null self.configurationOperationArray";
    v30 = v11;
    v31 = 12;
LABEL_26:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v29, buf, v31);
    goto LABEL_23;
  }
  if (!objc_msgSend(objc_getProperty(v2, a2, 408, 1), "count"))
  {
    v33 = ne_log_obj(0, v3);
    v11 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v29 = "request uninstall configuration operation array is empty";
    v30 = v11;
    v31 = 2;
    goto LABEL_26;
  }
  v4 = objc_msgSend(objc_getProperty(v2, v3, 408, 1), "objectAtIndexedSubscript:", 0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v7 = v5;
  if (!v5 || v5[2].isa != (Class)2)
  {
    v32 = ne_log_obj(v5, v6);
    v26 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "bad operation request state", buf, 2u);
    }
    goto LABEL_21;
  }
  Property = objc_getProperty(v5, v6, 24, 1);
  if (Property)
    Property = objc_getProperty(Property, v9, 24, 1);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000835E4;
  block[3] = &unk_1000BEB80;
  v11 = v7;
  v35 = v11;
  dispatch_async(v10, block);

  v14 = ne_log_obj(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_getProperty(v11, v16, 24, 1);
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v2;
    v38 = 2112;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ uninstalling session %@", buf, 0x16u);
  }

  v19 = objc_getProperty(v11, v18, 24, 1);
  if (v19)
    v19[4] = 1;
  objc_msgSend(objc_getProperty(v2, v20, 408, 1), "removeObject:", v11);

  v2->_installState = 1;
  if (objc_msgSend(objc_getProperty(v2, v21, 408, 1), "count"))
  {
    v23 = objc_msgSend(objc_getProperty(v2, v22, 408, 1), "objectAtIndexedSubscript:", 0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v26 = v24;
    if (v24)
    {
      v27 = *(_QWORD *)(v24 + 16);
      if (v27 == 2)
      {
        sub_100083B2C(v2, v25);
      }
      else if (v27 == 3)
      {
        sub_10008363C(v2, v25);
      }
    }
LABEL_21:

    v11 = v7;
  }
LABEL_23:

}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  NESMIKEv2VPNFallbackSession *v4;
  id Property;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[6];
  _QWORD block[6];

  v4 = self;
  if (self)
    self = (NESMIKEv2VPNFallbackSession *)objc_getProperty(self, a2, 360, 1);
  Property = (id)objc_claimAutoreleasedReturnValue(-[NESMIKEv2VPNFallbackSession objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0));
  v7 = Property;
  if (Property)
    Property = objc_getProperty(Property, v6, 24, 1);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083514;
  block[3] = &unk_1000BEA98;
  block[4] = v4;
  block[5] = a3;
  dispatch_async(v8, block);

  if (v4)
    v10 = objc_getProperty(v4, v9, 360, 1);
  else
    v10 = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
  v13 = v11;
  if (v11)
    v11 = objc_getProperty(v11, v12, 24, 1);
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008357C;
  v15[3] = &unk_1000BEA98;
  v15[4] = v4;
  v15[5] = a3;
  dispatch_async(v14, v15);

}

- (void)dropServer
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("primaryCellularInterface"));

  v4.receiver = self;
  v4.super_class = (Class)NESMIKEv2VPNFallbackSession;
  -[NESMSession dropServer](&v4, "dropServer");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationOperationArray, 0);
  objc_storeStrong((id *)&self->_primaryCellularInterface, 0);
  objc_storeStrong((id *)&self->_childSessions, 0);
}

@end
