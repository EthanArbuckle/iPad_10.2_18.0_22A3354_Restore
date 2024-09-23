@implementation misCTClientDelegates

- (void)tetheringStatus:(id)a3 connectionType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_100003108(1u, (uint64_t)"tetheringStatus notification", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, v18);
  if (a4 == 4)
  {
    -[misCTClientSharedInstance processCTTetheringStatusChangeNotification:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "processCTTetheringStatusChangeNotification:", a3);
  }
  else
  {
    v11 = -[NSString UTF8String](NSStringFromSelector(a2), "UTF8String");
    sub_100003108(1u, (uint64_t)"%s: ignoring unknown connection type %d", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v11[3];

  v9 = *(_QWORD *)&a4;
  memset(v11, 0, sizeof(v11));
  sub_100003108(1u, (uint64_t)"connectionStateChanged notification, connection type: %d", (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7, *(uint64_t *)&a4);
  -[misCTClientSharedInstance processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:", a3, v9, a5, v11);
}

- (void)subscriptionInfoDidChange
{
  -[misCTClientSharedInstance _updateDualSimStatus](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "_updateDualSimStatus");
}

@end
