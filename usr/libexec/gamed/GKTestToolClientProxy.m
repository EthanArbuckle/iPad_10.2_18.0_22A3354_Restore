@implementation GKTestToolClientProxy

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSString *v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  id v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
  v13 = (void *)v12;
  if (!v12)
    goto LABEL_10;
  v12 = (uint64_t)objc_msgSend((id)v12, "isEqualToString:", GKGameKitTesterIdentifier);
  if ((v12 & 1) != 0
    || (v12 = (uint64_t)objc_msgSend(v13, "isEqualToString:", GKGKTester2Identifier), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.sample")), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.onword")), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.Chess")), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.LameGame")), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.TheCoast")), (v12 & 1) != 0)
    || (v12 = (uint64_t)objc_msgSend(v13, "containsString:", CFSTR("com.apple.Boxes")), (_DWORD)v12))
  {
LABEL_10:
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleVersion"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v14, v13, v15));

    }
    else
    {
      v16 = CFSTR("Game Center (default)");
    }
    if (!os_log_GKGeneral)
      v17 = (id)GKOSLoggers(v12);
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v16;
      v29 = 2112;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "setTestGame: %@ protocolVersion: %@", buf, 0x16u);
    }
    -[GKTestToolClientProxy setTestGame:](self, "setTestGame:", v9);
    -[GKTestToolClientProxy setTestProtocolVersion:](self, "setTestProtocolVersion:", v10);
    v19 = 0;
  }
  else
  {
    if (!os_log_GKGeneral)
      v21 = (id)GKOSLoggers(v12);
    v22 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1001107E4((uint64_t)v13, v22);
    v23 = NSStringFromSelector(a2);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:description:](NSError, "userErrorForCode:description:", 32, v16));
  }

  if (v11)
  {
    v20 = objc_claimAutoreleasedReturnValue(-[GKClientProxy replyQueue](self, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100110228;
    block[3] = &unk_1002BB450;
    v26 = v11;
    v25 = v19;
    dispatch_async(v20, block);

  }
}

- (BOOL)isPosingAsGameCenter
{
  void *v3;
  unsigned __int8 v4;
  NSString *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    v5 = -[GKClientProxy bundleIdentifier](&v8, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = objc_msgSend(v6, "isEqualToString:", GKGameCenterToolIdentifier);

  }
  return v4;
}

- (id)transportWithCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportWithCredential:", v4));

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy transportWithCredential:](&v9, "transportWithCredential:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

- (id)bundleIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  objc_super v9;

  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy bundleIdentifier](&v9, "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

LABEL_7:
  return v6;
}

- (id)bundleVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  objc_super v9;

  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleVersion"));
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy bundleVersion](&v9, "bundleVersion");
    v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleVersion"));

LABEL_7:
  return v6;
}

- (id)bundleShortVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  objc_super v9;

  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleShortVersion"));
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy bundleShortVersion](&v9, "bundleShortVersion");
    v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortBundleVersion"));

LABEL_7:
  return v6;
}

- (id)adamID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  objc_super v9;

  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adamID"));
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy adamID](&v9, "adamID");
    v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "adamID"));

LABEL_7:
  return v6;
}

- (id)externalVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSNumber *v7;
  objc_super v9;

  if (-[GKTestToolClientProxy isPosingAsGameCenter](self, "isPosingAsGameCenter"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalVersion"));
LABEL_6:
    v6 = (void *)v4;
    goto LABEL_7;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  if (!v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v7 = -[GKClientProxy externalVersion](&v9, "externalVersion");
    v4 = objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testGame](self, "testGame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "externalVersion"));

LABEL_7:
  return v6;
}

- (id)protocolVersion
{
  void *v3;
  void *v4;
  id v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKTestToolClientProxy testProtocolVersion](self, "testProtocolVersion"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GKTestToolClientProxy;
    v6 = -[GKClientProxy protocolVersion](&v9, "protocolVersion");
    v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = v5;

  return v7;
}

- (GKGameInternal)testGame
{
  return self->_testGame;
}

- (void)setTestGame:(id)a3
{
  objc_storeStrong((id *)&self->_testGame, a3);
}

- (NSString)testProtocolVersion
{
  return self->_testProtocolVersion;
}

- (void)setTestProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_testProtocolVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testProtocolVersion, 0);
  objc_storeStrong((id *)&self->_testGame, 0);
}

@end
