@implementation SFNotificationProxy

- (SFNotificationProxy)init
{
  SFNotificationProxy *v2;
  uint64_t v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFNotificationProxy;
  v2 = -[SFNotificationProxy init](&v7, "init");
  if (v2)
  {
    v3 = CUMainQueue();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)_requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPost:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v11;
  NSString *externalID;
  BOOL v13;
  NSMutableArray *internalIDs;
  NSMutableArray *v15;
  NSMutableArray *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v6 = a6;
  v7 = a5;
  v24 = a3;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  externalID = self->_externalID;
  if (externalID)
    v13 = !v7;
  else
    v13 = 1;
  if (!v13)
  {
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]", 30, "NotifProxy: Ignoring medium, already posted\n");
    }
    goto LABEL_38;
  }
  if (externalID)
  {
    internalIDs = self->_internalIDs;
    if (!internalIDs)
    {
      v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v16 = self->_internalIDs;
      self->_internalIDs = v15;

      internalIDs = self->_internalIDs;
    }
    if ((-[NSMutableArray containsObject:](internalIDs, "containsObject:", v24) & 1) == 0)
      -[NSMutableArray addObject:](self->_internalIDs, "addObject:", v24);
    v17 = objc_claimAutoreleasedReturnValue(-[SFNotificationProxy externalID](self, "externalID"));
    if (v17)
    {
      v18 = (void *)v17;
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]", 30, "NotifProxy: Updating notification (already posted) %@\n", v18);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
      objc_msgSend(v23, "homePodHandoffUpdateIfNeeded:info:", v18, v11);
LABEL_37:

      self->_showingMedium = v7;
      objc_storeStrong((id *)&self->_triggeredID, a3);

    }
  }
  else if (v6)
  {
    v19 = self->_internalIDs;
    if (!v19)
    {
      v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v21 = self->_internalIDs;
      self->_internalIDs = v20;

      v19 = self->_internalIDs;
    }
    -[NSMutableArray addObject:](v19, "addObject:", v24);
    v22 = objc_claimAutoreleasedReturnValue(-[SFNotificationProxy externalID](self, "externalID"));
    if (v22)
    {
      v18 = (void *)v22;
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]", 30, "NotifProxy: Posting notification %@\n", v18);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
      objc_msgSend(v23, "homePodHandoffPostIfNeeded:info:", v18, v11);
      goto LABEL_37;
    }
  }
  else if (dword_1007B1060 <= 30
         && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    LogPrintF(&dword_1007B1060, "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]", 30, "NotifProx: Not handling %@: %@\n", v24, v11);
  }
LABEL_38:

}

- (void)requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5
{
  -[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:](self, "_requestPostOrUpdate:info:mediumVariant:canPost:", a3, a4, a5, 1);
}

- (void)requestRemove:(id)a3 withReason:(int64_t)a4
{
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  unsigned int v11;
  NSString *triggeredID;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  unsigned __int8 v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  unsigned int v21;
  void *v22;
  id v23;
  id v24;

  v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[NSMutableArray containsObject:](self->_internalIDs, "containsObject:", v24) & 1) != 0)
  {
    v6 = self->_externalID;
    if (!v6)
    {
      if (dword_1007B1060 <= 90
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
      {
        LogPrintF(&dword_1007B1060, "-[SFNotificationProxy requestRemove:withReason:]", 90, "### NotifProxy: RequestRemove failed, no existing notification\n");
      }
      goto LABEL_44;
    }
    if (self->_showingMedium)
      goto LABEL_4;
    triggeredID = self->_triggeredID;
    v13 = (NSString *)v24;
    v14 = triggeredID;
    if (v14 == v13)
    {

    }
    else
    {
      v15 = v14;
      if ((v13 == 0) == (v14 != 0))
      {

        goto LABEL_33;
      }
      v16 = -[NSString isEqual:](v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
LABEL_33:
        if (dword_1007B1060 <= 30
          && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
        {
          LogPrintF(&dword_1007B1060, "-[SFNotificationProxy requestRemove:withReason:]", 30, "NotifProxy: Remove tracking of %@ per request\n", v13);
        }
        -[NSMutableArray removeObject:](self->_internalIDs, "removeObject:", v13);
        v23 = objc_retainBlock(self->_dismissedHandler);
        v22 = v23;
        if (v23)
          (*((void (**)(id, NSString *, int64_t))v23 + 2))(v23, v13, a4);
        goto LABEL_43;
      }
    }
    if (self->_showingMedium)
      goto LABEL_4;
    v17 = self->_triggeredID;
    v18 = v13;
    v19 = v17;
    if (v19 == v18)
    {

    }
    else
    {
      v20 = v19;
      if ((v18 == 0) == (v19 != 0))
      {

        goto LABEL_48;
      }
      v21 = -[NSString isEqual:](v18, "isEqual:", v19);

      if (!v21)
      {
LABEL_48:
        if (!self->_showingMedium)
          goto LABEL_44;
LABEL_4:
        v7 = self->_triggeredID;
        v8 = (NSString *)v24;
        v9 = v7;
        if (v9 == v8)
        {

        }
        else
        {
          v10 = v9;
          if ((v8 == 0) == (v9 != 0))
          {

            goto LABEL_44;
          }
          v11 = -[NSString isEqual:](v8, "isEqual:", v9);

          if (!v11)
            goto LABEL_44;
        }
        if (-[NSMutableArray count](self->_internalIDs, "count") == (id)1)
          goto LABEL_22;
LABEL_44:

        goto LABEL_45;
      }
    }
LABEL_22:
    if (dword_1007B1060 <= 30
      && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    {
      LogPrintF(&dword_1007B1060, "-[SFNotificationProxy requestRemove:withReason:]", 30, "NotifProxy: Remove actual notification per request\n");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
    objc_msgSend(v22, "homePodHandoffRemove:reason:", v6, a4);
LABEL_43:

    goto LABEL_44;
  }
  if (dword_1007B1060 <= 90 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 90)))
    LogPrintF(&dword_1007B1060, "-[SFNotificationProxy requestRemove:withReason:]", 90, "### NotifProxy: RequestRemove failed, unrecognized ID: %@\n", v24);
LABEL_45:

}

- (void)requestRemoveAll
{
  void *v3;

  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SFNotificationProxy requestRemoveAll]", 30, "NotifProxy: Request remove all\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](SDNotificationManager, "sharedManager"));
  objc_msgSend(v3, "homePodHandoffRemoveAll");

  -[SFNotificationProxy reset](self, "reset");
}

- (void)requestUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPostNotification:(BOOL)a6
{
  -[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:](self, "_requestPostOrUpdate:info:mediumVariant:canPost:", a3, a4, a5, a6);
}

- (void)handleNotificationWasTapped:(id)a3
{
  id v4;
  void *v5;
  NSString *externalID;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  unsigned __int8 v10;
  int v11;
  void (**v12)(id, id);
  id v13;
  id v14;

  v4 = a3;
  v5 = v4;
  externalID = self->_externalID;
  v14 = v4;
  if (externalID)
  {
    v7 = (NSString *)v4;
    v8 = externalID;
    if (v8 == v7)
    {

      goto LABEL_7;
    }
    v9 = v8;
    if (v7)
    {
      v10 = -[NSString isEqual:](v7, "isEqual:", v8);

      v5 = v14;
      if ((v10 & 1) == 0)
        goto LABEL_11;
LABEL_7:
      if (dword_1007B1060 <= 30
        && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
      {
        LogPrintF(&dword_1007B1060, "-[SFNotificationProxy handleNotificationWasTapped:]", 30, "NotifProxy: Tapped %@\n", v7);
      }
      v12 = (void (**)(id, id))objc_retainBlock(self->_tappedHandler);
      if (v12)
      {
        v13 = -[NSMutableArray copy](self->_internalIDs, "copy");
        v12[2](v12, v13);

      }
      -[SFNotificationProxy reset](self, "reset");
      goto LABEL_20;
    }

    v5 = v14;
  }
LABEL_11:
  if (dword_1007B1060 <= 90)
  {
    if (dword_1007B1060 != -1 || (v11 = _LogCategory_Initialize(&dword_1007B1060, 90), v5 = v14, v11))
    {
      LogPrintF(&dword_1007B1060, "-[SFNotificationProxy handleNotificationWasTapped:]", 90, "### NotifProxy: Unrecognized notification ID tapped: %@\n", v5);
LABEL_20:
      v5 = v14;
    }
  }

}

- (void)handleNotificationWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  void (**v8)(id, _QWORD, int64_t);
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
  {
    if ((unint64_t)(a4 - 1) > 3)
      v7 = CFSTR("?");
    else
      v7 = *(&off_100716730 + a4 - 1);
    LogPrintF(&dword_1007B1060, "-[SFNotificationProxy handleNotificationWasDismissed:reason:]", 30, "NotifProxy: Did dismiss %@ (%@)", v6, v7);
  }
  v8 = (void (**)(id, _QWORD, int64_t))objc_retainBlock(self->_dismissedHandler);
  if (v8)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_internalIDs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          v8[2](v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), a4);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  -[SFNotificationProxy reset](self, "reset");

}

- (id)externalID
{
  NSString *externalID;
  void *v4;
  NSString *v5;
  NSString *v6;

  externalID = self->_externalID;
  if (!externalID)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = self->_externalID;
    self->_externalID = v5;

    externalID = self->_externalID;
  }
  return externalID;
}

- (void)reset
{
  NSMutableArray *internalIDs;
  NSString *externalID;
  NSString *triggeredID;

  if (dword_1007B1060 <= 30 && (dword_1007B1060 != -1 || _LogCategory_Initialize(&dword_1007B1060, 30)))
    LogPrintF(&dword_1007B1060, "-[SFNotificationProxy reset]", 30, "NotifProxy: Reset");
  -[NSMutableArray removeAllObjects](self->_internalIDs, "removeAllObjects");
  internalIDs = self->_internalIDs;
  self->_internalIDs = 0;

  externalID = self->_externalID;
  self->_externalID = 0;

  self->_showingMedium = 0;
  triggeredID = self->_triggeredID;
  self->_triggeredID = 0;

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)tappedHandler
{
  return self->_tappedHandler;
}

- (void)setTappedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tappedHandler, 0);
  objc_storeStrong(&self->_dismissedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_triggeredID, 0);
  objc_storeStrong((id *)&self->_internalIDs, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end
