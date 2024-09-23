@implementation SDAutoUnlockProxySession

- (SDAutoUnlockProxySession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9;
  SDAutoUnlockProxySession *v10;
  SDAutoUnlockProxySession *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockProxySession;
  v10 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:](&v13, "initWithDevice:sessionID:", a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    -[SDAutoUnlockProxySession addObservers](v11, "addObservers");
  }

  return v11;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFE80;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_start
{
  void *v3;
  void *v4;

  -[SDAutoUnlockProxySession setActiveConnection:](self, "setActiveConnection:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  objc_msgSend(v3, "startUnlockBLEConnectionWithDevice:encrypted:", v4, 1);

  -[SDAutoUnlockProxySession setState:](self, "setState:", 1);
  -[SDAutoUnlockProxySession sendProxyTrigger](self, "sendProxyTrigger");
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!-[SDAutoUnlockProxySession invalidated](self, "invalidated"))
  {
    -[SDAutoUnlockProxySession setInvalidated:](self, "setInvalidated:", 1);
    v5.receiver = self;
    v5.super_class = (Class)SDAutoUnlockProxySession;
    -[SDAutoUnlockPairingSession invalidate](&v5, "invalidate");
    -[SDAutoUnlockProxySession removeObservers](self, "removeObservers");
    if (-[SDAutoUnlockProxySession activeConnection](self, "activeConnection"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
      objc_msgSend(v3, "stopUnlockBLEConnectionWithDevice:", v4);

    }
  }
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceConnected:", SFBluetoothNotificationNameConnected, 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)results
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v3 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SDAutoUnlockManagerMetricUsingProxyDeviceKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession model](self, "model"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, SDAutoUnlockManagerMetricProxyDeviceModelKey);

  if (-[SDAutoUnlockProxySession proxyRSSI](self, "proxyRSSI"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SDAutoUnlockProxySession proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, SDAutoUnlockManagerMetricProxyDeviceRSSIKey);

  }
  -[SDAutoUnlockProxySession proxyDiscoveryTime](self, "proxyDiscoveryTime");
  if (v6 != 0.0)
  {
    -[SDAutoUnlockProxySession proxyDiscoveryTime](self, "proxyDiscoveryTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);

  }
  return v3;
}

- (void)deviceConnected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", SFBluetoothNotificationKeyPeerDevice));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", SFBluetoothNotificationKeyConnectTime));
    objc_msgSend(v9, "doubleValue");
    -[SDAutoUnlockProxySession setConnectionTime:](self, "setConnectionTime:");

    if ((id)-[SDAutoUnlockProxySession state](self, "state") == (id)1)
      -[SDAutoUnlockProxySession setState:](self, "setState:", 2);
  }

}

- (void)handleFoundBLEDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  NSErrorUserInfoKey v18;
  __CFString *v19;

  v4 = a3;
  -[SDAutoUnlockProxySession setProxyRSSI:](self, "setProxyRSSI:", objc_msgSend(v4, "rssi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession startDate](self, "startDate"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  -[SDAutoUnlockProxySession setProxyDiscoveryTime:](self, "setProxyDiscoveryTime:");

  v7 = sub_1000C801C(v4);
  if (v7)
  {
    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Proxy available for unlock", v17, 2u);
    }

    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    -[__CFString sessionDidStartConnection:](v10, "sessionDidStartConnection:", self);
  }
  else
  {
    if (sub_1000C8048(v4))
    {
      v12 = SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_ON_WRIST"), v11);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
      v13 = 135;
    }
    else
    {
      v10 = CFSTR("Watch Not On Wrist");
      v13 = 144;
    }
    v14 = SFAutoUnlockErrorDomain;
    v18 = NSLocalizedDescriptionKey;
    v19 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, v13, v15));
    -[SDAutoUnlockProxySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v16);

  }
}

- (void)notifyDelegateWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[SDAutoUnlockProxySession notified](self, "notified"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "session:didCompleteWithError:");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
      objc_msgSend(v6, "session:didCompleteWithError:", self, v7);

      -[SDAutoUnlockProxySession setNotified:](self, "setNotified:", 1);
    }
  }

}

- (void)sendProxyTrigger
{
  SDAutoUnlockProxyTrigger *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = objc_opt_new(SDAutoUnlockProxyTrigger);
  v4 = auto_unlock_log(-[SDAutoUnlockProxyTrigger setVersion:](v3, "setVersion:", 1));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockMessageTypeProxyTrigger", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxyTrigger data](v3, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v6, 307));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockProxySession bleDevice](self, "bleDevice"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D0614;
  v10[3] = &unk_1007147C8;
  v10[4] = self;
  objc_msgSend(v8, "sendUnlockData:toBLEDevice:completion:", v7, v9, v10);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)35));
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (double)proxyDiscoveryTime
{
  return self->_proxyDiscoveryTime;
}

- (void)setProxyDiscoveryTime:(double)a3
{
  self->_proxyDiscoveryTime = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(BOOL)a3
{
  self->_activeConnection = a3;
}

- (BOOL)notified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
